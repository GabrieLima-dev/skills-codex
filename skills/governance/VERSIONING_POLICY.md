# Política de Versionamento de Skills

## Regra geral

Aplicar SemVer à governança de skills: `MAJOR.MINOR.PATCH`.

## Critérios

- `MAJOR`: quebra de compatibilidade no contrato das skills ou no processo obrigatório.
- `MINOR`: nova capacidade de governança, novo check ou novo padrão sem quebra.
- `PATCH`: correção de erro, ajuste textual ou melhoria sem mudança de contrato.

## Regras de atualização

1. Toda mudança deve atualizar `VERSION` e `CHANGELOG.md`.
2. Toda mudança deve passar nos gates automáticos.
3. Mudança `MAJOR` exige revisão explícita de impacto em `AGENTS.md`.
4. Mudança `MINOR`/`PATCH` deve manter retrocompatibilidade operacional.

## Exemplo

- `3.0.0 -> 3.1.0`: adiciona novos controles sem quebrar contrato.
- `3.1.0 -> 4.0.0`: altera seções obrigatórias de `SKILL.md` e invalida automações antigas.
