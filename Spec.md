# Spec - Guia Interativo do Projeto Skills

## Vinculo com PRD

Esta especificacao implementa o `PRD.md` da documentacao interativa do projeto `Skills`, evoluindo a entrega para Vue 3, Vite, Pinia e persistencia local com `localStorage`.

## Escopo Tecnico

1. Atualizar `readme.md` como documentacao principal.
2. Criar app Vue/Vite em `game.html` e `src/`.
3. Remover referencias legadas de outro projeto nos arquivos alterados.
4. Manter `skills-workflow-guide.html` como apoio e incluir entrada para o jogo.
5. Salvar progresso do usuario em `localStorage`.

## Mudancas por Arquivo

### `readme.md`

O que alterar:
- Reposicionar o projeto como `Skills`.
- Explicar objetivo, stack atual, experiencia interativa e como rodar.
- Valorizar o estudo de Skills, agentes e vibe coding.
- Linkar a Home interativa, o jogo e o catalogo de skills.
- Reduzir detalhes internos de governanca, deploy e operacao que nao agregam a um README publico.
- Revisar acentuacao, pontuacao e concordancia em portugues do Brasil.

Por que:
- O README passa a ser a documentacao textual principal do projeto.
- O repositorio publico precisa comunicar valor tecnico e aprendizado sem expor ruido operacional.
- O texto publico precisa ter leitura profissional em portugues do Brasil.

### `skills-workflow-guide.html`

O que alterar:
- Manter como pagina principal/apoio ja existente.
- Adicionar link claro para abrir o jogo em Vue via `game.html`.
- Ajustar o wrapper `.shell` para usar o mesmo limite horizontal amplo do Game, com ate 1500px no desktop e margem segura em viewports menores.
- Compactar o `footer` e integra-lo visualmente ao final do grid, sem alterar `.side-rail`.
- Definir altura minima para `.flow-preview` somente em telas maiores, suficiente para o cenario com mais linhas.

Por que:
- A pagina atual passa a ser a primeira experiencia do site, enquanto o jogo vira experiencia dedicada.
- A Home deve ocupar a largura disponivel com a mesma regra visual aplicada na pagina do Game.
- O final da Home precisa ficar menos pesado visualmente quando o usuario chega ao fim da rolagem.
- O box do playground nao deve mudar de altura ao alternar entre cenarios no desktop.

### `package.json`

O que alterar:
- Definir scripts `dev`, `build` e `test`.
- Declarar dependencias Vue 3, Vite e Pinia.

Por que:
- O projeto passa a ter app frontend empacotado.

### `vite.config.js`

O que alterar:
- Publicar `index.html` e `skills-workflow-guide.html` no build de producao.
- Publicar `game.html` como entrada do jogo Vue.
- Servir `/home` no Nginx como rota limpa do guia.

Por que:
- A home precisa abrir o guia em `/home`, o botao `Abrir jogo` precisa abrir o game e o botao `Docs` precisa voltar para a documentacao sem 404 no Nginx/EasyPanel.

### `index.html`

O que alterar:
- Direcionar a entrada raiz para `skills-workflow-guide.html`.

Por que:
- Ao abrir a URL publica, a primeira pagina deve levar para `/home`.

### `game.html`

O que alterar:
- Criar ponto de entrada do app Vite.

Por que:
- O jogo deve abrir somente a partir do botao do guia.

### `src/`

O que alterar:
- `src/main.js`: inicializacao Vue + Pinia.
- `src/App.vue`: tela do jogo lateral.
- `src/styles.css`: UI side-scroller responsiva.
- `src/data/gameContent.js`: fases, skills e instrucoes.
- `src/stores/progress.js`: store Pinia.
- `src/lib/progressStorage.js`: persistencia versionada.

Por que:
- Separar experiencia, dados e persistencia de forma limpa.

### `scripts/validate-game.mjs`

O que alterar:
- Criar validacao automatica de dados do jogo e normalizacao do progresso.
- Validar que a Home usa o limite horizontal amplo esperado no wrapper principal.
- Validar que o footer compacto da Home esteja presente.
- Validar que a altura estavel do playground foi configurada apenas para telas maiores.

Por que:
- Ter um teste rapido sem depender de navegador.
- Evitar regressao para um container estreito na Home.
- Evitar regressao para um footer alto demais no final da Home.
- Evitar regressao de layout com box do playground pulando no desktop.

### `PRD.md`

O que alterar:
- Registrar o pedido de produto e criterios de aceite.

