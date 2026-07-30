import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_result.freezed.dart';
part 'validation_result.g.dart';

@freezed
class ValidationResult with _$ValidationResult {
  const factory ValidationResult({
    required String id,
    required bool isValid,
    required bool isCorrect,
    required double integrityScore, // 0.0 to 1.0
    @Default([]) List<String> flags,
    String? message,
    String? serverSignature,
    DateTime? validatedAt,
  }) = _ValidationResult;

  factory ValidationResult.fromJson(Map<String, dynamic> json) => _$ValidationResultFromJson(json);
}
