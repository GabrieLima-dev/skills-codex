## Checklist E2E de Sprint

## Pré-implementação

- Descoberta de repositório executada por arquivos de maior sinal.
- Pedido compreendido e validado com objetivo claro.
- Regras de negócio separadas em `confirmadas`, `inferidas`, `conflitantes`.
- Impacto técnico mapeado por arquivo/componente.
- Riscos e conflitos documentados.
- Plano de execução criado e aprovado explicitamente.
- Plano contém entendimento, proposta, arquivos previstos, riscos percebidos, impacto esperado e pergunta de confirmação.
- Em mudança de frontend visual/layout/theme/responsividade/UX, plano contém 3 propostas de direção visual com links e trade-offs.
- Execução autorizada somente após comando explícito do usuário.
- Registro textual da autorização explícita anexado ao fluxo.
- Sem plano aprovado, implementação permanece bloqueada.

## Execução SDD

- `PRD.md` criado com critérios verificáveis.
- `Spec.md` mapeia alterações por arquivo.
- Código implementado com aderência ao escopo aprovado.
- Validação final cobre critérios de aceitação e risco de regressão.

## Testes e Métricas

- TDD aplicado para mudanças de código (`red -> green -> refactor`) com evidências.
- Testes de sucesso, erro e borda executados.
- Regressão validada nos fluxos críticos.
- Tipos de teste aplicáveis avaliados (`unit`, `integration`, `e2e`, `contract`, `smoke`, `regression`).
- Lacunas de validação registradas com justificativa e impacto.
- Métricas consolidadas (total, aprovados, falhas, cobertura de critérios).
- Relatório de testes e métricas emitido no formato estruturado obrigatório.
- Procedimento de reprodução dos testes documentado.
- Checkpoint final realizado com o usuário sobre execução de testes adicionais.
- Testes adicionais só executados após novo comando explícito do usuário.
- Seção final `como testar` entregue com passos para API e FRONT quando aplicável.

## Publicação

- `readme.md` atualizado em cada repositório impactado pela alteração.
- Se houve alteração em `skills/` ou `AGENTS.md`, `skills-workflow-guide.html` atualizado obrigatoriamente.
- Changelog atualizado com pontos de alteração.
- Commit e push em `branch de trabalho` por repositório.
- PR `branch de trabalho -> main` aberto/atualizado com evidências.
