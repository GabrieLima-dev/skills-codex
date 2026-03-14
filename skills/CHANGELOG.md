# Changelog - Skills

## [4.2.0] - 2026-03-14

### Changed

- Regra global reforçada: toda alteração em `skills/` ou `AGENTS.md` deve atualizar obrigatoriamente o pacote documental `doc_skills/readme.md` + `doc_skills/skills-workflow-guide.html`.
- `sdd-sprint-orquestracao`, `github-flow` e checklist de publicação atualizados para bloquear fluxo sem o pacote documental completo.
- `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html` sincronizados para refletir o novo contrato operacional.


## [4.1.0] - 2026-03-14

### Changed

- `project-readiness-gate` endurecida para exigir sempre preenchimento da tríade de stack `backend + frontend + docs` antes de liberar execução.
- `AGENTS.md` atualizado com regra explícita da tríade obrigatória e bloqueio quando qualquer item estiver ausente.
- Checklist de prontidão atualizado para marcar `backend`, `frontend` e `docs` como campos mandatórios.
- `skills-workflow-guide.html` e `readme.md` sincronizados com a nova política de preenchimento obrigatório da tríade de stack.

## [4.0.0] - 2026-03-14

### Added

- Nova skill `project-readiness-gate` para validar stack/configuração obrigatória antes de qualquer execução, com bloqueio automático enquanto houver lacunas de contexto.

### Changed

- Renomeação completa das skills para nomenclatura genérica (remoção de prefixos legados e nomes específicos de projeto).
- `AGENTS.md` reescrito para fluxo genérico com acionamento obrigatório de `project-readiness-gate` antes de `sdd-sprint-orquestracao`.
- Skills `context`, `data-model`, `api-doc-postman` e `github-flow` desacopladas de estruturas/URLs fixas de projeto, agora com placeholders reutilizáveis.
- Governança e scripts atualizados para incluir a nova skill obrigatória e manter auditoria operacional.

## [3.19.0] - 2026-03-14

### Changed

- `github-flow` reforçada com regra obrigatória de higiene: todo repositório alvo de publicação deve conter `.DS_Store` no `.gitignore`.
- `github-flow` passou a bloquear publicação quando a regra `.DS_Store` estiver ausente no `.gitignore`.
- Checklist de publicação da skill (`references/repo-publish-checklist.md`) atualizado para auditar `.DS_Store` no pré-flight e nos checklists por repositório.
- `skills-workflow-guide.html` sincronizado para refletir o novo gate de higiene de repositório no bloco de governança/publicação.

## [3.18.0] - 2026-03-14

### Changed

- `AGENTS.md` atualizado para exigir plano de execução com os blocos obrigatórios: `o que a agente entendeu`, `o que a agente acredita que deve realizar`, `arquivos previstos`, `riscos percebidos`, `impacto esperado da alteração` e pergunta de confirmação.
- `AGENTS.md` atualizado para exigir, em mudanças de frontend visual/layout/theme/responsividade/UX, exatamente 3 propostas de direção visual com links no plano antes da execução.
- `sdd-sprint-orquestracao` atualizada para incorporar os novos blocos obrigatórios do plano, incluindo riscos e impacto esperado, além do gate frontend no próprio plano.
- Templates/checklists da sprint atualizados para remover ambiguidade entre regras globais e execução (`template-plano-execucao.md` e `sprint-e2e-checklist.md`).
- `aprendizado-profundo` e template de proposta alinhados ao novo contrato de plano com risco e impacto esperado.
- `front-ux-ui-design` alinhada para exigir as 3 propostas visuais com links no plano obrigatório antes de implementar.
- Governança comportamental reforçada para auditar os novos campos obrigatórios do plano e o gate frontend no plano.
- `skills-workflow-guide.html` sincronizado para `v3.18.0` refletindo plano com risco/impacto e gate UX/UI no fluxo.

## [3.17.0] - 2026-03-14

### Changed

- `front-ux-ui-design` endurecida com regra explícita de acionamento obrigatório para:
  - alteração grande de frontend;
  - pedido de refazer todo o frontend;
  - solicitação explícita de UX/UI.
