# Skills Genéricas - Documentação Operacional

Este repositório contém um agente com skills reutilizáveis e desacopladas de projeto específico.

## Estrutura

- `AGENTS.md`: contrato operacional e regras globais.
- `skills/`: catálogo de skills, referências e governança.
- `doc_skills/readme.md`: guia textual de operação.
- `doc_skills/skills-workflow-guide.html`: guia visual de workflow.

## Gate obrigatório de execução

Antes de qualquer execução, a skill `project-readiness-gate` valida:

1. Stack e versões.
2. Estrutura dos repositórios/pastas impactadas.
3. Comandos de instalação/build/lint/test.
4. Estratégia de ambiente/deploy.

Tríade obrigatória de stack: `backend`, `frontend` e `docs` devem estar sempre preenchidos.

Se houver lacunas (incluindo ausência de qualquer item da tríade obrigatória), a execução é bloqueada e o agente deve perguntar ao usuário até preencher os campos obrigatórios.

## Pacote documental obrigatório de skills

Sempre que houver alteração em `skills/` ou `AGENTS.md`, atualizar obrigatoriamente:

1. `doc_skills/readme.md`
2. `doc_skills/skills-workflow-guide.html`

Sem esse pacote documental atualizado, a publicação deve ser bloqueada.

## Checagens de governança

```bash
ruby skills/governance/scripts/behavior_contract_test.rb --base skills
ruby skills/governance/scripts/score_skills.rb --base skills --output skills/SKILLS_V3_METRICAS.md
ruby skills/governance/scripts/gate_skills.rb --base skills --min-score 95
ruby skills/governance/scripts/check_drift.rb
```
