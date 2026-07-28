import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../../utils/app_animations.dart';

/// SoteriaIconButton is a circular button that displays an icon.
class SoteriaIconButton extends StatelessWidget {
  const SoteriaIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.size = SoteriaIcons.m,
    this.isDisabled = false,
    this.tooltip,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final double size;
  final bool isDisabled;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return AppAnimations.bounceClick(
      onTap: onPressed ?? () {},
      isDisabled: isDisabled || onPressed == null,
      child: Tooltip(
        message: tooltip ?? '',
        child: Container(
          padding: const EdgeInsets.all(SoteriaSpacing.s8),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: size,
            color: isDisabled 
                ? Theme.of(context).disabledColor 
                : (color ?? Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}

/// SoteriaFab is a high-polish Floating Action Button.
class SoteriaFab extends StatelessWidget {
  const SoteriaFab({
    super.key,
    required this.onPressed,
    required this.icon,
    this.label,
    this.backgroundColor,
    this.foregroundColor,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String? label;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    if (label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label!.toUpperCase()),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
      );
    }
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      foregroundColor: foregroundColor ?? Colors.white,
      child: Icon(icon),
    );
  }
}
