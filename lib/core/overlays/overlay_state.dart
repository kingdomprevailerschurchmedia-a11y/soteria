import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'overlay_state.freezed.dart';

enum OverlayPriority { low, normal, high, critical }

@freezed
class OverlayRequest with _$OverlayRequest {
  const factory OverlayRequest({
    required String id,
    required Widget child,
    @Default(OverlayPriority.normal) OverlayPriority priority,
    @Default(true) bool dismissible,
  }) = _OverlayRequest;
}

@freezed
class OverlayState with _$OverlayState {
  const factory OverlayState({
    @Default([]) List<OverlayRequest> queue,
    OverlayRequest? activeOverlay,
  }) = _OverlayState;
}
