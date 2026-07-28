import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// Defines the visual type of the badge.
enum SoteriaBadgeType { success, error, warning, info, premium, xp, coin, level }

/// SoteriaBadge is a small status indicator or label.
class SoteriaBadge extends StatelessWidget {
  const SoteriaBadge({
    super.key,
    required this.label,
    this.type = SoteriaBadgeType.info,
    this.icon,
  });

  final String label;
  final SoteriaBadgeType type;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    final onColor = _getOnColor();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SoteriaSpacing.s8,
        vertical: SoteriaSpacing.s4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(SoteriaRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: onColor),
            const SizedBox(width: 4),
          ],
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: onColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  letterSpacing: 1.1,
                ),
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    switch (type) {
      case SoteriaBadgeType.success: return SoteriaColors.success;
      case SoteriaBadgeType.error: return SoteriaColors.error;
      case SoteriaBadgeType.warning: return SoteriaColors.warning;
      case SoteriaBadgeType.info: return SoteriaColors.info;
      case SoteriaBadgeType.premium: return SoteriaColors.primaryLight;
      case SoteriaBadgeType.xp: return SoteriaColors.xpPurple;
      case SoteriaBadgeType.coin: return SoteriaColors.coinGold;
      case SoteriaBadgeType.level: return Colors.black87;
    }
  }

  Color _getOnColor() {
    switch (type) {
      case SoteriaBadgeType.warning:
      case SoteriaBadgeType.coin:
        return Colors.black87;
      default:
        return Colors.white;
    }
  }
}

/// SoteriaTag is a non-interactive label for categorization.
class SoteriaTag extends StatelessWidget {
  const SoteriaTag({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(SoteriaRadius.xs),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
