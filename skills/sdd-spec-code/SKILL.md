---
name: sdd-spec-code
description: Use esta skill para executar a fase 3 do SDD, implementando `Spec.md` com aderência estrita ao escopo aprovado, mudanças incrementais por arquivo, TDD obrigatório (`red -> green -> refactor`) e validações previstas, sem deriva arquitetural não planejada.
---

# SDD 3 - Spec para Código

## Objetivo Operacional

Implementar exatamente o que está na `Spec.md`, com simplicidade, previsibilidade, TDD obrigatório e controle de escopo.

## Escopo

Incluído:
- Implementação por arquivo conforme `Spec.md`.
- Execução de TDD em mudanças de código (`red -> green -> refactor`).
- Execução de testes/checks definidos.
- Registro de evidências e limitações.
- Entrega de seção final `como testar` (API e FRONT quando aplicável).

Fora de escopo:
- Mudanças não previstas na spec.
- Refatorações amplas sem necessidade comprovada.
- Alterações arquiteturais sem aprovação explícita.

## Entradas Obrigatórias

1. `Spec.md` aprovado.
2. Código fonte atual.

Referência obrigatória:
- `references/implementacao-checklist.md`

## Fluxo Operacional (Determinístico)

1. Ler `Spec.md` integralmente e extrair checklist executável.
2. Confirmar arquivos-alvo e ordem de implementação.
3. Para cada item de código, executar ciclo TDD:
   - criar/ajustar teste que falha (`red`)
   - implementar para passar (`green`)
   - refatorar mantendo testes passando (`refactor`)
4. Implementar item a item, mantendo diffs pequenos e legíveis.
5. Rodar validações previstas na spec (tests/lint/build/manual).
6. Registrar resultado por item:
   - `concluído`
   - `não concluído`
   - `risco/desvio`
7. Consolidar evidências e pendências técnicas.
8. Entregar `como testar` com passos de API e FRONT quando aplicável.

## Contrato de Saída

Responder sempre com:
1. Itens da spec implementados (com arquivos).
2. Itens não implementados e motivo.
3. Evidências de TDD por item crítico (`red/green/refactor`).
4. Testes/checks executados e resultado.
5. Seção `como testar` (API e FRONT quando aplicável).
6. Riscos residuais e próximos passos.
7. Status final da execução (`concluído`, `concluído com ressalvas`, `não concluído`).

## Fail-Safe e Tratamento de Ambiguidade

- Se surgir necessidade fora da spec, pausar escopo e registrar desvio.
- Se um item da spec estiver ambíguo, adotar a interpretação mais conservadora e declarar premissa.
- Se não for possível validar algo no ambiente atual, explicitar limitação e impacto.
- Se houver conflito entre spec aprovada e comportamento real do código, interromper execução e registrar conflito técnico.
- Se mudança de código não tiver evidência de TDD, bloquear conclusão como `concluído`.
- Se faltar seção `como testar` aplicável ao escopo, bloquear conclusão como `concluído`.

## Guardrails

- Não “resolver junto” demandas paralelas.
- Não introduzir abstração sem ganho claro.
- Não ocultar falha de teste ou validação parcial.
- Não pular TDD em mudança de código.
- Não concluir implementação sem `como testar` reproduzível.

## Checklist de Qualidade

- Implementação aderente à spec, sem escopo paralelo.
- Mudanças simples, incrementais e revisáveis.
- Evidências de TDD foram registradas por item crítico.
- Validações previstas foram executadas ou justificadas.
- Seção `como testar` foi entregue para API/FRONT quando aplicável.
- Riscos/desvios estão documentados.
