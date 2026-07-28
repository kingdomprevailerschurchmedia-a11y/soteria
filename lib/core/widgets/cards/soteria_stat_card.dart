import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'soteria_card.dart';

/// StatisticCard displays intelligence metrics with an icon and optional trend.
class SoteriaStatCard extends StatelessWidget {
  const SoteriaStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.trend,
    this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final String? trend;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      onTap: onTap,
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: SoteriaColors.info, size: SoteriaIcons.m),
          const Spacer(),
          Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: SoteriaSpacing.s4),
          Row(
            children: [
              Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey)),
              if (trend != null) ...[
                const Spacer(),
                Text(
                  trend!,
                  style: const TextStyle(color: SoteriaColors.success, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
