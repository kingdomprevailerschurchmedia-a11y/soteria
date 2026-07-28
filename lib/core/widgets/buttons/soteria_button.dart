import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../../utils/app_animations.dart';
import '../../utils/quality/quality_checker.dart';

/// Defines the visual size for [SoteriaButton].
enum SoteriaButtonSize { small, medium, large }

/// Defines the visual types available for [SoteriaButton].
enum SoteriaButtonType { primary, secondary, outlined, text, destructive, success, reward }

/// SoteriaButton is the standard button component used throughout the app.
/// It supports various sizes, types, and states (loading, disabled).
class SoteriaButton extends StatelessWidget {
  const SoteriaButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.type = SoteriaButtonType.primary,
    this.size = SoteriaButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.fullWidth = true,
  });

  final VoidCallback? onPressed;
  final String label;
  final SoteriaButtonType type;
  final SoteriaButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    QualityChecker.checkSemantics(label, component: 'SoteriaButton');

    return AppAnimations.bounceClick(
      onTap: onPressed ?? () {},
      isDisabled: isDisabled || isLoading || onPressed == null,
      child: SizedBox(
        width: fullWidth ? double.infinity : null,
        height: _getHeight(),
        child: DecoratedBox(
          decoration: _getDecoration(context),
          child: Center(
            child: Padding(
              padding: _getPadding(),
              child: _buildContent(context),
            ),
          ),
        ),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case SoteriaButtonSize.small: return 36.0;
      case SoteriaButtonSize.medium: return 48.0;
      case SoteriaButtonSize.large: return 56.0;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case SoteriaButtonSize.small: return const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s12);
      case SoteriaButtonSize.medium: return const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s16);
      case SoteriaButtonSize.large: return const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s24);
    }
  }

  Decoration _getDecoration(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(SoteriaRadius.m);

    if (isDisabled) {
      return BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: borderRadius,
      );
    }

    switch (type) {
      case SoteriaButtonType.primary:
        return BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: borderRadius,
        );
      case SoteriaButtonType.secondary:
        return BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: borderRadius,
        );
      case SoteriaButtonType.outlined:
        return BoxDecoration(
          border: Border.all(color: theme.colorScheme.primary, width: 2),
          borderRadius: borderRadius,
        );
      case SoteriaButtonType.text:
        return const BoxDecoration();
      case SoteriaButtonType.destructive:
        return BoxDecoration(
          color: SoteriaColors.error,
          borderRadius: borderRadius,
        );
      case SoteriaButtonType.success:
        return BoxDecoration(
          color: SoteriaColors.success,
          borderRadius: borderRadius,
        );
      case SoteriaButtonType.reward:
        return BoxDecoration(
          gradient: const LinearGradient(
            colors: [SoteriaColors.coinGold, Color(0xFFFFA500)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        );
    }
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(_getContentColor(context)),
        ),
      );
    }

    final color = _getContentColor(context);
    final style = _getTextStyle(context).copyWith(color: color);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: _getIconSize(), color: color),
          const SizedBox(width: SoteriaSpacing.s8),
        ],
        Text(label, style: style),
      ],
    );
  }

  double _getIconSize() {
    switch (size) {
      case SoteriaButtonSize.small: return 16.0;
      case SoteriaButtonSize.medium: return 20.0;
      case SoteriaButtonSize.large: return 24.0;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    switch (size) {
      case SoteriaButtonSize.small: return theme.labelMedium!;
      case SoteriaButtonSize.medium: return theme.labelLarge!.copyWith(fontWeight: FontWeight.bold);
      case SoteriaButtonSize.large: return theme.titleMedium!.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.1);
    }
  }

  Color _getContentColor(BuildContext context) {
    final theme = Theme.of(context);
    if (isDisabled) return theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.38);

    switch (type) {
      case SoteriaButtonType.primary: return theme.colorScheme.onPrimary;
      case SoteriaButtonType.secondary: return theme.colorScheme.onSecondaryContainer;
      case SoteriaButtonType.outlined: return theme.colorScheme.primary;
      case SoteriaButtonType.text: return theme.colorScheme.primary;
      case SoteriaButtonType.destructive: return SoteriaColors.onError;
      case SoteriaButtonType.success: return SoteriaColors.onSuccess;
      case SoteriaButtonType.reward: return Colors.black87;
    }
  }
}