Por que:
- Manter rastreabilidade SDD.

### `Spec.md`

O que alterar:
- Registrar plano tecnico e validacoes.

Por que:
- Manter rastreabilidade entre PRD, implementacao e validacao.

## Regras de Implementacao

1. Adicionar apenas Vue 3, Vite e Pinia.
2. Nao criar backend nesta entrega.
3. Nao usar assets de outro projeto.
4. Texto deve ser direto, didatico e orientado a iniciantes.
5. App deve rodar com Vite.
6. JavaScript deve usar dados locais para fases, skills e caminhos.
7. Layout deve ser responsivo para desktop e mobile.
8. Persistencia local deve validar dados antes de reutilizar.

## Comportamento Antes e Depois

Antes:
- Guia estatico/interativo em arquivo unico, sem persistencia de progresso.

Depois:
- Guia estatico publicado em `/home`, com visual de command sidebar, playground por cenario, cards de skill abrindo modal, VLibras, tema compartilhado por `localStorage`, e app Vue em `game.html` com mapa lateral, instrucoes sempre visiveis, fases desbloqueadas e progresso salvo no navegador.

## Cenarios de Validacao

1. Rodar `npm test`.
2. Rodar `npm run build`.
3. Confirmar que `dist/skills-workflow-guide.html` e `dist/game.html` foram gerados.
4. Rodar preview/build local quando aplicavel.
5. Em producao Nginx, abrir `/home` e confirmar que a pagina inicial e o guia.
6. Clicar em `Abrir jogo` e confirmar que `game.html` abre sem 404.
7. Clicar em `Docs` no game e confirmar retorno para `/home`.
8. Alternar tema na Home e confirmar tema igual ao abrir Game.
9. Alternar tema no Game e confirmar tema igual ao voltar para Home.
10. Usar busca/filtro do catalogo e confirmar que apenas cards do catalogo mudam.
11. Abrir modal de uma skill e confirmar arquivo, objetivo, fluxo, saida e guardrails.
12. Fechar modal por botao e por `Esc`.
13. Confirmar widget VLibras na Home, no Game e na raiz de redirecionamento.
14. Clicar nas fases do game e verificar atualizacao da agente e da missao.
15. Concluir fase, recarregar pagina e confirmar progresso persistido.
16. Usar `Reiniciar` e confirmar limpeza do progresso.
17. Verificar responsividade por estrutura CSS.
18. Procurar termos legados nos arquivos alterados.
19. Validar que `.shell` da Home usa largura maxima de 1500px com margem segura.
20. Validar que o footer da Home esta compacto e que o sidebar nao foi alterado.
21. Validar que o box do playground fica estavel em telas maiores e continua fluido nos breakpoints menores.
22. Validar que o README publico destaca proposta, stack, execucao local, estudo das skills e ausencia de backend.
23. Validar que o README publico usa pontuacao, acentuacao e concordancia adequadas em portugues do Brasil.

## Criterios de Pronto

1. `readme.md` explica o projeto `Skills` e como validar.
2. App Vue possui interacao funcional e persistencia local.
3. A URL `/home` abre o guia e o botao `Abrir jogo` abre `game.html`.
4. Link `Docs` abre `/home` no build de producao.
5. Tema claro/escuro e compartilhado entre Home e Game.
6. Home possui leitura guiada e catalogo filtravel sem paineis que mudam longe do clique.
7. Cards de skill abrem modal acessivel com estrutura real resumida.
8. VLibras esta integrado nas entradas HTML.
9. Nao existem referencias ativas a outro projeto nos arquivos alterados.
10. Validacoes locais planejadas foram executadas ou justificadas.
11. A entrega inclui roteiro `como testar`.
12. A Home tem wrapper alinhado ao limite horizontal do Game.
13. O footer da Home fica mais compacto sem mudanca no sidebar lateral.
14. O box de preview do playground tem altura estavel no desktop sem impor altura fixa no mobile.
15. O README esta adequado para GitHub publico, com conteudo essencial e sem comandos privados de publicacao.
16. O README esta revisado em portugues do Brasil sem alterar o escopo tecnico descrito.

## Estrategia TDD/Validacao

Como a mudanca introduz app Vue e persistencia local, a estrategia sera:

1. Red: registrar criterios verificaveis no PRD/Spec antes de alterar a interface.
2. Green: implementar app Vue e script `npm test` para dados/progresso.
3. Refactor: revisar consistencia textual, responsividade basica, build e ausencia de termos legados.
