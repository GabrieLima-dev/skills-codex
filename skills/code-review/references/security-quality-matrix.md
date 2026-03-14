# Matriz de Severidade e Decisão

## Classificação de achados

- `crítico`: risco direto de segurança, perda de dados, quebra grave de fluxo, exposição sensível.
- `alto`: bug relevante com impacto operacional significativo ou fragilidade de segurança importante.
- `médio`: problema de qualidade/manutenção com potencial de regressão localizado.
- `baixo`: melhoria recomendada sem impacto imediato de operação.

## Critério de decisão do gate

- `reprovado`:
  - existe achado `crítico` aberto.
  - existe combinação de achados `alto` sem plano de correção.
- `aprovado com ressalvas`:
  - não há `crítico`, mas há achados `alto` ou `médio` com mitigação parcial.
- `aprovado`:
  - sem `crítico/alto` e com riscos residuais aceitáveis e documentados.

## Métricas mínimas obrigatórias do relatório

- `arquivos_revisados`: total de arquivos/componentes analisados.
- `checklist_aplicaveis`: total de itens aplicáveis do checklist.
- `checklist_verificados`: total efetivamente verificado.
- `achados_critico`: quantidade de achados críticos.
- `achados_alto`: quantidade de achados altos.
- `achados_medio`: quantidade de achados médios.
- `achados_baixo`: quantidade de achados baixos.
- `pendencias_bloqueantes`: quantidade de pendências que impedem continuidade.
- `confianca`: `alto|médio|baixo`.

## Decisão operacional de continuidade (obrigatória)

- `aprovado para continuar`:
  - status do review = `aprovado` ou `aprovado com ressalvas` sem pendência bloqueante.
- `bloqueado para continuar`:
  - status do review = `reprovado`, ou
  - existe qualquer pendência bloqueante aberta.

## Formato mínimo de cada achado

- Severidade: `crítico|alto|médio|baixo`
- Evidência: arquivo/componente e descrição objetiva
- Impacto: segurança, funcionalidade, performance ou manutenção
- Correção sugerida: ação objetiva e verificável
- Status: `aberto|mitigado|aceito`
