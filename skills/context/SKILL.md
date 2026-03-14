---
name: context
description: Use esta skill quando a tarefa exigir entendimento técnico confiável do estado atual do código (frontend, backend, integração, automações), com distinção explícita entre comportamento implementado, risco conhecido e hipótese.
---

# Context

## Objetivo Operacional

Produzir contexto técnico fiel ao código atual, com rastreabilidade por arquivo e sem inferências não verificadas.

## Escopo

Incluído:
- Mapeamento de responsabilidades entre frontend, backend e integrações.
- Fluxos críticos (autenticação, autorização, dados, jobs e sincronizações).
- Diferença entre comportamento real e documentação.
- Identificação de riscos técnicos e lacunas de contexto.

Fora de escopo:
- Redesenhar arquitetura sem pedido explícito.
- Assumir serviços não presentes no código.
- Declarar integrações sem evidência.

## Entradas Obrigatórias

1. Pedido do usuário.
2. Código fonte atual do workspace.

Entradas opcionais:
- `references/current-architecture.md` para acelerar leitura inicial.

## Fluxo Operacional (Determinístico)

1. Classificar o pedido por domínio técnico (`frontend`, `backend`, `infra`, `integração`, `visão geral`).
2. Identificar arquivos de verdade operacional por maior sinal (entrypoints, handlers, serviços, jobs, config).
3. Ler os arquivos críticos primeiro e consolidar o fluxo executável real.
4. Ler `references/current-architecture.md` somente se faltar contexto para síntese.
5. Consolidar achados separando obrigatoriamente:
   - `Comprovado no código`
   - `Risco/limitação atual`
   - `Hipótese ou lacuna a verificar`
6. Se houver conflito entre docs e código, priorizar código e registrar o conflito.

## Contrato de Saída

Responder sempre com:
1. Resumo técnico objetivo do comportamento atual.
2. Evidências com caminhos de arquivo.
3. Riscos relevantes e impacto.
4. Próximo passo recomendado, pequeno e verificável.
5. Nível de confiança da análise (`alto`, `médio`, `baixo`) com justificativa.

## Fail-Safe e Tratamento de Ambiguidade

- Se o pedido for vago, explicitar premissas adotadas antes de concluir.
- Se faltar arquivo-chave, declarar limitação e reduzir o nível de certeza.
- Se existir mais de uma interpretação possível, listar opções e indicar a mais provável com justificativa técnica.

## Guardrails

- Nunca expor conteúdo de segredo, token, chave privada ou credencial.
- Nunca afirmar “implementado” sem referência de arquivo.
- Nunca apresentar planejamento futuro como estado atual.

## Checklist de Qualidade

- Estado atual foi descrito com base em código real.
- Há distinção clara entre fato, risco e hipótese.
- Há referências de arquivo suficientes para auditoria.
- Não há extrapolação além do escopo pedido.