- A skill de UX/UI agora exige apresentação de exatamente 3 modelos de mercado com links clicáveis e aprovação explícita do usuário antes de implementar.
- Referência `benchmark-sites.md` atualizada com modelos de mercado e formato operacional obrigatório (links + trade-offs + bloqueio sem aprovação).
- `AGENTS.md` atualizado com a regra global `Frontend UX benchmark mandatory rule` para tornar o comportamento obrigatório e auditável.
- Governança comportamental reforçada para validar presença da nova regra no `AGENTS.md` e requisitos na `front-ux-ui-design`.
- `skills-workflow-guide.html` sincronizado para `v3.17.0` com gate explícito de UX/UI.

## [3.16.0] - 2026-03-13

### Changed

- `github-flow` reformulada para novo padrão de publicação:
  - criação obrigatória de nova branch de trabalho a partir de `main`;
  - commits na branch da tarefa;
  - PR obrigatório `branch de trabalho -> main`.
- Templates de PR (`Backend`, `Frontend`, `Documentação`) atualizados com estrutura objetiva baseada no template enviado pelo usuário, incluindo objetivo, impactos, validação, riscos, rollback e checklist.
- Referências de publicação (`pr-api-inline.md` e `repo-publish-checklist.md`) atualizadas para remover dependência de `pre-main` e padronizar `WORK_BRANCH`.
- `AGENTS.md` atualizado para refletir a nova política de branch e governança de publicação para `main`.
- `sdd-sprint-orquestracao` e checklist E2E alinhados ao novo fluxo de branch de trabalho.
- `skills-workflow-guide.html` redesenhado com direção visual premium e mapa mental alinhado ao caminho real de operação da agente.
- Versões de skills/governança elevadas para `v3.16.0`.

## [3.15.0] - 2026-03-12

### Changed

- `AGENTS.md` reforçado com novas regras globais:
  - `Explicit command execution rule` (não executar sem comando explícito do usuário, mesmo com plano aprovado).
  - `Execution authorization register rule` (registrar autorização explícita antes de cada etapa operacional).
  - `Mandatory test report format rule` (relatório estruturado obrigatório de testes e métricas).
  - `Pre-close extra-tests checkpoint rule` (checkpoint obrigatório para o usuário validar testes adicionais antes de encerrar).
- `sdd-sprint-orquestracao` atualizada para bloquear execução sem comando explícito, exigir relatório estruturado de testes/métricas e exigir checkpoint final de testes adicionais com o usuário.
- `sdd-validacao` atualizada para emitir relatório estruturado, perguntar testes adicionais antes do encerramento e bloquear aprovação sem esse checkpoint.
- `aprendizado-profundo` e suas referências atualizadas para preservar os novos gates operacionais no ciclo de melhoria contínua.
- Templates/checklists de sprint e validação atualizados para tornar auditável: autorização explícita, formato do relatório de testes e decisão final sobre testes adicionais.
- Governança automatizada (`behavior_contract_test.rb`) reforçada para auditar as novas regras no `AGENTS.md` e nas skills SDD.
- `skills-workflow-guide.html` sincronizado para refletir `v3.15.0` e os novos gates operacionais.

## [3.14.0] - 2026-03-12

### Changed

- `code-review` evoluída para exigir saída detalhada obrigatória com as seções:
  - `o que foi feito`
  - `como foi feito` (incluindo passo a passo de testes/validação)
  - `métricas`
  - `aprovação para continuar`
- Referências da skill atualizadas com checklist de execução detalhada e métricas mínimas obrigatórias.
- `skills-workflow-guide.html` atualizado para versão `v3.14.0` e descrição da nova exigência operacional da skill de code review.

## [3.13.0] - 2026-03-10

### Added

- Nova skill `code-review` para revisão técnica preventiva em pedidos de teste/validação e também antes de commit/push/PR/publicação, com foco em bugs, segurança e qualidade.

### Changed

