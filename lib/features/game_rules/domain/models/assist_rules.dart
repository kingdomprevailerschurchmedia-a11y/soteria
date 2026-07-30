import 'package:freezed_annotation/freezed_annotation.dart';

part 'assist_rules.freezed.dart';
part 'assist_rules.g.dart';

@freezed
class AssistRules with _$AssistRules {
  const factory AssistRules({
    required bool allowKnowledgeAssist,
    required int maxAssistsPerSession,
    required int cooldownSeconds,
    required Map<String, int> assistTypeLimits,
  }) = _AssistRules;

  factory AssistRules.fromJson(Map<String, dynamic> json) =>
      _$AssistRulesFromJson(json);
}
