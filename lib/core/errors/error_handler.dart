import 'dart:async';
import 'package:flutter/foundation.dart';
import '../logging/logger.dart';

/// Centralized error handler to capture and log all application errors.
class ErrorHandler {
  ErrorHandler({required this.logger});

  final SoteriaLogger logger;

  /// Initializes the global error listeners.
  void init() {
    // 1. Capture Flutter Framework errors
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      logger.critical(
        'FLUTTER ERROR: ${details.exceptionAsString()}',
        error: details.exception,
        stackTrace: details.stack,
        tag: 'Framework',
      );
    };

    // 2. Capture errors from Platform (e.g., Android/iOS host errors)
    PlatformDispatcher.instance.onError = (error, stack) {
      logger.critical(
        'PLATFORM DISPATCHER ERROR: $error',
        error: error,
        stackTrace: stack,
        tag: 'Platform',
      );
      return true; // Error is handled
    };

    logger.info('Global Error Handler initialized', tag: 'System');
  }

  /// Wraps an asynchronous operation with error logging.
  Future<void> runZoned(FutureOr<void> Function() body) async {
    await runZonedGuarded(
      () async {
        await body();
      },
      (error, stack) {
        logger.error(
          'UNHANDLED ASYNC ERROR: $error',
          error: error,
          stackTrace: stack,
          tag: 'AsyncZone',
        );
      },
    );
  }
}
