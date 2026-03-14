---
name: front-ux-ui-design
description: Use esta skill em qualquer alteração visual de frontend (layout, responsividade, tema, componentes, tipografia, cores, navegação). O plano obrigatório da execução deve apresentar exatamente 3 propostas de direção visual com links e confirmação explícita do usuário antes de implementar.
---

# UX/UI Frontend Design

## Objetivo Operacional

Garantir mudanças visuais de frontend com direção estética clara, alinhada ao usuário e com execução responsiva sem regressões de usabilidade.

## Escopo

Incluído:
- Benchmark rápido com 3 referências de mercado.
- Acionamento obrigatório para qualquer mudança frontend visual/layout/theme/responsividade/UX.
- Apresentação obrigatória de exatamente 3 modelos de mercado com links clicáveis para visualização.
- Tradução das referências em sistema visual aplicável ao contexto do projeto.
- Validação explícita com o usuário antes de implementar quando houver ambiguidade de estilo.
- Análise de imagem de referência enviada pelo usuário para extrair padrões visuais replicáveis.
- Checklist de responsividade sem rolagem lateral.

Fora de escopo:
- Alterar regras de negócio do backend.
- Introduzir design system novo sem necessidade.

## Entradas Obrigatórias

1. Contexto do frontend atual (arquivos e limitações).
2. Objetivo visual do usuário.
3. Plano com exatamente 3 propostas de direção visual com links clicáveis e trade-offs.
4. Direção visual escolhida e aprovada explicitamente pelo usuário (ou imagem fornecida pelo usuário para guiar síntese).

Referências obrigatórias:
- `references/benchmark-sites.md`
- `references/image-pattern-checklist.md`

## Fluxo Operacional (Determinístico)

1. Classificar o tipo de demanda visual (`ajuste pontual`, `alteração grande`, `refazer front`, `pedido explícito de UX/UI`).
2. Apresentar no plano obrigatório exatamente 3 modelos visuais de mercado com links clicáveis e trade-offs curtos.
3. Se o usuário enviar imagem, analisar padrões (layout, densidade, tipografia, ritmo, contraste, motion, componentes) e propor síntese aderente.
4. Confirmar explicitamente com o usuário a direção visual escolhida antes de editar código.
5. Implementar incrementalmente com foco em responsividade e acessibilidade.
6. Validar sem overflow horizontal, inclusive em telas pequenas.
7. Entregar resultado com instruções objetivas de validação visual.

## Contrato de Saída

Responder sempre com:
1. Três modelos de mercado apresentados com links e trade-offs.
2. Referência visual escolhida pelo usuário.
3. Decisões de design aplicadas (tipografia, cor, espaçamento, hierarquia, interação).
4. Arquivos alterados e impacto visual esperado.
5. Evidências de responsividade e regressão.
6. Seção `como testar` para FRONT.

## Fail-Safe e Tratamento de Ambiguidade

- Se houver ambiguidade de estilo, interromper implementação e confirmar a direção visual com o usuário.
- Se não houver 3 modelos com links no plano, bloquear implementação.
- Se houver conflito entre referência escolhida e padrão atual do projeto, registrar conflito explicitamente e propor solução conservadora.
- Se a referência por imagem estiver incompleta ou ilegível, declarar limitação e pedir nova referência antes de avançar.
- Se a solução introduzir risco de usabilidade (contraste baixo, legibilidade ruim, overflow lateral), bloquear conclusão como pronta.

## Tratamento de conflito

- Priorizar consistência com o design já estabelecido no projeto quando a referência externa conflitar com fluxos críticos.
- Documentar o trade-off e confirmar com o usuário qual direção deve prevalecer.

## Controle de risco

- Validar responsividade nos breakpoints críticos antes de encerrar.
- Verificar contraste e legibilidade no tema ativo.
- Evitar mudanças visuais amplas sem incremento controlado.

## Guardrails

- Nunca implementar direção visual sem confirmação explícita quando houver dúvida estética.
- Nunca apresentar menos de 3 referências em pedidos de direção visual aberta.
- Nunca iniciar mudança frontend visual/layout/theme/responsividade/UX sem apresentar 3 modelos de mercado com links no plano.
- Nunca apresentar modelo de referência sem link clicável válido para inspeção do usuário.
- Nunca ignorar imagem de referência enviada pelo usuário.
- Nunca concluir alteração frontend com rolagem lateral em viewport mobile.
- Nunca quebrar padrões já estabelecidos do projeto sem justificativa.

## Checklist de Qualidade

- 3 referências de benchmark apresentadas.
- As 3 referências constam no plano obrigatório com links clicáveis e trade-offs.
- Links das 3 referências apresentados de forma clicável.
- Confirmação explícita do usuário registrada.
- Se houve imagem, padrões visuais foram extraídos e validados com o usuário.
- Layout responsivo sem overflow lateral.
- Contraste e legibilidade adequados em light/dark (quando aplicável).
