export const STORAGE_KEY = 'skills-game-progress:v1';

export const defaultProgress = {
  version: 1,
  currentStageId: 'pedido',
  completedStageIds: [],
  lastPlayedAt: null,
  theme: 'light'
};

export function normalizeProgress(value, validStageIds) {
  const completed = Array.isArray(value?.completedStageIds)
    ? value.completedStageIds.filter((stageId) => validStageIds.includes(stageId))
    : [];
  const currentStageId = validStageIds.includes(value?.currentStageId)
    ? value.currentStageId
    : validStageIds[0];

  return {
    ...defaultProgress,
    ...value,
    version: 1,
    currentStageId,
    completedStageIds: [...new Set(completed)],
    theme: value?.theme === 'dark' ? 'dark' : 'light'
  };
}

export function loadProgress(storage, validStageIds) {
  try {
    const raw = storage?.getItem(STORAGE_KEY);
    if (!raw) return normalizeProgress(defaultProgress, validStageIds);
    return normalizeProgress(JSON.parse(raw), validStageIds);
  } catch {
    return normalizeProgress(defaultProgress, validStageIds);
  }
}

export function saveProgress(storage, progress) {
  storage?.setItem(STORAGE_KEY, JSON.stringify({
    ...progress,
    lastPlayedAt: new Date().toISOString()
  }));
}
