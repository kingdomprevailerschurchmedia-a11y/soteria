import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaCard is the standard container component for grouped content.
/// It implements the v2 premium surface styling: Surface Level 2 + Premium Borders.
class SoteriaCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Color? borderColor;
  final bool isGlass;

  const SoteriaCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(SoteriaSpacing.s16),
    this.onTap,
    this.borderColor,
    this.isGlass = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(SoteriaRadius.surface),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: SoteriaColors.surfaceL2,
          borderRadius: BorderRadius.circular(SoteriaRadius.surface),
          border: Border.fromBorderSide(borderColor != null 
            ? BorderSide(color: borderColor!, width: SoteriaBorders.thin) 
            : SoteriaBorders.premium),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
