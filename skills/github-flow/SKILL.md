---
name: github-flow
description: Use esta skill sempre que houver pedido para commit, push, abrir PR ou publicar mudanças do Projeto no GitHub; aplica política obrigatória de plano aprovado, criação de nova branch de trabalho a partir da `main`, evidência de TDD/validação, seção `como testar` (API/FRONT quando aplicável), documentação de PR em pt-BR, atualização obrigatória de README por repositório impactado e sync do pacote documental de skills (`doc_skills/readme.md` + `doc_skills/skills-workflow-guide.html`) para mudanças em skills/AGENTS.
---

# Projeto GitHub Flow

## Objetivo Operacional

Publicar mudanças no GitHub com processo previsível, seguro e auditável, usando branch de trabalho dedicada por solicitação e PR para `main`.

## Escopo

Incluído:
- Commit/push/PR para os repositórios afetados pela solicitação (app, backend, frontend, docs, skills).
- Garantia de fluxo `branch de trabalho -> main`.
- Verificação de aprovação explícita do plano antes de qualquer publicação.
- Verificação de comando explícito do usuário antes da execução operacional.
- Verificação de evidência de TDD em mudanças de código.
- Higiene de repositório: garantir regra `.DS_Store` no `.gitignore` de todo repositório publicado.
- Atualização obrigatória de `readme.md` em todo repositório impactado por alteração.
- Atualização obrigatória do pacote documental (`doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`) para mudanças em `skills/` ou `AGENTS.md`.
- Verificações de segurança antes de publicar.

Fora de escopo:
- Push direto em `main`.
- Reutilizar `pre-main` como branch padrão.
- Merge automático em `main` sem pedido explícito.
- Reescrita de histórico sem autorização explícita.

## Repositórios Oficiais

- Backend: `<BACKEND_REPO_URL>`
- Frontend: `<FRONTEND_REPO_URL>`
- API Docs: `<API_DOCS_REPO_URL>`
- Skills Docs: `<SKILLS_REPO_URL>`

## Política Obrigatória

1. Nunca publicar direto em `main`.
2. Sempre criar nova branch de trabalho a partir da `main` para cada solicitação de publicação.
3. Sempre abrir/atualizar PR `branch de trabalho -> main`.
4. Commit, título e descrição de PR em português (pt-BR).
5. Atualizar obrigatoriamente `readme.md` em cada repositório impactado.
6. Nunca incluir segredo/token/chave/dump sensível em commit/PR.
7. Sempre incluir status de validação, riscos residuais e notas de rollback no PR.
8. Toda alteração em `doc_skills/readme.md` ou `doc_skills/skills-workflow-guide.html` deve ser publicada no repositório de skills configurado.
9. Toda alteração em `skills/` ou `AGENTS.md` deve atualizar `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html` antes de publicar.
10. Nunca publicar sem evidência de plano aprovado explicitamente.
11. Nunca publicar mudança de código sem evidência de TDD e sem seção `como testar` (API/FRONT quando aplicável).
12. Registrar no relatório final o nome da branch de trabalho usada por repositório.
13. Sempre garantir `.DS_Store` no `.gitignore` do repositório alvo antes de commit/push/PR.

## Entradas Obrigatórias

1. Repositório alvo (`Frontend`, `Backend`, `API Docs`, `Skills Docs` ou combinação).
2. Mudanças locais prontas para publicação.
3. Mensagem de commit (ou contexto suficiente para redigir em pt-BR).

Referências:
- `references/repo-publish-checklist.md`
- `references/pr-template.md`
- `references/pr-api-inline.md`

## Fluxo Operacional (Determinístico)

1. Detectar quais repositórios têm mudanças.
2. Em cada repositório alvo, executar em isolamento:
   - confirmar branch e `git status`
   - `git fetch origin`
   - garantir atualização da `main` local a partir de `origin/main`
