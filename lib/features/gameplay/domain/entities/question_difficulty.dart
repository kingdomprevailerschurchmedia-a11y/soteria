/// Represents the difficulty levels for questions in Soteria.
enum QuestionDifficulty {
  beginner,
  intermediate,
  advanced,
  elite;

  String get label => name.toUpperCase();
}
