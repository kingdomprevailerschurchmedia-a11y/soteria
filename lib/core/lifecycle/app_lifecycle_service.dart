import 'package:flutter/widgets.dart';
import '../logging/logger.dart';

/// Centralized service to handle application lifecycle changes.
class AppLifecycleService with WidgetsBindingObserver {
  AppLifecycleService({required this.logger});

  final SoteriaLogger logger;
  AppLifecycleState _lastState = AppLifecycleState.resumed;

  AppLifecycleState get lastState => _lastState;

  /// Initializes the observer.
  void init() {
    WidgetsBinding.instance.addObserver(this);
    logger.info('App Lifecycle Service Initialized', tag: 'System');
  }

  /// Disposes the observer.
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _lastState = state;
    logger.info('Lifecycle state changed to: ${state.name.toUpperCase()}', tag: 'Lifecycle');

    switch (state) {
      case AppLifecycleState.resumed:
        _onForeground();
        break;
      case AppLifecycleState.paused:
        _onBackground();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  void didHaveMemoryPressure() {
    logger.warning('Memory Pressure detected!', tag: 'System');
  }

  void _onForeground() {
    // Handle app returning to foreground
  }

  void _onBackground() {
    // Handle app going to background
  }
}
