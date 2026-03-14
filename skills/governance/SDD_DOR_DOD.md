# SDD - Definition of Ready / Definition of Done

## Fase 1 - Pesquisa para PRD

### Definition of Ready (DoR)

- Pedido do usuário documentado.
- Contexto técnico inicial identificado.
- Escopo inicial delimitado.

### Definition of Done (DoD)

- `PRD.md` gerado com critérios de aceitação testáveis.
- Fora de escopo explícito.
- Riscos e dúvidas abertas registrados.

## Fase 2 - PRD para Spec

### Definition of Ready (DoR)

- `PRD.md` aprovado.
- Requisitos sem ambiguidades críticas.

### Definition of Done (DoD)

- `Spec.md` com mudanças por arquivo.
- Matriz de rastreabilidade PRD -> Spec completa.
- Cenários de validação (sucesso/erro/regressão) definidos.

## Fase 3 - Spec para Código

### Definition of Ready (DoR)

- `Spec.md` aprovado e executável.
- Arquivos-alvo confirmados.

### Definition of Done (DoD)

- Itens da spec implementados sem escopo paralelo.
- Validações executadas ou justificadas.
- Riscos residuais e pendências documentados.

## Fase 4 - Validação e Revalidação

### Definition of Ready (DoR)

- PRD, Spec e código disponíveis.
- Evidências de teste disponíveis.

### Definition of Done (DoD)

- Decisão final emitida (`aprovado`, `aprovado com ressalvas`, `reprovado`).
- Achados por severidade documentados.
- Pendências obrigatórias antes de merge/publicação registradas.
