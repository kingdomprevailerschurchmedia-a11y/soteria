/// Defines the possible states of a game session lifecycle.
enum GameSessionStatus {
  idle,
  initializing,
  loadingQuestions,
  countdown,
  active,
  validating,
  feedback,
  paused,
  completed,
  abandoned,
  interrupted,
}
