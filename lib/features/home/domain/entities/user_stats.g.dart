// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStats _$UserStatsFromJson(Map<String, dynamic> json) => _UserStats(
  level: (json['level'] as num).toInt(),
  xpProgress: (json['xpProgress'] as num).toDouble(),
  coins: (json['coins'] as num).toInt(),
  streakDays: (json['streakDays'] as num).toInt(),
  lives: (json['lives'] as num).toInt(),
  rank: json['rank'] as String,
);

Map<String, dynamic> _$UserStatsToJson(_UserStats instance) =>
    <String, dynamic>{
      'level': instance.level,
      'xpProgress': instance.xpProgress,
      'coins': instance.coins,
      'streakDays': instance.streakDays,
      'lives': instance.lives,
      'rank': instance.rank,
    };
