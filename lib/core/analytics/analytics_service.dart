import 'analytics_engine.dart';
import 'analytics_event.dart';

/// Represents a tracked event with metadata.
class AnalyticsEventEntry {
  const AnalyticsEventEntry({
    required this.event,
    required this.timestamp,
  });

  final AnalyticsEvent event;
  final DateTime timestamp;
}

/// Centralized service to manage analytics engines and event queue.
class AnalyticsService {
  AnalyticsService({
    required this.engines,
    this.maxQueueSize = 100,
  });

  final List<AnalyticsEngine> engines;
  final int maxQueueSize;

  final List<AnalyticsEventEntry> _recentEvents = [];
  final Map<String, String?> _userProperties = {};
  bool _isEnabled = true;

  /// List of recent events for developer dashboard.
  List<AnalyticsEventEntry> get recentEvents => List.unmodifiable(_recentEvents);
  
  /// Current user properties for developer dashboard.
  Map<String, String?> get userProperties => Map.unmodifiable(_userProperties);

  bool get isEnabled => _isEnabled;

  Future<void> initialize() async {
    for (final engine in engines) {
      await engine.initialize();
    }
  }

  void setEnabled(bool enabled) {
    _isEnabled = enabled;
  }

  Future<void> trackEvent(AnalyticsEvent event) async {
    if (!_isEnabled) return;

    final entry = AnalyticsEventEntry(
      event: event,
      timestamp: DateTime.now(),
    );

    // Add to local history
    _recentEvents.insert(0, entry);
    if (_recentEvents.length > maxQueueSize) {
      _recentEvents.removeLast();
    }

    // Distribute to engines
    for (final engine in engines) {
      await engine.trackEvent(event);
    }
  }

  Future<void> trackScreen(String screenName) async {
    if (!_isEnabled) return;
    
    // Also record screen as an event
    await trackEvent(ScreenViewedEvent(screenName));

    for (final engine in engines) {
      await engine.trackScreen(screenName);
    }
  }

  Future<void> setUserId(String? userId) async {
    for (final engine in engines) {
      await engine.setUserId(userId);
    }
  }

  Future<void> setUserProperty(String key, String? value) async {
    _userProperties[key] = value;
    for (final engine in engines) {
      await engine.setUserProperty(key, value);
    }
  }

  Future<void> reset() async {
    _recentEvents.clear();
    _userProperties.clear();
    for (final engine in engines) {
      await engine.reset();
    }
  }
}
