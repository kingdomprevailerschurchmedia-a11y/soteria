import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';
import 'log_entry.dart';
import 'log_level.dart';
import 'log_formatter.dart';

/// Central logging class for Soteria.
/// Manages console output and an in-memory buffer for developer tools.
class SoteriaLogger {
  SoteriaLogger({
    this.maxBufferSize = 1000,
    this.enableConsole = kDebugMode,
  });

  final int maxBufferSize;
  final bool enableConsole;

  final List<LogEntry> _buffer = [];
  
  /// Get all logs in the current buffer.
  List<LogEntry> get logs => List.unmodifiable(_buffer);

  void debug(String message, {String? tag, String? category}) {
    _log(LogSeverity.debug, message, tag: tag, category: category);
  }

  void info(String message, {String? tag, String? category}) {
    _log(LogSeverity.info, message, tag: tag, category: category);
  }

  void warning(String message, {String? tag, String? category}) {
    _log(LogSeverity.warning, message, tag: tag, category: category);
  }

  void error(String message, {Object? error, StackTrace? stackTrace, String? tag, String? category}) {
    _log(LogSeverity.error, message, error: error, stackTrace: stackTrace, tag: tag, category: category);
  }

  void critical(String message, {Object? error, StackTrace? stackTrace, String? tag, String? category}) {
    _log(LogSeverity.critical, message, error: error, stackTrace: stackTrace, tag: tag, category: category);
  }

  void _log(
    LogSeverity severity,
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String? tag,
    String? category,
  }) {
    final entry = LogEntry(
      message: message,
      severity: severity,
      error: error,
      stackTrace: stackTrace,
      tag: tag,
      category: category,
    );

    // Update in-memory buffer
    _buffer.add(entry);
    if (_buffer.length > maxBufferSize) {
      _buffer.removeAt(0);
    }

    // Console output
    if (enableConsole) {
      final formatted = LogFormatter.format(entry);
      // Use dart:developer log for better integration with IDEs
      dev.log(
        formatted,
        name: tag ?? 'Soteria',
        level: _severityToLogLevel(severity),
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  int _severityToLogLevel(LogSeverity severity) {
    switch (severity) {
      case LogSeverity.debug: return 500;
      case LogSeverity.info: return 800;
      case LogSeverity.warning: return 900;
      case LogSeverity.error: return 1000;
      case LogSeverity.critical: return 2000;
    }
  }

  void clear() {
    _buffer.clear();
  }
}
