import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../../analytics/analytics_event.dart';
import '../cards/soteria_card.dart';

class AnalyticsEventCard extends StatelessWidget {
  const AnalyticsEventCard({
    super.key,
    required this.event,
    required this.timestamp,
  });

  final AnalyticsEvent event;
  final DateTime timestamp;

  @override
  Widget build(BuildContext context) {
    final params = event.toMap();

    return SoteriaCard(
      padding: const EdgeInsets.all(SoteriaSpacing.s12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildBadge(context),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  event.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                      ),
                ),
              ),
              Text(
                '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}:${timestamp.second.toString().padLeft(2, '0')}',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),
          if (params.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(SoteriaRadius.s),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: params.entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 10, fontFamily: 'monospace'),
                        children: [
                          TextSpan(text: '${e.key}: ', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                          TextSpan(text: '${e.value}', style: const TextStyle(color: SoteriaColors.textPrimary)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBadge(BuildContext context) {
    Color color = Colors.grey;
    IconData icon = Icons.event_note_outlined;

    if (event.name.contains('click')) {
      color = Colors.orange;
      icon = Icons.touch_app_outlined;
    } else if (event.name.contains('screen')) {
      color = Colors.green;
      icon = Icons.visibility_outlined;
    } else if (event.name.contains('error')) {
      color = SoteriaColors.error;
      icon = Icons.error_outline;
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 14, color: color),
    );
  }
}
