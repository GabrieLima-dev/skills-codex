## Workflow Operacional

## Fonte única de verdade

- Manter somente `docs/openapi.json` como contrato principal.
- Não manter contratos paralelos.
- Tratar `docs-portal-cliente` como template oficial e bloqueado para layout/UX/UI/funções.

## Briefing mínimo permitido ao usuário

Solicitar somente:

1. Cores do projeto (paleta para substituir variáveis CSS).
2. Informações institucionais:
- nome do projeto/produto
- título da documentação
- texto da marca/logo
- descrição curta da API
- nome da collection Postman
- URLs de servidor (local e publicado, quando houver)

Não solicitar detalhes técnicos de endpoint (request, response, autenticação) quando puder extrair do backend atual.

## Passo a passo em alteração de endpoint

1. Mapear endpoints no backend atual.
2. Atualizar `docs/openapi.json` com:
- summary e description
- tags
- security (quando aplicável)
- requestBody
- responses (2xx/4xx/5xx)
3. Replicar `docs/index.html` e `docs/app.js` a partir do padrão `docs-portal-cliente`, alterando apenas:
- tokens de identidade do projeto
- paleta de cores
4. Atualizar `postman/*.json` sincronizando com o OpenAPI.
5. Executar:

```bash
npm test
npm run docs:check-coverage
```

6. Abrir `docs/index.html` e validar render dos endpoints + bloco Try it.
7. Atualizar `README.md` do backend e deste repositório de docs, quando aplicável.

## Checklist de paridade obrigatória com docs-portal-cliente

- Navegação lateral por grupos/tags com contadores.
- Busca por endpoint (`search-input`).
- Alternância de tema claro/escuro com persistência local.
- Menu lateral redimensionável e colapsável.
- Cartões de endpoint com:
  - badge de método HTTP
  - metadados de autenticação
  - request/response formatados
  - botão `Copiar cURL`
- Bloco Try it funcional com:
  - servidor
  - bearer token
  - parâmetros path/query/header
  - body
  - execução e render de status, headers e body.
- Botão de export da collection Postman.

## Critérios de aceite

- Cobertura de endpoints = 100% entre backend e OpenAPI.
- Site de documentação atualizado sem erro de carregamento.
- Fluxo Try it funcional com URL base configurada.
- Sem conflito entre payload real da API e documentação.
- Paridade funcional com `docs-portal-cliente` confirmada sem desvios não aprovados.
