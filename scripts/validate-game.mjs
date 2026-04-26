import { stages, skills, controls } from '../src/data/gameContent.js';
import { defaultProgress, normalizeProgress } from '../src/lib/progressStorage.js';

const failures = [];
const stageIds = stages.map((stage) => stage.id);

if (stages.length < 6) failures.push('A jornada precisa ter pelo menos 6 fases.');
if (new Set(stageIds).size !== stageIds.length) failures.push('IDs de fase devem ser unicos.');
if (!controls.length) failures.push('A tela precisa explicar como jogar.');

for (const stage of stages) {
  for (const field of ['id', 'label', 'title', 'skill', 'objective', 'action', 'reward', 'hint']) {
    if (!stage[field]) failures.push(`Fase ${stage.id || 'sem-id'} sem campo ${field}.`);
  }
}

if (!skills.some((skill) => skill.name === 'project-readiness-gate')) {
  failures.push('Catalogo precisa incluir project-readiness-gate.');
}

const normalized = normalizeProgress({
  currentStageId: 'invalido',
  completedStageIds: ['pedido', 'invalido', 'pedido'],
  theme: 'unknown'
}, stageIds);

if (normalized.currentStageId !== defaultProgress.currentStageId) {
  failures.push('Progresso invalido deve voltar para a primeira fase.');
}

if (normalized.completedStageIds.length !== 1 || normalized.completedStageIds[0] !== 'pedido') {
  failures.push('Progresso salvo deve filtrar fases invalidas e duplicadas.');
}

if (normalized.theme !== 'light') {
  failures.push('Tema invalido deve voltar para light.');
}

if (failures.length) {
  console.error(failures.join('\n'));
  process.exit(1);
}

console.log(`Game validation ok: ${stages.length} fases, ${skills.length} skills, ${controls.length} instrucoes.`);
