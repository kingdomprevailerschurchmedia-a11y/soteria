import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/entities/assist_usage.dart';
import '../domain/entities/assist_type.dart';

part 'assist_state.freezed.dart';

@freezed
class AssistState with _$AssistState {
  const factory AssistState({
    @Default([]) List<AssistUsage> currentAssists,
    @Default(false) bool isLoading,
    String? errorMessage,
    
    // Timer specific state
    @Default(false) bool isTimerFrozen,
    DateTime? freezeUntil,
    
    // Current insight result
    CommunityInsightResult? activeInsight,
    
    // Eliminated options for the CURRENT question
    @Default([]) List<String> eliminatedOptionIds,
  }) = _AssistState;

  const AssistState._();

  bool isAvailable(AssistType type) {
    return currentAssists.any((a) => a.type == type && a.status.isAvailable);
  }
}
