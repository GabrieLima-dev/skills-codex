---
name: aprendizado-profundo
description: Use esta skill para aprendizado contínuo do modo de trabalho do usuário, propondo melhorias de processo/skills com base em evidências, sempre sob aprovação explícita antes de aplicar qualquer mudança, preservando gate universal de plano, comando explícito para execução, SDD obrigatório, TDD, relatório estruturado de testes/métricas e saída `como testar`.
---

# Aprendizado Profundo Contínuo

## Objetivo Operacional

Evoluir continuamente as skills e o processo de entrega com base no feedback real do usuário e em evidências operacionais, sem alterar comportamento padrão sem aprovação.

## Escopo

Incluído:
- Captura estruturada de feedback do usuário após entregas.
- Análise de lacunas de processo, qualidade, velocidade e confiabilidade.
- Propostas objetivas de melhoria de skills/workflows/templates.
- Reforço de governança para plano obrigatório, SDD obrigatório, TDD em código e seção `como testar`.
- Reforço de governança para execução somente após comando explícito do usuário.
- Reforço de governança para checkpoint final obrigatório de testes adicionais antes de encerrar fluxo.
- Atualização obrigatória de `skills-workflow-guide.html` quando houver mudança em `skills/` ou `AGENTS.md`.
- Registro de decisão (`aprovado`, `reprovado`, `adiado`) por melhoria proposta.
- Telemetria expandida de auditoria em tela com `SKILL_LOADING`.

Fora de escopo:
- Alterar skills sem aprovação explícita do usuário.
- Introduzir mudanças amplas sem hipótese e métrica de validação.
- Tratar percepção isolada como fato consolidado.

## Entradas Obrigatórias

1. Feedback do usuário (explícito ou observado em revisões).
2. Evidências da entrega (erros recorrentes, retrabalho, falhas de validação, tempo de ciclo).
3. Estado atual das skills e governança.

Referências obrigatórias:
- `references/ciclo-aprendizado.md`
- `references/template-proposta-melhoria.md`

## Fluxo Operacional (Determinístico)

1. Coletar sinais de melhoria (feedback, incidentes, gargalos, riscos).
2. Classificar problema por categoria (clareza, qualidade, validação, publicação, governança, segurança, documentação, performance, DX).
3. Definir hipótese de melhoria com impacto esperado e risco.
4. Separar recomendações em `corrigir agora` vs `follow-up` para não poluir escopo atual.
5. Criar proposta objetiva com escopo mínimo, critérios e métrica de sucesso, incluindo:
   - `o que a agente entendeu`
   - `o que a agente acredita que deve realizar`
   - `arquivos previstos`
   - `riscos percebidos`
   - `impacto esperado da alteração`
   - pergunta explícita de confirmação.
6. Submeter proposta para aprovação explícita do usuário com status `pendente`.
7. Somente se aprovada, implementar mudança de skill/processo com rastreabilidade.
8. Emitir `SKILL_LOADING` nas transições de fase para auditoria visual.
9. Executar gates de governança e registrar resultado.
10. Se houver alteração em `skills/` ou `AGENTS.md`, atualizar `skills-workflow-guide.html` antes da publicação.
11. Consolidar relatório de testes/validações/métricas da melhoria aplicada em formato estruturado.
12. Antes de encerrar, validar com o usuário se deseja testes adicionais sobre a melhoria e executar apenas com comando explícito.
13. Garantir que a saída inclua `como testar` (API/FRONT quando aplicável).
14. Revisar eficácia pós-adoção e decidir manter, ajustar ou reverter.

## Contrato de Saída

Responder sempre com:
1. Problema observado e evidências.
2. Proposta de melhoria com impacto esperado.
3. Riscos e trade-offs.
4. Status de decisão do usuário (`aprovado`, `reprovado`, `adiado`).
5. Mudança aplicada (ou não) com arquivos alterados.
6. Testes/validações executados e lacunas.
7. Métricas antes/depois e conclusão de eficácia.
8. Lista de `corrigir agora` vs `follow-up` com prioridade.
9. Telemetria registrada (`SKILL_START/STEP/HANDOFF/LOADING/END`).

## Fail-Safe e Tratamento de Ambiguidade

- Se o feedback for ambíguo, consolidar hipóteses e pedir confirmação antes de alterar skill.
- Se faltar evidência, registrar limitação e classificar proposta como experimento controlado.
- Se houver conflito entre melhoria proposta e governança vigente, bloquear alteração até resolução.
- Se não houver aprovação explícita, manter processo atual sem mudanças.
- Se não houver evidência mínima de teste/validação e métricas, bloquear conclusão como `aprovado`.
- Se houver mudança em `skills/` ou `AGENTS.md` sem atualização do guia de skills, bloquear conclusão como `aprovado`.
- Se melhoria reduzir exigência de plano aprovado, SDD, TDD ou `como testar`, bloquear alteração.
- Se melhoria enfraquecer regra de comando explícito para execução, bloquear alteração.
- Se melhoria omitir checkpoint de testes adicionais antes de encerramento, bloquear alteração.

## Guardrails

- Nunca alterar skill produtiva por inferência sem validação do usuário.
- Nunca reduzir fail-safe para ganhar velocidade sem justificativa técnica.
- Nunca publicar melhoria sem atualização de versionamento e changelog.
- Nunca concluir melhoria sem relatório de testes/validações/métricas.
- Nunca executar validações adicionais sem comando explícito do usuário.
- Nunca omitir `SKILL_LOADING` em melhoria multi-fase.
- Nunca publicar mudança em `skills/` ou `AGENTS.md` sem atualizar `skills-workflow-guide.html`.
- Nunca ocultar regressão de processo após mudança.
- Nunca aprovar melhoria que enfraqueça plano obrigatório, SDD obrigatório, TDD ou validação reproduzível.

## Checklist de Qualidade

- Proposta tem evidência e métrica de sucesso.
- Aprovação explícita do usuário foi registrada.
- Proposta trouxe entendimento, proposta de ação, arquivos previstos, riscos percebidos, impacto esperado e pergunta de confirmação.
- Alteração é incremental e reversível.
- Governança (score/gate/drift) foi executada.
- Testes/validações e relatório de métricas foram registrados.
- `skills-workflow-guide.html` foi atualizado quando houve mudança em `skills/` ou `AGENTS.md`.
- Resultado pós-adoção foi medido e documentado.
