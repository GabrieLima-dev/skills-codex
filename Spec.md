# Spec - Guia Interativo do Projeto Skills

## Vinculo com PRD

Esta especificacao implementa o `PRD.md` da documentacao interativa do projeto `Skills`, evoluindo a entrega para Vue 3, Vite, Pinia e persistencia local com `localStorage`.

## Escopo Tecnico

1. Atualizar `readme.md` como documentacao principal.
2. Criar app Vue/Vite em `index.html` e `src/`.
3. Remover referencias legadas de outro projeto nos arquivos alterados.
4. Manter `skills-workflow-guide.html` como apoio e incluir entrada para o jogo.
5. Salvar progresso do usuario em `localStorage`.

## Mudancas por Arquivo

### `readme.md`

O que alterar:
- Reposicionar o projeto como `Skills`.
- Explicar objetivo, estrutura, stack atual e evolucao futura.
- Listar skills por bloco operacional.
- Documentar gates, caminhos de uso e como testar.

Por que:
- O README passa a ser a documentacao textual principal do projeto.

### `skills-workflow-guide.html`

O que alterar:
- Manter como pagina principal/apoio ja existente.
- Adicionar link claro para abrir o jogo em Vue.

Por que:
- A pagina atual continua util como documentacao visual, enquanto o jogo vira experiencia dedicada.

### `package.json`

O que alterar:
- Definir scripts `dev`, `build` e `test`.
- Declarar dependencias Vue 3, Vite e Pinia.

Por que:
- O projeto passa a ter app frontend empacotado.

### `index.html`

O que alterar:
- Criar ponto de entrada do app Vite.

Por que:
- O jogo passa a ser a tela principal do app Vue.

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

Por que:
- Ter um teste rapido sem depender de navegador.

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
- App Vue com mapa lateral, instrucoes sempre visiveis, fases desbloqueadas e progresso salvo no navegador.

## Cenarios de Validacao

1. Rodar `npm test`.
2. Rodar `npm run build`.
3. Rodar `npm run dev`.
4. Clicar nas fases e verificar atualizacao da agente e da missao.
5. Concluir fase, recarregar pagina e confirmar progresso persistido.
6. Usar `Reiniciar` e confirmar limpeza do progresso.
7. Verificar responsividade por estrutura CSS.
8. Procurar termos legados nos arquivos alterados.

## Criterios de Pronto

1. `readme.md` explica o projeto `Skills` e como validar.
2. App Vue possui interacao funcional e persistencia local.
3. Nao existem referencias ativas a outro projeto nos arquivos alterados.
4. Validacoes locais planejadas foram executadas ou justificadas.
5. A entrega inclui roteiro `como testar`.

## Estrategia TDD/Validacao

Como a mudanca introduz app Vue e persistencia local, a estrategia sera:

1. Red: registrar criterios verificaveis no PRD/Spec antes de alterar a interface.
2. Green: implementar app Vue e script `npm test` para dados/progresso.
3. Refactor: revisar consistencia textual, responsividade basica, build e ausencia de termos legados.
