# Skills Governance v4.3

Este diretório centraliza o framework de confiabilidade das skills.

## Objetivo

Garantir que as skills permaneçam consistentes, testáveis, auditáveis e seguras em operação.

## Componentes

- `VERSION`: versão semântica da governança de skills.
- `CHANGELOG.md`: histórico de mudanças da governança.
- `VERSIONING_POLICY.md`: política de versionamento.
- `SLO_SKILLS.md`: metas operacionais de confiabilidade.
- `RACI_SKILLS.md`: papéis e responsabilidades.
- `AUDITORIA_MENSAL_TEMPLATE.md`: template de auditoria mensal.
- `SDD_DOR_DOD.md`: critérios de Definition of Ready/Done por fase SDD.
- `PLAYBOOKS_INCIDENTES.md`: resposta operacional para incidentes de skill.
- `tests/skill-behavior-cases.md`: cenários de comportamento esperado.
- `scripts/`: automações de score, gate, testes de contrato e drift.

## Execução recomendada

1. `ruby skills/governance/scripts/behavior_contract_test.rb --base skills`
2. `ruby skills/governance/scripts/score_skills.rb --base skills --output skills/SKILLS_V3_METRICAS.md`
3. `ruby skills/governance/scripts/gate_skills.rb --base skills --min-score 95`
4. `ruby skills/governance/scripts/check_drift.rb`

## Regras de uso

- Não publicar alteração de skill sem passar pelos gates.
- Não reduzir controles de fail-safe sem justificativa técnica.
- Tratar queda de score como regressão de confiabilidade.
- Tratar presença de `skills/` ou `AGENTS.md` locais em repositórios satélite como bloqueio (política `root-only`).
- Tratar ausência de acionamento da `project-readiness-gate` antes de execução como falha de processo.
- Tratar execução com stack/configuração incompleta como falha de processo.
- Tratar ausência de preenchimento da tríade obrigatória `backend + frontend + docs` como falha de processo.
- Tratar ausência de telemetria em tela (`SKILL_START/STEP/HANDOFF/LOADING/END`) como falha de auditoria operacional.
- Tratar ausência de `SKILL_LOADING` em tarefas multi-fase como falha de observabilidade operacional.
- Tratar qualquer execução (incluindo commit/push/PR/publicação/deploy) sem plano aprovado previamente como falha de processo.
- Tratar qualquer execução sem comando explícito do usuário como falha de processo.
- Tratar mudança de frontend visual/layout/theme/responsividade/UX sem apresentação prévia, no plano, de 3 propostas de direção visual com links como falha de processo.
- Tratar ausência do registro textual da autorização explícita como falha de auditoria operacional.
- Tratar publicação sem criação de branch de trabalho a partir da `main` como falha de processo.
- Tratar PR que não tenha `main` como base como falha de processo.
- Tratar plano sem `entendimento + proposta + arquivos previstos + riscos percebidos + impacto esperado + pergunta de confirmação` como falha de processo.
- Tratar ausência de trilha SDD (`PRD -> Spec -> Implementação -> Validação`) como falha de processo.
- Tratar ausência de evidência de TDD em mudanças de código como falha de qualidade.
- Tratar ausência de relatório de testes/validações/métricas como falha de qualidade.
- Tratar ausência de relatório de testes no formato estruturado obrigatório como falha de qualidade.
- Tratar ausência de checkpoint final de testes adicionais com o usuário como falha de processo.
- Tratar ausência de seção `como testar` (API/FRONT quando aplicável) como falha de validação operacional.
- Tratar ausência de acionamento da `code-review` em pedidos de teste/validação/publicação como falha de processo.
- Tratar alteração sem atualização de `readme.md` no repositório impactado como falha de documentação.
- Tratar alteração em `skills/` ou `AGENTS.md` sem atualização de `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html` como falha de rastreabilidade documental.
- Tratar documentação de API fora do padrão fixo `docs-portal-cliente` (layout/UX/funções) como desvio de padronização quando a skill `api-doc-postman` for acionada.
