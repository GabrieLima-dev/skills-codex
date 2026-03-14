# RACI - Governança de Skills

## Papéis

- `Owner de Skills`: responsável final pelo contrato e qualidade.
- `Revisor Técnico`: valida consistência técnica e riscos.
- `Mantenedor de Repositório`: aplica mudanças e mantém CI saudável.
- `Executor SDD`: usa as skills no fluxo diário e reporta falhas.

## Matriz RACI

| Atividade | Owner de Skills | Revisor Técnico | Mantenedor de Repositório | Executor SDD |
|---|---|---|---|---|
| Definir padrão de `SKILL.md` | A | C | I | C |
| Alterar skill crítica (`github-flow`, `validacao`) | A | R | C | I |
| Aprovar mudança `MAJOR` | A | R | C | I |
| Executar gate automático | I | C | R | I |
| Corrigir falha de gate | A | C | R | I |
| Auditoria mensal | A | R | C | C |
| Responder incidente de skill | A | R | C | C |

Legenda: `R` Responsible, `A` Accountable, `C` Consulted, `I` Informed.
