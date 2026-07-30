import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/question.dart';
import '../domain/entities/question_session.dart';
import '../domain/entities/question_difficulty.dart';
import '../presentation/providers/gameplay_providers.dart';
import 'question_state.dart';
import 'question_validator.dart';
import 'assist_controller.dart';

part 'question_controller.g.dart';

@riverpod
class QuestionController extends _$QuestionController {
  @override
  QuestionState build() => const QuestionState();

  Future<void> startSession({
    int limit = 10,
    List<String>? categories,
    QuestionDifficulty? difficulty,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final questions = await ref.read(questionRepositoryProvider).getQuestions(
            limit: limit,
            categories: categories,
            difficulty: difficulty,
          );

      if (questions.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'No questions found for the selected criteria.',
        );
        return;
      }

      final session = QuestionSession(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        questions: questions,
        startTime: DateTime.now(),
      );

      // Initialize assists for the new session
      await ref.read(assistControllerProvider.notifier).initForSession(session.id);

      state = state.copyWith(
        isLoading: false,
        session: session,
        isFinished: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load questions: $e',
      );
    }
  }

  void submitAnswer(List<String> optionIds) {
    final session = state.session;
    if (session == null || session.isCompleted || state.isLocked) return;

    final currentQuestion = session.currentQuestion;
    
    // 1. Local Validation for immediate feedback
    final isCorrect = QuestionValidator.validate(currentQuestion, optionIds);
    
    // 2. Reveal correct answers
    final correctIds = currentQuestion.options
        .where((o) => o.isCorrect)
        .map((o) => o.id)
        .toList();

    state = state.copyWith(
      isLocked: true,
      revealedCorrectOptionIds: correctIds,
      activeFeedback: isCorrect ? FeedbackType.correct : FeedbackType.incorrect,
    );

    // 3. Save to session
    final updatedAnswers = Map<String, List<String>>.from(session.userAnswers);
    updatedAnswers[currentQuestion.id] = optionIds;

    final updatedVisited = List<String>.from(session.visitedQuestionIds);
    if (!updatedVisited.contains(currentQuestion.id)) {
      updatedVisited.add(currentQuestion.id);
    }

    state = state.copyWith(
      session: session.copyWith(
        userAnswers: updatedAnswers,
        visitedQuestionIds: updatedVisited,
      ),
    );
  }

  void clearFeedback() {
    state = state.copyWith(
      activeFeedback: null,
    );
  }

  void nextQuestion() {
    final session = state.session;
    if (session == null || !session.hasNext) return;

    ref.read(assistControllerProvider.notifier).resetPerQuestionEffects();

    state = state.copyWith(
      session: session.copyWith(currentIndex: session.currentIndex + 1),
      isLocked: false,
      revealedCorrectOptionIds: [],
      activeFeedback: null,
    );
  }

  void previousQuestion() {
    final session = state.session;
    if (session == null || !session.hasPrevious) return;

    ref.read(assistControllerProvider.notifier).resetPerQuestionEffects();

    state = state.copyWith(
      session: session.copyWith(currentIndex: session.currentIndex - 1),
      isLocked: false,
      revealedCorrectOptionIds: [],
      activeFeedback: null,
    );
  }

  void jumpToQuestion(int index) {
    final session = state.session;
    if (session == null || index < 0 || index >= session.totalQuestions) return;

    state = state.copyWith(
      session: session.copyWith(currentIndex: index),
    );
  }

  void skipQuestion() {
    final session = state.session;
    if (session == null) return;

    final currentId = session.currentQuestion.id;
    final updatedSkipped = List<String>.from(session.skippedQuestionIds);
    if (!updatedSkipped.contains(currentId)) {
      updatedSkipped.add(currentId);
    }

    state = state.copyWith(
      session: session.copyWith(skippedQuestionIds: updatedSkipped),
    );
    
    if (session.hasNext) {
      nextQuestion();
    }
  }

  void finishSession() {
    final session = state.session;
    if (session == null) return;

    state = state.copyWith(
      session: session.copyWith(
        isCompleted: true,
        endTime: DateTime.now(),
      ),
      isFinished: true,
    );
  }

  void resetSession() {
    state = const QuestionState();
  }

  void restoreSession(QuestionSession session) {
    state = state.copyWith(
      session: session,
      isFinished: session.isCompleted,
    );
  }
}
