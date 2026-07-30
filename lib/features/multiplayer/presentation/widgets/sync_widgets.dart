import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../application/sync_providers.dart';
import '../models/sync_models.dart';

class ConnectionQualityIndicator extends ConsumerWidget {
  const ConnectionQualityIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(latencyNotifierProvider);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceL2.withOpacity(0.5),
        borderRadius: BorderRadius.circular(SoteriaRadius.button),
        border: Border.all(color: SoteriaColors.premiumBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSignalIcon(metrics.pingMs),
          const SizedBox(width: 8),
          Text(
            '${metrics.pingMs}ms',
            style: SoteriaTypography.labelSmall.copyWith(
              color: _getColorForPing(metrics.pingMs),
              fontWeight: FontWeight.bold,
            ),
          ),
          if (metrics.packetLossRate > 0) ...[
            const SizedBox(width: 8),
            const Icon(Icons.warning_amber_rounded, color: SoteriaColors.error, size: 14),
          ],
        ],
      ),
    );
  }

  Widget _buildSignalIcon(int ping) {
    final color = _getColorForPing(ping);
    return Row(
      children: List.generate(3, (index) {
        final isActive = (ping < 100 && index < 3) || 
                         (ping < 200 && index < 2) || 
                         (ping >= 200 && index < 1);
        return Container(
          width: 3,
          height: 6.0 + (index * 4),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: isActive ? color : SoteriaColors.textDisabled.withOpacity(0.3),
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }

  Color _getColorForPing(int ping) {
    if (ping < 100) return SoteriaColors.success;
    if (ping < 200) return SoteriaColors.accentGold;
    return SoteriaColors.error;
  }
}

class SyncStatusBanner extends StatelessWidget {
  final bool isRecovering;
  final double progress;

  const SyncStatusBanner({
    super.key, 
    required this.isRecovering, 
    this.progress = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    if (!isRecovering) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: SoteriaColors.primary.withOpacity(0.2),
      child: Row(
        children: [
          const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(SoteriaColors.primary),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Resynchronizing session state...',
            style: SoteriaTypography.labelSmall.copyWith(color: SoteriaColors.textPrimary),
          ),
          const Spacer(),
          Text(
            '${(progress * 100).toInt()}%',
            style: SoteriaTypography.labelSmall.copyWith(
              color: SoteriaColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class LatencyDetailedOverlay extends ConsumerWidget {
  const LatencyDetailedOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(latencyNotifierProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceL1,
        borderRadius: SoteriaRadius.m.circular,
        border: Border.all(color: SoteriaColors.premiumBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('NETWORK DIAGNOSTICS', style: SoteriaTypography.labelSmall.copyWith(letterSpacing: 1.5)),
          const Divider(height: 24),
          _MetricRow(label: 'RTT (Ping)', value: '${metrics.pingMs}ms'),
          _MetricRow(label: 'Jitter', value: '${metrics.jitterMs}ms'),
          _MetricRow(label: 'Packet Loss', value: '${(metrics.packetLossRate * 100).toStringAsFixed(1)}%'),
          _MetricRow(label: 'Clock Offset', value: '${metrics.clockOffsetMs}ms'),
        ],
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  final String label;
  final String value;

  const _MetricRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: SoteriaTypography.bodySmall.copyWith(color: SoteriaColors.textSecondary)),
          Text(value, style: SoteriaTypography.bodySmall.copyWith(color: SoteriaColors.textPrimary, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

extension on double {
  BorderRadius get circular => BorderRadius.circular(this);
}
