## Skills

A skill is a set of local instructions stored in a `SKILL.md` file.

### Available skills

- project-readiness-gate: Use before any execution to validate if stack, architecture, repository mapping and mandatory skill configs are complete; if not complete, block execution and ask the user for missing data. (file: skills/project-readiness-gate/SKILL.md)
- context: Use when a task needs technical understanding of current code behavior, module boundaries and critical flows. (file: skills/context/SKILL.md)
- vps-easypanel: Use when planning/deploying/operating this project on VPS with Docker + EasyPanel, domains, SSL, and security baseline. (file: skills/vps-easypanel/SKILL.md)
- data-model: Use when discussing/planning DER/Postgres architecture and migration path from current model to scalable multi-tenant model. (file: skills/data-model/SKILL.md)
- github-flow: Use when the user asks to commit/push/open PR/publish; enforce task branch from `main`, PR documentation, README update by impacted repo, and skills guide sync when changing `skills/` or `AGENTS.md`. (file: skills/github-flow/SKILL.md)
- code-review: Use when the user asks to test/validate/review quality or to commit/push/open PR/publish; perform preventive code review for bugs, security vulnerabilities and quality issues before integration. (file: skills/code-review/SKILL.md)
- api-doc-postman: Use when Backend(API) endpoints are created/changed/removed and API docs must stay synchronized from a single OpenAPI source. (file: skills/api-doc-postman/SKILL.md)
- front-ux-ui-design: Use for any frontend visual/layout/theme/responsive change; the execution plan must present exactly 3 visual direction proposals with clickable links and wait for explicit user approval before implementation. (file: skills/front-ux-ui-design/SKILL.md)
- sdd-sprint-orquestracao: Use for any end-to-end change request; enforce request validation, impact analysis, approved execution plan, SDD flow, mapped changes, tests/metrics and publish checklist. (file: skills/sdd-sprint-orquestracao/SKILL.md)
- aprendizado-profundo: Use for continuous process/skill improvement based on user feedback and delivery evidence, always requiring explicit user approval before applying improvements. (file: skills/aprendizado-profundo/SKILL.md)
- sdd-pesquisa-prd: Use when a new request arrives and SDD phase 1 (research) must produce a grounded `PRD.md`. (file: skills/sdd-pesquisa-prd/SKILL.md)
- sdd-prd-spec: Use when converting an approved `PRD.md` into a concrete `Spec.md` with file-level plan and validation criteria. (file: skills/sdd-prd-spec/SKILL.md)
- sdd-spec-code: Use when implementing a `Spec.md` with strict scope control, simple code and no unplanned architecture changes. (file: skills/sdd-spec-code/SKILL.md)
- sdd-validacao: Use for final validation/revalidation before publish, checking alignment between PRD, Spec, Code, tests and risks. (file: skills/sdd-validacao/SKILL.md)

### How to use skills

