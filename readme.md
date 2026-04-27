# Skills

`Skills` e um projeto de documentacao e aprendizado sobre agentes orientados por skills.

O objetivo e mostrar, de forma clara e pratica, como cada skill funciona, quando ela deve ser acionada, quais gates protegem a execucao e o que a agente deve retornar em cada etapa.

## O Que Existe Hoje

- Frontend: Vue 3, Vite, Pinia, HTML, CSS e JavaScript.
- Backend: nao aplicavel nesta entrega.
- Docs: este `readme.md`.
- Home/documentacao visual: `/home` servindo `skills-workflow-guide.html`.
- App principal do jogo: `game.html`.
- Layout da Home: wrapper amplo alinhado ao Game, com limite de 1500px e margem segura em telas menores.
- Footer da Home: compacto e integrado ao fim do grid, sem alteracao no sidebar lateral.
- Playground da Home: preview com altura estavel somente em telas maiores, preservando fluidez em mobile.

O projeto agora possui uma experiencia de jogo lateral para ensinar o fluxo das Skills e salva progresso no cache local do navegador.

## Como Abrir

Instale as dependencias:

```bash
npm install
```

Rode o app:

```bash
npm run dev
```

Valide a estrutura de jogo:

```bash
npm test
```

Gere build de producao:

```bash
npm run build
```

O build deve gerar `dist/index.html`, `dist/skills-workflow-guide.html` e `dist/game.html`. Em producao, o Nginx publica a home limpa em `/home`; o botao `Abrir jogo` abre `game.html`.

## Estrutura

- `AGENTS.md`: regras operacionais que a agente deve seguir.
- `skills/`: catalogo das skills e seus arquivos `SKILL.md`.
- `src/`: app Vue do jogo interativo.
- `src/stores/progress.js`: store Pinia do progresso.
- `src/lib/progressStorage.js`: persistencia local versionada.
- `src/data/gameContent.js`: fases, skills e instrucoes do jogo.
- `index.html`: entrada raiz que direciona para o guia.
- `game.html`: entrada Vite do jogo.
- `skills-workflow-guide.html`: home estatica servida em `/home`, com sidebar, playground, catalogo com modais e VLibras.
- `vite.config.js`: build multipagina para publicar o jogo e a pagina de docs.

## Docker

### Build da imagem

```bash
docker build -t skills-codex .
```

### Run local

```bash
docker run -d -p 8080:80 --name skills-codex skills-codex
```

Acesse em: http://localhost:8080

### Deploy no EasyPanel

1. Build da imagem e push para registry:
   ```bash
   docker build -t registry.seu-dominio.com/skills-codex .
   docker push registry.seu-dominio.com/skills-codex
   ```

2. No EasyPanel:
   - Container image: `registry.seu-dominio.com/skills-codex`
   - Port interna HTTP: `80`
   - Health check do painel, se habilitado: `/` ou `/health`
   - Variaveis de ambiente: nao obrigatorias para servir o frontend estatico

O `Dockerfile` nao define `HEALTHCHECK` interno. O container deve subir o Nginx diretamente na porta `80`, deixando a validacao de saude sob responsabilidade do EasyPanel/proxy.
- Rota publica principal: `/home`
- Rota do jogo: `/game.html`
- Tema compartilhado entre Home e Game: `localStorage` na chave `skills-ui-theme:v1`
- Acessibilidade: VLibras integrado nas entradas HTML do projeto.
- `readme.md`: documentacao principal do projeto.
- `skills-workflow-guide.html`: mapa interativo inicial para aprender o fluxo.
- `PRD.md`: intencao de produto da entrega atual.
- `Spec.md`: especificacao tecnica da entrega atual.

## Como Uma Skill Deve Ser Entendida

Cada skill deve responder quatro perguntas simples:

1. Objetivo: para que ela existe.
2. Quando usar: qual pedido ou contexto aciona a skill.
3. O que fazer: quais passos ela exige.
4. O que retornar: qual evidencia ou resultado precisa aparecer no final.

## Blocos Operacionais

### 1. Prontidao e Contexto

- `project-readiness-gate`: bloqueia execucao se faltar stack, contexto ou triade obrigatoria.
- `context`: entende o estado real do codigo e separa fato, risco e hipotese.

Retorno esperado:
- status do gate;
- campos completos e ausentes;
- evidencias por arquivo;
- proximo passo seguro.

### 2. Orquestracao SDD

