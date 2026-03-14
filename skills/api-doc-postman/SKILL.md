---
name: api-doc-postman
description: Use esta skill quando houver criação, alteração ou remoção de endpoint no Backend(API), quando for necessário manter documentação pública estilo site (com Try it) para consumo da API e quando for preciso garantir sincronização a partir de contrato OpenAPI único.
---

# API Docs Interativa (Backend)

## Objetivo Operacional

Garantir documentação única, rastreável e sempre atualizada da API do backend, com site navegável e execução de endpoints no próprio navegador.

## Escopo

Incluído:
- Atualizar contrato OpenAPI da API em `<api_docs_path>/docs/openapi.json`.
- Manter site de documentação em `<api_docs_path>/docs/index.html` e `<api_docs_path>/docs/app.js`.
- Validar cobertura de endpoints contra `<backend_path>/src/server.js` (ou entrypoint equivalente).
- Atualizar documentação operacional no `readme.md` do backend e do repositório de docs quando houver impacto.

Fora de escopo:
- Alterar regra de negócio da API sem solicitação explícita.
- Publicar em GitHub sem passar pelo fluxo de publicação aprovado.
- Aceitar endpoint novo sem documentação no contrato OpenAPI.

## Entradas Obrigatórias

1. Estado atual de rotas do backend (`<backend_path>/src/server.js` ou equivalente).
2. Contrato OpenAPI atual (`<api_docs_path>/docs/openapi.json`).
3. Critério de alteração (novo endpoint, alteração de payload, alteração de autenticação, remoção).

Referências obrigatórias:
- `references/workflow-api-docs.md`
- `references/template-endpoint.md`

## Fluxo Operacional (Determinístico)

1. Ler endpoints atuais no backend e identificar delta da alteração.
2. Atualizar `openapi.json` com path, método, autenticação, request, response e exemplos.
3. Validar cobertura com script/procedimento disponível no projeto (ex.: `node scripts/check-endpoint-coverage.js`).
4. Verificar render do site de docs (`docs/index.html`) e execução no bloco Try it.
5. Atualizar `readme.md` dos repositórios impactados.
6. Registrar testes executados, pendências e nível de confiança (alto, médio, baixo).

## Contrato de Saída

Responder sempre com:
1. Endpoints alterados e status de documentação.
2. Arquivos alterados no backend docs e na skill.
3. Resultado da validação de cobertura de endpoints.
4. Métricas (planejado vs executado, taxa de sucesso, pendências, confiança).
5. Riscos residuais e plano de mitigação.

## Fail-Safe e Tratamento de Ambiguidade

- Se houver endpoint no backend sem documentação OpenAPI, bloquear conclusão como concluída.
- Se faltar contexto de payload ou autenticação, classificar como contexto incompleto e solicitar confirmação antes de finalizar.
- Se houver conflito entre implementação e spec, priorizar evidência do código e registrar conflito explicitamente.
- Se execução de endpoint no Try it falhar por CORS/base URL, reportar bloqueio operacional e orientar ajuste de ambiente.

## Guardrails

- Nunca manter dois contratos de API concorrentes.
- Nunca adicionar endpoint sem exemplo mínimo de request/response.
- Nunca marcar cobertura completa se existir lacuna entre `server.js` e `openapi.json`.
- Nunca ocultar erro de validação de cobertura.
- Nunca publicar mudança de docs sem rastreabilidade do endpoint alterado.

## Checklist de Qualidade

- Delta de endpoints foi identificado no backend.
- `openapi.json` foi atualizado com método, autenticação e exemplos.
- Validação de cobertura (`check-endpoint-coverage.js`) foi executada sem falha.
- Site de documentação abriu e listou endpoints atualizados.
- README dos repositórios impactados foi atualizado.
- Métricas e riscos foram reportados com status crítico/alto/médio/baixo.
