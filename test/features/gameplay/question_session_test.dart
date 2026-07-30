import 'package:flutter_test/flutter_test.dart';
import 'package:soteria/features/gameplay/domain/entities/question.dart';
import 'package:soteria/features/gameplay/domain/entities/question_session.dart';
import 'package:soteria/features/gameplay/domain/entities/question_type.dart';
import 'package:soteria/features/gameplay/domain/entities/question_difficulty.dart';

void main() {
  group('QuestionSession', () {
    final mockQuestions = [
      const Question(
        id: '1',
        text: 'Q1',
        type: QuestionType.multipleChoice,
        difficulty: QuestionDifficulty.beginner,
      ),
      const Question(
        id: '2',
        text: 'Q2',
        type: QuestionType.multipleChoice,
        difficulty: QuestionDifficulty.beginner,
      ),
    ];

    test('initial state is correct', () {
      final session = QuestionSession(id: 'test', questions: mockQuestions);
      expect(session.currentIndex, 0);
      expect(session.totalQuestions, 2);
      expect(session.progress, 0.5);
      expect(session.hasNext, true);
      expect(session.hasPrevious, false);
    });

    test('navigation updates index', () {
      var session = QuestionSession(id: 'test', questions: mockQuestions);
      session = session.copyWith(currentIndex: 1);
      expect(session.currentIndex, 1);
      expect(session.hasNext, false);
      expect(session.hasPrevious, true);
      expect(session.progress, 1.0);
    });

    test('answeredCount correctly tracks userAnswers', () {
      final session = QuestionSession(
        id: 'test',
        questions: mockQuestions,
        userAnswers: {'1': ['opt1']},
      );
      expect(session.answeredCount, 1);
      expect(session.remainingCount, 1);
    });
  });
}
