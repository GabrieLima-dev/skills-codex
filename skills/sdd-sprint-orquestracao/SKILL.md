---
name: sdd-sprint-orquestracao
description: Use esta skill para qualquer solicitação de execução (feature, bugfix, melhoria, refatoração, ajuste operacional, commit/push/PR/publicação), impondo plano aprovado + comando explícito para executar, fluxo SDD ponta a ponta, TDD obrigatório para código, relatório estruturado de testes/métricas, checkpoint de testes adicionais com o usuário e atualização obrigatória de README por repositório impactado.
---

# SDD Sprint Orquestração

## Objetivo Operacional

Garantir execução completa, segura e auditável de qualquer solicitação executável, do pedido inicial até PR `branch de trabalho -> main`, sem pular validações críticas.

Regra central: nenhuma execução com efeito em código/processo/publicação começa sem `project-readiness-gate` aprovado, plano de execução aprovado explicitamente pelo usuário e comando explícito do usuário autorizando início da execução.

## Escopo

Incluído:
- Triagem e validação da solicitação antes de codificar ou publicar.
- Gate obrigatório de prontidão (`project-readiness-gate`) para validar stack/configuração antes do plano.
- Análise técnica criteriosa do impacto e estratégia de mudança.
- Plano de execução sucinto com etapa de aprovação explícita do usuário.
- Gate explícito de autorização operacional: executar somente após comando claro do usuário.
- Plano estruturado com cinco blocos obrigatórios de conteúdo (entendimento, proposta, arquivos previstos, riscos percebidos, impacto esperado) e pergunta de confirmação.
- Em mudança de frontend visual/layout/theme/responsividade/UX, plano obrigatório com exatamente 3 propostas de direção visual com links e trade-offs.
- Encadeamento SDD (`PRD.md` -> `Spec.md` -> código -> validação).
- Adoção obrigatória de TDD em mudanças de código (`red -> green -> refactor`).
- Mapeamento de alterações por arquivo e atualização de changelog.
- Estratégia ampla de testes, evidências e métricas de eficácia.
- Relatório de testes e métricas em formato estruturado obrigatório.
- Checkpoint final obrigatório com o usuário para decidir se serão executados testes adicionais antes do encerramento.
- Entrega obrigatória de seção final `como testar` (API e FRONT, quando aplicável).
- Telemetria de auditoria em tela com logs de progresso visual (`SKILL_LOADING`).
- Atualização obrigatória de `readme.md` em todo repositório impactado.
- Atualização obrigatória do pacote documental de skills (`doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`) quando houver mudança em `skills/` ou `AGENTS.md`.
- Checklist de publicação (README, guide de skills quando aplicável, commit, push, PR).

Fora de escopo:
- Implementar sem plano aprovado.
- Executar comando/edição/teste sem comando explícito do usuário.
- Executar commit/push/PR/publicação sem plano aprovado.
- Publicar sem evidência mínima de teste.
- Omitir riscos relevantes para acelerar entrega.

## Entradas Obrigatórias

1. Solicitação do usuário.
2. Estado atual do código afetado.
3. Critérios de sucesso esperados pelo usuário.

Referências obrigatórias:
- `references/sprint-e2e-checklist.md`
- `references/template-plano-execucao.md`
- `references/regras-negocio-rastreio.md`

## Fluxo Operacional (Determinístico)

1. Executar descoberta de repositório por arquivos de maior sinal antes de planejar.
2. Acionar `project-readiness-gate` e confirmar status `aprovado para execução` antes de montar plano.
3. Validar pedido e explicitar entendimento objetivo do problema.
4. Mapear regras de negócio em três blocos: `confirmadas`, `inferidas`, `conflitantes`.
5. Fazer análise técnica criteriosa: impacto, arquivos, risco, dependências e conflitos.
6. Se houver ambiguidade material, fazer no máximo 5 perguntas bloqueantes; se possível, seguir com premissas explícitas e validação posterior.
7. Produzir plano de execução em fases com critérios de aceitação por fase, incluindo obrigatoriamente:
   - `o que a agente entendeu para fazer`
   - `o que a agente acredita que deve realizar`
   - `arquivos que acredita que irá alterar`
   - `riscos percebidos`
   - `impacto esperado da alteração`
   - pergunta explícita: `está ok para continuar ou não é isso que você deseja?`
