import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// SoteriaLogger provides a centralized logging interface.
/// It uses the logger package and respects the application's config.
class SoteriaLogger {
  SoteriaLogger({required bool enableLogging})
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 2,
            errorMethodCount: 8,
            lineLength: 120,
            colors: true,
            printEmojis: true,
            dateTimeFormat: DateTimeFormat.dateAndTime,
          ),
          level: enableLogging && kDebugMode ? Level.all : Level.off,
        );

  final Logger _logger;

  void trace(String message) => _logger.t(message);
  void debug(String message) => _logger.d(message);
  void info(String message) => _logger.i(message);
  void warning(String message) => _logger.w(message);
  void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
  void critical(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.f(message, error: error, stackTrace: stackTrace);
}

/// Provider for the [SoteriaLogger].
final loggerProvider = Provider<SoteriaLogger>((ref) {
  // This will be overridden with the correct config during startup.
  return SoteriaLogger(enableLogging: kDebugMode);
});
