# Checklist de Implementação (Spec -> Código) v3

## 1. Pré-Implementação

1. `Spec.md` está aprovada e sem conflito crítico.
2. Arquivos-alvo foram confirmados.
3. Mudanças locais não relacionadas foram avaliadas.
4. Escopo paralelo foi explicitamente descartado.
5. Estratégia de TDD foi definida para os itens críticos.

## 2. Execução Item a Item

1. Para mudança de código, iniciar com teste falhando (`red`).
2. Implementar apenas itens previstos na spec para passar teste (`green`).
3. Refatorar sem quebrar testes (`refactor`).
4. Manter diff pequeno e legível por etapa.
5. Registrar status por item:
- `concluído`
- `não concluído`
- `desvio/risco`
6. Se surgir demanda fora da spec, pausar e registrar desvio.

## 3. Validação Técnica

1. Rodar checks previstos (test/lint/build/manual).
2. Capturar resultado de cada check.
3. Registrar checks não executados e motivo.
4. Confirmar cobertura dos critérios de pronto da spec.
5. Confirmar evidência de TDD por item crítico.

## 4. Evidência de Saída

1. Lista de itens implementados por arquivo.
2. Lista de itens pendentes e impacto.
3. Resultado de validações.
4. Seção `como testar` com passos de API e FRONT quando aplicável.
5. Riscos residuais e próximos passos.
