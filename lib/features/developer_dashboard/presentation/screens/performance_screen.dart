import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/performance/performance_provider.dart';
import '../../../../core/performance/startup_metrics.dart';
import '../widgets/dashboard_cards.dart';

class PerformanceDashboardScreen extends ConsumerWidget {
  const PerformanceDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final perfService = ref.watch(performanceServiceProvider);
    final summary = perfService.getHealthSummary();

    final avgFrameBuild = summary['avg_frame_build_ms'] as double? ?? 0.0;
    final jankP = summary['jank_p'] as double? ?? 0.0;

    return SoteriaScaffold(
      appBar: AppBar(
        title: const Text('Performance Monitor'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(SoteriaSpacing.s16),
        children: [
          _buildMetricCard(
            context,
            'Startup Time',
            '${summary['startup_ms'] ?? 0} ms',
            subtitle: 'Time from main() to fully ready',
            icon: Icons.speed_rounded,
            color: Colors.blue,
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          _buildMetricCard(
            context,
            'Average Frame Build',
            '${avgFrameBuild.toStringAsFixed(2)} ms',
            subtitle: 'Target: < 16.6 ms',
            icon: Icons.grid_view_rounded,
            color: avgFrameBuild > 16.0 ? Colors.orange : Colors.green,
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          _buildMetricCard(
            context,
            'Jank Percentage',
            '${jankP.toStringAsFixed(1)}%',
            subtitle: 'Frames exceeding 16ms',
            icon: Icons.warning_amber_rounded,
            color: jankP > 5.0 ? SoteriaColors.error : Colors.green,
          ),
          const SizedBox(height: SoteriaSpacing.s32),
          Text(
            'LIFECYCLE EVENTS',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          InfoCard(
            title: 'Timestamps',
            icon: Icons.history_toggle_off_rounded,
            data: {
              'App Started': StartupMetrics.startTime?.toIso8601String() ?? 'Unknown',
              'Ready Marker': 'Success',
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value, {
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleSmall),
                  Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
