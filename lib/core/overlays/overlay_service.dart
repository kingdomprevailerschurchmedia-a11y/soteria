import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'overlay_controller.dart';
import 'overlay_state.dart';

class OverlayService {
  OverlayService(this.ref);
  final Ref ref;

  void show(Widget child, {OverlayPriority priority = OverlayPriority.normal}) {
    ref.read(overlayControllerProvider.notifier).enqueue(
      OverlayRequest(id: DateTime.now().toString(), child: child, priority: priority),
    );
  }
}

final overlayServiceProvider = Provider((ref) => OverlayService(ref));
