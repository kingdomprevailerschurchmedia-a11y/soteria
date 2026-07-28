import 'dart:developer';

/// Utility to track and measure application startup performance.
class StartupMetrics {
  static final Stopwatch _stopwatch = Stopwatch();
  static DateTime? _startTime;
  static Duration? _totalStartupTime;

  /// Marks the absolute beginning of the application process.
  static void markStart() {
    _startTime = DateTime.now();
    _stopwatch.start();
    Timeline.startSync('App Startup');
  }

  /// Marks the point where the application is fully interactive and visible.
  static void markReady() {
    if (!_stopwatch.isRunning) return;
    
    _stopwatch.stop();
    _totalStartupTime = _stopwatch.elapsed;
    Timeline.finishSync();
    
    log('🚀 App Ready in ${_totalStartupTime!.inMilliseconds}ms', name: 'Performance');
  }

  /// Returns the total startup duration if completed.
  static Duration? get totalStartupTime => _totalStartupTime;

  /// Returns the timestamp when the app started.
  static DateTime? get startTime => _startTime;
}
