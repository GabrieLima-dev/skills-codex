import { stages, skills, controls } from '../src/data/gameContent.js';
import { defaultProgress, normalizeProgress } from '../src/lib/progressStorage.js';
import { existsSync, readFileSync } from 'node:fs';

const failures = [];
const stageIds = stages.map((stage) => stage.id);
const docsPath = 'skills-workflow-guide.html';
const gamePath = 'game.html';
const homePath = '/home';
const appSource = readFileSync('src/App.vue', 'utf8');
const indexSource = readFileSync('index.html', 'utf8');
const guideSource = readFileSync(docsPath, 'utf8');
const nginxSource = readFileSync('nginx.conf', 'utf8');
const progressStorageSource = readFileSync('src/lib/progressStorage.js', 'utf8');

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

if (!appSource.includes(`href="${homePath}"`)) {
  failures.push('Link Docs do app precisa apontar para /home.');
}

if (!indexSource.includes(homePath)) {
  failures.push('index.html precisa abrir /home.');
}

if (!guideSource.includes(`href="${gamePath}"`)) {
  failures.push('Botao Abrir jogo do guia precisa apontar para game.html.');
}

if (!nginxSource.includes('location = /home')) {
  failures.push('Nginx precisa publicar a rota limpa /home.');
}

if (!nginxSource.includes('return 301 /home;')) {
  failures.push('Nginx precisa redirecionar skills-workflow-guide.html para /home.');
}

if (!progressStorageSource.includes("THEME_STORAGE_KEY = 'skills-ui-theme:v1'")) {
  failures.push('Tema precisa usar chave compartilhada skills-ui-theme:v1.');
}

if (!guideSource.includes('skills-ui-theme:v1')) {
  failures.push('Home precisa ler e salvar a chave compartilhada de tema.');
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
