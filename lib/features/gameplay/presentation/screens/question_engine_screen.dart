import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../../../core/widgets/loading/soteria_loading.dart';
import '../../../../core/widgets/error/soteria_error_state.dart';
import '../../application/question_controller.dart';
import '../../application/question_state.dart';
import '../../application/assist_controller.dart';
import '../../application/assist_state.dart';
import '../../application/game_session_controller.dart';
import '../../application/timer_controller.dart';
import '../widgets/gameplay_progress_bar.dart';
import '../widgets/question_renderer.dart';
import '../widgets/question_navigator_bar.dart';
import '../widgets/assist_bar.dart';
import '../widgets/soteria_timer.dart';
import '../widgets/fair_play_indicator.dart';
import '../widgets/feedback_overlay.dart';
import '../widgets/reward_feedback.dart';

class QuestionEngineScreen extends ConsumerWidget {
  const QuestionEngineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionControllerProvider);
    final assistState = ref.watch(assistControllerProvider);
    final timerState = ref.watch(timerControllerProvider);
    final notifier = ref.read(questionControllerProvider.notifier);

    return Scaffold(
      backgroundColor: SoteriaColors.background,
      appBar: AppBar(
        title: _buildAppBarTitle(context, state, assistState),
        leading: IconButton(
          icon: const Icon(Icons.pause),
          onPressed: () => ref.read(gameSessionControllerProvider.notifier).pauseMatch(),
          tooltip: 'Pause Session',
        ),
        actions: [
          if (timerState != null)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Center(child: CircularTimer(timerState: timerState, size: 36)),
            ),
          if (state.hasSession)
            Padding(
              padding: const EdgeInsets.only(right: SoteriaSpacing.s16),
              child: Center(
                child: Text(
                  '${state.session!.currentIndex + 1}/${state.session!.totalQuestions}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: SoteriaColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _buildBody(context, state, assistState, notifier),
      bottomNavigationBar: state.hasSession && !state.isFinished
          ? QuestionNavigatorBar(
              onPrevious: notifier.previousQuestion,
              onNext: notifier.nextQuestion,
              onSkip: notifier.skipQuestion,
              onFinish: () => ref.read(gameSessionControllerProvider.notifier).endMatch(),
              hasNext: state.canNavigateNext,
              hasPrevious: state.canNavigatePrevious,
              isAnswered: state.session!.userAnswers.containsKey(state.session!.currentQuestion.id),
              isLastQuestion: !state.canNavigateNext,
            )
          : null,
    );
  }

  Widget _buildAppBarTitle(BuildContext context, QuestionState state, AssistState assistState) {
    if (!state.hasSession) return const Text('Question Engine');
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Question ${state.session!.currentIndex + 1}'),
        const SizedBox(width: SoteriaSpacing.s12),
        const FairPlayIndicator(integrityScore: 1.0),
        if (assistState.isTimerFrozen) ...[
          const SizedBox(width: SoteriaSpacing.s8),
          _buildFrozenBadge(context),
        ],
      ],
    );
  }

  Widget _buildFrozenBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: SoteriaColors.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Row(
        children: [
          Icon(Icons.ac_unit, size: 12, color: Colors.white),
          SizedBox(width: 4),
          Text(
            'FROZEN',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, QuestionState state, AssistState assistState, QuestionController notifier) {
    if (state.isLoading) {
      return const Center(child: SoteriaCircularLoader());
    }

    if (state.errorMessage != null) {
      return Center(
        child: SoteriaErrorState(
          message: state.errorMessage!,
          onRetry: () => notifier.startSession(),
        ),
      );
    }

    if (state.session == null) {
      return const Center(child: Text('Waiting for session...'));
    }

    return _buildGameplayView(context, state, assistState, notifier);
  }

  Widget _buildGameplayView(BuildContext context, QuestionState state, AssistState assistState, QuestionController notifier) {
    final session = state.session!;
    final question = session.currentQuestion;

    return Stack(
      children: [
        Column(
          children: [
            GameplayProgressBar(progress: session.progress),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(SoteriaSpacing.s24),
                child: Column(
                  children: [
                    QuestionRenderer(
                      question: question,
                      selectedOptionIds: session.userAnswers[question.id] ?? [],
                      onOptionSelected: (ids) {
                        notifier.submitAnswer(ids);
                      },
                      assistState: assistState,
                      isLocked: state.isLocked,
                      revealedCorrectOptionIds: state.revealedCorrectOptionIds,
                    ),
                    const SizedBox(height: SoteriaSpacing.s16),
                    const AssistBar(),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (state.activeFeedback == FeedbackType.correct)
          const Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: RewardFeedback(amount: 10, label: 'XP'),
            ),
          ),
        if (state.activeFeedback != null)
          FeedbackOverlay(
            type: state.activeFeedback!,
            onFinished: notifier.clearFeedback,
          ),
      ],
    );
  }
}
