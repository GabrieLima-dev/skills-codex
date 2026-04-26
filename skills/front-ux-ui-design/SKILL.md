---
name: front-ux-ui-design
description: Use esta skill em qualquer alteração frontend visual/layout/theme/responsividade/UX, criação ou melhoria de página, landing page, dashboard, app screen, portfólio, SaaS, design system ou interface moderna. O plano obrigatório deve apresentar exatamente 3 propostas de direção visual com links clicáveis, trade-offs e confirmação explícita do usuário antes de implementar.
---

# UX/UI Frontend Design

## Objetivo Operacional

Atuar como especialista de frontend criativo para transformar ideias vagas, referências, screenshots ou requisitos iniciais em experiências visuais modernas, responsivas, acessíveis e implementáveis sem aparência genérica.

A skill deve garantir que mudanças visuais de frontend tenham direção estética clara, contexto de produto compreendido, benchmark visual rastreável, critérios objetivos de qualidade e execução alinhada ao projeto atual.

## Escopo

Incluído:
- Acionamento obrigatório para qualquer mudança frontend visual/layout/theme/responsividade/UX.
- Criação ou melhoria de páginas, landing pages, dashboards, portfólios, SaaS pages, app screens, componentes e design systems.
- Descoberta objetiva do contexto de negócio, público, objetivo da tela e restrições técnicas antes de propor UI.
- Benchmark rápido com exatamente 3 propostas de direção visual com links clicáveis e trade-offs.
- Tradução das referências em linguagem visual aplicável: layout, hierarquia, paleta, tipografia, espaçamento, componentes e motion.
- Perguntas de esclarecimento quando o objetivo, público, conteúdo, stack ou estilo desejado estiverem incompletos.
- Análise de imagem de referência enviada pelo usuário para extrair padrões visuais replicáveis sem copiar assets proprietários.
- Orientação para React, Next.js, Vue, Tailwind CSS, Framer Motion, shadcn/ui, lucide-react/lucide-vue e bibliotecas já adotadas pelo projeto, quando aplicável.
- Checklist de responsividade, acessibilidade, estados de UI e ausência de rolagem lateral.

Fora de escopo:
- Alterar regras de negócio do backend.
- Introduzir stack, biblioteca ou design system novo sem necessidade comprovada.
- Copiar layouts proprietários, marcas, assets, logos, ilustrações ou identidade visual protegida.
- Implementar direção visual sem aprovação explícita do usuário.

## Entradas Obrigatórias

1. Contexto do frontend atual: stack, arquivos relevantes, padrões existentes e limitações.
2. Objetivo visual e funcional do usuário: o que a interface precisa comunicar ou resolver.
3. Contexto de produto: negócio, público, tom visual, conteúdo disponível e fluxo principal.
4. Plano com exatamente 3 propostas de direção visual com links clicáveis e trade-offs.
5. Direção visual escolhida e aprovada explicitamente pelo usuário antes da implementação.
6. Imagem, vídeo, site ou referência textual do usuário, quando existir.

Referências obrigatórias:
- `references/benchmark-sites.md`
- `references/image-pattern-checklist.md`

## Fluxo Operacional (Determinístico)

1. Classificar o tipo de demanda visual (`ajuste pontual`, `alteração grande`, `refazer front`, `nova página`, `landing page`, `dashboard`, `app screen`, `design system`, `pedido explícito de UX/UI`).
2. Ler o frontend atual e identificar padrões existentes de stack, layout, componentes, tokens, responsividade e acessibilidade.
3. Entender o produto antes de propor UI:
   - quem usa;
   - qual ação principal a tela deve facilitar;
   - qual percepção visual deve transmitir;
   - quais conteúdos reais ou placeholders realistas serão usados;
   - quais restrições técnicas existem.
4. Se faltar contexto crítico, fazer perguntas objetivas antes de propor direção visual. Se a lacuna não bloquear, seguir com premissas explícitas.
5. Apresentar no plano obrigatório exatamente 3 propostas de direção visual com links clicáveis e trade-offs curtos.
6. Para cada proposta, descrever:
   - estilo de layout;
   - hierarquia visual;
   - paleta e contraste;
   - tipografia;
   - sistema de espaçamento;
   - estilo de componentes;
   - padrão de animação/motion;
   - riscos de adaptação ao projeto atual.
7. Se o usuário enviar imagem, vídeo ou site específico, analisar padrões (layout, densidade, tipografia, ritmo, contraste, motion, componentes) e propor síntese aderente.
8. Confirmar explicitamente com o usuário a direção visual escolhida antes de editar código.
9. Implementar incrementalmente com foco em semântica, responsividade, acessibilidade e manutenção.
10. Usar padrões modernos de frontend somente quando agregarem qualidade real:
    - React/Next.js/Vue conforme stack existente;
    - Tailwind CSS quando já existir ou for aprovado;
    - Framer Motion/GSAP quando motion for útil e não excessivo;
    - shadcn/ui quando componentes acelerarem qualidade sem engessar identidade;
    - lucide para ícones em botões e ações.
