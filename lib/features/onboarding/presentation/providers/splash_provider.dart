import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

/// Notifier that manages the duration of the premium splash experience.
@riverpod
class SplashState extends _$SplashState {
  @override
  bool build() {
    _startTimer();
    return false;
  }

  void _startTimer() {
    // Total duration of splash animation is 3.5s + small buffer
    Future.delayed(const Duration(milliseconds: 3800), () {
      if (state == false) {
        state = true;
      }
    });
  }

  /// Manually mark the splash as completed.
  void complete() {
    state = true;
  }
}
