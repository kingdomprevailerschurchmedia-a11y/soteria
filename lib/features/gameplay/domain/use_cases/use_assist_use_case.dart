import '../entities/assist_type.dart';
import '../entities/assist_usage.dart';
import '../repositories/assist_repository.dart';

class UseAssistUseCase {
  final AssistRepository _repository;

  UseAssistUseCase(this._repository);

  Future<AssistUsage> call(String sessionId, String questionId, AssistType type) async {
    final isValid = await _repository.validateAssist(sessionId, questionId, type);
    if (!isValid) {
      throw Exception('Assist is not available for this session/question.');
    }

    return await _repository.useAssist(sessionId, questionId, type);
  }
}
