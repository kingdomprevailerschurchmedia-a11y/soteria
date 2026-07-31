import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_option.freezed.dart';
part 'question_option.g.dart';

@freezed
class QuestionOption with _$QuestionOption {
  const factory QuestionOption({
    required String id,
    required String text,
    @Default(false) bool isCorrect,
    int? order,
    String? matchId,
  }) = _QuestionOption;

  factory QuestionOption.fromJson(Map<String, dynamic> json) => _$QuestionOptionFromJson(json);
}
