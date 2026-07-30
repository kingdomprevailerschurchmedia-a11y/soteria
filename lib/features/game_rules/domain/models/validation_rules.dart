import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_rules.freezed.dart';
part 'validation_rules.g.dart';

@freezed
class ValidationRules with _$ValidationRules {
  const factory ValidationRules({
    required bool requiresAntiCheat,
    required bool integrityCheckEnabled,
    required List<String> requiredPermissions,
  }) = _ValidationRules;

  factory ValidationRules.fromJson(Map<String, dynamic> json) =>
      _$ValidationRulesFromJson(json);
}
