# Playbooks de Incidente - Skills

## 1. Incidente: Gate de skill falhou em CI

### Sintomas

- Pipeline falha em `gate_skills.rb`.
- Score abaixo do threshold.

### Resposta

1. Bloquear merge/publicação da mudança.
2. Executar `score_skills.rb` localmente para identificar skill problemática.
3. Corrigir seção ausente/contrato inválido.
4. Reexecutar gate e anexar evidência no PR.

## 2. Incidente: Drift entre raiz, Front e Back

### Sintomas

- `check_drift.rb` reporta hash divergente.

### Resposta

1. Identificar skill divergente e origem da alteração.
2. Sincronizar versões em todos os espelhos obrigatórios.
3. Reexecutar `check_drift.rb` até `OK`.
4. Registrar causa raiz na auditoria mensal.

## 3. Incidente: Regressão de confiabilidade em produção

### Sintomas

- Respostas inconsistentes, omissão de guardrails ou falha de fluxo SDD.

### Resposta

1. Classificar severidade (`crítico/alto/médio/baixo`).
2. Aplicar hotfix na skill afetada.
3. Rodar suíte completa: behavior + score + gate + drift.
4. Executar análise de causa raiz (RCA).
5. Atualizar `CHANGELOG.md` e auditoria mensal.

## 4. Incidente: Exposição de dado sensível em instrução

### Sintomas

- Skill/referência contendo token, segredo, caminho sensível.

### Resposta

1. Remover dado imediatamente do arquivo.
2. Revisar histórico e rotacionar credenciais impactadas.
3. Adicionar regra preventiva no contrato/guardrail.
4. Validar repositórios para reincidência.
