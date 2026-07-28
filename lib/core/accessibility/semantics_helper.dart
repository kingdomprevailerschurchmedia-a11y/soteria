import 'package:flutter/material.dart';

/// Helper class to provide consistent semantics for custom components.
class SemanticsHelper {
  /// Wraps a widget with standard button semantics.
  static Widget button({
    required Widget child,
    required String label,
    String? hint,
    bool enabled = true,
    VoidCallback? onTap,
  }) {
    return Semantics(
      button: true,
      label: label,
      hint: hint,
      enabled: enabled,
      onTap: onTap,
      child: child,
    );
  }

  /// Wraps a widget with heading semantics for screen readers.
  static Widget heading({
    required Widget child,
    int level = 1,
  }) {
    return Semantics(
      header: true,
      child: child,
    );
  }

  /// Provides image semantics with meaningful descriptions.
  static Widget image({
    required Widget child,
    required String altText,
  }) {
    return Semantics(
      image: true,
      label: altText,
      child: child,
    );
  }
}
