import 'log_entry.dart';
import 'log_level.dart';

/// Handles formatting log entries for console output.
class LogFormatter {
  static String format(LogEntry entry) {
    final buffer = StringBuffer();
    
    // Add Emoji and Severity
    buffer.write(entry.severity.emoji);
    buffer.write(' ');
    
    // Add Timestamp (Short format)
    final ts = entry.timestamp;
    buffer.write('${ts.hour.toString().padLeft(2, '0')}:');
    buffer.write('${ts.minute.toString().padLeft(2, '0')}:');
    buffer.write('${ts.second.toString().padLeft(2, '0')} ');

    // Add Tag if present
    if (entry.tag != null) {
      buffer.write('[${entry.tag}] ');
    }

    // Add Category if present
    if (entry.category != null) {
      buffer.write('<${entry.category}> ');
    }

    // Add Message
    buffer.write(entry.message);

    // Add Error and StackTrace if present
    if (entry.error != null) {
      buffer.write('\nError: ${entry.error}');
    }

    if (entry.stackTrace != null) {
      buffer.write('\nStackTrace: ${entry.stackTrace}');
    }

    return buffer.toString();
  }
}
