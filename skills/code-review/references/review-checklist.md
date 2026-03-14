# Checklist de Code Review Preventivo

## Bugs e comportamento

- A lógica implementada cobre cenário de sucesso, erro e limite?
- Há condição de corrida, nulos não tratados ou branch morto?
- Existe risco de regressão em fluxo crítico já existente?

## Segurança

- Entradas externas são validadas/sanitizadas?
- Há risco de injeção (SQL, comando, template) ou XSS?
- Segredos/tokens/chaves ficaram expostos em código, log ou resposta?
- Controles de autenticação/autorização foram preservados?

## Qualidade e manutenção

- Código está simples, legível e alinhado ao escopo aprovado?
- Há duplicação evitável ou acoplamento desnecessário?
- Tratamento de erro está consistente e observável?

## Testes e validação

- Existe evidência de teste suficiente para o escopo alterado?
- Há cobertura mínima de cenário negativo e regressão?
- Lacunas de validação estão explícitas com impacto?

## Passo a passo obrigatório da execução do review

- O relatório explicou, em ordem, o que foi revisado?
- O relatório explicou, em ordem, como o review foi executado?
- O relatório detalhou passo a passo dos testes/validações realizados?
- O relatório indicou claramente o que não foi testado e por quê?

## Métricas obrigatórias do review

- Quantos arquivos/componentes foram revisados?
- Quantos itens de checklist eram aplicáveis?
- Quantos itens de checklist foram efetivamente verificados?
- Quantos achados foram identificados por severidade?
- Quantas pendências ficaram bloqueantes?

## Gate de continuidade

- O relatório trouxe decisão explícita `aprovado para continuar` ou `bloqueado para continuar`?
- A justificativa da decisão está objetiva e baseada nos achados/métricas?

## Documentação

- Mudanças exigem atualização de `readme.md` ou guia operacional?
- Instruções de validação (`como testar`) estão reproduzíveis?
