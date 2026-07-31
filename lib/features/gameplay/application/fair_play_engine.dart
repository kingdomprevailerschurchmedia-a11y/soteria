import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/validation_result.dart';
import '../domain/entities/audit_log.dart';
import '../presentation/providers/gameplay_providers.dart';

part 'fair_play_engine.g.dart';

@riverpod
class FairPlayEngine extends _$FairPlayEngine {
  @override
  void build() {}

  Future<ValidationResult> validate({
    required String sessionId,
    required String questionId,
    required List<String> selectedOptionIds,
    required double responseTimeSeconds,
  }) async {
    final repo = ref.read(fairPlayRepositoryProvider);

    // 1. Log Attempt
    await repo.logAuditEntry(AuditEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      sessionId: sessionId,
      type: 'validation',
      description: 'Answer submitted for question $questionId',
      timestamp: DateTime.now(),
      metadata: {'responseTime': responseTimeSeconds, 'options': selectedOptionIds},
    ));

    // 2. Integrity Pre-checks (e.g. was question already answered?)
    // This would use the GameSessionController state

    // 3. Perform Validation
    final result = await repo.validateAnswer(
      sessionId: sessionId,
      questionId: questionId,
      selectedOptionIds: selectedOptionIds,
      responseTimeSeconds: responseTimeSeconds,
      integrityContext: {
        'platform': 'mock', // In real app, use DeviceInfo
        'version': '1.0.0',
      },
    );

    // 4. Handle results/flags
    if (result.integrityScore < 0.5) {
      await repo.reportSuspiciousActivity(SuspiciousActivity(
        id: result.id,
        sessionId: sessionId,
        reason: 'Low integrity score: ${result.flags.join(', ')}',
        severity: 1.0 - result.integrityScore,
        timestamp: DateTime.now(),
      ));
    }

    return result;
  }
}
