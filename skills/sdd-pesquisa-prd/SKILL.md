---
name: sdd-pesquisa-prd
description: Use esta skill quando surgir uma nova demanda de produto/feature e for necessário executar a fase 1 do SDD, convertendo o pedido em `PRD.md` fundamentado no código real, com escopo incremental e critérios de aceitação verificáveis.
---

# SDD 1 - Pesquisa para PRD

## Objetivo Operacional

Transformar pedido do usuário em `PRD.md` acionável, evitando invenções e reduzindo risco de implementação desalinhada.

## Escopo

Incluído:
- Leitura do pedido e decomposição do problema.
- Pesquisa no código para validar estado atual.
- Identificação de restrições, riscos e dependências.
- Produção de `PRD.md` com template oficial.

Fora de escopo:
- Definir implementação detalhada por arquivo (fase 2).
- Codificar mudanças (fase 3).
- Aprovar release (fase 4).

## Entradas Obrigatórias

1. Pedido do usuário.
2. Código atual relevante à demanda.

Referência obrigatória:
- `references/prd-template.md`

## Fluxo Operacional (Determinístico)

1. Interpretar o pedido e explicitar objetivo de negócio/técnico.
2. Pesquisar no código evidências do estado atual (arquivos, fluxos, limitações).
3. Delimitar escopo e fora de escopo com foco incremental.
4. Escrever requisitos funcionais e não funcionais testáveis.
5. Definir critérios de aceitação claros (mensuráveis/verificáveis).
6. Registrar riscos e dúvidas abertas sem mascarar incerteza.
7. Gerar `PRD.md` conforme template.

## Contrato de Saída

Entregar `PRD.md` contendo no mínimo:
1. Contexto com situação atual comprovada.
2. Objetivo da entrega e fora de escopo.
3. Áreas/arquivos impactados.
4. Requisitos funcionais e não funcionais.
5. Critérios de aceitação verificáveis.
6. Riscos e dúvidas abertas.

## Fail-Safe e Tratamento de Ambiguidade

- Se o pedido estiver ambíguo, documentar premissas adotadas no PRD.
- Se faltar evidência no código, marcar item como hipótese, não como fato.
- Se o escopo estiver grande demais, propor recorte incremental obrigatório.
- Se houver conflito entre pedido, código atual e restrições técnicas, registrar conflito explicitamente e priorizar estado real do código.

## Guardrails

- Não afirmar comportamento não verificado.
- Não propor stack nova sem necessidade e justificativa.
- Não deixar critério de aceitação genérico (“funcionar melhor”).

## Checklist de Qualidade

- PRD reflete o código real, não suposições.
- Escopo e fora de escopo estão explícitos.
- Critérios de aceitação são testáveis.
- Riscos e dependências relevantes foram capturados.
