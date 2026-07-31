import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_rules.freezed.dart';
part 'timer_rules.g.dart';

@freezed
class TimerRules with _$TimerRules {
  const factory TimerRules({
    required int questionTimerSeconds,
    required int minTimerSeconds,
    required int maxTimerSeconds,
    required int reconnectTimeoutSeconds,
    required int sessionTimeoutSeconds,
    @Default(true) bool isTimerActive,
  }) = _TimerRules;

  factory TimerRules.fromJson(Map<String, dynamic> json) =>
      _$TimerRulesFromJson(json);
}
