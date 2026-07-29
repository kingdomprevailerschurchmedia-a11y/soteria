import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../../feature_flags/feature_flag.dart';
import '../cards/soteria_card.dart';

/// A card that displays metadata and toggle for a [FeatureFlag].
class FeatureFlagCard extends StatelessWidget {
  const FeatureFlagCard({
    super.key,
    required this.flag,
    required this.onToggle,
    required this.onReset,
  });

  final FeatureFlag flag;
  final VoidCallback onToggle;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final isOverridden = flag.localOverride != null;

    return SoteriaCard(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flag.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      flag.id,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.grey,
                            fontFamily: 'monospace',
                          ),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: flag.isEnabled,
                onChanged: (_) => onToggle(),
                activeTrackColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
          const SizedBox(height: SoteriaSpacing.s8),
          Text(
            flag.description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade700,
                ),
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          Row(
            children: [
              _StatusBadge(
                label: 'Default: ${flag.defaultValue ? 'ON' : 'OFF'}',
                color: Colors.grey.shade200,
                textColor: SoteriaColors.textMuted,
              ),
              if (isOverridden) ...[
                const SizedBox(width: SoteriaSpacing.s8),
                _StatusBadge(
                  label: 'OVERRIDDEN',
                  color: SoteriaColors.warning.withValues(alpha: 0.1),
                  textColor: SoteriaColors.warning,
                ),
                const Spacer(),
                TextButton(
                  onPressed: onReset,
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    foregroundColor: SoteriaColors.error,
                  ),
                  child: const Text('RESET'),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.color,
    required this.textColor,
  });

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(SoteriaRadius.s),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