- `AGENTS.md` atualizado com a skill `code-review`, regras obrigatórias de acionamento (teste/validação/publicação) e sequência SDD incluindo code review antes da validação final.
- `skills-workflow-guide.html` atualizado com 13 skills ativas, versão `v3.13.0` e etapa explícita de code review preventivo no fluxo.
- `skills/governance/scripts/check_drift.rb` atualizado para tratar `code-review` como skill obrigatória da raiz.

## [3.12.0] - 2026-03-08

### Added

- Nova skill `front-ux-ui-design` para mudanças visuais de frontend com benchmark obrigatório de 3 referências de mercado, análise opcional de imagem de referência e confirmação explícita antes da implementação.

### Changed

- `AGENTS.md` atualizado com a nova skill `front-ux-ui-design` e regra de acionamento obrigatório para mudanças de layout/tema/responsividade/frontend UX.
- `api-doc-postman` atualizada para o modelo de documentação interativa (OpenAPI + site Try it), sem dependência de coleção Postman.
- `skills-workflow-guide.html` atualizado com nova skill, atualização de descrições e versão `v3.12.0`.

## [3.11.0] - 2026-03-08

### Changed

- Endurecimento global em `AGENTS.md`: plano obrigatório para toda execução (incluindo commit/push/PR/publicação), SDD obrigatório, TDD obrigatório em código e seção final `como testar` (API/FRONT quando aplicável).
- `sdd-sprint-orquestracao` atualizada para bloquear qualquer execução sem aprovação explícita, exigir TDD e saída `como testar`.
- `sdd-spec-code` atualizada para executar implementação com ciclo TDD (`red -> green -> refactor`) e entrega obrigatória de `como testar`.
- `sdd-validacao` atualizada para auditar evidência de TDD e bloquear aprovação sem `como testar`.
- `github-flow` atualizada para bloquear publicação sem plano aprovado, sem evidência de TDD (quando código) e sem seção `como testar`.
- Templates e checklists SDD/GitHub atualizados para o novo padrão de confiabilidade máxima.
- `skills/governance/scripts/behavior_contract_test.rb` e `skills/governance/scripts/gate_skills.rb` reforçados para auditar regras universais (plano/SDD/TDD/como testar).
- `skills-workflow-guide.html` atualizado para refletir o padrão universal e versão `v3.11.0`.

## [3.10.0] - 2026-03-08

### Added

- Nova skill `api-doc-postman` para documentação contínua da Backend(API) com contrato OpenAPI único, site de endpoints e coleção importável no Postman.
- Novo workspace dedicado `APIDocs/` para manter documentação da API separada do backend, preparado para publicação em repositório GitHub próprio.

### Changed

- `AGENTS.md` atualizado com a nova skill e regra de acionamento obrigatório em toda alteração de endpoint no backend.
- `skills-workflow-guide.html` atualizado com a skill `api-doc-postman`, total de skills ativas e versão `v3.10.0`.
- `Backend/readme.md` atualizado com fluxo obrigatório de documentação externa da API e lista completa de endpoints atuais.

## [3.9.0] - 2026-03-05

### Changed

- Regra global adicionada em `AGENTS.md`: toda alteração deve atualizar o `readme.md` do repositório impactado.
- Regra global adicionada em `AGENTS.md`: toda alteração em `skills/` ou `AGENTS.md` deve atualizar `skills-workflow-guide.html`.
- `sdd-sprint-orquestracao` reforçada com obrigatoriedade explícita de atualização de README por repositório e sync do guia de skills para mudanças em skills/agente.
- `github-flow` reforçada para bloquear publicação sem README atualizado e sem sync de `skills-workflow-guide.html` quando aplicável.
- `aprendizado-profundo` reforçada com gate documental para mudanças em skills/agente.
- Templates/checklists de sprint e publicação atualizados para exigir evidência documental obrigatória.
- `skills-workflow-guide.html` atualizado para refletir as novas regras de documentação.
- Governança atualizada para v3.9.0.

## [3.8.0] - 2026-03-05

### Changed

