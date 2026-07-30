import 'package:freezed_annotation/freezed_annotation.dart';
import 'question.dart';

part 'question_session.freezed.dart';

@freezed
class QuestionSession with _$QuestionSession {
  const factory QuestionSession({
    required String id,
    required List<Question> questions,
    @Default({}) Map<String, List<String>> userAnswers, // questionId -> list of selected optionIds
    @Default(0) int currentIndex,
    @Default([]) List<String> visitedQuestionIds,
    @Default([]) List<String> skippedQuestionIds,
    DateTime? startTime,
    DateTime? endTime,
    @Default(false) bool isCompleted,
  }) = _QuestionSession;

  const QuestionSession._();

  Question get currentQuestion => questions[currentIndex];
  int get totalQuestions => questions.length;
  double get progress => totalQuestions == 0 ? 0 : (currentIndex + 1) / totalQuestions;
  
  bool get hasPrevious => currentIndex > 0;
  bool get hasNext => currentIndex < totalQuestions - 1;
  
  int get answeredCount => userAnswers.length;
  int get remainingCount => totalQuestions - answeredCount;
}
