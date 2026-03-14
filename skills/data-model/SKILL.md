---
name: data-model
description: Use esta skill para desenhar, revisar e evoluir modelo de dados relacional (Postgres ou equivalente), com foco em migração incremental, multi-tenant quando aplicável e segurança de acesso.
---

# Data Model

## Objetivo Operacional

Produzir decisões de modelagem de dados tecnicamente defensáveis, compatíveis com o estado atual do produto e com caminho de migração incremental.

## Escopo

Incluído:
- Modelagem conceitual/lógica para banco relacional.
- Entidades, relacionamentos, ownership e multi-tenancy (quando aplicável).
- Estratégia de migração do modelo atual para DB-backed.
- Regras de segurança para dados sensíveis e rastreabilidade.

Fora de escopo:
- Afirmar integração de banco já implementada sem evidência.
- Propor migração big-bang sem plano de compatibilidade.
- Ignorar comportamento atual em produção.

## Entradas Obrigatórias

1. Estado atual validado no código (AS-IS).
2. Objetivo de negócio/técnico da mudança (TO-BE).

Entradas opcionais:
- `references/der-planned-v1.md` para baseline de entidades.

## Fluxo Operacional (Determinístico)

1. Mapear restrições atuais (arquivos, APIs, logs e fluxos existentes).
2. Listar entidades e limites de responsabilidade.
3. Definir relacionamentos e chaves com foco em auditabilidade.
4. Aplicar estratégia multi-tenant quando necessário (`organization_id` ou equivalente).
5. Definir políticas de segurança para campos sensíveis (hash, criptografia, masking e retenção).
6. Separar claramente cada item como:
   - `Comprovado no código`
   - `Proposta de evolução`
   - `Risco e mitigação`
7. Entregar DER lógico + plano de migração incremental por fases.

## Contrato de Saída

Responder sempre com:
1. Entidades propostas e relacionamentos.
2. Chaves primárias/estrangeiras e índices críticos.
3. Estratégia de migração incremental.
4. Riscos de consistência/performance/segurança.
5. Nível de confiança (`alto`, `médio`, `baixo`) com justificativa.

## Fail-Safe e Tratamento de Ambiguidade

- Se faltar contexto de uso real, declarar premissas e reduzir escopo.
- Se houver conflito entre modelo proposto e código existente, priorizar compatibilidade incremental.
- Se o impacto de migração for crítico sem janela segura, bloquear recomendação de rollout direto.

## Guardrails

- Nunca propor armazenamento em claro de dado sensível por conveniência.
- Nunca remover trilha de auditoria em fluxo crítico.
- Nunca confundir hipótese de modelagem com fato implementado.

## Checklist de Qualidade

- Modelo cobre entidades e relações do escopo.
- Há estratégia incremental sem quebra abrupta.
- Segurança e multi-tenant foram tratados quando aplicável.
- Riscos e trade-offs foram explicitados.
