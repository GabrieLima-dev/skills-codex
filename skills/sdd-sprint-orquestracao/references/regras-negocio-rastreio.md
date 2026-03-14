## Rastreio de Regras de Negócio

## Classificação obrigatória

- `confirmadas`: regra comprovada em código/docs válidas.
- `inferidas`: regra provável, mas sem confirmação definitiva.
- `conflitantes`: regra com divergência entre pedido, documentação e código.

## Fontes de evidência

- validações e schemas
- services/use-cases
- checks de permissão
- contratos de API
- textos/estados de UI
- PRD/Spec/README

## Saída mínima no planejamento

- lista de regras confirmadas
- lista de regras inferidas
- lista de conflitos e decisão proposta
- impacto dessas regras nos critérios de aceitação e testes

## Guardrail

- regra inferida nunca deve ser promovida para confirmada sem evidência explícita.
