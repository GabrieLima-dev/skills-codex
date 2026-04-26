---
name: api-doc-postman
description: Use esta skill quando houver criação, alteração ou remoção de endpoint no Backend(API), aplicando obrigatoriamente o mesmo padrão visual, UX/UI e funcional do `docs-portal-cliente`, mudando apenas cores e informações do projeto.
---

# API Docs Interativa (Backend) - Template Bloqueado `docs-portal-cliente`

## Objetivo Operacional

Garantir documentação única, rastreável e sempre atualizada da API do backend usando o template oficial `docs-portal-cliente` como padrão fixo (layout, UX/UI e funções), alterando somente endpoints do projeto atual e identidade visual/institucional informada pelo usuário.

## Escopo

Incluído:
- Atualizar contrato OpenAPI da API em `<api_docs_path>/docs/openapi.json` com base nos endpoints reais do backend atual.
- Manter site de documentação em `<api_docs_path>/docs/index.html` e `<api_docs_path>/docs/app.js` com a mesma estrutura do `docs-portal-cliente`.
- Manter exportação Postman em `<api_docs_path>/postman/*.postman_collection.json` e `<api_docs_path>/postman/*.postman_environment.json`.
- Solicitar ao usuário somente:
  - cores da identidade visual do projeto;
  - informações institucionais do projeto (nome, título da documentação, texto da marca e descrições).
- Preservar funções padrão do template:
  - navegação lateral por tags e endpoints;
  - busca de endpoints;
  - tema claro/escuro;
  - redimensionamento/colapso do menu lateral;
  - bloco Try it por endpoint;
  - execução real de request e render de resposta;
  - botão de cópia de cURL;
  - export de collection Postman.
- Validar cobertura de endpoints contra `<backend_path>/src/server.*` (ou entrypoint equivalente).
- Atualizar documentação operacional no `readme.md` do backend e do repositório de docs quando houver impacto.

Fora de escopo:
- Redesenhar layout/UX/UI fora do padrão do `docs-portal-cliente`.
- Alterar comportamento das funções centrais do template sem solicitação explícita de exceção.
- Pedir ao usuário detalhes de endpoints (payload, status, autenticação) quando isso puder ser extraído do backend e/ou contrato atual.
- Alterar regra de negócio da API sem solicitação explícita.
- Publicar em GitHub sem passar pelo fluxo de publicação aprovado.
- Aceitar endpoint novo sem documentação no contrato OpenAPI.

## Entradas Obrigatórias

1. Estado atual de rotas do backend (`<backend_path>/src/server.js` ou equivalente).
2. Contrato OpenAPI atual (`<api_docs_path>/docs/openapi.json`).
3. Artefatos base do template de referência (`docs-portal-cliente/docs/index.html`, `docs-portal-cliente/docs/app.js` e estrutura `postman/`).
4. Briefing mínimo de identidade do projeto (somente cores + informações institucionais).

Referências obrigatórias:
- `references/workflow-api-docs.md`
- `references/template-endpoint.md`
- `references/template-identidade-projeto.md`

## Fluxo Operacional (Determinístico)

1. Ler endpoints atuais no backend e identificar delta da alteração.
2. Preencher ou solicitar apenas o briefing mínimo de identidade (cores + informações do projeto); não solicitar detalhes técnicos de endpoint ao usuário sem necessidade.
3. Atualizar `openapi.json` com path, método, autenticação, request, response e exemplos a partir do backend real.
4. Replicar o padrão do `docs-portal-cliente` para `docs/index.html` e `docs/app.js`, permitindo apenas substituições de:
   - tokens de identidade do projeto;
   - paleta de cores.
5. Gerar/atualizar collection e environment Postman sincronizados com o OpenAPI.
6. Validar cobertura com script/procedimento disponível no projeto (ex.: `node scripts/check-endpoint-coverage.js`).
7. Verificar render do site de docs (`docs/index.html`) e execução no bloco Try it.
8. Executar checklist de paridade do template (layout, UX/UI e funções).
9. Atualizar `readme.md` dos repositórios impactados.
10. Registrar testes executados, pendências e nível de confiança (alto, médio, baixo).

## Contrato de Saída

Responder sempre com:
1. Endpoints alterados e status de documentação.
2. Briefing coletado do usuário (somente cores + informações institucionais).
3. Arquivos alterados no backend docs e status de paridade com `docs-portal-cliente`.
4. Resultado da validação de cobertura de endpoints.
5. Resultado da validação funcional (Try it, cURL, navegação, busca, tema, Postman export).
6. Métricas (planejado vs executado, taxa de sucesso, pendências, confiança).
7. Riscos residuais e plano de mitigação.

## Fail-Safe e Tratamento de Ambiguidade

- Se houver endpoint no backend sem documentação OpenAPI, bloquear conclusão como concluída.
- Se faltar briefing mínimo de cores/informações do projeto, classificar como contexto incompleto e solicitar somente os campos faltantes.
- Se faltar contexto de payload ou autenticação não inferível por código/contrato, classificar como contexto incompleto e solicitar confirmação antes de finalizar.
- Se houver conflito entre implementação e spec, priorizar evidência do código e registrar conflito explicitamente.
- Se execução de endpoint no Try it falhar por CORS/base URL, reportar bloqueio operacional e orientar ajuste de ambiente.
- Se o usuário solicitar alteração de layout/UX/UI/funções fora do template `docs-portal-cliente`, bloquear execução padrão e pedir confirmação explícita de exceção com risco de perda de padronização.
- Se o template base `docs-portal-cliente` estiver indisponível, bloquear com status `bloqueado` e pedir caminho de referência válido.

## Guardrails

- Nunca manter dois contratos de API concorrentes.
- Nunca adicionar endpoint sem exemplo mínimo de request/response.
- Nunca marcar cobertura completa se existir lacuna entre `server.js` e `openapi.json`.
- Nunca ocultar erro de validação de cobertura.
- Nunca publicar mudança de docs sem rastreabilidade do endpoint alterado.
- Nunca alterar estrutura/funções centrais de `index.html` e `app.js` que descaracterizem o padrão `docs-portal-cliente`.
- Nunca pedir ao usuário informações técnicas de endpoint que possam ser levantadas automaticamente no projeto atual.

## Checklist de Qualidade

- Delta de endpoints foi identificado no backend.
- Briefing mínimo do projeto (cores + informações institucionais) foi coletado.
- `openapi.json` foi atualizado com método, autenticação e exemplos.
- `index.html` e `app.js` seguem o padrão do `docs-portal-cliente` (layout, UX/UI e funções).
- Collection/environment Postman foram sincronizados com `openapi.json`.
- Validação de cobertura (`check-endpoint-coverage.js`) foi executada sem falha.
- Site de documentação abriu e listou endpoints atualizados.
- README dos repositórios impactados foi atualizado.
- Métricas e riscos foram reportados com status crítico/alto/médio/baixo.
