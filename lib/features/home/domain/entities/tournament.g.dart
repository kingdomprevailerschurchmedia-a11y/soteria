// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tournament _$TournamentFromJson(Map<String, dynamic> json) => _Tournament(
  id: json['id'] as String,
  title: json['title'] as String,
  prizePool: json['prizePool'] as String,
  timeLeft: json['timeLeft'] as String,
  entryFee: json['entryFee'] as String,
  category: json['category'] as String,
);

Map<String, dynamic> _$TournamentToJson(_Tournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'prizePool': instance.prizePool,
      'timeLeft': instance.timeLeft,
      'entryFee': instance.entryFee,
      'category': instance.category,
    };
