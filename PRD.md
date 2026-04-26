# PRD - Documentacao Interativa do Projeto Skills

## Contexto

O projeto `Skills` passa a evoluir de uma experiencia estatica para um app Vue com formato de jogo lateral. A documentacao principal continua sendo o `readme.md`.

O guia atual ainda contem referencias legadas de outro projeto e descreve parte do fluxo de forma informativa, mas ainda pouco interativa para uma pessoa iniciante.

## Problema

1. A identidade do projeto precisa ser apenas `Skills`.
2. A documentacao precisa explicar cada skill, gate e caminho operacional com linguagem objetiva.
3. O guia visual precisa parecer uma home de produto clara, elegante e facil de navegar.
4. A experiencia deve ensinar por leitura guiada, cards completos e interacoes previsiveis.
5. O progresso precisa ficar salvo no cache local do usuario de forma controlada e limpa.

## Objetivo

Transformar a documentacao do projeto `Skills` em uma experiencia didatica e interativa, com formato de jornada por fases, para que uma pessoa com pouco ou nenhum conhecimento consiga entender:

1. O que cada skill faz.
2. Quando cada skill e acionada.
3. O que cada skill deve retornar.
4. Quais gates bloqueiam ou liberam o fluxo.
5. Quais caminhos operacionais existem ate validacao ou publicacao.

## Escopo Incluido

1. Remover referencias visuais e textuais a outro projeto no guia atual.
2. Atualizar `readme.md` como documentacao textual principal do projeto.
3. Criar app Vue 3/Vite com mecanica lateral de fases.
4. Organizar catalogo de skills por funcao operacional.
5. Incluir retornos esperados por skill e explicacao dos gates.
6. Salvar progresso local com Pinia e `localStorage`.

## Fora de Escopo

1. Criar backend real nesta entrega.
2. Sincronizar progresso entre dispositivos.
3. Criar autenticacao, banco de dados ou persistencia remota.
4. Publicar deploy externo.
5. Alterar contratos internos das skills.

## Stack e Premissas

1. Backend atual: nao aplicavel nesta entrega; pode existir em evolucao futura.
2. Frontend atual: Vue 3, Vite, Pinia, HTML, CSS e JavaScript.
3. Documentacao principal: `readme.md`.
4. Persistencia: `localStorage` versionado no navegador.
5. Direcao visual aprovada para a Home: centro de comando inspirado em Raycast, sem copiar assets proprietarios.

## Areas Impactadas

1. `readme.md`
2. `skills-workflow-guide.html`
3. `PRD.md`
4. `Spec.md`
5. `package.json`
6. `index.html`
7. `game.html`
8. `src/`

## Requisitos Funcionais

1. O app deve apresentar uma jornada por fases com progresso visual.
2. O usuario deve conseguir selecionar fases e ver conteudo especifico.
3. O usuario deve conseguir encontrar skills por busca/filtro e ler objetivo, quando usar e retorno esperado no proprio card.
4. O guia deve apresentar gates operacionais de forma visual.
5. O guia deve mostrar caminhos comuns: entender contexto, implementar mudanca, mudar frontend, validar qualidade e publicar.
6. O README deve explicar o projeto, estrutura, stack, como abrir e como validar.
7. O progresso deve persistir apos recarregar a pagina.
8. A URL limpa `/home` deve abrir o guia `skills-workflow-guide.html`.
9. O botao `Abrir jogo` do guia deve abrir o game em `game.html`.
10. O botao `Docs` dentro do game deve retornar para `/home`.
11. A opcao de tema deve ser compartilhada entre Home e Game via `localStorage`.
12. O controle de tema deve usar icone de lua/sol, sem texto `Tema`.
13. A Home deve manter apenas dois CTAs principais: `Abrir jogo` e `Ver catalogo`.
14. A Home deve evitar cliques que alteram conteudo distante do ponto de interacao.
15. A Home deve permitir abrir uma skill em modal com sua estrutura interna real.
16. O projeto deve integrar VLibras nas entradas HTML.
17. A Home deve ter sidebar/rail e suporte a interacoes por mouse e teclado.

## Requisitos Nao Funcionais

1. O app deve rodar com Vite.
2. A experiencia deve ser responsiva.
3. O texto deve ser claro, enxuto e didatico.
4. O codigo deve permanecer simples e com dependencias restritas a Vue/Vite/Pinia.
5. Nao deve haver referencia ativa a outro projeto no guia ou README.
6. A persistencia local deve usar chave versionada e normalizacao de dados.

## Criterios de Aceitacao

1. `readme.md` apresenta o projeto como `Skills`, sem acoplamento a outro produto.
2. O app Vue oferece interacao por fases em mapa lateral.
3. A Home apresenta jornada, catalogo, caminhos e gates sem depender de conteudo escondido.
4. Cada skill listada tem objetivo, acionamento e retorno esperado no proprio card.
5. O modal da skill mostra arquivo, objetivo, quando usar, fluxo, contrato de saida e guardrails.
6. VLibras esta presente nas entradas HTML do projeto.
7. Os gates principais estao explicados em linguagem acessivel.
8. O app roda com `npm run dev` e gera build com `npm run build`.
9. O build de producao inclui `skills-workflow-guide.html` e `game.html`, e o Nginx publica `/home` sem 404.
10. Busca textual por termos legados de projeto nao encontra referencias ativas nos arquivos alterados.
11. `npm test` valida dados basicos do jogo, normalizacao do progresso, rota `/home`, tema compartilhado, modais e VLibras.

## Riscos e Duvidas

1. A futura evolucao para 3D ou backend completo nao sera implementada nesta entrega.
2. Como nao ha backend, interacoes e progresso serao locais no navegador.
3. Alteracoes em contratos das skills ficam fora do escopo para evitar mudanca operacional nao solicitada.
