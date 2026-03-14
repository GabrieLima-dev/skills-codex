# Deploy Checklist (VPS + EasyPanel) v3

## 1. Escopo da Publicação

- Ambiente: staging | produção
- Serviços: frontend | api | jobs
- Janela de deploy e rollback definidos

## 2. DNS e Domínios

1. Cada domínio/subdomínio aponta para IP da VPS.
2. Mapeamento documentado por serviço.
3. Propagação mínima validada.

## 3. SSL e Edge

1. Certificados emitidos/renovados pelo EasyPanel.
2. HTTPS forçado.
3. Política de redirecionamento HTTP -> HTTPS ativa.

## 4. Hardening de Host (Gate Crítico)

1. UFW permite somente `22`, `80`, `443`.
2. SSH apenas com chave.
3. Login root desabilitado.
4. Fail2Ban ativo.

## 5. Segurança de Runtime (Gate Crítico)

1. Sem credenciais em Git.
2. Segredos apenas via env/secrets do painel.
3. Volumes persistentes em paths privados.
4. Dumps/logs sensíveis fora de versionamento.

## 6. Observabilidade

1. Healthcheck para frontend e API.
2. Logs de container acessíveis.
3. Critério mínimo de uptime definido.

## 7. Backup e Recuperação

1. Backup diário dos dados operacionais.
2. Retenção definida.
3. Cópia offsite.
4. Procedimento de restauração descrito.

## 8. Critério de Go-Live

- `apto`: todos gates críticos OK.
- `apto com ressalvas`: sem pendência crítica, com plano de correção.
- `não apto`: qualquer gate crítico falhou.
