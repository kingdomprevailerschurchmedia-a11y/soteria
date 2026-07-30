import 'dart:math';
import '../../domain/entities/validation_result.dart';
import '../../domain/entities/audit_log.dart';
import '../../domain/repositories/fair_play_repository.dart';
import '../../domain/repositories/question_repository.dart';

class MockFairPlayRepository implements FairPlayRepository {
  final QuestionRepository _questionRepository;
  final List<AuditEntry> _auditLogs = [];

  MockFairPlayRepository(this._questionRepository);

  @override
  Future<ValidationResult> validateAnswer({
    required String sessionId,
    required String questionId,
    required List<String> selectedOptionIds,
    required double responseTimeSeconds,
    required Map<String, dynamic> integrityContext,
  }) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final question = await _questionRepository.getQuestionById(questionId);
    if (question == null) throw Exception('Question not found');

    // Simple local validation
    final correctIds = question.options.where((o) => o.isCorrect).map((o) => o.id).toList();
    final isCorrect = selectedOptionIds.length == correctIds.length &&
        selectedOptionIds.every((id) => correctIds.contains(id));

    // Integrity heuristics
    double integrityScore = 1.0;
    List<String> flags = [];

    if (responseTimeSeconds < 1.0) {
      integrityScore = 0.3;
      flags.add('IMPOSSIBLE_SPEED');
    }

    return ValidationResult(
      id: Random().nextInt(100000).toString(),
      isValid: true,
      isCorrect: isCorrect,
      integrityScore: integrityScore,
      flags: flags,
      validatedAt: DateTime.now(),
      serverSignature: 'mock_sig_${Random().nextInt(1000)}',
    );
  }

  @override
  Future<void> logAuditEntry(AuditEntry entry) async {
    _auditLogs.add(entry);
  }

  @override
  Future<void> reportSuspiciousActivity(SuspiciousActivity activity) async {
    // Log to audit as well
    logAuditEntry(AuditEntry(
      id: 'susp_${activity.id}',
      sessionId: activity.sessionId,
      type: 'integrity',
      description: 'SUSPICIOUS: ${activity.reason}',
      timestamp: activity.timestamp,
      isSuspicious: true,
    ));
  }

  @override
  Future<List<AuditEntry>> getSessionAuditLogs(String sessionId) async {
    return _auditLogs.where((e) => e.sessionId == sessionId).toList();
  }
}
