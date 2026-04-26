# filepath: Dockerfile
# Build multi-stage para Vue.js + Vite
# Stage 1: Build da aplicação
FROM node:20-alpine AS builder

WORKDIR /app

# Copia package.json e package-lock.json primeiro
# para aproveitar cache do Docker se dependências não mudarem
COPY package*.json ./

# Instala dependências
RUN npm ci

# Copia código fonte
COPY . .

# Build da aplicação
RUN npm run build

# Stage 2: Servidor de produção com Nginx
FROM nginx:alpine

# Copia arquivos estáticos do build
COPY --from=builder /app/dist /usr/share/nginx/html

# Copia configuração do Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Script para configurar porta dinâmica
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'sed -i "s/listen 80;/listen ${PORT:-80};/" /etc/nginx/conf.d/default.conf' >> /entrypoint.sh && \
    echo 'exec nginx -g "daemon off;"' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

# Porta padrão
EXPOSE 80

# Healthcheck para o EasyPanel
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# Inicia Nginx com script de configuração de porta
CMD ["/entrypoint.sh"]