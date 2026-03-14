#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STORE_FILE="${ROOT_DIR}/gitchein.md"
ALGO="aes-256-cbc"
ITER="250000"

usage() {
  cat <<'EOF'
Uso:
  scripts/gitchein.sh set
  scripts/gitchein.sh status
  scripts/gitchein.sh exec -- <comando...>

Comandos:
  set      Solicita token GitHub + senha mestra e grava no gitchein.md criptografado.
  status   Mostra status do arquivo local sem exibir segredos.
  exec     Decripta em memória e executa comando com GITHUB_TOKEN no ambiente.

Exemplo:
  scripts/gitchein.sh exec -- /bin/zsh -lc 'curl -sS -H "Authorization: Bearer $GITHUB_TOKEN" -H "Accept: application/vnd.github+json" https://api.github.com/user'
EOF
}

require_openssl() {
  if ! command -v openssl >/dev/null 2>&1; then
    echo "Erro: openssl não encontrado no sistema." >&2
    exit 1
  fi
}

read_secret() {
  local prompt="$1"
  local output_var="$2"
  local value
  read -r -s -p "$prompt" value
  printf '\n' >&2
  printf -v "$output_var" '%s' "$value"
}

extract_ciphertext() {
  awk '
    /^ciphertext_base64:[[:space:]]*\|[[:space:]]*$/ { capture=1; next }
    capture {
      gsub(/^[[:space:]]+/, "", $0)
      if (length($0) > 0) print $0
    }
  ' "$STORE_FILE"
}

cmd_set() {
  require_openssl

  local token pass1 pass2 ciphertext wrapped created_at algo_upper
  read_secret "Token GitHub (input oculto): " token
  token="${token//$'\r'/}"
  token="${token//$'\n'/}"
  if [[ -z "$token" ]]; then
    echo "Erro: token vazio." >&2
    exit 1
  fi
  if [[ "$token" == *[[:space:]]* ]]; then
    echo "Erro: token com espaço em branco. Cole apenas o valor puro do token." >&2
    exit 1
  fi

  read_secret "Senha mestra para criptografar (input oculto): " pass1
  if [[ -z "$pass1" ]]; then
    echo "Erro: senha mestra vazia." >&2
    exit 1
  fi
  read_secret "Confirme a senha mestra: " pass2
  if [[ "$pass1" != "$pass2" ]]; then
    echo "Erro: confirmação da senha não confere." >&2
    exit 1
  fi

  ciphertext="$(printf '%s' "$token" | openssl enc -"${ALGO}" -pbkdf2 -iter "${ITER}" -salt -a -A -pass pass:"${pass1}")"
  wrapped="$(printf '%s' "$ciphertext" | fold -w 76 | sed 's/^/  /')"
  created_at="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
  algo_upper="$(printf '%s' "$ALGO" | tr '[:lower:]' '[:upper:]')"

  cat >"$STORE_FILE" <<EOF
# gitchein.md
# Cofre local para credencial GitHub da agente.
# Não publique este arquivo.

version: 1
encryption: OPENSSL_${algo_upper}
kdf: PBKDF2
iterations: ${ITER}
created_at_utc: ${created_at}
ciphertext_base64: |
${wrapped}
EOF

  chmod 600 "$STORE_FILE"
  unset token pass1 pass2 ciphertext wrapped
  echo "OK: token criptografado salvo em $STORE_FILE com permissão 600."
}

decrypt_token() {
  require_openssl
  if [[ ! -f "$STORE_FILE" ]]; then
    echo "Erro: $STORE_FILE não existe." >&2
    exit 1
  fi

  local pass ciphertext token
  ciphertext="$(extract_ciphertext | tr -d '\r\n[:space:]')"
  if [[ -z "$ciphertext" ]]; then
    echo "Erro: ciphertext não encontrado em $STORE_FILE." >&2
    exit 1
  fi
  if [[ "$ciphertext" == "PENDENTE_CONFIGURACAO" ]]; then
    echo "Erro: gitchein.md ainda não foi configurado. Execute: scripts/gitchein.sh set" >&2
    exit 1
  fi

  read_secret "Senha mestra para decriptar (input oculto): " pass
  token="$(printf '%s' "$ciphertext" | openssl enc -d -"${ALGO}" -pbkdf2 -iter "${ITER}" -a -A -pass pass:"${pass}" 2>/dev/null)" || {
    echo "Erro: falha ao decriptar (senha inválida ou arquivo corrompido)." >&2
    exit 1
  }
  token="${token//$'\r'/}"
  token="${token//$'\n'/}"
  if [[ -z "$token" ]]; then
    echo "Erro: token decriptado vazio após sanitização." >&2
    exit 1
  fi
  printf '%s' "$token"
}

cmd_status() {
  if [[ ! -f "$STORE_FILE" ]]; then
    echo "status: ausente ($STORE_FILE)"
    exit 1
  fi

  local perms has_cipher
  perms="$(stat -f '%Sp' "$STORE_FILE" 2>/dev/null || echo 'indisponivel')"
  local cipher_value
  cipher_value="$(extract_ciphertext | tr -d '\r\n[:space:]')"
  if [[ -z "$cipher_value" ]]; then
    has_cipher="nao"
  elif [[ "$cipher_value" == "PENDENTE_CONFIGURACAO" ]]; then
    has_cipher="nao_configurado"
  else
    has_cipher="sim"
  fi

  echo "arquivo: $STORE_FILE"
  echo "permissoes: $perms"
  echo "ciphertext_presente: $has_cipher"
}

cmd_exec() {
  if [[ "${1:-}" != "--" ]]; then
    echo "Erro: use scripts/gitchein.sh exec -- <comando...>" >&2
    exit 1
  fi
  shift
  if [[ "$#" -eq 0 ]]; then
    echo "Erro: nenhum comando informado após --." >&2
    exit 1
  fi

  local token
  token="$(decrypt_token)"
  GITHUB_TOKEN="$token" "$@"
  unset token
}

main() {
  local cmd="${1:-}"
  case "$cmd" in
    set)
      shift
      cmd_set "$@"
      ;;
    status)
      shift
      cmd_status "$@"
      ;;
    exec)
      shift
      cmd_exec "$@"
      ;;
    -h|--help|help|"")
      usage
      ;;
    *)
      echo "Erro: comando inválido '$cmd'." >&2
      usage
      exit 1
      ;;
  esac
}

main "$@"
