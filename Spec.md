# Spec - Implementação da Genericização

## Escopo técnico

1. Renomear diretórios de skills para IDs genéricos.
2. Atualizar referências internas para os novos nomes.
3. Reescrever `AGENTS.md` para catálogo genérico + regra obrigatória de prontidão.
4. Adicionar `skills/project-readiness-gate/` com `SKILL.md` e `references/checklist-template.md`.
5. Ajustar governança:
   - `skills/governance/scripts/check_drift.rb`
   - `skills/governance/scripts/behavior_contract_test.rb`
   - `skills/governance/scripts/gate_skills.rb`
6. Limpar URLs e estruturas fixas em `github-flow` e `api-doc-postman`.
7. Atualizar artefatos de documentação e versionamento:
   - `skills/VERSION`
   - `skills/governance/VERSION`
   - `skills/CHANGELOG.md`
   - `skills/governance/CHANGELOG.md`
   - `skills-workflow-guide.html`
   - `readme.md`

## Validação

1. Rodar os quatro scripts de governança.
2. Regenerar `skills/SKILLS_V3_METRICAS.md` pelo script oficial.
3. Verificar ausência de termos legados `lima`/`lima-retratos` em nomes de skills e referências operacionais ativas.

## Riscos

1. Regressão em scripts que exigem nomes antigos.
2. Divergência entre AGENTS e validações automatizadas.

## Mitigação

1. Ajustar scripts de contrato/gate/drift em conjunto.
2. Executar bateria completa de checks antes de concluir.
