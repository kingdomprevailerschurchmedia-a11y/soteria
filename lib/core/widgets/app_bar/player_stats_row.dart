import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

class PlayerStatsRow extends StatelessWidget {
  const PlayerStatsRow({
    super.key,
    required this.coins,
    required this.xp,
    required this.level,
  });

  final int coins;
  final int xp;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _StatBadge(
          icon: SoteriaIcons.coin,
          value: coins.toString(),
          color: SoteriaColors.coinGold,
          label: 'Coins',
        ),
        const SizedBox(width: SoteriaSpacing.s8),
        _StatBadge(
          icon: SoteriaIcons.streak, // Using streak icon for XP/energy vibe
          value: xp.toString(),
          color: SoteriaColors.xpPurple,
          label: 'XP',
        ),
        const SizedBox(width: SoteriaSpacing.s8),
        _LevelBadge(level: level),
      ],
    );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({
    required this.icon,
    required this.value,
    required this.color,
    required this.label,
  });

  final IconData icon;
  final String value;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$value $label',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(SoteriaRadius.s),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LevelBadge extends StatelessWidget {
  const _LevelBadge({required this.level});
  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).primaryColor, SoteriaColors.xpPurple],
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(
        level.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
