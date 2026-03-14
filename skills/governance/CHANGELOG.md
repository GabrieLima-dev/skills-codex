# Changelog - Skills Governance

## [4.2.0] - 2026-03-14

### Changed

- Governança atualizada para tratar ausência do pacote documental (`doc_skills/readme.md` + `doc_skills/skills-workflow-guide.html`) como falha de rastreabilidade em mudanças de `skills/` ou `AGENTS.md`.
- `behavior_contract_test.rb` reforçado para auditar regra de sync do pacote documental no `AGENTS.md` e nas skills críticas (`sdd-sprint-orquestracao` e `github-flow`).
- `gate_skills.rb` reforçado para exigir a regra `Skills docs pack sync rule` no `AGENTS.md`.


## [4.1.0] - 2026-03-14

### Changed

- `behavior_contract_test.rb` atualizado para auditar presença da tríade obrigatória `backend + frontend + docs` na `project-readiness-gate` e no `AGENTS.md`.
- `gate_skills.rb` atualizado para bloquear skill de prontidão que não contenha a regra da tríade obrigatória.
- `README.md` de governança e casos comportamentais atualizados para tratar ausência da tríade como falha de processo.

## [4.0.0] - 2026-03-14

### Changed

- Governança atualizada para exigir `project-readiness-gate` antes de qualquer execução operacional.
- `check_drift.rb` atualizado para incluir `project-readiness-gate` no conjunto obrigatório e remover acoplamento rígido com caminhos fixos de Front/Back (agora opcionais via variáveis/flags).
- `behavior_contract_test.rb` e `gate_skills.rb` atualizados com validações obrigatórias da nova skill de prontidão.
- `README.md` da governança atualizado para refletir política genérica e nova versão `v4.0`.

## [3.19.0] - 2026-03-14

### Changed

- Governança alinhada ao novo gate de publicação: presença de `.DS_Store` no `.gitignore` como requisito de higiene de repositório na skill `github-flow`.
- Documentação operacional de governança sincronizada para refletir bloqueio de publicação quando a regra `.DS_Store` estiver ausente no repositório alvo.

## [3.18.0] - 2026-03-14

### Changed

- Governança atualizada para tratar como falha de processo plano sem os blocos obrigatórios `entendimento + proposta + arquivos previstos + riscos percebidos + impacto esperado + pergunta de confirmação`.
- Governança atualizada para tratar como falha de processo mudança de frontend visual/layout/theme/responsividade/UX sem 3 propostas de direção visual com links registradas no plano.
- `behavior_contract_test.rb` reforçado para auditar:
  - presença dos campos `riscos percebidos` e `impacto esperado da alteração` na `sdd-sprint-orquestracao`;
  - exigência das 3 propostas com links no plano da `front-ux-ui-design`;
  - coerência textual das novas regras no `AGENTS.md`.
- Casos comportamentais expandidos com bloqueios para plano incompleto (sem riscos/impacto) e frontend sem 3 propostas no plano.
- Documentação de governança alinhada para `v3.18`.

## [3.17.0] - 2026-03-14

### Changed

- Governança atualizada para tratar como falha de processo qualquer alteração grande de frontend/refazer front/pedido explícito de UX/UI sem apresentação prévia de 3 modelos de mercado com links.
- `behavior_contract_test.rb` reforçado para auditar:
  - presença da regra global `Frontend UX benchmark mandatory rule` no `AGENTS.md`;
  - exigência de gatilho obrigatório, 3 modelos com links e aprovação explícita na `front-ux-ui-design`.
- Casos comportamentais expandidos com cenário de bloqueio para tentativa de execução UX/UI grande sem os 3 modelos com links.
- Documentação de governança alinhada para `v3.17`.

## [3.16.0] - 2026-03-13

### Changed

- Governança atualizada para tratar como falha operacional:
  - publicação sem criação de branch de trabalho a partir de `main`;
  - PR cuja base não seja `main`.
- `behavior_contract_test.rb` reforçado para auditar:
  - nova regra global `Branch creation for publish rule` no `AGENTS.md`;
  - presença de política de branch de trabalho e PR para `main` na `github-flow`.
- Casos comportamentais expandidos com cenário de bloqueio para publicação sem branch nova da tarefa.
- Documentação de governança alinhada ao fluxo `branch de trabalho -> main`.

## [3.15.0] - 2026-03-12

### Changed

- Governança atualizada para tratar como falha:
  - execução sem comando explícito do usuário;
  - ausência de registro da autorização explícita da execução;
  - ausência de relatório de testes no formato estruturado obrigatório;
  - ausência de checkpoint final com o usuário sobre testes adicionais antes do encerramento.
- `scripts/behavior_contract_test.rb` reforçado para auditar as novas regras em `AGENTS.md`, `sdd-sprint-orquestracao` e `sdd-validacao`.
- `tests/skill-behavior-cases.md` expandido com cenários de bloqueio para:
  - plano aprovado sem comando explícito;
  - encerramento sem checkpoint de testes adicionais.
- Documentação de governança (`README.md`) sincronizada para `v3.15`.

## [3.14.0] - 2026-03-12

### Changed

