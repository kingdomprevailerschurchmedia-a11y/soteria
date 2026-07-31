import '../domain/entities/question.dart';
import '../domain/entities/question_type.dart';

class QuestionValidator {
  static bool validate(Question question, List<String> selectedOptionIds) {
    if (selectedOptionIds.isEmpty) return false;

    switch (question.type) {
      case QuestionType.multipleChoice:
      case QuestionType.trueFalse:
        // For multiple choice, we assume single selection for now unless specified
        final correctIds = question.options
            .where((opt) => opt.isCorrect)
            .map((opt) => opt.id)
            .toList();
        
        if (correctIds.length != selectedOptionIds.length) return false;
        return selectedOptionIds.every((id) => correctIds.contains(id));

      case QuestionType.ordering:
        // Check if selected IDs are in the correct order
        for (int i = 0; i < selectedOptionIds.length; i++) {
          final option = question.options.firstWhere((opt) => opt.id == selectedOptionIds[i]);
          if (option.order != i) return false;
        }
        return true;

      case QuestionType.matching:
        // Implementation for matching would check pairs
        return false; // TODO: Implement matching validation

      default:
        return false;
    }
  }
}
