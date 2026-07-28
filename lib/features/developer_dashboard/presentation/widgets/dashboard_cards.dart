import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/cards/soteria_card.dart';

/// A card that displays a title and a list of key-value pairs for diagnostics.
class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.data,
    this.icon,
  });

  final String title;
  final Map<String, String> data;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: Theme.of(context).primaryColor),
                const SizedBox(width: SoteriaSpacing.s8),
              ],
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
              ),
            ],
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          ...data.entries.map((entry) => Padding(
                padding: const EdgeInsets.only(bottom: SoteriaSpacing.s8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    Text(
                      entry.value,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

/// A card that triggers a quick action for developers.
class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
    this.color,
  });

  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      onTap: onTap,
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      color: color?.withValues(alpha: 0.1),
      borderColor: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: color ?? Theme.of(context).primaryColor),
          const SizedBox(height: SoteriaSpacing.s12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
