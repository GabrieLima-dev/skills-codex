# Matriz de Tipos de Teste (quando aplicável)

## Tipos

- `unit`: regra de negócio e funções isoladas.
- `integration`: integração entre módulos, banco, fila, API externa.
- `e2e`: fluxo ponta a ponta do usuário.
- `contract`: compatibilidade de contratos API/eventos.
- `smoke`: verificação rápida de disponibilidade/fluxo principal.
- `regression`: garantia de comportamento antigo esperado.

## Registro obrigatório na validação

- Tipo de teste
- Status (`executado`, `não executado`, `não aplicável`)
- Evidência (comando, log, caso manual)
- Motivo da lacuna (quando não executado)
- Impacto no risco residual
- Evidência de ciclo TDD (`red`, `green`, `refactor`) quando houver mudança de código
- Passo de validação manual para API (endpoint/payload/resultado esperado) quando aplicável
- Passo de validação manual para FRONT (fluxo visual/estado esperado) quando aplicável

## Regra de confiança

- `alto`: cobre fluxos críticos + negativo + regressão com evidências fortes.
- `médio`: cobertura parcial de críticos, com lacunas não bloqueantes justificadas.
- `baixo`: lacunas relevantes em críticos, pouca evidência ou ambiente limitado.
