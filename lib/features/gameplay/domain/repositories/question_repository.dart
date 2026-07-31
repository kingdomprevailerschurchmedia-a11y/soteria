import '../entities/question.dart';
import '../entities/question_type.dart';
import '../entities/question_difficulty.dart';

abstract class QuestionRepository {
  Future<List<Question>> getQuestions({
    int? limit,
    List<String>? categories,
    QuestionDifficulty? difficulty,
    List<QuestionType>? types,
    String? subjectId,
  });

  Future<Question?> getQuestionById(String id);
}