- `AGENTS.md` reforçado com plano estruturado obrigatório para alteração/ajuste/criação: entendimento, proposta, arquivos previstos e pergunta explícita de confirmação.
- `AGENTS.md` passou a exigir relatório final de testes/validações/métricas em toda alteração.
- Telemetria operacional expandida com `SKILL_LOADING` para auditoria visual de progresso por fase.
- `sdd-sprint-orquestracao` atualizada para exigir template de plano estruturado, relatório final de métricas e telemetria `SKILL_LOADING`.
- `aprendizado-profundo` atualizada para exigir aprovação com plano estruturado, validação com métricas e logs de loading.
- `sdd-validacao` atualizada com relatório de métricas obrigatório e telemetria `SKILL_LOADING`.
- `template-plano-execucao.md` atualizado para incorporar entendimento, proposta, arquivos previstos e pergunta de confirmação.
- Governança atualizada para v3.8.0.

## [3.7.0] - 2026-03-05

### Changed

- Regra global adicionada no `AGENTS.md`: qualquer solicitação de alteração, ajuste ou criação exige apresentação de plano de execução e aprovação do usuário antes da implementação.
- `sdd-sprint-orquestracao` reforçada com gate explícito de plano (`apresentar -> aprovar -> executar`) e bloqueio automático quando não aprovado.
- Checklist de sprint atualizado com bloqueio explícito sem plano aprovado.

## [3.6.0] - 2026-03-05

### Changed

- `github-flow` passou a incluir o repositório `<SKILLS_REPO_NAME>` no fluxo oficial `pre-main -> main`.
- Regra explícita adicionada: toda alteração em `skills-workflow-guide.html` deve ser publicada no repositório de Skills Docs.
- `AGENTS.md` atualizado com regra de publicação obrigatória do guia HTML no repositório `<SKILLS_REPO_NAME>`.

## [3.5.0] - 2026-03-05

### Changed

- `AGENTS.md` passou a exigir telemetria obrigatória em tela para toda skill acionada (`SKILL_START`, `SKILL_STEP`, `SKILL_HANDOFF`, `SKILL_END`) para reforçar auditoria operacional.

## [3.4.0] - 2026-03-05

### Changed

- Melhoria da `sdd-sprint-orquestracao` com descoberta de repositório, rastreio explícito de regras de negócio (`confirmadas/inferidas/conflitantes`) e limite de perguntas bloqueantes.
- Melhoria da `sdd-validacao` com matriz de tipos de teste, registro obrigatório de lacunas e nível de confiança da validação.
- Melhoria da `github-flow` com reforço de granularidade de commits, seções obrigatórias de rollback e pontos de atenção para revisão no PR.
- Melhoria da `aprendizado-profundo` com categorização ampliada e separação de ações `corrigir agora` vs `follow-up`.
- Atualização dos checklists/templates de sprint, validação e PR para refletir o novo padrão operacional.

## [3.3.0] - 2026-03-05

### Changed

- Política de skills consolidada para `root-only`: remoção de `skills/` e `AGENTS.md` locais em `Frontend/` e `Backend/`.
- `AGENTS.md` da raiz atualizado para refletir governança `root-only`.

## [3.2.0] - 2026-03-05

### Added

- Nova skill `sdd-sprint-orquestracao` para fluxo completo de sprint com gates explícitos: validação do pedido, análise criteriosa, plano aprovado, SDD, mapeamento de alterações, testes com métricas, atualização de README e checklist de publicação.
- Nova skill `aprendizado-profundo` para melhoria contínua de skills/processos baseada em evidências, sempre com aprovação explícita do usuário.

### Changed

- `AGENTS.md` (raiz, Front e Back) atualizado com regras obrigatórias de orquestração de sprint e melhoria contínua.
- `check_drift.rb` (raiz, Front e Back) atualizado para tratar as duas novas skills como compartilhadas obrigatórias entre os três repositórios.

## [3.1.0] - 2026-03-03

### Added

- Framework de governança em `skills/governance/`.
- Scripts de score, gate, testes comportamentais e drift.
- Política de versionamento, SLO, RACI, auditoria mensal, DoR/DoD e playbooks.
- Gatilhos de CI para validação automática de skills.

### Changed

- Padronização operacional de todas as skills para contrato v3.
- Sincronização de skills compartilhadas entre raiz, Front e Back.
