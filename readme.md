# Skills

Estudo prático sobre **Skills, agentes de IA e vibe coding**, apresentado como uma experiência interativa para aprender como um agente pode organizar contexto, planejar execução, validar entregas e preservar rastreabilidade.

O projeto nasceu como um laboratório pessoal para transformar regras operacionais de agentes em algo visual, navegável e fácil de explicar em um repositório público.

## O Que O Projeto Mostra

- Uma Home interativa para explorar cenários, skills e caminhos de decisão.
- Um jogo lateral em Vue para praticar a jornada de uma entrega orientada por skills.
- Um catálogo de skills com objetivo, momento de uso, fluxo, guardrails e contrato de saída.
- Persistência local de progresso e tema usando `localStorage`.
- Acessibilidade com VLibras nas entradas HTML.
- Validação automática simples para garantir estrutura, rotas e regras principais.

## Por Que Isso Existe

Este repositório documenta meu aprendizado sobre como trabalhar com agentes de IA de forma mais estruturada.

Em vez de tratar vibe coding como tentativa solta, o projeto explora uma abordagem com:

1. contexto antes de execução;
2. plano antes de alteração;
3. PRD e Spec para reduzir ambiguidade;
4. implementação com escopo controlado;
5. validação antes de publicar;
6. revisão e rastreabilidade como parte do fluxo.

A ideia central é simples: usar Skills para transformar pedidos em caminhos verificáveis.

## Experiências Disponíveis

| Área | Onde fica | O que mostra |
| --- | --- | --- |
| Home | [`skills-workflow-guide.html`](./skills-workflow-guide.html) | Guia visual com playground, catálogo e modais de skills |
| Game | [`game.html`](./game.html) | Jornada lateral para praticar fases de uma entrega |
| Skills | [`skills/`](./skills) | Arquivos `SKILL.md` com regras e contratos operacionais |
| App Vue | [`src/`](./src) | Interface do jogo, dados, store e persistência local |

Ao rodar o projeto localmente, a rota principal da Home é `/home`.

## Stack

- Vue 3
- Vite
- Pinia
- HTML, CSS e JavaScript
- Node.js para scripts de validação

Não há backend nesta versão. O progresso e o tema ficam apenas no navegador.

## Como Rodar

Instale as dependências:

```bash
npm install
```

Inicie o ambiente local:

```bash
npm run dev
```

Valide a estrutura do projeto:

```bash
npm test
```

Gere o build de produção:

```bash
npm run build
```

## Como Explorar

1. Abra a URL local exibida pelo Vite.
2. Acesse a Home em `/home`.
3. Use o Playground de decisão para alternar cenários.
4. Abra cards de skills para ver objetivo, fluxo, guardrails e saída esperada.
5. Clique em `Abrir jogo` para praticar a jornada em fases.
6. Troque o tema na Home ou no Game e confirme que a preferência é compartilhada.

## Fluxo De Aprendizado

O jogo e a Home organizam o estudo em uma sequência parecida com uma entrega real:

1. entender o pedido;
2. validar a prontidão do projeto;
3. montar o plano;
4. transformar a ideia em PRD;
5. converter o PRD em Spec;
6. implementar com escopo controlado;
7. validar evidências;
8. preparar a publicação.

Esse fluxo não tenta substituir julgamento técnico. Ele serve como guia para deixar o trabalho com agentes mais claro, auditável e repetível.

## Estrutura Principal

```text
.
|-- skills/                    # catálogo de skills e regras operacionais
|-- src/                       # app Vue do jogo interativo
|-- scripts/                   # validações locais
|-- skills-workflow-guide.html # Home interativa
|-- game.html                  # entrada do jogo
|-- index.html                 # entrada raiz
|-- PRD.md                     # contexto de produto da entrega
|-- Spec.md                    # especificação técnica da entrega
`-- readme.md                  # apresentação pública do projeto
```

## O Que Eu Aprendi Com Este Projeto

- Como transformar prompts e regras em contratos reutilizáveis de execução.
- Como separar contexto, planejamento, implementação e validação.
- Como reduzir ambiguidade em interações com agentes.
- Como criar uma experiência visual para explicar conceitos técnicos.
- Como usar vibe coding com mais disciplina, sem perder velocidade.

## Status

Projeto em evolução como estudo público. A versão atual foca em frontend, documentação interativa e aprendizado local, sem autenticação, banco de dados ou backend remoto.