3. Criar nova branch de trabalho a partir da `main` (nome sugerido: assim como é feito para PRs).
4. Revisar diff e bloquear publicação de dados sensíveis.
5. Confirmar que o `.gitignore` contém `.DS_Store`; se não contiver, adicionar antes da publicação.
6. Confirmar evidência de plano aprovado e execução SDD/validação antes de publicar.
7. Confirmar evidência de TDD em mudanças de código.
8. Confirmar presença da seção final `como testar` (API/FRONT quando aplicável).
9. Confirmar atualização do `readme.md` no(s) repositório(s) impactado(s).
10. Se houver alteração em `skills/` ou `AGENTS.md`, confirmar atualização de `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`.
11. Organizar commits com granularidade por subtema concluído, evitando commit gigante multi-propósito.
12. Realizar commit na branch de trabalho com mensagem clara em pt-BR.
13. Push da branch de trabalho para origin.
14. Abrir ou atualizar PR `branch de trabalho -> main` em pt-BR.
   - preferir payload inline (`curl --data @-`), sem arquivo temporário.
15. Garantir seções mínimas do PR: objetivo, o que foi feito, impactos, como testar, riscos, rollback e checklist.
16. Reportar evidências de publicação com branch/commit/link da PR.

## Contrato de Saída

Responder sempre com:
1. Repositório(s) publicados.
2. Branch(es) de trabalho criadas/usadas.
3. Hash(es) de commit.
4. Resumo de arquivos alterados.
5. Link(s) de PR.
6. Status de README por repositório (`atualizado` ou bloqueado com justificativa explícita).
7. Status de atualização de `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html` quando houver mudança em `skills/` ou `AGENTS.md`.
8. Evidência de TDD em mudanças de código.
9. Seção `como testar` (API/FRONT quando aplicável).
10. Riscos/pendências para merge.
11. Estratégia de rollback resumida por repositório.

## Fail-Safe e Tratamento de Ambiguidade

- Se houver mudanças sensíveis, interromper publicação e reportar bloqueio.
- Se existir conflito de branch/base, pausar e explicar correção necessária.
- Se o contexto estiver incompleto ou insuficiente para commit/PR de qualidade, inferir minimamente e declarar premissas usadas.
- Se a validação estiver incompleta para fluxo crítico, bloquear publicação automática e registrar ressalva explícita.
- Se `readme.md` não estiver atualizado no repositório impactado, bloquear publicação.
- Se houver alteração em `skills/` ou `AGENTS.md` sem atualização de `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`, bloquear publicação.
- Se não houver plano aprovado explicitamente, bloquear publicação.
- Se houver mudança de código sem evidência de TDD, bloquear publicação.
- Se faltar seção `como testar` aplicável ao escopo, bloquear publicação.
- Se o repositório alvo não tiver regra `.DS_Store` no `.gitignore`, bloquear publicação até corrigir.

## Guardrails

- Nunca executar comando destrutivo git sem autorização explícita.
- Nunca persistir token em arquivo do repositório.
- Nunca esconder falha de push/PR; reportar erro com próxima ação recomendada.
- Nunca abrir PR sem informar validação executada e lacunas remanescentes.
- Nunca abrir PR sem incluir como validar manualmente API/FRONT quando aplicável.
- Nunca publicar repositório sem regra `.DS_Store` no `.gitignore`.
- Nunca publicar alteração sem atualização de `readme.md` no repositório impactado.
- Nunca publicar mudança em `skills/` ou `AGENTS.md` sem atualizar `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`.

## Checklist de Qualidade

- Fluxo `branch de trabalho -> main` respeitado em todos os repositórios.
- Conteúdo de commit/PR está em pt-BR e documentado.
- `.gitignore` de cada repositório alvo contém `.DS_Store`.
- README foi atualizado em todo repositório impactado.
- `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html` foram atualizados para alterações em `skills/` ou `AGENTS.md`.
- Evidência de plano aprovado, TDD e validação foi registrada no PR.
- Seção `como testar` (API/FRONT quando aplicável) está presente no PR.
- Saída final contém branch, hashes, links e pendências.
- PR contém rollback e pontos de atenção para revisão.