- Governança atualizada para refletir reforço da `code-review` com relatório detalhado obrigatório, métricas mínimas e decisão explícita de continuidade (`aprovado para continuar` ou `bloqueado para continuar`).
- Documentação operacional do ecossistema (`skills-workflow-guide.html`) sincronizada para `v3.14.0`.

## [3.13.0] - 2026-03-10

### Changed

- Governança atualizada para incluir a skill `code-review` como gate preventivo obrigatório em pedidos de teste/validação e em pedidos de publicação.
- `scripts/check_drift.rb` atualizado para exigir presença da `code-review` no conjunto obrigatório de skills na raiz.

## [3.12.0] - 2026-03-08

### Changed

- Governança atualizada para incluir a skill `front-ux-ui-design` no ecossistema de confiabilidade operacional.
- Regras operacionais passaram a explicitar benchmark de referência e confirmação de direção visual para mudanças frontend guiadas pela nova skill.

## [3.11.0] - 2026-03-08

### Changed

- Governança passou a tratar como falha crítica qualquer execução sem plano aprovado explicitamente, incluindo commit/push/PR/publicação.
- Governança passou a tratar ausência de trilha SDD completa como falha de processo.
- Governança passou a tratar ausência de evidência de TDD em mudança de código como falha de qualidade.
- Governança passou a tratar ausência de seção `como testar` (API/FRONT quando aplicável) como falha de validação operacional.
- Scripts de gate/contrato comportamental reforçados para auditar regras universais em skills críticas e no `AGENTS.md`.

## [3.10.0] - 2026-03-08

### Changed

- Governança atualizada para incluir rastreabilidade da nova skill `api-doc-postman` no ecossistema root-only.
- Versão de governança sincronizada para `v3.10.0` com inclusão de controle operacional para documentação contínua de endpoints da Backend(API).

## [3.9.0] - 2026-03-05

### Changed

- Governança passou a classificar como falha de documentação qualquer alteração sem atualização de `readme.md` no repositório impactado.
- Governança passou a classificar como falha de rastreabilidade documental qualquer alteração em `skills/` ou `AGENTS.md` sem atualização de `skills-workflow-guide.html`.
- `README` de governança atualizado para versão `v3.9`.

## [3.8.0] - 2026-03-05

### Changed

- Governança passou a classificar como falha de processo plano de alteração/ajuste/criação sem os quatro blocos obrigatórios: entendimento, proposta, arquivos previstos e pergunta de confirmação.
- Governança passou a classificar ausência de relatório final de testes/validações/métricas como falha de qualidade.
- Governança passou a classificar ausência de `SKILL_LOADING` em tarefas multi-fase como falha de observabilidade operacional.
- `README` de governança atualizado para versão `v3.8`.

## [3.7.0] - 2026-03-05

### Changed

- Governança passou a classificar como falha de processo qualquer execução de alteração/ajuste/criação sem plano aprovado previamente.

## [3.6.0] - 2026-03-05

### Changed

- Governança operacional atualizada para incluir publicação do `skills-workflow-guide.html` no repositório dedicado `<SKILLS_REPO_NAME>` usando fluxo `pre-main -> main`.

## [3.5.0] - 2026-03-05

### Changed

- Governança passou a exigir telemetria obrigatória de skills em tela (`SKILL_START/STEP/HANDOFF/END`) como requisito de auditoria operacional.

## [3.4.0] - 2026-03-05

### Changed

- Alinhamento operacional das skills com práticas de validação mais fortes: tipos de teste aplicáveis, lacunas explícitas, nível de confiança e notas de rollback no fluxo de publicação.

## [3.3.0] - 2026-03-05

### Changed

- `scripts/check_drift.rb` migrado para validação `root-only`: exige skills obrigatórias na raiz e bloqueia presença de `skills/`/`AGENTS.md` locais em Front e Back.
- Alinhamento da governança para publicação limpa de Front e Back sem artefatos de skill duplicados.

## [3.2.0] - 2026-03-05

### Changed

- `scripts/check_drift.rb` passou a validar também `sdd-sprint-orquestracao` e `aprendizado-profundo` como skills compartilhadas obrigatórias entre raiz, Front e Back.
- Consolidação de governança para novo fluxo de sprint ponta a ponta com aprovação explícita antes da implementação e melhoria contínua controlada por aprovação do usuário.

## [3.1.0] - 2026-03-03

### Added

- Gate automatizado de qualidade de skills (`scripts/gate_skills.rb`) com threshold configurável.
- Motor de métricas objetivas (`scripts/score_skills.rb`) para score estrutural e de referências.
- Testes de contrato comportamental (`scripts/behavior_contract_test.rb`) para ambiguidade, conflito e incompletude.
- Detector de drift entre raiz, Front e Back (`scripts/check_drift.rb`).
- Política de versionamento semântico para skills.
- SLOs de confiabilidade operacional de skills.
- Matriz RACI para governança e aprovação.
- Template de auditoria mensal.
- Critérios de Definition of Ready e Definition of Done por fase SDD.
- Playbooks de incidente para falha de gate, drift e regressão de confiabilidade.

### Changed

- Consolidação de fluxo operacional de validação contínua para skills.
- Formalização de governança de skills em documentação única.
