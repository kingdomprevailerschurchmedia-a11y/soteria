import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preview_settings_notifier.g.dart';

/// Represents the possible device frames for component preview.
enum PreviewDevice {
  phone(Size(375, 812), 'Phone'),
  tablet(Size(768, 1024), 'Tablet'),
  web(Size(1200, 900), 'Web');

  const PreviewDevice(this.size, this.label);
  final Size size;
  final String label;
}

/// State for the preview environment settings.
class PreviewSettings {
  const PreviewSettings({
    this.device = PreviewDevice.phone,
    this.isDarkMode = false,
    this.textScale = 1.0,
    this.isLandscape = false,
    this.isRTL = false,
  });

  final PreviewDevice device;
  final bool isDarkMode;
  final double textScale;
  final bool isLandscape;
  final bool isRTL;

  PreviewSettings copyWith({
    PreviewDevice? device,
    bool? isDarkMode,
    double? textScale,
    bool? isLandscape,
    bool? isRTL,
  }) {
    return PreviewSettings(
      device: device ?? this.device,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      textScale: textScale ?? this.textScale,
      isLandscape: isLandscape ?? this.isLandscape,
      isRTL: isRTL ?? this.isRTL,
    );
  }
}

/// Notifier that manages the preview environment state.
@riverpod
class PreviewSettingsNotifier extends _$PreviewSettingsNotifier {
  @override
  PreviewSettings build() => const PreviewSettings();

  void setDevice(PreviewDevice device) => state = state.copyWith(device: device);
  void toggleDarkMode() => state = state.copyWith(isDarkMode: !state.isDarkMode);
  void setTextScale(double scale) => state = state.copyWith(textScale: scale);
  void toggleOrientation() => state = state.copyWith(isLandscape: !state.isLandscape);
  void toggleRTL() => state = state.copyWith(isRTL: !state.isRTL);
}
