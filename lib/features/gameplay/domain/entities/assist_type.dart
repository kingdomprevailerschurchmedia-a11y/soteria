/// Defines the available types of Knowledge Assists in Soteria.
enum AssistType {
  eliminateTwo,
  timeFreeze,
  communityInsight;

  String get label {
    switch (this) {
      case AssistType.eliminateTwo:
        return 'Eliminate Two';
      case AssistType.timeFreeze:
        return 'Time Freeze';
      case AssistType.communityInsight:
        return 'Community Insight';
    }
  }

  String get icon {
    switch (this) {
      case AssistType.eliminateTwo:
        return '🎯';
      case AssistType.timeFreeze:
        return '⏸';
      case AssistType.communityInsight:
        return '👥';
    }
  }
}
