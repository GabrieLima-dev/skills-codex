import { stages, skills, controls } from '../src/data/gameContent.js';
import { defaultProgress, normalizeProgress } from '../src/lib/progressStorage.js';
import { existsSync, readFileSync } from 'node:fs';

const failures = [];
const stageIds = stages.map((stage) => stage.id);
const docsPath = 'skills-workflow-guide.html';
const gamePath = 'game.html';
const appSource = readFileSync('src/App.vue', 'utf8');
const indexSource = readFileSync('index.html', 'utf8');
const guideSource = readFileSync(docsPath, 'utf8');
const nginxSource = readFileSync('nginx.conf', 'utf8');

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

if (!existsSync(docsPath)) {
  failures.push('Pagina estatica de docs precisa existir na raiz do projeto.');
}

if (!existsSync(gamePath)) {
  failures.push('Pagina do game precisa existir como game.html.');
}

if (!appSource.includes(`href="${docsPath}"`)) {
  failures.push('Link Docs do app precisa apontar para skills-workflow-guide.html.');
}

if (!indexSource.includes(docsPath)) {
  failures.push('index.html precisa abrir o guia skills-workflow-guide.html.');
}

if (!guideSource.includes(`href="${gamePath}"`)) {
  failures.push('Botao Abrir jogo do guia precisa apontar para game.html.');
}

if (!nginxSource.includes('index skills-workflow-guide.html index.html;')) {
  failures.push('Nginx precisa servir skills-workflow-guide.html como indice da raiz.');
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
