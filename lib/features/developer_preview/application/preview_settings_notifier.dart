import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preview_settings_notifier.g.dart';

/// Represents the possible device frames for component preview.
enum PreviewDevice {
  smallPhone(Size(320, 568), 'Small Phone'),
  largePhone(Size(428, 926), 'Large Phone'),
  tablet(Size(834, 1194), 'Tablet'),
  foldable(Size(673, 841), 'Foldable'),
  desktop(Size(1440, 900), 'Desktop'),
  web(Size(1200, 800), 'Web');

  const PreviewDevice(this.size, this.label);
  final Size size;
  final String label;
}

/// State for the preview environment settings.
class PreviewSettings {
  const PreviewSettings({
    this.device = PreviewDevice.largePhone,
    this.textScale = 1.0,
    this.isLandscape = false,
    this.isRTL = false,
    this.showLayoutBounds = false,
    this.showSemantics = false,
    this.showSafeAreas = false,
    this.reducedMotion = false,
    this.showInspector = false,
    // Live Controls
    this.borderRadiusScale = 1.0,
    this.spacingScale = 1.0,
    this.glowOpacity = 0.5,
  });

  final PreviewDevice device;
  final double textScale;
  final bool isLandscape;
  final bool isRTL;
  final bool showLayoutBounds;
  final bool showSemantics;
  final bool showSafeAreas;
  final bool reducedMotion;
  final bool showInspector;

  // Live Controls (factors)
  final double borderRadiusScale;
  final double spacingScale;
  final double glowOpacity;

  PreviewSettings copyWith({
    PreviewDevice? device,
    double? textScale,
    bool? isLandscape,
    bool? isRTL,
    bool? showLayoutBounds,
    bool? showSemantics,
    bool? showSafeAreas,
    bool? reducedMotion,
    bool? showInspector,
    double? borderRadiusScale,
    double? spacingScale,
    double? glowOpacity,
  }) {
    return PreviewSettings(
      device: device ?? this.device,
      textScale: textScale ?? this.textScale,
      isLandscape: isLandscape ?? this.isLandscape,
      isRTL: isRTL ?? this.isRTL,
      showLayoutBounds: showLayoutBounds ?? this.showLayoutBounds,
      showSemantics: showSemantics ?? this.showSemantics,
      showSafeAreas: showSafeAreas ?? this.showSafeAreas,
      reducedMotion: reducedMotion ?? this.reducedMotion,
      showInspector: showInspector ?? this.showInspector,
      borderRadiusScale: borderRadiusScale ?? this.borderRadiusScale,
      spacingScale: spacingScale ?? this.spacingScale,
      glowOpacity: glowOpacity ?? this.glowOpacity,
    );
  }
}

/// Notifier that manages the preview environment state.
@riverpod
class PreviewSettingsNotifier extends _$PreviewSettingsNotifier {
  @override
  PreviewSettings build() => const PreviewSettings();

  void setDevice(PreviewDevice device) => state = state.copyWith(device: device);
  void setTextScale(double scale) => state = state.copyWith(textScale: scale);
  void toggleOrientation() => state = state.copyWith(isLandscape: !state.isLandscape);
  void toggleRTL() => state = state.copyWith(isRTL: !state.isRTL);

  void toggleLayoutBounds() => state = state.copyWith(showLayoutBounds: !state.showLayoutBounds);
  void toggleSemantics() => state = state.copyWith(showSemantics: !state.showSemantics);
  void toggleSafeAreas() => state = state.copyWith(showSafeAreas: !state.showSafeAreas);
  void toggleReducedMotion() => state = state.copyWith(reducedMotion: !state.reducedMotion);
  void toggleInspector() => state = state.copyWith(showInspector: !state.showInspector);

  void setBorderRadiusScale(double value) => state = state.copyWith(borderRadiusScale: value);
  void setSpacingScale(double value) => state = state.copyWith(spacingScale: value);
  void setGlowOpacity(double value) => state = state.copyWith(glowOpacity: value);
}
