import 'package:freezed_annotation/freezed_annotation.dart';
import 'assist_type.dart';
import 'assist_status.dart';

part 'assist_usage.freezed.dart';
part 'assist_usage.g.dart';

@freezed
class AssistUsage with _$AssistUsage {
  const factory AssistUsage({
    required String id,
    required AssistType type,
    @Default(AssistStatus.available) AssistStatus status,
    DateTime? usedAt,
    String? questionId,
    Map<String, dynamic>? metadata,
  }) = _AssistUsage;

  factory AssistUsage.fromJson(Map<String, dynamic> json) => _$AssistUsageFromJson(json);
}

@freezed
class CommunityInsightResult with _$CommunityInsightResult {
  const factory CommunityInsightResult({
    required Map<String, double> statistics, // optionId -> percentage (0.0 to 1.0)
    required bool isSimulated,
  }) = _CommunityInsightResult;

  factory CommunityInsightResult.fromJson(Map<String, dynamic> json) => _$CommunityInsightResultFromJson(json);
}
