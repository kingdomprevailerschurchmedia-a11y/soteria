import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// Displays player avatar with status.
class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar({super.key, required this.imageUrl, this.isOnline = true});
  final String imageUrl;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(imageUrl),
        ),
        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: SoteriaColors.success,
                shape: BoxShape.circle,
                border: Border.all(color: SoteriaColors.background, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}

/// Badge component for XP.
class XPBadge extends StatelessWidget {
  const XPBadge({super.key, required this.xp});
  final int xp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s8, vertical: SoteriaSpacing.s4),
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceContainer,
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
      ),
      child: Row(
        children: [
          const Icon(Icons.bolt, size: 14, color: SoteriaColors.primary),
          const SizedBox(width: SoteriaSpacing.s4),
          Text(xp.toString(), style: SoteriaTypography.labelSmall),
        ],
      ),
    );
  }
}

/// Badge component for Coins.
class CoinBadge extends StatelessWidget {
  const CoinBadge({super.key, required this.coins});
  final int coins;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s8, vertical: SoteriaSpacing.s4),
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceContainer,
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
      ),
      child: Row(
        children: [
          const Icon(Icons.currency_bitcoin, size: 14, color: SoteriaColors.warning),
          const SizedBox(width: SoteriaSpacing.s4),
          Text(coins.toString(), style: SoteriaTypography.labelSmall),
        ],
      ),
    );
  }
}
