import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../domain/models/player.dart';
import '../domain/models/connection_models.dart';

class OpponentCard extends StatelessWidget {
  final Player player;
  final int latency;

  const OpponentCard({
    super.key,
    required this.player,
    required this.latency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceL2,
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
        border: Border.all(color: SoteriaColors.premiumBorder),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: SoteriaColors.primary.withOpacity(0.2),
            child: const Icon(Icons.person, color: SoteriaColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  player.displayName,
                  style: SoteriaTypography.titleSmall.copyWith(color: SoteriaColors.textPrimary),
                ),
                Text(
                  'Skill Rating: ${player.skillRating}',
                  style: SoteriaTypography.labelSmall.copyWith(color: SoteriaColors.textSecondary),
                ),
              ],
            ),
          ),
          _LatencyIndicator(latency: latency),
        ],
      ),
    );
  }
}

class _LatencyIndicator extends StatelessWidget {
  final int latency;

  const _LatencyIndicator({required this.latency});

  @override
  Widget build(BuildContext context) {
    Color color;
    if (latency < 50) {
      color = SoteriaColors.success;
    } else if (latency < 150) {
      color = SoteriaColors.accentGold;
    } else {
      color = SoteriaColors.error;
    }

    return Column(
      children: [
        Icon(Icons.wifi, color: color, size: 16),
        Text(
          '${latency}ms',
          style: SoteriaTypography.labelSmall.copyWith(color: color, fontSize: 10),
        ),
      ],
    );
  }
}

class ConnectionStatusIndicator extends StatelessWidget {
  final ConnectionState state;

  const ConnectionStatusIndicator({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    String label;
    Color color;
    IconData icon;

    switch (state) {
      case ConnectionState.connected:
        label = 'CONNECTED';
        color = SoteriaColors.success;
        icon = Icons.cloud_done;
        break;
      case ConnectionState.connecting:
      case ConnectionState.reconnecting:
        label = 'CONNECTING...';
        color = SoteriaColors.accentGold;
        icon = Icons.cloud_sync;
        break;
      case ConnectionState.disconnected:
      case ConnectionState.failed:
        label = 'OFFLINE';
        color = SoteriaColors.error;
        icon = Icons.cloud_off;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(SoteriaRadius.xs),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 12),
          const SizedBox(width: 4),
          Text(
            label,
            style: SoteriaTypography.labelSmall.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
