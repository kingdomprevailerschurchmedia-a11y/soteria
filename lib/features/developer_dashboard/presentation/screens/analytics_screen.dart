import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/analytics/analytics_provider.dart';
import '../../../../core/analytics/analytics_service.dart';
import '../../../../core/widgets/analytics/analytics_event_card.dart';

class AnalyticsDashboardScreen extends ConsumerWidget {
  const AnalyticsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsState = ref.watch(analyticsStateProvider);

    return SoteriaScaffold(
      appBar: AppBar(
        title: const Text('Analytics Console'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.read(analyticsStateProvider.notifier).refresh(),
            tooltip: 'Refresh',
          ),
          Switch.adaptive(
            value: analyticsState.isEnabled,
            onChanged: (v) => ref.read(analyticsStateProvider.notifier).setEnabled(v),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'RECENT EVENTS'),
                Tab(text: 'USER PROPERTIES'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildEventsList(analyticsState.events),
                  _buildUserProperties(analyticsState.properties),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsList(List<AnalyticsEventEntry> events) {
    if (events.isEmpty) {
      return const Center(child: Text('No events tracked yet.'));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      itemCount: events.length,
      separatorBuilder: (context, index) => const SizedBox(height: SoteriaSpacing.s12),
      itemBuilder: (context, index) {
        final entry = events[index];
        return AnalyticsEventCard(
          event: entry.event,
          timestamp: entry.timestamp,
        );
      },
    );
  }

  Widget _buildUserProperties(Map<String, String?> props) {
    if (props.isEmpty) {
      return const Center(child: Text('No user properties set.'));
    }

    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      children: props.entries.map((e) {
        return Card(
          child: ListTile(
            title: Text(e.key, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            subtitle: Text(e.value ?? 'null', style: const TextStyle(fontFamily: 'monospace')),
          ),
        );
      }).toList(),
    );
  }
}
