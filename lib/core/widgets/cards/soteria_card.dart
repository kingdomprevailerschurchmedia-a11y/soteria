import 'dart:ui';
import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../../utils/quality/quality_checker.dart';

/// SoteriaCard is a premium container supporting Glassmorphism and specific states.
class SoteriaCard extends StatelessWidget {
  const SoteriaCard({
    super.key,
    required this.child,
    this.onTap,
    this.isGlass = false,
    this.color,
    this.borderColor,
    this.padding = const EdgeInsets.all(SoteriaSpacing.s24),
    this.elevation = SoteriaElevation.level1,
    this.borderRadius,
    this.isLoading = false,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool isGlass;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final double? borderRadius;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      QualityChecker.checkSemantics('Card Action', component: 'SoteriaCard');
    }

    if (isGlass) {
      return _buildGlass(context);
    }

    final radius = BorderRadius.circular(borderRadius ?? SoteriaRadius.l);

    return Card(
      elevation: elevation,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: borderColor != null
            ? BorderSide(color: borderColor!, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Stack(
          children: [
            Padding(
              padding: padding,
              child: child,
            ),
            if (isLoading)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.5),
                    borderRadius: radius,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlass(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? SoteriaRadius.l);
    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: (color ?? Colors.white).withValues(alpha: 0.1),
            borderRadius: radius,
            border: Border.all(
              color: (borderColor ?? Colors.white).withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: radius,
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
