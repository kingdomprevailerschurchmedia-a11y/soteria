import '../entities/validation_result.dart';
import '../entities/audit_log.dart';

abstract class FairPlayRepository {
  /// Submits an answer for validation (can be local or remote).
  Future<ValidationResult> validateAnswer({
    required String sessionId,
    required String questionId,
    required List<String> selectedOptionIds,
    required double responseTimeSeconds,
    required Map<String, dynamic> integrityContext,
  });

  /// Logs an audit entry.
  Future<void> logAuditEntry(AuditEntry entry);

  /// Reports suspicious activity.
  Future<void> reportSuspiciousActivity(SuspiciousActivity activity);

  /// Fetches audit logs for a session.
  Future<List<AuditEntry>> getSessionAuditLogs(String sessionId);
}
