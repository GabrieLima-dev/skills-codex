# DER Planejado v1 (Template)

## 1. Entidades Base

- `organizations`
- `users`
- `projects`
- `records`
- `events_audit`

## 2. Regras de Modelagem

1. Toda tabela de negócio em cenário multi-tenant deve ter `organization_id`.
2. Dados sensíveis devem usar proteção adequada (hash/criptografia).
3. Eventos relevantes devem gerar trilha em auditoria.

## 3. Relacionamentos (Exemplo)

- `organizations` 1:N `users`
- `organizations` 1:N `projects`
- `projects` 1:N `records`
- `records` 1:N `events_audit`

## 4. Estratégia de Migração Incremental

1. Introduzir novo schema sem remover fluxo legado.
2. Escrever camada de compatibilidade de leitura/escrita.
3. Migrar dados por lote com validação.
4. Habilitar cutover gradual por feature flag.
5. Remover legado somente após validação completa.
