// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeDashboard _$HomeDashboardFromJson(Map<String, dynamic> json) =>
    _HomeDashboard(
      stats: UserStats.fromJson(json['stats'] as Map<String, dynamic>),
      activeTournaments: (json['activeTournaments'] as List<dynamic>)
          .map((e) => Tournament.fromJson(e as Map<String, dynamic>))
          .toList(),
      welcomeMessage: json['welcomeMessage'] as String,
    );

Map<String, dynamic> _$HomeDashboardToJson(_HomeDashboard instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'activeTournaments': instance.activeTournaments,
      'welcomeMessage': instance.welcomeMessage,
    };
