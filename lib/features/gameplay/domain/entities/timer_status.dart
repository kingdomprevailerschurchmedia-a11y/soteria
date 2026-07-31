/// Defines the possible states of the Advanced Timer Engine.
enum TimerStatus {
  idle,
  preparing,
  countdown,
  running,
  paused,
  frozen,
  warning,
  critical,
  expired,
  completed,
  cancelled,
  interrupted,
  recovered;

  bool get isRunning => this == TimerStatus.running || this == TimerStatus.warning || this == TimerStatus.critical;
  bool get isPaused => this == TimerStatus.paused || this == TimerStatus.frozen;
  bool get isCritical => this == TimerStatus.critical;
  bool get isExpired => this == TimerStatus.expired;
}
