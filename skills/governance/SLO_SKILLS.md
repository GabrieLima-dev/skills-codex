# SLO de Confiabilidade das Skills

## Objetivo

Controlar qualidade e previsibilidade das skills com metas mensuráveis.

## Indicadores (SLIs)

1. `Skill Gate Pass Rate`
- Definição: percentual de execuções de gate aprovadas na primeira tentativa.
- Meta: >= 95% por mês.

2. `Skill Drift Rate`
- Definição: percentual de skills espelhadas com hash divergente entre raiz, Front e Back.
- Meta: 0%.

3. `SDD Rastreabilidade Completa`
- Definição: percentual de entregas SDD com evidência PRD->Spec->Code->Validação completa.
- Meta: >= 90%.

4. `Incidentes de Skill em Produção`
- Definição: número de incidentes atribuídos a instrução ambígua/falha de skill.
- Meta: <= 1 por mês, com RCA obrigatória.

5. `Tempo de Correção de Regressão de Skill`
- Definição: tempo entre detecção e correção de regressão de governança.
- Meta: <= 24h para severidade crítica.

## Política de erro (Error Budget)

- Se `Skill Gate Pass Rate` < 95% no mês, congelar mudanças não críticas em skills até estabilização.
- Se `Drift Rate` > 0%, bloquear publicação até sincronização.
- Se houver incidente crítico por skill, executar playbook e auditoria extraordinária.
