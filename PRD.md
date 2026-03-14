# PRD - Genericização das Skills e Gate de Prontidão

## Contexto

O workspace continha nomenclaturas e configurações acopladas a um projeto específico.

## Problema

1. Nomes de skills/pastas com prefixos legados.
2. Referências fixas de repositório/estrutura.
3. Ausência de gate obrigatório para validar stack/configuração antes da execução.

## Objetivo

Transformar o pacote em template genérico reutilizável, preservando governança e qualidade operacional.

## Requisitos Funcionais

1. Remover prefixos legados dos nomes de skills (pastas e identificadores).
2. Limpar referências de projeto específico em AGENTS e skills.
3. Criar skill obrigatória `project-readiness-gate` que bloqueia execução sem contexto completo.
4. Atualizar governança/scripts para reconhecer a nova skill.
5. Atualizar documentação mínima (`readme.md` e `skills-workflow-guide.html`).

## Requisitos Não Funcionais

1. Manter compatibilidade dos scripts de score/gate.
2. Manter telemetria de skill e rastreabilidade SDD.
3. Evitar exposição de segredos.

## Critérios de Aceitação

1. Não existem pastas/skills com nome contendo `lima` ou `lima-retratos`.
2. Existe skill `project-readiness-gate` com bloqueio de execução por lacuna.
3. `AGENTS.md` aponta para skills genéricas e inclui regra obrigatória do gate.
4. Scripts de governança executam sem falha.