8. Se houver mudança de frontend visual/layout/theme/responsividade/UX, incluir no plano exatamente 3 propostas de direção visual com links clicáveis e trade-offs curtos para aprovação.
9. Exibir plano de execução em tela com status `pendente` para aprovação do usuário.
10. Solicitar e registrar aprovação explícita do plano antes de qualquer execução.
11. Se o plano for reprovado, revisar e reapresentar até aprovação.
12. Após plano aprovado, aguardar comando explícito do usuário autorizando iniciar execução operacional (comandos/edições/testes).
13. Registrar em tela qual autorização explícita do usuário liberou a execução.
14. Emitir telemetria visual `SKILL_LOADING` nas transições de fase.
15. Executar SDD na ordem:
   - `sdd-pesquisa-prd`
   - `sdd-prd-spec`
   - `sdd-spec-code`
   - `sdd-validacao`
16. Mapear alterações com rastreabilidade por arquivo (incluindo changelog).
17. Para mudança de código, aplicar TDD por item crítico:
   - escrever/ajustar teste primeiro (`red`)
   - implementar correção/feature (`green`)
   - refatorar mantendo testes passando (`refactor`)
18. Executar bateria de testes e validações (sucesso, erro, limite, regressão, segurança), reportando planejado vs executado.
19. Consolidar métricas objetivas (cobertura do escopo, taxa de aprovação de testes, pendências, nível de confiança).
20. Emitir relatório estruturado de testes e métricas com:
   - escopo e ambiente de execução
   - matriz de testes planejado vs executado
   - comandos executados
   - resultado por teste/check
   - lacunas de validação e impacto
   - métricas consolidadas e risco residual
21. Antes de finalizar, perguntar explicitamente ao usuário se deseja testes adicionais e listar testes ainda possíveis.
22. Executar testes adicionais somente com novo comando explícito do usuário.
23. Emitir relatório final consolidado após decisão do usuário sobre testes adicionais.
24. Documentar como reproduzir e validar os testes.
25. Entregar seção `como testar` com passos objetivos:
   - API: endpoints, payloads e resultados esperados
   - FRONT: fluxo visual, estados esperados e evidência de regressão
26. Atualizar obrigatoriamente `readme.md` de cada repositório impactado.
27. Se houver alteração em `skills/` ou `AGENTS.md`, atualizar obrigatoriamente `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`.
28. Publicar com `github-flow` (commit/push/PR `branch de trabalho -> main`).

## Contrato de Saída

Responder sempre com:
1. Status da solicitação (`validada`, `bloqueada`, `em execução`, `concluída`).
2. Plano de execução apresentado com `entendimento + proposta + arquivos previstos + riscos percebidos + impacto esperado + pergunta de confirmação` e status de aprovação (`aprovado`, `reprovado`, `ajustar`).
3. Status do `project-readiness-gate` e campos críticos de stack/configuração validados antes da execução.
4. Registro da autorização explícita do usuário que liberou a execução operacional.
5. Alterações realizadas por arquivo.
5. Changelog atualizado com pontos de alteração.
6. Testes e validações executados (planejado vs executado), métricas e evidências.
7. Relatório estruturado de testes e métricas (escopo, ambiente, matriz, comandos, resultados, lacunas, risco residual).
8. Registro do checkpoint final: decisão do usuário sobre execução de testes adicionais.
9. Procedimento de validação manual/automática para comprovação.
10. Seção `como testar` (API e FRONT quando aplicável).
11. Status de README por repositório impactado e status do pacote documental (`doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`) quando aplicável, além de publicação (hashes/PR).
12. Riscos residuais e pendências.
13. Regras de negócio `confirmadas/inferidas/conflitantes` e tratamento adotado.
14. Quando aplicável ao frontend visual/layout/theme/responsividade/UX, 3 propostas de direção visual com links e aprovação explícita antes da implementação.
15. Telemetria registrada (`SKILL_START/STEP/HANDOFF/LOADING/END`).

## Fail-Safe e Tratamento de Ambiguidade

