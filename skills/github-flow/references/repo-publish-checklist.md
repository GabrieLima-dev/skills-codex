# Repository Publish Checklist (v4)

## 1. Pré-Flight (Obrigatório)

1. Confirmar repositório alvo (`Frontend`, `Backend`, `API Docs`, `Skills Docs` ou combinação).
2. Confirmar `git status` e branch atual.
3. Confirmar política de branch (`branch de trabalho -> main`).
4. Verificar se há arquivos sensíveis no diff.
5. Confirmar evidência de plano aprovado explicitamente.
6. Confirmar evidência de comando explícito do usuário para executar publicação.
7. Confirmar execução SDD e validação final registradas.
8. Confirmar evidência de TDD para mudanças de código.
9. Confirmar regra `.DS_Store` presente no `.gitignore` do repositório alvo.

## 2. Política de Branch

1. Nunca publicar direto em `main`.
2. Sempre criar branch de trabalho nova a partir de `main` para cada solicitação.
3. Nome sugerido: `task/<yyyyMMdd>-<slug-curto>`.
4. Push e PR devem usar essa branch, com base em `main`.

## 3. Checklist Backend

Path: `<backend_repo_root>/`

1. Revisar diff para token/credenciais/chaves/logs/dumps.
2. Atualizar obrigatoriamente `readme.md` do backend quando houver alteração no repositório.
3. Garantir `.DS_Store` no `.gitignore`.
4. Commit em pt-BR.
5. Push da branch de trabalho.
6. Abrir/atualizar PR `branch de trabalho -> main` em pt-BR.
7. Incluir no PR seção `como testar` para API/FRONT quando aplicável.

## 4. Checklist Frontend

Path: `<frontend_repo_root>/`

1. Revisar diff para segredos embutidos em scripts/assets.
2. Atualizar obrigatoriamente `readme.md` do frontend quando houver alteração no repositório.
3. Garantir `.DS_Store` no `.gitignore`.
4. Commit em pt-BR.
5. Push da branch de trabalho.
6. Abrir/atualizar PR `branch de trabalho -> main` em pt-BR.
7. Incluir no PR seção `como testar` para API/FRONT quando aplicável.

## 5. Checklist API Docs

Path: `<api_docs_repo_root>/`

1. Revisar diff para exemplos sensíveis e links quebrados.
2. Atualizar obrigatoriamente `README.md` do repositório quando houver alteração.
3. Garantir `.DS_Store` no `.gitignore`.
4. Commit em pt-BR.
5. Push da branch de trabalho.
6. Abrir/atualizar PR `branch de trabalho -> main` em pt-BR.
7. Incluir no PR seção `como validar`/`como testar`.

## 6. Checklist Skills/Agente

Path: `skills/` e `AGENTS.md`

1. Se houve alteração em `skills/` ou `AGENTS.md`, atualizar obrigatoriamente `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`.
2. Publicar mudanças do pacote documental no repositório de skills configurado (`<skills_repo_name>`).
3. Garantir consistência entre regras em `AGENTS.md`, `SKILL.md` e guia HTML.

## 7. Publicação em Múltiplos Repositórios

1. Rodar checklist completo de forma independente em cada repo.
2. Produzir commits separados.
3. Produzir PRs separados.
4. Retornar todos os links de PR no relatório final.

## 8. Bloqueios Operacionais

Bloquear publicação se houver:
1. Dado sensível no diff.
2. Tentativa de push direto em `main`.
3. Falha de push/PR não resolvida.
4. Ausência de atualização de `readme.md` no repositório impactado.
5. Alteração em `skills/` ou `AGENTS.md` sem atualização de `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html`.
6. Ausência de regra `.DS_Store` no `.gitignore` do repositório alvo.
7. Ausência de plano aprovado, comando explícito, evidência de TDD ou seção `como testar` aplicável.

## 9. Evidência de Saída Obrigatória

1. Nome da branch de trabalho por repositório.
2. Hash de commit.
3. Resumo dos arquivos alterados.
4. Link da PR.
5. Status de README por repositório (`atualizado` ou bloqueio justificado).
6. Status de atualização de `doc_skills/readme.md` e `doc_skills/skills-workflow-guide.html` quando aplicável.
7. Evidência de TDD (quando houver código).
8. Seção `como testar` (API/FRONT quando aplicável).