- Discovery: Skills listed above are available in this repository.
- Trigger rules: If the user names a skill directly or the request clearly matches a skill description, use that skill for that turn.
- Project readiness gate rule: Any executable request must trigger `project-readiness-gate` before `sdd-sprint-orquestracao`.
- Stack/config completeness rule: If stack/config/architecture context is incomplete, execution is blocked; ask objective questions until all mandatory fields are provided by the user.
- Mandatory stack triad rule: `backend`, `frontend` e `docs` são obrigatórios em toda solicitação executável; se qualquer um estiver ausente, manter bloqueio até preenchimento explícito.
- Code review test rule: Any request to test, validate, audit quality, or look for bugs/security issues must trigger `code-review` before `sdd-validacao`.
- Code review publish rule: Any request to commit, push, open PR, or publish changes must trigger `code-review` together with `github-flow` before publication.
- GitHub rule: Any request to commit, push, open PR, or publish changes must trigger `github-flow`.
- Skills Docs rule: Any change in `doc_skills/readme.md` or `doc_skills/skills-workflow-guide.html` must be published to `<SKILLS_REPO_URL>` via `branch de trabalho -> main`.
- Skills Repo rule: Any change under `skills/` (including new/edited SKILLs, governance, changelog, version, metrics and guide) must be synchronized and published to `<SKILLS_REPO_URL>` via `branch de trabalho -> main`.
- Skills docs pack sync rule: Toda alteração em `skills/` ou `AGENTS.md` deve atualizar obrigatoriamente o pacote documental `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`.
- Sprint rule: Any request that changes code/process must start with `sdd-sprint-orquestracao`.
- API docs rule: Any Backend(API) endpoint change must trigger `api-doc-postman` to keep OpenAPI and docs site synchronized.
- Frontend design rule: Any visual/layout/theme/responsive/frontend UX change must trigger `front-ux-ui-design`.
- Frontend UX benchmark mandatory rule: Em qualquer mudança de frontend visual/layout/theme/responsividade/UX, o plano obrigatório deve apresentar exatamente 3 propostas de direção visual com links clicáveis, explicar trade-offs e aguardar aprovação explícita antes de implementar.
- Melhoria contínua rule: Any request to improve process/skills must trigger `aprendizado-profundo` and requires explicit user approval before applying changes.
- Universal plan gate rule: Toda e qualquer solicitação que envolva execução (criação, alteração, ajuste, refatoração, commit, push, PR, publicação, deploy ou automação) deve apresentar plano e aguardar aprovação explícita do usuário antes de executar.
- Structured plan rule: Todo plano obrigatório deve conter `o que a agente entendeu`, `o que a agente acredita que deve realizar`, `arquivos previstos`, `riscos percebidos`, `impacto esperado da alteração` e pergunta explícita de confirmação antes de executar.
- Explicit command execution rule: Mesmo com plano aprovado, a agente só pode executar comandos, edições, testes ou automações após comando explicitamente claro do usuário autorizando iniciar a execução.
- Execution authorization register rule: Antes de executar, registrar em tela qual comando/autorização explícita do usuário habilitou a etapa operacional.
- Branch creation for publish rule: Quando o usuário pedir commit/push/PR/publicação, criar uma nova branch de trabalho a partir da `main`, realizar commits nela e abrir PR dessa branch para `main`.
- Universal SDD rule: Toda execução deve seguir trilha SDD com rastreabilidade (`PRD.md -> Spec.md -> implementação -> validação`), sem exceção operacional.
- TDD mandatory rule: Toda implementação de código deve adotar TDD (`red -> green -> refactor`) com evidências de testes criados/ajustados antes ou junto da mudança.
- Validation + metrics rule: Toda alteração deve finalizar com testes/validações e relatório de métricas (planejado vs executado, taxa de sucesso, pendências e nível de confiança).
- Mandatory test report format rule: Todo ciclo de testes deve entregar relatório estruturado com `escopo`, `ambiente`, `matriz planejado vs executado`, `comandos executados`, `resultado por teste`, `lacunas`, `métricas` e `risco residual`.
- Pre-close extra-tests checkpoint rule: Antes de finalizar o fluxo, a agente deve perguntar explicitamente se o usuário deseja testes adicionais, listar opções de testes possíveis e aguardar decisão.
- How-to-test mandatory rule: Toda entrega deve incluir seção final `como testar` com passos objetivos para API (endpoints) e FRONT (fluxo visual), quando aplicável ao escopo.
- README mandatory rule: Toda alteração em cada projeto deve atualizar o `readme.md` do repositório impactado.
- Skills docs sync rule: Toda alteração em `skills/` ou `AGENTS.md` deve atualizar `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`.
- Skills publish rule: Toda alteração em `skills/` deve ser sincronizada e publicada no repositório `<SKILLS_REPO_URL>` usando `branch de trabalho -> main`.
- Publish blocking rule: Não publicar commit/push/PR sem evidência de plano aprovado, validação SDD, testes e seção `como testar`.
- SDD rule: For feature development, prefer this sequence:
  1) `project-readiness-gate`
  2) `sdd-sprint-orquestracao`
  3) `sdd-pesquisa-prd`
  4) `sdd-prd-spec`
  5) `sdd-spec-code`
  6) `code-review`
  7) `sdd-validacao`
- Missing/blocked: If a skill file cannot be read, say so briefly and continue with the best fallback.
- Progressive loading:
  1) Read `SKILL.md` first.
  2) Load `references/` files only when needed for the current request.
- Coordination: If more than one skill applies, use the minimal set and state the order briefly.
- Safety: Never expose secrets, tokens, credentials, or private keys.

## Skill Telemetry (Obrigatório)

Para auditoria em tempo real, toda skill acionada deve ser registrada em tela.

