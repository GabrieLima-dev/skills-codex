## Workflow Operacional

## Fonte única de verdade

- Manter somente `docs/openapi.json` como contrato principal.
- Não manter contratos paralelos.

## Passo a passo em alteração de endpoint

1. Atualizar endpoint no backend.
2. Atualizar `docs/openapi.json` com:
- summary e description
- tags
- security (quando aplicável)
- requestBody
- responses (2xx/4xx/5xx)
3. Executar:

```bash
npm test
npm run docs:check-coverage
```

4. Abrir `docs/index.html` e validar render dos endpoints + bloco Try it.
5. Atualizar `README.md` do backend e deste repositório de docs, quando aplicável.

## Critérios de aceite

- Cobertura de endpoints = 100% entre backend e OpenAPI.
- Site de documentação atualizado sem erro de carregamento.
- Fluxo Try it funcional com `{{url_base}}` configurada.
- Sem conflito entre payload real da API e documentação.
