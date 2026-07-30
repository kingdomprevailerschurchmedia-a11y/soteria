/// Defines the available strategies for selecting the next question.
enum SelectionStrategy {
  adaptive,     // Practice mode: Adjusts based on performance
  deterministic, // Tournament/Versus: Fixed sequence for all
  linear,        // Mock Exams: Follows a specific curriculum order
  random,        // Daily Challenge: Curated but shuffled
  ai;           // Future: Fully personalized AI-driven path
}
