import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_record.freezed.dart';
part 'question_record.g.dart';

@freezed
class QuestionRecord with _$QuestionRecord {
  const factory QuestionRecord({
    required String questionId,
    required DateTime timestamp,
    required bool isCorrect,
    required double responseTimeSeconds,
    required bool wasSkipped,
    required bool wasTimedOut,
  }) = _QuestionRecord;

  factory QuestionRecord.fromJson(Map<String, dynamic> json) => _$QuestionRecordFromJson(json);
}
