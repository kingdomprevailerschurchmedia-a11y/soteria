// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LearningProfile _$LearningProfileFromJson(Map<String, dynamic> json) =>
    _LearningProfile(
      educationLevel:
          $enumDecodeNullable(
            _$EducationLevelEnumMap,
            json['educationLevel'],
          ) ??
          EducationLevel.other,
      institution: json['institution'] as String?,
      preferredCategories:
          (json['preferredCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      difficultyPreference:
          $enumDecodeNullable(
            _$DifficultyPreferenceEnumMap,
            json['difficultyPreference'],
          ) ??
          DifficultyPreference.adaptive,
      dailyGoal:
          $enumDecodeNullable(_$DailyLearningGoalEnumMap, json['dailyGoal']) ??
          DailyLearningGoal.ten,
      competitionPreference:
          $enumDecodeNullable(
            _$CompetitionPreferenceEnumMap,
            json['competitionPreference'],
          ) ??
          CompetitionPreference.friendly,
      notificationPreferences:
          (json['notificationPreferences'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {
            'dailyReminder': true,
            'tournamentAlerts': true,
            'friendChallenges': true,
            'leaderboardUpdates': true,
            'rewards': true,
            'achievements': true,
          },
      avatarId: json['avatarId'] as String?,
    );

Map<String, dynamic> _$LearningProfileToJson(_LearningProfile instance) =>
    <String, dynamic>{
      'educationLevel': _$EducationLevelEnumMap[instance.educationLevel]!,
      'institution': instance.institution,
      'preferredCategories': instance.preferredCategories,
      'difficultyPreference':
          _$DifficultyPreferenceEnumMap[instance.difficultyPreference]!,
      'dailyGoal': _$DailyLearningGoalEnumMap[instance.dailyGoal]!,
      'competitionPreference':
          _$CompetitionPreferenceEnumMap[instance.competitionPreference]!,
      'notificationPreferences': instance.notificationPreferences,
      'avatarId': instance.avatarId,
    };

const _$EducationLevelEnumMap = {
  EducationLevel.secondarySchool: 'secondarySchool',
  EducationLevel.university: 'university',
  EducationLevel.graduate: 'graduate',
  EducationLevel.professional: 'professional',
  EducationLevel.other: 'other',
};

const _$DifficultyPreferenceEnumMap = {
  DifficultyPreference.beginner: 'beginner',
  DifficultyPreference.intermediate: 'intermediate',
  DifficultyPreference.advanced: 'advanced',
  DifficultyPreference.adaptive: 'adaptive',
};

const _$DailyLearningGoalEnumMap = {
  DailyLearningGoal.five: 'five',
  DailyLearningGoal.ten: 'ten',
  DailyLearningGoal.twenty: 'twenty',
  DailyLearningGoal.fifty: 'fifty',
  DailyLearningGoal.custom: 'custom',
};

const _$CompetitionPreferenceEnumMap = {
  CompetitionPreference.practiceOnly: 'practiceOnly',
  CompetitionPreference.friendly: 'friendly',
  CompetitionPreference.competitive: 'competitive',
  CompetitionPreference.professional: 'professional',
};
