import 'package:flutter/material.dart';

/// Represents a single log entry for the internal Log Viewer.
class LogEntry {
  const LogEntry({
    required this.timestamp,
    required this.message,
    required this.level,
    this.error,
    this.stackTrace,
  });

  final DateTime timestamp;
  final String message;
  final LogLevel level;
  final dynamic error;
  final StackTrace? stackTrace;
}

/// Defines the severity levels for log entries.
enum LogLevel {
  debug(Colors.blue, Icons.bug_report_outlined),
  info(Colors.green, Icons.info_outline),
  warning(Colors.orange, Icons.warning_amber_outlined),
  error(Colors.red, Icons.error_outline),
  critical(Colors.purple, Icons.new_releases_outlined);

  const LogLevel(this.color, this.icon);
  final Color color;
  final IconData icon;
}
