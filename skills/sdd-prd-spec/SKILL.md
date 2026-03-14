---
name: sdd-prd-spec
description: Use esta skill para executar a fase 2 do SDD, convertendo um `PRD.md` aprovado em `Spec.md` técnico e implementável, com plano por arquivo, regras de implementação, cenários de validação e critérios de pronto.
---

# SDD 2 - PRD para Spec

## Objetivo Operacional

Eliminar ambiguidade do PRD e produzir contrato técnico preciso para implementação segura.

## Escopo

Incluído:
- Tradução de requisitos do PRD para mudanças técnicas.
- Mapeamento explícito de alterações por arquivo.
- Definição de cenários de validação e critérios de pronto.

Fora de escopo:
- Codificação da solução.
- Alterar objetivos de negócio do PRD sem registrar desvio.

## Entradas Obrigatórias

1. `PRD.md` aprovado.
2. Estado atual do código relevante.

Referência obrigatória:
- `references/spec-template.md`

## Fluxo Operacional (Determinístico)

1. Ler `PRD.md` e extrair requisitos/aceitação.
2. Mapear requisitos para componentes e arquivos concretos.
3. Especificar mudanças por arquivo (`o que` + `por que`).
4. Definir comportamento antes/depois quando houver risco de regressão.
5. Definir cenários de validação (sucesso, erro/limite, regressão).
6. Definir critérios de pronto alinhados ao PRD.
7. Gerar `Spec.md` usando template oficial.

## Contrato de Saída

Entregar `Spec.md` contendo no mínimo:
1. Escopo técnico e vínculo com `PRD.md`.
2. Lista de mudanças por arquivo.
3. Regras de implementação.
4. Cenários de validação.
5. Critérios de pronto verificáveis.

## Fail-Safe e Tratamento de Ambiguidade

- Se um requisito do PRD não puder ser mapeado para arquivo, marcar bloqueio explicitamente.
- Se houver múltiplas estratégias válidas, escolher uma e registrar trade-off.
- Se PRD estiver inconsistente, registrar conflito antes de fechar a spec.
- Se o contexto técnico estiver incompleto para mapear requisito crítico, interromper fechamento da spec e registrar bloqueio.

## Guardrails

- Não incluir tarefa vaga sem alvo técnico.
- Não expandir escopo além do PRD sem seção de desvio controlado.
- Não omitir validação de cenários de erro/regressão.

## Checklist de Qualidade

- Todos os requisitos do PRD foram mapeados.
- Toda alteração aponta arquivo-alvo.
- Cenários de validação cobrem sucesso e bordas.
- Critérios de pronto são objetivos e executáveis.