- Se a solicitação estiver ambígua, interromper execução e declarar premissas para validação.
- Se houver mais de 5 dúvidas de bloqueio, reduzir escopo para um incremento seguro e validável antes de avançar.
- Se faltar contexto crítico, classificar como bloqueio e reduzir escopo para faixa segura.
- Se houver conflito entre pedido e estado real do código, priorizar evidência técnica e registrar conflito.
- Se `project-readiness-gate` não estiver aprovado, não iniciar nenhuma execução.
- Se o plano não for aprovado explicitamente, não iniciar nenhuma execução (incluindo commit/push/PR/publicação).
- Se não houver comando explícito do usuário para executar, manter status bloqueado mesmo com plano aprovado.
- Se não houver evidência mínima de teste/validação, bloquear conclusão como `concluída` e reportar ressalvas.
- Se houver mudança de código sem evidência de TDD, bloquear conclusão como `concluída`.
- Se faltar seção `como testar` (API/FRONT quando aplicável), bloquear conclusão como `concluída`.
- Se faltar checkpoint explícito com o usuário sobre testes adicionais antes do encerramento, bloquear conclusão como `concluída`.

## Guardrails

- Nunca codificar mudança estrutural sem plano aprovado.
- Nunca executar sem `project-readiness-gate` aprovado.
- Nunca executar qualquer solicitação operacional sem plano aprovado.
- Nunca executar comando, edição, teste ou automação sem comando explícito do usuário.
- Nunca assumir aprovação implícita como autorização para executar.
- Nunca iniciar alteração/ajuste/criação sem etapa explícita de apresentação de plano para aprovação.
- Nunca apresentar plano sem os cinco blocos obrigatórios (entendimento, proposta, arquivos previstos, riscos percebidos, impacto esperado) e pergunta de confirmação.
- Nunca seguir com mudança de frontend visual/layout/theme/responsividade/UX sem 3 propostas de direção visual com links apresentadas no plano e aprovadas.
- Nunca entregar mudança de código sem evidência de ciclo TDD (`red -> green -> refactor`).
- Nunca ocultar falha de teste, regressão ou limitação de ambiente.
- Nunca encerrar tarefa de alteração sem relatório final de testes/validações/métricas.
- Nunca encerrar tarefa sem checkpoint explícito de testes adicionais com o usuário.
- Nunca encerrar tarefa sem seção final `como testar` para API/FRONT quando aplicável.
- Nunca omitir `SKILL_LOADING` em tarefas multi-fase.
- Nunca publicar alteração sem atualizar `readme.md` do repositório impactado.
- Nunca publicar alteração em `skills/` ou `AGENTS.md` sem atualizar `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`.
- Nunca publicar sem checklist mínimo: testes, métricas, README, guide de skills (quando aplicável) e PR.
- Nunca expor segredo, token, chave privada ou credencial.
- Nunca tratar regra inferida como requisito confirmado sem marcação explícita.

## Checklist de Qualidade

- Solicitação foi validada antes da execução.
- Descoberta de repositório e regras de negócio foram consolidadas antes do plano.
- `project-readiness-gate` foi executada e aprovada antes da execução operacional.
- Plano foi aprovado explicitamente pelo usuário.
- Plano trouxe entendimento, proposta, arquivos previstos, riscos percebidos, impacto esperado e pergunta de confirmação.
- Em mudança de frontend visual/layout/theme/responsividade/UX, o plano trouxe 3 propostas de direção visual com links e trade-offs.
- Execução só começou após comando explícito do usuário e registro dessa autorização.
- SDD foi seguido sem desvio de escopo não aprovado.
- Mudança de código seguiu TDD com evidência rastreável.
- Mudanças estão mapeadas por arquivo e changelog.
- Testes, métricas e evidências foram registrados.
- Relatório estruturado de testes e métricas foi emitido no formato obrigatório.
- Usuário validou checkpoint final sobre necessidade de testes adicionais.
- Relatório final de validação e métricas foi emitido.
- Seção `como testar` foi entregue para API/FRONT quando aplicável.
- Telemetria visual `SKILL_LOADING` foi emitida nas transições de fase.
- `readme.md` foi atualizado em todos os repositórios impactados.
- `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html` foram atualizados quando houve mudança em `skills/` ou `AGENTS.md`.
- Publicação foi tratada conforme impacto.
