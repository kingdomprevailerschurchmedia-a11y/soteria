import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_profile.freezed.dart';
part 'learning_profile.g.dart';

@freezed
abstract class LearningProfile with _$LearningProfile {
  const factory LearningProfile({
    @Default(EducationLevel.other) EducationLevel educationLevel,
    String? institution,
    @Default([]) List<String> preferredCategories,
    @Default(DifficultyPreference.adaptive) DifficultyPreference difficultyPreference,
    @Default(DailyLearningGoal.ten) DailyLearningGoal dailyGoal,
    @Default(CompetitionPreference.friendly) CompetitionPreference competitionPreference,
    @Default({
      'dailyReminder': true,
      'tournamentAlerts': true,
      'friendChallenges': true,
      'leaderboardUpdates': true,
      'rewards': true,
      'achievements': true,
    }) Map<String, bool> notificationPreferences,
    String? avatarId,
  }) = _LearningProfile;

  factory LearningProfile.fromJson(Map<String, dynamic> json) =>
      _$LearningProfileFromJson(json);
}

enum EducationLevel {
  secondarySchool,
  university,
  graduate,
  professional,
  other,
}

enum DifficultyPreference {
  beginner,
  intermediate,
  advanced,
  adaptive,
}

enum DailyLearningGoal {
  five,
  ten,
  twenty,
  fifty,
  custom,
}

enum CompetitionPreference {
  practiceOnly,
  friendly,
  competitive,
  professional,
}
