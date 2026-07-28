import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Manages accessibility settings and state for the application.
class AccessibilityService {
  bool _isHighContrastEnabled = false;
  bool _isReducedMotionEnabled = false;
  TextScaler _textScaler = TextScaler.noScaling;

  bool get isHighContrastEnabled => _isHighContrastEnabled;
  bool get isReducedMotionEnabled => _isReducedMotionEnabled;
  TextScaler get textScaler => _textScaler;

  /// Updates internal state based on system or user preference.
  void updateFromMediaQuery(MediaQueryData data) {
    _isHighContrastEnabled = data.highContrast;
    _isReducedMotionEnabled = data.disableAnimations;
    _textScaler = data.textScaler;
  }

  /// Forces the system to announce a message via Screen Reader.
  void announce(String message, {TextDirection textDirection = TextDirection.ltr}) {
    final view = PlatformDispatcher.instance.views.first;
    SemanticsService.sendAnnouncement(view, message, textDirection);
  }
}
