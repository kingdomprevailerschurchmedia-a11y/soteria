import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/assist_type.dart';
import '../domain/entities/assist_usage.dart';
import '../presentation/providers/gameplay_providers.dart';
import 'assist_state.dart';
import 'question_controller.dart';
import 'timer_controller.dart';

part 'assist_controller.g.dart';

@riverpod
class AssistController extends _$AssistController {
  Timer? _freezeTimer;

  @override
  AssistState build() {
    ref.onDispose(() => _freezeTimer?.cancel());
    return const AssistState();
  }

  Future<void> initForSession(String sessionId) async {
    state = state.copyWith(isLoading: true);
    try {
      final assists = await ref.read(assistRepositoryProvider).resetAssists(sessionId);
      state = state.copyWith(
        currentAssists: assists,
        isLoading: false,
        eliminatedOptionIds: [],
        activeInsight: null,
        isTimerFrozen: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> useAssist(AssistType type) async {
    final questionState = ref.read(questionControllerProvider);
    final session = questionState.session;
    if (session == null) return;

    final questionId = session.currentQuestion.id;
    final sessionId = session.id;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final updatedAssist = await ref.read(useAssistUseCaseProvider).call(
        sessionId,
        questionId,
        type,
      );

      // Update local assists list
      final updatedList = state.currentAssists.map((a) {
        return a.type == type ? updatedAssist : a;
      }).toList();

      state = state.copyWith(
        currentAssists: updatedList,
        isLoading: false,
      );

      // Apply assist effect
      _applyAssistEffect(updatedAssist);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void _applyAssistEffect(AssistUsage usage) {
    switch (usage.type) {
      case AssistType.eliminateTwo:
        final removedIds = List<String>.from(usage.metadata?['removedOptionIds'] ?? []);
        state = state.copyWith(eliminatedOptionIds: removedIds);
        break;
      
      case AssistType.timeFreeze:
        final duration = usage.metadata?['durationSeconds'] ?? 15;
        ref.read(timerControllerProvider.notifier).freeze(duration);

        state = state.copyWith(
          isTimerFrozen: true,
          freezeUntil: DateTime.now().add(Duration(seconds: duration)),
        );
        
        _freezeTimer?.cancel();
        _freezeTimer = Timer(Duration(seconds: duration), () {
          state = state.copyWith(isTimerFrozen: false, freezeUntil: null);
        });
        break;

      case AssistType.communityInsight:
        final insightJson = usage.metadata?['insight'];
        if (insightJson != null) {
          state = state.copyWith(activeInsight: CommunityInsightResult.fromJson(insightJson));
        }
        break;
    }
  }

  /// Reset question-specific assist effects when moving to next question
  void resetPerQuestionEffects() {
    state = state.copyWith(
      eliminatedOptionIds: [],
      activeInsight: null,
    );
  }

  void restoreAssists(List<AssistUsage> assists) {
    state = state.copyWith(currentAssists: assists);
  }
}
