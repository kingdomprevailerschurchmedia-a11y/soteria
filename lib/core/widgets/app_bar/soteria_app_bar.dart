import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'player_components.dart';
import 'action_components.dart';

/// SoteriaAppBar is a premium, reusable app bar designed for the Dark Theme.
class SoteriaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SoteriaAppBar({
    super.key,
    this.title,
    this.showStats = true,
  });

  final String? title;
  final bool showStats;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: SoteriaColors.navigation,
      elevation: 0,
      centerTitle: true,
      title: title != null ? Text(title!, style: SoteriaTypography.titleLarge) : null,
      actions: [
        if (showStats) ...[
          const XPBadge(xp: 1250),
          const SizedBox(width: SoteriaSpacing.s8),
          const CoinBadge(coins: 4500),
          const SizedBox(width: SoteriaSpacing.s16),
        ],
        const SearchAction(),
        const NotificationBadge(count: 3),
        const SizedBox(width: SoteriaSpacing.s8),
        const Padding(
          padding: EdgeInsets.only(right: SoteriaSpacing.s16),
          child: PlayerAvatar(imageUrl: 'https://placehold.co/40x40.png'),
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(SoteriaRadius.surface),
        ),
      ),
    );
  }
}
