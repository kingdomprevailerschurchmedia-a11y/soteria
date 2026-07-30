import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_rules.freezed.dart';
part 'event_rules.g.dart';

@freezed
class EventRules with _$EventRules {
  const factory EventRules({
    required String eventId,
    required DateTime startTime,
    required DateTime endTime,
    required bool isActive,
    required Map<String, dynamic> modifiers,
  }) = _EventRules;

  factory EventRules.fromJson(Map<String, dynamic> json) =>
      _$EventRulesFromJson(json);
}
