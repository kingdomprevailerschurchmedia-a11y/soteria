import 'package:flutter/material.dart';
import '../../../../../core/design_system/design_system.dart';
import '../../../../../core/widgets/cards/soteria_card.dart';
import '../../../domain/entities/session.dart';
import '../../../domain/entities/session_status.dart';

class SessionStatusCard extends StatelessWidget {
  const SessionStatusCard({super.key, required this.session});
  final Session session;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Session',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              _StatusBadge(status: session.status),
            ],
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          _InfoRow(label: 'Identity', value: session.user?.username ?? 'Anonymous'),
          const SizedBox(height: SoteriaSpacing.s8),
          _InfoRow(
            label: 'Token Status', 
            value: session.token?.isValid == true ? 'VALID' : 'INVALID',
            valueColor: session.token?.isValid == true ? SoteriaColors.success : SoteriaColors.error,
          ),
          if (session.lastActivityAt != null) ...[
            const SizedBox(height: SoteriaSpacing.s8),
            _InfoRow(label: 'Last Active', value: _formatTime(session.lastActivityAt!)),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime dt) {
    return '${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});
  final SessionStatus status;

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(SoteriaRadius.s),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    );
  }

  Color _getColor() {
    switch (status) {
      case SessionStatus.authenticated: return SoteriaColors.success;
      case SessionStatus.guest: return Colors.blue;
      case SessionStatus.expired: return SoteriaColors.error;
      case SessionStatus.restoring: return Colors.orange;
      default: return Colors.grey;
    }
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value, this.valueColor});
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: valueColor)),
      ],
    );
  }
}
