# Arquitetura Atual (Template de Leitura)

## 1. Visão Geral

Este documento é um guia rápido para mapear arquitetura real do projeto com base em código fonte.

## 2. Mapa de Componentes

- Frontend: `<caminho_frontend>`
- Backend: `<caminho_backend>`
- Worker/Jobs: `<caminho_jobs>`
- Infra/Deploy: `<caminho_infra>`

## 3. Fluxos Críticos para Auditar

### 3.1 Entrada do Usuário

- Pontos de entrada (rotas, páginas, comandos).
- Validação de entrada e tratamento de erro.

### 3.2 API e Regras de Negócio

- Endpoints e handlers principais.
- Serviços com lógica de domínio.
- Dependências externas.

### 3.3 Persistência e Integrações

- Fontes de dados (DB, arquivos, APIs externas).
- Camadas de acesso e sincronização.

### 3.4 Jobs e Rotinas Assíncronas

- Scripts agendados.
- Filas/workers.
- Política de retry e observabilidade.

## 4. Riscos Técnicos Comuns

1. Regras críticas apenas no frontend.
2. Validação inconsistente entre camadas.
3. Acoplamento alto em módulo central.
4. Falta de teste de regressão em fluxo crítico.

## 5. Saída Esperada da Análise

1. Comprovado no código.
2. Risco/limitação atual.
3. Hipótese ou lacuna a verificar.
4. Nível de confiança (`alto`, `médio`, `baixo`).