- `sdd-sprint-orquestracao`: controla plano, aprovacao, autorizacao e fluxo ponta a ponta.
- `sdd-pesquisa-prd`: transforma pedido em PRD.
- `sdd-prd-spec`: transforma PRD em Spec tecnica.
- `sdd-spec-code`: implementa a Spec com escopo controlado.
- `sdd-validacao`: valida alinhamento entre PRD, Spec, codigo e evidencias.

Retorno esperado:
- plano estruturado;
- PRD;
- Spec;
- implementacao rastreada;
- relatorio de testes, metricas e risco residual.

### 3. Especialistas

- `front-ux-ui-design`: conduz mudancas visuais/frontend com 3 propostas e aprovacao.
- `api-doc-postman`: sincroniza contrato OpenAPI e documentacao de API.
- `data-model`: apoia arquitetura de dados e DER.
- `vps-easypanel`: apoia deploy e operacao em VPS/EasyPanel.

Retorno esperado:
- decisao tecnica ou visual;
- arquivos impactados;
- trade-offs;
- validacoes aplicaveis.

### 4. Qualidade, Publicacao e Evolucao

- `code-review`: revisa bugs, seguranca, qualidade e regressao.
- `github-flow`: organiza branch, commit, push e PR.
- `aprendizado-profundo`: propõe melhorias de processo com aprovacao explicita.

Retorno esperado:
- achados por severidade;
- checklist de publicacao;
- PR documentado;
- proposta de melhoria quando aplicavel.

## Gates Principais

- Gate de prontidao: antes de qualquer execucao.
- Gate de plano: sem plano aprovado, nada deve ser executado.
- Gate de comando explicito: mesmo com plano aprovado, a execucao so comeca apos autorizacao clara.
- Gate UX/UI: mudanca visual exige exatamente 3 propostas com links e aprovacao.
- Gate de validacao: entrega precisa de testes, metricas, lacunas e risco residual.
- Gate de publicacao: commit, push ou PR exigem revisao e rastreabilidade.

## Caminhos Comuns

### Entender Um Projeto

1. `project-readiness-gate`
2. `context`
3. resposta com fatos, riscos, hipoteses e proximo passo

### Implementar Uma Mudanca

1. `project-readiness-gate`
2. `sdd-sprint-orquestracao`
3. `sdd-pesquisa-prd`
4. `sdd-prd-spec`
5. `sdd-spec-code`
6. `sdd-validacao`

### Alterar Frontend Visual

1. `project-readiness-gate`
2. `sdd-sprint-orquestracao`
3. `front-ux-ui-design`
4. aprovacao de uma direcao visual
5. implementacao e validacao responsiva

### Publicar

1. `code-review`
2. `github-flow`
3. branch de trabalho
4. commit
5. push
6. PR para `main`

## Como Testar Esta Entrega

### Front

1. Rode `npm install`.
2. Rode `npm run dev`.
3. Abra a URL local exibida pelo Vite.
4. Em producao, abra `/home` e confirme que a home aparece sem `.html`.
5. Clique em `Abrir jogo` e confirme que `game.html` abre.
6. Altere o tema na Home ou no Game e confirme que a escolha continua ao trocar de pagina.
7. Use a busca/filtro do catalogo e confirme que apenas os cards do catalogo mudam.
8. Clique em um card de skill e confirme que o modal abre com objetivo, fluxo, contrato, guardrails e arquivo `SKILL.md`.
9. Use `Esc` para fechar o modal.
10. Confirme que o widget VLibras aparece na Home e no Game.
11. Clique nas fases do mapa lateral do Game.
12. Use `Proxima fase` e `Concluir fase`.
13. Recarregue a pagina e confirme que o progresso foi mantido.
14. Use `Reiniciar` e confirme que o progresso volta ao inicio.
15. Reduza a largura da janela e confirme que a interface continua legivel.
16. Em desktop largo, confirme que a Home ocupa largura semelhante ao Game, sem voltar ao container estreito anterior.
17. Role ate o fim da Home e confirme que o footer esta mais discreto, com menor espaco inferior e sem mudanca no sidebar.
18. Em desktop, alterne as opcoes do Playground de decisao e confirme que o box de preview nao muda de altura.

### API

Nao aplicavel nesta entrega. O progresso e salvo no navegador via `localStorage`, sem backend real.

## Validacoes Recomendadas

```bash
rg -n "termo-legado-do-projeto-anterior" readme.md skills-workflow-guide.html PRD.md Spec.md
npm test
npm run build
```

O comando nao deve retornar referencias ativas aos termos legados nos arquivos alterados.
