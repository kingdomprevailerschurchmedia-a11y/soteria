import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/entities/question_session.dart';
import '../presentation/widgets/feedback_overlay.dart';

part 'question_state.freezed.dart';

@freezed
class QuestionState with _$QuestionState {
  const factory QuestionState({
    QuestionSession? session,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isFinished,
    FeedbackType? activeFeedback,
    @Default([]) List<String> revealedCorrectOptionIds,
    @Default(false) bool isLocked,
  }) = _QuestionState;

  const QuestionState._();

  bool get hasSession => session != null;
  bool get canNavigateNext => session?.hasNext ?? false;
  bool get canNavigatePrevious => session?.hasPrevious ?? false;
}
