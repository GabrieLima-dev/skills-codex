import { computed, ref, watch } from 'vue';
import { defineStore } from 'pinia';
import { stages } from '../data/gameContent';
import { defaultProgress, loadProgress, loadTheme, saveProgress, saveTheme, THEME_STORAGE_KEY } from '../lib/progressStorage';

const stageIds = stages.map((stage) => stage.id);

export const useProgressStore = defineStore('progress', () => {
  const storage = typeof window === 'undefined' ? null : window.localStorage;
  const saved = loadProgress(storage, stageIds);
  const currentStageId = ref(saved.currentStageId);
  const completedStageIds = ref(saved.completedStageIds);
  const theme = ref(loadTheme(storage, saved.theme));

  const currentIndex = computed(() => Math.max(0, stageIds.indexOf(currentStageId.value)));
  const currentStage = computed(() => stages[currentIndex.value] || stages[0]);
  const completionPercent = computed(() => Math.round((completedStageIds.value.length / stages.length) * 100));
  const unlockedIndex = computed(() => Math.min(stages.length - 1, completedStageIds.value.length + 1));

  function selectStage(stageId) {
    const targetIndex = stageIds.indexOf(stageId);
    if (targetIndex === -1 || targetIndex > unlockedIndex.value) return;
    currentStageId.value = stageId;
  }

  function nextStage() {
    const nextIndex = Math.min(stages.length - 1, currentIndex.value + 1);
    selectStage(stages[nextIndex].id);
  }

  function completeCurrentStage() {
    if (!completedStageIds.value.includes(currentStageId.value)) {
      completedStageIds.value = [...completedStageIds.value, currentStageId.value];
    }
    nextStage();
  }

  function resetProgress() {
    currentStageId.value = defaultProgress.currentStageId;
    completedStageIds.value = [];
  }

  function toggleTheme() {
    theme.value = theme.value === 'dark' ? 'light' : 'dark';
  }

  function handleThemeStorage(event) {
    if (event.key === THEME_STORAGE_KEY && event.newValue) {
      theme.value = loadTheme(storage, theme.value);
    }
  }

  if (typeof window !== 'undefined') {
    window.addEventListener('storage', handleThemeStorage);
  }

  watch(
    [currentStageId, completedStageIds, theme],
    () => saveProgress(storage, {
      version: 1,
      currentStageId: currentStageId.value,
      completedStageIds: completedStageIds.value,
      theme: theme.value
    }),
    { deep: true }
  );

  watch(theme, () => saveTheme(storage, theme.value), { immediate: true });

  return {
    currentStageId,
    completedStageIds,
    theme,
    currentIndex,
    currentStage,
    completionPercent,
    unlockedIndex,
    selectStage,
    nextStage,
    completeCurrentStage,
    resetProgress,
    toggleTheme
  };
});
