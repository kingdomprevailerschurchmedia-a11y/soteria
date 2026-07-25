import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../../design_system/design_system.dart';

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
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool isGlass;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    if (isGlass) {
      return _buildGlass(context);
    }

    return Card(
      elevation: elevation,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SoteriaRadius.l),
        side: borderColor != null
            ? BorderSide(color: borderColor!, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(SoteriaRadius.l),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }

  Widget _buildGlass(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SoteriaRadius.l),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: (color ?? Colors.white).withAlpha(25),
            borderRadius: BorderRadius.circular(SoteriaRadius.l),
            border: Border.all(
              color: (borderColor ?? Colors.white).withAlpha(50),
              width: 1.5,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
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

// --- Previews ---

@Preview(name: 'Card - Default')
Widget cardPreview() {
  return MaterialApp(
    theme: SoteriaTheme.light,
    home: const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(SoteriaSpacing.s16),
          child: SoteriaCard(
            child: Text('This is a Soteria Card'),
          ),
        ),
      ),
    ),
  );
}
