import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'overlay_state.dart';

part 'overlay_controller.g.dart';

@Riverpod(keepAlive: true)
class OverlayController extends _$OverlayController {
  @override
  OverlayState build() => const OverlayState();

  void enqueue(OverlayRequest request) {
    final newQueue = List<OverlayRequest>.from(state.queue)..add(request);
    // Sort by priority logic here if needed
    state = state.copyWith(queue: newQueue);
    if (state.activeOverlay == null) {
      _showNext();
    }
  }

  void _showNext() {
    if (state.queue.isNotEmpty) {
      final next = state.queue.first;
      state = state.copyWith(activeOverlay: next, queue: state.queue.sublist(1));
    }
  }

  void dismiss() {
    state = state.copyWith(activeOverlay: null);
    _showNext();
  }
}
