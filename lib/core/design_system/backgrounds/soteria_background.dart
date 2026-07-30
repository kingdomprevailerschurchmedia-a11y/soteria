import 'package:flutter/material.dart';
import '../colors/soteria_colors.dart';

/// Defines the visual variant for the [SoteriaBackground].
enum SoteriaBackgroundType {
  /// Standard background for Home, Profile, and general screens.
  standard,

  /// Enhanced violet glow for Versus, Tournaments, and Live matches.
  competition,

  /// Gold ambient glow for Achievements, Rewards, and Leaderboards.
  rewards;

  /// Alias for standard background.
  static const SoteriaBackgroundType defaultType = standard;
}

/// A reusable background widget that implements the Soteria v2 premium aesthetic.
/// 
/// It applies the multi-stop wallpaper gradient and adds subtle ambient glows
/// based on the selected [type].
class SoteriaBackground extends StatelessWidget {
  const SoteriaBackground({
    super.key,
    required this.child,
    this.type = SoteriaBackgroundType.standard,
  });

  final Widget child;
  final SoteriaBackgroundType type;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Primary Wallpaper Gradient
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: SoteriaColors.wallpaperGradient,
                stops: const [0.0, 0.33, 0.66, 1.0],
              ),
            ),
          ),
        ),

        // 2. Ambient Glows (Stack of RadialGradients)
        ..._buildAmbientGlows(),

        // 3. Content
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }

  List<Widget> _buildAmbientGlows() {
    switch (type) {
      case SoteriaBackgroundType.competition:
        return [
          _GlowLayer(
            alignment: Alignment.topLeft,
            color: SoteriaColors.glowPurple.withValues(alpha: 0.12),
            radius: 1.2,
          ),
          _GlowLayer(
            alignment: Alignment.bottomRight,
            color: SoteriaColors.glowIndigo.withValues(alpha: 0.08),
            radius: 1.0,
          ),
        ];
      case SoteriaBackgroundType.rewards:
        return [
          _GlowLayer(
            alignment: Alignment.center,
            color: SoteriaColors.glowGold.withValues(alpha: 0.05),
            radius: 1.5,
          ),
          _GlowLayer(
            alignment: Alignment.topLeft,
            color: SoteriaColors.glowPurple.withValues(alpha: 0.05),
            radius: 1.0,
          ),
        ];
      case SoteriaBackgroundType.standard:
      default:
        return [
          _GlowLayer(
            alignment: Alignment.topLeft,
            color: SoteriaColors.glowPurple.withValues(alpha: 0.08),
            radius: 1.0,
          ),
          _GlowLayer(
            alignment: Alignment.bottomRight,
            color: SoteriaColors.glowIndigo.withValues(alpha: 0.06),
            radius: 0.8,
          ),
        ];
    }
  }
}

class _GlowLayer extends StatelessWidget {
  const _GlowLayer({
    required this.alignment,
    required this.color,
    this.radius = 1.0,
  });

  final Alignment alignment;
  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: alignment,
              radius: radius,
              colors: [
                color,
                Colors.transparent,
              ],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
