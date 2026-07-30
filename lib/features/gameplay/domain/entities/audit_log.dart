import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log.freezed.dart';
part 'audit_log.g.dart';

@freezed
class AuditEntry with _$AuditEntry {
  const factory AuditEntry({
    required String id,
    required String sessionId,
    required String type, // 'validation', 'integrity', 'fairplay'
    required String description,
    required DateTime timestamp,
    Map<String, dynamic>? metadata,
    @Default(false) bool isSuspicious,
  }) = _AuditEntry;

  factory AuditEntry.fromJson(Map<String, dynamic> json) => _$AuditEntryFromJson(json);
}

@freezed
class SuspiciousActivity with _$SuspiciousActivity {
  const factory SuspiciousActivity({
    required String id,
    required String sessionId,
    required String reason,
    required double severity, // 0.0 to 1.0
    required DateTime timestamp,
    String? evidence,
  }) = _SuspiciousActivity;

  factory SuspiciousActivity.fromJson(Map<String, dynamic> json) => _$SuspiciousActivityFromJson(json);
}
