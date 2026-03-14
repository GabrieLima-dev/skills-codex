# Pull Request Template (branch de trabalho -> main) v4

Idioma obrigatório: português (pt-BR).

## Regras de preenchimento

- Preencher apenas com fatos observáveis no diff e nos testes executados.
- Não inventar informações.
- Se um campo não se aplicar, escrever `Não se aplica.`.
- Garantir clareza sobre: `o que foi feito`, `por que foi feito`, `como testar` e `riscos`.

## Template — Backend

```markdown
<!--
INSTRUÇÕES PARA A ASSISTENTE
- Preencha com base apenas no que realmente foi alterado.
- Não invente informações.
- Se algo não se aplicar, escreva: "Não se aplica."
- Seja objetiva, técnica e direta.
- Sempre deixar claro:
  1. o que foi feito
  2. por que foi feito
  3. como testar
  4. riscos importantes
-->

# PR — Backend

## Objetivo
Descreva em 1 ou 2 frases o que esta alteração resolve.

## O que foi feito
- 
- 
- 

## Impactos técnicos
- Endpoints afetados:
- Regras de negócio afetadas:
- Banco de dados/migrations:
- Variáveis de ambiente/configuração:
- Breaking change:

## Como testar
1. 
2. 
3. 

**Resultado esperado:**
- 
- 

## Riscos / atenção
- 
- 

## Rollback
- 

## Checklist
- [ ] Código revisado
- [ ] Fluxo principal validado
- [ ] Impactos técnicos descritos
- [ ] Como testar preenchido
- [ ] Breaking change informado, se houver
- [ ] Nenhum segredo/credencial exposto
```

## Template — Frontend

```markdown
<!--
INSTRUÇÕES PARA A ASSISTENTE
- Preencha com base apenas no que realmente foi alterado.
- Não invente informações.
- Se algo não se aplicar, escreva: "Não se aplica."
- Seja objetiva, técnica e direta.
-->

# PR — Frontend

## Objetivo
Descreva em 1 ou 2 frases o que esta alteração resolve.

## O que foi feito
- 
- 
- 

## Impactos funcionais
- Telas/rotas afetadas:
- Componentes afetados:
- Integração com API:
- Responsividade:
- Acessibilidade:

## Como testar
1. 
2. 
3. 

**Resultado esperado:**
- 
- 

## Evidências
- Prints/GIFs/vídeos:

## Riscos / atenção
- 
- 

## Rollback
- 

## Checklist
- [ ] Código revisado
- [ ] Fluxo principal validado
- [ ] Como testar preenchido
- [ ] Evidências adicionadas, se necessário
- [ ] Impactos em API/UI descritos
- [ ] Nenhum segredo/credencial exposto
```

## Template — Documentação

```markdown
<!--
INSTRUÇÕES PARA A ASSISTENTE
- Preencha com base apenas no que realmente foi alterado.
- Não invente informações.
- Se algo não se aplicar, escreva: "Não se aplica."
- Seja objetiva, técnica e direta.
-->

# PR — Documentação

## Objetivo
Descreva em 1 ou 2 frases o objetivo desta atualização.

## O que foi alterado
- 
- 
- 

## Impacto
- Público afetado:
- Documentos/arquivos alterados:
- Relação com código/processo:

## Como validar
1. 
2. 
3. 

**Resultado esperado:**
- 
- 

## Pontos de atenção
- 
- 

## Rollback
- 

## Checklist
- [ ] Conteúdo revisado
- [ ] Informação atualizada e coerente
- [ ] Links/caminhos validados
- [ ] Como validar preenchido
- [ ] Impacto descrito
```
