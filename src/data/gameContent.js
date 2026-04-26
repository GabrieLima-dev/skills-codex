export const stages = [
  {
    id: 'pedido',
    label: 'Pedido',
    title: 'Entenda a missao',
    x: 6,
    skill: 'context',
    objective: 'Descobrir o que o usuario quer antes de tocar em qualquer arquivo.',
    action: 'Leia o pedido, classifique o tipo de tarefa e separe fato, risco e duvida.',
    reward: 'Missao classificada e proximo gate definido.',
    hint: 'Comece aqui: se voce nao sabe o tipo de tarefa, nao sabe qual skill chamar.'
  },
  {
    id: 'prontidao',
    label: 'Gate',
    title: 'Abra o portao certo',
    x: 19,
    skill: 'project-readiness-gate',
    objective: 'Confirmar stack, docs, comandos e criterio de aceite.',
    action: 'Valide backend, frontend, docs e lacunas criticas antes da execucao.',
    reward: 'Gate aprovado ou lista objetiva de bloqueios.',
    hint: 'Sem prontidao aprovada, o jogo nao libera a proxima fase.'
  },
  {
    id: 'plano',
    label: 'Plano',
    title: 'Monte o mapa',
    x: 32,
    skill: 'sdd-sprint-orquestracao',
    objective: 'Explicar o que sera feito, arquivos previstos, riscos e impacto.',
    action: 'Apresente o plano e espere aprovacao mais comando explicito.',
    reward: 'Rota aprovada para seguir sem surpresa.',
    hint: 'Plano aprovado nao e execucao; ainda precisa de comando claro.'
  },
  {
    id: 'prd',
    label: 'PRD',
    title: 'Transforme ideia em objetivo',
    x: 45,
    skill: 'sdd-pesquisa-prd',
    objective: 'Converter demanda em contexto, problema, requisitos e aceite.',
    action: 'Escreva um PRD verificavel e pequeno o bastante para implementar.',
    reward: 'Produto da fase definido em linguagem de negocio.',
    hint: 'O PRD responde por que a mudanca existe.'
  },
  {
    id: 'spec',
    label: 'Spec',
    title: 'Desenhe a ponte tecnica',
    x: 58,
    skill: 'sdd-prd-spec',
    objective: 'Mapear requisitos para arquivos, regras e validacoes.',
    action: 'Transforme o PRD em contrato tecnico por arquivo.',
    reward: 'Implementacao pronta para comecar com escopo claro.',
    hint: 'A Spec responde onde e como mexer.'
  },
  {
    id: 'execucao',
    label: 'Execucao',
    title: 'Passe pela fase sem sair da rota',
    x: 71,
    skill: 'sdd-spec-code',
    objective: 'Implementar somente o que a Spec autorizou.',
    action: 'Edite incrementalmente, valide e registre qualquer desvio.',
    reward: 'Mudanca funcional com evidencias.',
    hint: 'Se aparecer uma ideia nova, ela vira desvio e pede aprovacao.'
  },
  {
    id: 'validacao',
    label: 'Validacao',
    title: 'Colete as evidencias',
    x: 84,
    skill: 'sdd-validacao',
    objective: 'Provar que PRD, Spec e implementacao estao alinhados.',
    action: 'Rode testes, consolide metricas, lacunas e risco residual.',
    reward: 'Entrega aprovada, aprovada com ressalvas ou reprovada.',
    hint: 'Sem evidencia, a fase nao esta realmente vencida.'
  },
  {
    id: 'publicacao',
    label: 'PR',
    title: 'Leve para main com seguranca',
    x: 94,
    skill: 'github-flow',
    objective: 'Publicar com branch, commit, push e PR rastreavel.',
    action: 'Revise, documente, abra PR para main e deixe como testar.',
    reward: 'Publicacao pronta para revisao.',
    hint: 'Publicar e uma fase propria, nao um detalhe final.'
  }
];

export const skills = [
  ['project-readiness-gate', 'Bloqueia execucao sem stack/contexto completo.'],
  ['context', 'Mapeia comportamento real, riscos e hipoteses.'],
  ['sdd-sprint-orquestracao', 'Controla plano, autorizacao, SDD e metricas.'],
  ['sdd-pesquisa-prd', 'Transforma pedido em PRD verificavel.'],
  ['sdd-prd-spec', 'Transforma PRD em Spec tecnica por arquivo.'],
  ['sdd-spec-code', 'Implementa a Spec com escopo controlado.'],
  ['sdd-validacao', 'Valida PRD, Spec, codigo e evidencias.'],
  ['front-ux-ui-design', 'Conduz UX/UI com 3 propostas e aprovacao.'],
  ['code-review', 'Procura bug, regressao, seguranca e qualidade.'],
  ['github-flow', 'Organiza branch, commit, push e PR para main.']
].map(([name, summary]) => ({ name, summary }));

export const controls = [
  'Clique em uma fase para mover a agente.',
  'Use Proxima fase para avancar como em um jogo lateral.',
  'Leia objetivo, acao e recompensa antes de concluir.',
  'Clique em Concluir fase para salvar progresso no navegador.'
];
