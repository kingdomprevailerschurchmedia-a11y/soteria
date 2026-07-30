import 'package:freezed_annotation/freezed_annotation.dart';
import 'question_type.dart';
import 'question_difficulty.dart';
import 'question_option.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String id,
    required String text,
    required QuestionType type,
    required QuestionDifficulty difficulty,
    @Default([]) List<String> categories,
    @Default([]) List<QuestionOption> options,
    String? explanation,
    String? hint,
    String? mediaUrl,
    @Default([]) List<String> tags,
    @Default('') String subjectId,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
