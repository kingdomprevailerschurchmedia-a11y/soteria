/// Defines the severity levels for application logs.
enum LogSeverity {
  /// Information useful for debugging.
  debug,

  /// General application progress.
  info,

  /// Potential issues that don't stop the app.
  warning,

  /// Errors that occur but are handled.
  error,

  /// Critical failures that require immediate attention.
  critical,
}

extension LogSeverityExtension on LogSeverity {
  String get label => name.toUpperCase();

  String get emoji {
    switch (this) {
      case LogSeverity.debug: return '🔍';
      case LogSeverity.info: return 'ℹ️';
      case LogSeverity.warning: return '⚠️';
      case LogSeverity.error: return '❌';
      case LogSeverity.critical: return '🚨';
    }
  }
}
