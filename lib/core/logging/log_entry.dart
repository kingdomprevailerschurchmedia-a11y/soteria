import 'log_level.dart';

/// Represents a single log entry in the system.
class LogEntry {
  LogEntry({
    required this.message,
    required this.severity,
    DateTime? timestamp,
    this.tag,
    this.category,
    this.error,
    this.stackTrace,
  }) : timestamp = timestamp ?? DateTime.now();

  final String message;
  final LogSeverity severity;
  final DateTime timestamp;
  final String? tag;
  final String? category;
  final Object? error;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return '${severity.emoji} [$timestamp] ${tag != null ? '($tag) ' : ''}$message';
  }
}
