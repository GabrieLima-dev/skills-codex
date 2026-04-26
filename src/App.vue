<script setup>
import { computed, onMounted, onUnmounted } from 'vue';
import { storeToRefs } from 'pinia';
import { controls, skills, stages } from './data/gameContent';
import { STORAGE_KEY } from './lib/progressStorage';
import { useProgressStore } from './stores/progress';

const progress = useProgressStore();
const {
  currentStageId,
  completedStageIds,
  theme,
  currentIndex,
  currentStage,
  completionPercent,
  unlockedIndex
} = storeToRefs(progress);

const activeSkill = computed(() => skills.find((skill) => skill.name === currentStage.value.skill));
const completedCount = computed(() => completedStageIds.value.length);
const isFinished = computed(() => completedCount.value === stages.length);

function stageState(stage, index) {
  if (completedStageIds.value.includes(stage.id)) return 'done';
  if (currentStageId.value === stage.id) return 'active';
  if (index <= unlockedIndex.value) return 'open';
  return 'locked';
}

function handleStageClick(stage, index) {
  if (index <= unlockedIndex.value) {
    progress.selectStage(stage.id);
  }
}

function handleKeydown(event) {
  if (event.key === 'ArrowRight') {
    event.preventDefault();
    progress.nextStage();
  }
  if (event.key === 'ArrowLeft') {
    event.preventDefault();
    const previousIndex = Math.max(0, currentIndex.value - 1);
    progress.selectStage(stages[previousIndex].id);
  }
  if (event.key === 'Enter') {
    event.preventDefault();
    progress.completeCurrentStage();
  }
}

onMounted(() => window.addEventListener('keydown', handleKeydown));
onUnmounted(() => window.removeEventListener('keydown', handleKeydown));
</script>

<template>
  <main class="game-app" :data-theme="theme">
    <header class="hud">
      <section class="brand">
        <div class="brand-mark" aria-hidden="true">S</div>
        <div>
          <p>Skills Game</p>
          <h1>Aprenda o fluxo correndo da esquerda para a direita.</h1>
        </div>
      </section>

      <section class="scoreboard" aria-label="Progresso do jogo">
        <div>
          <span>Fase</span>
          <strong>{{ currentIndex + 1 }}/{{ stages.length }}</strong>
        </div>
        <div>
          <span>Progresso</span>
          <strong>{{ completionPercent }}%</strong>
        </div>
        <div>
          <span>Cache</span>
          <strong>localStorage</strong>
        </div>
      </section>

      <nav class="hud-actions" aria-label="Acoes do jogo">
        <a href="/skills-workflow-guide.html">Docs</a>
        <button type="button" @click="progress.toggleTheme">
          {{ theme === 'dark' ? 'Tema claro' : 'Tema escuro' }}
        </button>
        <button type="button" @click="progress.resetProgress">Reiniciar</button>
      </nav>
    </header>

    <section class="play-layout">
      <aside class="how-to panel">
        <span class="panel-kicker">Como jogar</span>
        <h2>Complete fases para destravar o fluxo.</h2>
        <ol>
          <li v-for="control in controls" :key="control">{{ control }}</li>
        </ol>
        <div class="keys" aria-label="Atalhos">
          <span>← voltar</span>
          <span>→ avancar</span>
          <span>Enter concluir</span>
        </div>
      </aside>

      <section class="world panel" aria-label="Mapa lateral das fases">
        <div class="skyline" aria-hidden="true">
          <span></span>
          <span></span>
          <span></span>
        </div>

        <div class="track">
          <button
            v-for="(stage, index) in stages"
            :key="stage.id"
            type="button"
            class="stage-node"
            :class="stageState(stage, index)"
            :style="{ left: `${stage.x}%` }"
            :aria-label="`${stage.label}: ${stage.title}`"
            :disabled="stageState(stage, index) === 'locked'"
            @click="handleStageClick(stage, index)"
          >
            <span class="flag">{{ index + 1 }}</span>
            <strong>{{ stage.label }}</strong>
          </button>

          <div
            class="agent"
            :style="{ left: `${currentStage.x}%` }"
            aria-label="Agente na fase atual"
          >
            <span class="agent-head"></span>
            <span class="agent-body"></span>
          </div>

          <div class="ground" aria-hidden="true"></div>
        </div>
      </section>

      <aside class="mission panel" aria-live="polite">
        <span class="panel-kicker">Missao atual</span>
        <h2>{{ currentStage.title }}</h2>
        <p>{{ currentStage.hint }}</p>

        <dl>
          <div>
            <dt>Skill</dt>
            <dd>{{ currentStage.skill }}</dd>
          </div>
          <div>
            <dt>Objetivo</dt>
            <dd>{{ currentStage.objective }}</dd>
          </div>
          <div>
            <dt>Acao</dt>
            <dd>{{ currentStage.action }}</dd>
          </div>
          <div>
            <dt>Recompensa</dt>
            <dd>{{ currentStage.reward }}</dd>
          </div>
        </dl>

        <div class="mission-actions">
          <button type="button" class="primary" @click="progress.completeCurrentStage">
            {{ isFinished ? 'Jornada completa' : 'Concluir fase' }}
          </button>
          <button type="button" @click="progress.nextStage">Proxima fase</button>
        </div>
      </aside>
    </section>

    <section class="bottom-dock">
      <article class="panel skill-card">
        <span class="panel-kicker">Skill em foco</span>
        <h2>{{ activeSkill?.name }}</h2>
        <p>{{ activeSkill?.summary }}</p>
      </article>

      <article class="panel progress-card">
        <span class="panel-kicker">Salvamento controlado</span>
        <h2>{{ completedCount }} fases concluidas</h2>
        <p>
          O progresso e salvo no cache do navegador usando a chave
          <code>{{ STORAGE_KEY }}</code>. Nada e enviado para servidor nesta etapa.
        </p>
      </article>
    </section>
  </main>
</template>
