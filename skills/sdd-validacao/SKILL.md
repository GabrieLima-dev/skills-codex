---
name: sdd-validacao
description: Use esta skill para executar a fase 4 do SDD como gate final antes de push/PR, validando alinhamento entre `PRD.md`, `Spec.md` e código, evidências de TDD, cobertura de critérios de aceitação, riscos de regressão, relatório estruturado de testes/métricas e checkpoint obrigatório de testes adicionais com o usuário.
---

# SDD 4 - Validação e Revalidação

## Objetivo Operacional

Decidir com evidência se a entrega está pronta para publicação (`aprovado`, `aprovado com ressalvas`, `reprovado`).

## Escopo

Incluído:
- Verificação de aderência `PRD.md` x `Spec.md` x código.
- Verificação de evidência de TDD em mudanças de código.
- Checagem de critérios de aceitação e critérios de pronto.
- Avaliação de risco de regressão e segurança.
- Emissão de parecer final com justificativa.
- Emissão de relatório consolidado de métricas de validação.
- Emissão de relatório de testes no formato estruturado obrigatório.
- Checkpoint explícito com o usuário para decidir se haverá testes adicionais antes do encerramento.
- Emissão obrigatória de `como testar` para API e FRONT quando aplicável.

Fora de escopo:
- Implementar correções grandes na fase de validação.
- Aprovar entrega crítica sem evidência mínima.

## Entradas Obrigatórias

1. `PRD.md`.
2. `Spec.md`.
3. Mudanças implementadas (diff/código).
4. Evidências de teste/checks disponíveis.

Referência obrigatória:
- `references/validacao-checklist.md`
- `references/matriz-tipos-teste.md`

## Fluxo Operacional (Determinístico)

1. Traçar matriz de rastreabilidade: requisito (PRD) -> item técnico (Spec) -> evidência no código.
2. Verificar cobertura dos critérios de aceitação e de pronto.
3. Revisar regressões potenciais (funcionais, dados, segurança, documentação).
4. Consolidar evidências de testes e lacunas de validação por tipo (`unit`, `integration`, `e2e`, `contract`, `smoke`, `regression`) quando aplicável.
5. Confirmar evidência de TDD (`red -> green -> refactor`) em cada item crítico de código.
6. Consolidar métricas da validação: total planejado, total executado, total aprovado, taxa de sucesso, pendências e nível de confiança.
7. Emitir relatório estruturado de testes e métricas com:
   - escopo e ambiente de execução
   - matriz de testes planejado vs executado
   - comandos executados
   - resultado por teste/check
   - lacunas e impacto
   - métricas consolidadas e risco residual
8. Perguntar explicitamente ao usuário se deseja testes adicionais antes de encerrar e listar opções possíveis.
9. Executar testes adicionais somente após novo comando explícito do usuário.
10. Emitir telemetria visual `SKILL_LOADING` para cada fase de validação.
11. Classificar decisão final:
   - `aprovado`
   - `aprovado com ressalvas`
   - `reprovado`
12. Registrar explicitamente o que não foi testado, por quê e impacto no risco residual.
13. Atribuir nível de confiança da validação (`alto`, `médio`, `baixo`) com justificativa objetiva.
14. Emitir seção final `como testar` com roteiro manual/automático:
   - API: endpoints, payloads, respostas esperadas e evidência
   - FRONT: fluxo visual, estados esperados e cenários de regressão
15. Registrar pendências obrigatórias antes de merge/publicação.

## Contrato de Saída

Responder sempre com:
1. Status final (`aprovado`, `aprovado com ressalvas`, `reprovado`).
2. Achados por severidade (`crítico/alto/médio/baixo`).
3. Critérios cobertos vs não cobertos.
4. Evidências executadas vs não executadas.
5. Relatório estruturado de testes e métricas (escopo, ambiente, matriz, comandos, resultados, lacunas, risco residual).
6. Relatório de métricas (planejado, executado, aprovado, taxa de sucesso, pendências).
7. Registro do checkpoint final do usuário sobre execução de testes adicionais.
8. Evidência de TDD por item crítico (quando houver código).
9. Seção `como testar` (API e FRONT quando aplicável).
10. Pendências obrigatórias para avançar.
11. Nível de confiança da validação (`alto`, `médio`, `baixo`) com justificativa.
12. Telemetria registrada (`SKILL_START/STEP/HANDOFF/LOADING/END`).

## Fail-Safe e Tratamento de Ambiguidade

- Se faltar evidência para requisito crítico, não aprovar.
- Se existir inferência não comprovada, marcar explicitamente como inferência.
- Se houver conflito entre PRD e Spec, sinalizar inconsistência e bloquear aprovação plena.
- Se o conjunto de testes não cobrir cenário negativo e regressão de fluxo crítico, classificar no mínimo como `aprovado com ressalvas`.
- Se não houver métricas mínimas de validação, bloquear aprovação plena.
- Se não houver relatório de testes no formato estruturado obrigatório, bloquear aprovação plena.
- Se não houver checkpoint explícito com o usuário sobre testes adicionais, bloquear aprovação plena.
- Se houver execução de testes adicionais sem comando explícito do usuário, bloquear aprovação plena.
- Se não houver evidência de TDD em mudança de código, bloquear aprovação plena.
- Se faltar `como testar` aplicável ao escopo (API/FRONT), bloquear aprovação plena.

## Guardrails

- Não minimizar risco relevante para acelerar publicação.
- Não confundir ausência de erro observado com validação completa.
- Não omitir limitações do ambiente de teste.
- Não declarar cobertura de teste que não tenha evidência executável.
- Não encerrar validação sem pergunta explícita de testes adicionais ao usuário.
- Não executar testes adicionais sem comando explícito do usuário.
- Não aprovar entrega sem relatório de métricas de validação.
- Não omitir `SKILL_LOADING` em validação multi-fase.
- Não aprovar entrega sem roteiro `como testar` para API/FRONT quando aplicável.

## Checklist de Qualidade

- Existe rastreabilidade entre requisito, implementação e evidência.
- Critérios de aceitação foram avaliados objetivamente.
- Riscos e lacunas estão priorizados por severidade.
- Decisão final está justificada e auditável.
- Tipos de teste aplicáveis foram avaliados e lacunas justificadas.
- Relatório de métricas foi emitido com planejado/executado/aprovado e taxa de sucesso.
- Relatório de testes foi emitido no formato estruturado obrigatório.
- Checkpoint de testes adicionais foi validado explicitamente com o usuário.
- Evidência de TDD foi auditada para mudanças de código.
- Seção `como testar` foi entregue para API/FRONT quando aplicável.
