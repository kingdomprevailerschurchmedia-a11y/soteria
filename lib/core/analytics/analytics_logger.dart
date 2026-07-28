import '../logging/logger.dart';
import 'analytics_engine.dart';
import 'analytics_event.dart';

/// An analytics engine that simply logs events to the system logger.
class ConsoleAnalyticsEngine implements AnalyticsEngine {
  const ConsoleAnalyticsEngine(this._logger);
  final SoteriaLogger _logger;

  @override
  Future<void> initialize() async {
    _logger.info('Console Analytics Engine Initialized', tag: 'Analytics');
  }

  @override
  Future<void> trackEvent(AnalyticsEvent event) async {
    _logger.info('EVENT: ${event.name} params: ${event.toMap()}', tag: 'Analytics');
  }

  @override
  Future<void> trackScreen(String screenName) async {
    _logger.info('SCREEN: $screenName', tag: 'Analytics');
  }

  @override
  Future<void> setUserId(String? userId) async {
    _logger.info('USER_ID: $userId', tag: 'Analytics');
  }

  @override
  Future<void> setUserProperty(String key, String? value) async {
    _logger.info('USER_PROP: $key = $value', tag: 'Analytics');
  }

  @override
  Future<void> reset() async {
    _logger.info('Analytics Reset', tag: 'Analytics');
  }
}
