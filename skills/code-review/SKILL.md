---
name: code-review
description: Use esta skill sempre que houver pedido para testar, validar, revisar qualidade, buscar bugs/vulnerabilidades ou publicar (commit/push/PR). Executa code review preventivo com achados por severidade, métricas objetivas e gate explícito de aprovação para continuar.
---

# Code Review Preventivo

## Objetivo Operacional

Detectar cedo bugs, vulnerabilidades e problemas de qualidade para reduzir risco de regressão antes da integração, entregando relatório detalhado e decisão explícita de continuidade.

## Escopo

Incluído:
- Revisão estática e comportamental baseada em diffs/arquivos alterados.
- Classificação de achados por severidade (`crítico`, `alto`, `médio`, `baixo`).
- Recomendação objetiva de correção por achado.
- Métricas obrigatórias do review.
- Gate final com aprovação explícita para continuidade (`continuar` ou `bloquear`).
- Registro de riscos residuais e lacunas.

Fora de escopo:
- Reescrever arquitetura inteira fora do escopo aprovado.
- Substituir a fase final de `sdd-validacao`.
- Publicar alterações sem passar pelos gates obrigatórios.

## Entradas Obrigatórias

1. Pedido do usuário (teste, validação, revisão, commit/push/PR/publicação).
2. Arquivos alterados (ou alvo de revisão) e contexto técnico mínimo.
3. Critérios esperados de qualidade/segurança do escopo.

Referências obrigatórias:
- `references/review-checklist.md`
- `references/security-quality-matrix.md`

## Fluxo Operacional (Determinístico)

1. Coletar contexto do escopo e arquivos de maior risco.
2. Executar revisão orientada por checklist (bug, segurança, qualidade, testes, documentação).
3. Classificar cada achado por severidade e impacto.
4. Para cada achado, propor correção mínima e verificável.
5. Consolidar métricas mínimas obrigatórias:
   - total de arquivos revisados;
   - total de itens de checklist aplicáveis e verificados;
   - total de achados por severidade;
   - total de pendências bloqueantes.
6. Consolidar status do review:
   - `aprovado`
   - `aprovado com ressalvas`
   - `reprovado`
7. Emitir decisão operacional explícita:
   - `aprovado para continuar`
   - `bloqueado para continuar`
8. Se houver pedido de publicação, repassar resultado para `github-flow` com pendências explícitas.
9. Se houver pedido de validação final, repassar resultado para `sdd-validacao` com rastreabilidade de achados.

## Contrato de Saída

Responder sempre com as seções abaixo, nesta ordem:
1. `Status final do code review` (`aprovado`, `aprovado com ressalvas`, `reprovado`).
2. `O que foi feito`:
   - escopo revisado;
   - arquivos/componentes revisados;
   - tipos de análise executados.
3. `Como foi feito`:
   - passo a passo da revisão;
   - passo a passo dos testes/validações executados.
4. `Achados por severidade` (`crítico/alto/médio/baixo`) com:
   - evidência (arquivo/componente),
   - impacto,
   - correção sugerida,
   - status (`aberto`, `mitigado`, `aceito`).
5. `Métricas`:
   - arquivos revisados;
   - itens de checklist verificados;
   - achados por severidade;
   - pendências bloqueantes;
   - nível de confiança (`alto`, `médio`, `baixo`).
6. `Aprovação para continuar`:
   - `aprovado para continuar` ou
   - `bloqueado para continuar`
   - justificativa objetiva.
7. Telemetria registrada (`SKILL_START/STEP/HANDOFF/LOADING/END`).

## Fail-Safe e Tratamento de Ambiguidade

- Se o contexto estiver incompleto, registrar lacuna e classificar no máximo como `aprovado com ressalvas`.
- Se houver conflito entre requisito e implementação, priorizar evidência técnica e registrar o conflito explicitamente.
- Se houver achado `crítico` sem mitigação, bloquear integração com status `reprovado` e `bloqueado para continuar`.
- Se não houver evidência mínima de testes no escopo alterado, registrar risco residual e reduzir confiança.
- Se faltar qualquer seção obrigatória do contrato de saída, review deve ser considerado incompleto.

## Guardrails

- Nunca minimizar vulnerabilidade para acelerar entrega.
- Nunca ocultar risco de segurança, regressão ou dívida técnica relevante.
- Nunca aprovar mudança com exposição de segredo/token/chave.
- Nunca concluir review sem recomendação prática de correção.
- Nunca concluir review sem bloco de métricas.
- Nunca concluir review sem decisão explícita de continuidade.
- Nunca substituir validação final SDD; esta skill é gate preventivo.

## Checklist de Qualidade

- Escopo e arquivos de revisão foram identificados.
- Checklist de bug/segurança/qualidade foi aplicado.
- Achados foram classificados por severidade.
- Cada achado tem recomendação de correção.
- Status final foi decidido com critério objetivo.
- Riscos residuais e pendências foram reportados.
- Métricas mínimas foram consolidadas e reportadas.
- Decisão de continuidade foi declarada explicitamente.
