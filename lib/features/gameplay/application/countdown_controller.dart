import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'countdown_controller.g.dart';

@riverpod
class CountdownController extends _$CountdownController {
  Timer? _timer;

  @override
  int build() {
    ref.onDispose(() => _timer?.cancel());
    return 0;
  }

  void start(int seconds, VoidCallback onComplete) {
    state = seconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 1) {
        state--;
      } else {
        state = 0;
        _timer?.cancel();
        onComplete();
      }
    });
  }

  void cancel() {
    _timer?.cancel();
    state = 0;
  }
}