Formato obrigatório de log:

1) `SKILL_START: <skill> | motivo objetivo`
2) `SKILL_STEP: <skill> | ação atual`
3) `SKILL_HANDOFF: <skill-origem> -> <skill-destino> | motivo`
4) `SKILL_LOADING: <skill> | [##........] 20% | fase/ação`
5) `SKILL_END: <skill> | status`

Regras:

- Emitir `SKILL_START` no momento em que a skill for ativada.
- Emitir `SKILL_STEP` a cada etapa relevante da execução.
- Emitir `SKILL_HANDOFF` quando houver troca de skill no fluxo.
- Emitir `SKILL_LOADING` para transição de fase (`descoberta`, `plano`, `implementação`, `validação`, `publicação`) para auditoria visual.
- Emitir `SKILL_END` ao concluir a skill (`concluída`, `concluída com ressalvas`, `bloqueada`).
- Não ocultar falhas, bloqueios ou lacunas de validação nos logs.
- Quando houver pedido de alteração/ajuste/criação, registrar o plano em tela e o status de aprovação antes de iniciar execução.

## Skill Governance (v4.2)

- Version source of truth: `skills/VERSION`.
- Governance docs: `skills/governance/README.md`.
- Changelog obrigatório: `skills/CHANGELOG.md` e `skills/governance/CHANGELOG.md`.
- Toda alteração de skill deve manter rastreabilidade SDD e passar nos gates abaixo.

### Mandatory checks before publish

1) `ruby skills/governance/scripts/behavior_contract_test.rb --base skills`
2) `ruby skills/governance/scripts/score_skills.rb --base skills --output skills/SKILLS_V3_METRICAS.md`
3) `ruby skills/governance/scripts/gate_skills.rb --base skills --min-score 95`
4) `ruby skills/governance/scripts/check_drift.rb`

### Governance rules

- Não reduzir guardrails/fail-safe sem justificativa técnica explícita.
- Tratar score abaixo de 95 como regressão de confiabilidade.
- Tratar ausência de acionamento de `project-readiness-gate` antes da execução como falha de processo.
- Tratar execução sem stack/configuração mínima confirmada como falha de processo.
- Tratar ausência de preenchimento explícito da tríade obrigatória `backend + frontend + docs` como falha de processo.
- Tratar qualquer `skills/` ou `AGENTS.md` local em apps satélite como bloqueio de publicação (política root-only).
- Tratar ausência de telemetria de skill em tela (`SKILL_START/STEP/HANDOFF/LOADING/END`) como falha de auditoria operacional.
- Tratar ausência de telemetria visual `SKILL_LOADING` em tarefas multi-fase como falha de observabilidade operacional.
- Tratar execução sem plano aprovado previamente como falha de processo.
- Tratar plano sem `entendimento + proposta + arquivos previstos + riscos percebidos + impacto esperado + pergunta de confirmação` como falha de processo.
- Tratar execução sem comando explícito do usuário como falha de processo.
- Tratar mudança de frontend visual/layout/theme/responsividade/UX sem apresentação prévia, no plano, de 3 propostas de direção visual com links como falha de processo.
- Tratar ausência de registro da autorização explícita de execução como falha de auditoria operacional.
- Tratar publicação sem criar branch de trabalho a partir da `main` como falha de processo.
- Tratar PR que não tenha `main` como base como falha de processo.
- Tratar qualquer execução sem trilha SDD completa como falha de processo.
- Tratar ausência de evidência de TDD em mudança de código como falha de qualidade.
- Tratar ausência de relatório final de testes/validações/métricas como falha de qualidade.
- Tratar ausência de relatório de testes no formato estruturado obrigatório como falha de qualidade.
- Tratar ausência do checkpoint final de validação de testes adicionais com o usuário como falha de processo.
- Tratar ausência de seção `como testar` (API e FRONT quando aplicável) como falha de validação operacional.
- Tratar ausência de acionamento da `code-review` em pedidos de teste/validação/publicação como falha de processo.
- Tratar alteração sem atualização do `readme.md` do repositório impactado como falha de documentação.
- Tratar alteração em `skills/` ou `AGENTS.md` sem atualização de `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html` como falha de rastreabilidade documental.
- Atualizar `VERSION` e `CHANGELOG` em toda mudança estrutural de skill.
