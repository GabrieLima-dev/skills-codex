---
name: project-readiness-gate
description: Use esta skill antes de qualquer execução para validar se stack, contexto arquitetural, mapeamento de repositórios e configurações mínimas estão preenchidos; a tríade `backend + frontend + docs` é sempre obrigatória, e quando faltar informação a execução deve ser bloqueada até completar os campos obrigatórios.
---

# Project Readiness Gate

## Objetivo Operacional

Garantir que nenhuma execução operacional (comando, edição, teste, automação, commit/push/PR/publicação) ocorra sem contexto técnico mínimo, stack confirmada e configurações essenciais definidas.

## Escopo

Incluído:
- Validação pré-execução de contexto técnico e operacional.
- Conferência de campos obrigatórios de stack/configuração.
- Validação obrigatória da tríade de stack: `backend`, `frontend` e `docs`.
- Geração de perguntas objetivas para preencher lacunas.
- Bloqueio explícito de execução enquanto houver contexto incompleto.
- Registro auditável do status (`aprovado para execução` ou `bloqueado`).

Fora de escopo:
- Implementar código da demanda do usuário.
- Publicar mudanças em repositório.
- Inferir configurações críticas sem confirmação.

## Entradas Obrigatórias

1. Solicitação executável do usuário.
2. Estado atual de `AGENTS.md` e skills relevantes.
3. Campos de configuração listados em `references/checklist-template.md`.

Referência obrigatória:
- `references/checklist-template.md`

## Fluxo Operacional (Determinístico)

1. Ler `AGENTS.md` e identificar se a solicitação envolve execução.
2. Carregar checklist obrigatório de stack/configuração.
3. Validar preenchimento mínimo dos campos:
   - nome do projeto e objetivo funcional
   - estrutura de repositórios/pastas relevantes
   - stack `backend` (obrigatório)
   - stack `frontend` (obrigatório)
   - stack `docs` (obrigatório)
   - stack de infra (quando aplicável)
   - linguagem/runtime e versões
   - gerenciador de pacotes e comandos de build/test/lint
   - estratégia de ambiente (`.env`, segredos e variáveis obrigatórias)
   - estratégia de deploy/publicação (se aplicável)
   - critérios de validação/aceite
4. Se algum campo estiver ausente, marcar status `bloqueado` e perguntar objetivamente ao usuário apenas os campos faltantes.
5. Se qualquer item da tríade `backend + frontend + docs` estiver ausente, bloquear execução sem exceção.
6. Revalidar após cada resposta até checklist completo.
7. Quando todos os campos críticos estiverem preenchidos, emitir status `aprovado para execução`.
8. Transferir fluxo para `sdd-sprint-orquestracao` apenas após aprovação do gate.

## Contrato de Saída

Responder sempre com:
1. Status do gate (`aprovado para execução` ou `bloqueado`).
2. Campos validados como completos.
3. Campos ausentes (se houver).
4. Perguntas objetivas pendentes para preenchimento.
5. Risco de seguir sem os campos faltantes.
6. Próxima ação recomendada.

## Fail-Safe e Tratamento de Ambiguidade

- Manter status `bloqueado` sempre que houver contexto incompleto em campo crítico.
- Manter status `bloqueado` sempre que `backend`, `frontend` ou `docs` não estiverem preenchidos.
- Se houver conflito entre informações do usuário e configuração existente, registrar conflito e solicitar confirmação explícita.
- Se o usuário não souber um campo técnico, propor alternativas seguras e pedir escolha.
- Se faltar evidência mínima para comandos de build/test/deploy, não autorizar execução.

## Guardrails

- Nunca executar comando com impacto antes do gate estar `aprovado para execução`.
- Nunca ocultar lacuna de configuração crítica.
- Nunca assumir versão/stack sem confirmação explícita.
- Nunca prosseguir quando risco residual de contexto for crítico/alto.
- Nunca expor segredo, token, chave privada ou credencial.

## Checklist de Qualidade

- Solicitação foi classificada como executável ou não executável.
- Checklist de stack/configuração foi aplicado integralmente.
- Tríade obrigatória `backend + frontend + docs` foi validada e preenchida.
- Lacunas críticas foram listadas sem omissão.
- Perguntas ao usuário foram objetivas e rastreáveis.
- Status final do gate foi registrado (`aprovado para execução` ou `bloqueado`).
- Handoff para `sdd-sprint-orquestracao` ocorreu somente após aprovação do gate.