11. Criar ou ajustar estados esperados: loading, vazio, erro, hover, focus, active, disabled e responsivo.
12. Validar sem overflow horizontal, inclusive em telas pequenas.
13. Entregar resultado com decisões de design, arquivos alterados, evidências e instruções objetivas de validação visual.

## Contrato de Saída

Responder sempre com:
1. Três propostas de direção visual apresentadas com links clicáveis e trade-offs.
2. Perguntas feitas e respostas/premissas adotadas, quando houver lacunas de contexto.
3. Referência visual escolhida pelo usuário e confirmação explícita registrada.
4. Decisões de design aplicadas: layout, hierarquia, cor, tipografia, espaçamento, componentes e motion.
5. Arquivos alterados e impacto visual esperado.
6. Estados de UI considerados: loading, vazio, erro, hover, focus, active, disabled e responsivo.
7. Evidências de responsividade, acessibilidade básica e regressão visual.
8. Seção `como testar` para FRONT.

## Fail-Safe e Tratamento de Ambiguidade

- Se houver ambiguidade de estilo, interromper implementação e confirmar a direção visual com o usuário.
- Se o objetivo de negócio, público ou ação principal estiverem ausentes e forem críticos para a UI, perguntar antes de seguir.
- Se não houver exatamente 3 propostas com links clicáveis no plano, bloquear implementação.
- Se houver conflito entre referência escolhida e padrão atual do projeto, registrar conflito explicitamente e propor solução conservadora.
- Se a referência por imagem estiver incompleta ou ilegível, declarar limitação e pedir nova referência antes de avançar.
- Se a solução introduzir risco de usabilidade (contraste baixo, legibilidade ruim, navegação confusa, foco invisível ou overflow lateral), bloquear conclusão como pronta.
- Se a referência externa for proprietária, recriar apenas a linguagem visual geral e a estrutura de experiência, sem copiar assets, marca, código ou layout exato.

## Tratamento de conflito

- Priorizar consistência com o design já estabelecido no projeto quando a referência externa conflitar com fluxos críticos.
- Priorizar clareza, legibilidade e acessibilidade quando a estética desejada prejudicar uso real.
- Documentar o trade-off e confirmar com o usuário qual direção deve prevalecer.

## Controle de risco

- Validar responsividade nos breakpoints críticos antes de encerrar.
- Verificar contraste, legibilidade e foco visível no tema ativo.
- Evitar mudanças visuais amplas sem incremento controlado.
- Evitar templates genéricos, seções decorativas sem função e excesso de animação.
- Preferir menos seções com propósito claro a muitas seções fracas.
- Preservar padrões técnicos existentes salvo aprovação explícita para mudança.

## Guardrails

- Nunca implementar direção visual sem confirmação explícita quando houver dúvida estética.
- Nunca apresentar menos ou mais de 3 propostas em pedidos de direção visual aberta.
- Nunca iniciar mudança frontend visual/layout/theme/responsividade/UX sem apresentar 3 modelos de mercado com links no plano.
- Nunca apresentar modelo de referência sem link clicável válido para inspeção do usuário.
- Nunca ignorar imagem, vídeo ou site de referência enviado pelo usuário.
- Nunca copiar assets, logos, marcas, ilustrações, textos proprietários ou layout exato de referência.
- Nunca usar animação como substituto de hierarquia visual clara.
- Nunca concluir alteração frontend com rolagem lateral em viewport mobile.
- Nunca quebrar padrões já estabelecidos do projeto sem justificativa.
- Nunca criar UI com aparência de template genérico quando o pedido exigir interface customizada, premium ou altamente visual.

## Checklist de Qualidade

- Contexto de produto, público, objetivo da tela e fluxo principal foram entendidos ou tiveram premissas registradas.
- 3 referências/propostas de benchmark foram apresentadas.
- As 3 referências constam no plano obrigatório com links clicáveis e trade-offs.
- Links das 3 referências apresentados de forma clicável.
- Confirmação explícita do usuário registrada.
- Se houve imagem, vídeo ou site de referência, padrões visuais foram extraídos e validados com o usuário.
- Direção visual define layout, hierarquia, paleta, tipografia, espaçamento, componentes e motion.
- UI considera estados de loading, vazio, erro, hover, focus, active, disabled e responsivo.
- Layout responsivo sem overflow lateral.
- Contraste, foco visível e legibilidade adequados em light/dark quando aplicável.
- Estrutura de componentes permanece simples, sem abstrações desnecessárias.
