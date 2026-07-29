// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GuestProgress _$GuestProgressFromJson(Map<String, dynamic> json) =>
    _GuestProgress(
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      coins: (json['coins'] as num?)?.toInt() ?? 0,
      completedQuizIds:
          (json['completedQuizIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      unlockedAchievements:
          (json['unlockedAchievements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      localSettings: json['localSettings'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$GuestProgressToJson(_GuestProgress instance) =>
    <String, dynamic>{
      'xp': instance.xp,
      'coins': instance.coins,
      'completedQuizIds': instance.completedQuizIds,
      'unlockedAchievements': instance.unlockedAchievements,
      'localSettings': instance.localSettings,
    };
