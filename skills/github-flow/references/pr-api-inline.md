# Criação de PR via API (sem arquivo temporário) v4

Pré-requisito:
- `GITHUB_TOKEN` no ambiente com permissão de PR.
- `WORK_BRANCH` contendo o nome da branch de trabalho criada a partir da `main`.
- `ORG` com o dono da organização/usuário no GitHub.
- `REPO` com o nome do repositório alvo.

## 1. Verificar PR existente da branch de trabalho

```bash
curl -sS -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/${ORG}/${REPO}/pulls?head=${ORG}:${WORK_BRANCH}&state=open"
```

## 2. Criar PR (payload inline)

### Exemplo Front

```bash
ORG="<org-ou-usuario>"
REPO="<frontend-repo>"
WORK_BRANCH="task/20260313-ajuste-front"

curl -sS -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/${ORG}/${REPO}/pulls" \
  --data @- <<JSON
{
  "title": "[Projeto][Front] <título em pt-BR>",
  "head": "${WORK_BRANCH}",
  "base": "main",
  "body": "## Objetivo\n...\n\n## O que foi feito\n- ...\n\n## Impactos funcionais\n- ...\n\n## Como testar\n1. ...\n\n## Riscos / atenção\n- ...\n\n## Rollback\n- ..."
}
JSON
```

### Exemplo Back

```bash
ORG="<org-ou-usuario>"
REPO="<backend-repo>"
WORK_BRANCH="task/20260313-ajuste-back"

curl -sS -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/${ORG}/${REPO}/pulls" \
  --data @- <<JSON
{
  "title": "[Projeto][Back] <título em pt-BR>",
  "head": "${WORK_BRANCH}",
  "base": "main",
  "body": "## Objetivo\n...\n\n## O que foi feito\n- ...\n\n## Impactos técnicos\n- ...\n\n## Como testar\n1. ...\n\n## Riscos / atenção\n- ...\n\n## Rollback\n- ..."
}
JSON
```

### Exemplo Skills Docs

```bash
ORG="<org-ou-usuario>"
REPO="<skills-repo>"
WORK_BRANCH="task/20260313-skills-flow"

curl -sS -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/${ORG}/${REPO}/pulls" \
  --data @- <<JSON
{
  "title": "[Projeto][Skills] <título em pt-BR>",
  "head": "${WORK_BRANCH}",
  "base": "main",
  "body": "## Objetivo\n...\n\n## O que foi alterado\n- ...\n\n## Como validar\n1. ...\n\n## Pontos de atenção\n- ..."
}
JSON
```

## 3. Tratamento de erros (obrigatório)

1. Se API retornar erro de autenticação/autorização, interromper e corrigir token/permissão.
2. Se PR já existir para a `WORK_BRANCH`, não criar duplicata; retornar link da PR existente.
3. Nunca incluir token em arquivo do repositório ou log persistente.
