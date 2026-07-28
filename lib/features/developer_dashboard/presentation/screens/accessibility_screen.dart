import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/accessibility/accessibility_provider.dart';

class AccessibilityDashboardScreen extends ConsumerWidget {
  const AccessibilityDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessService = ref.watch(accessibilityServiceProvider);

    return SoteriaScaffold(
      appBar: AppBar(
        title: const Text('Accessibility Tools'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(SoteriaSpacing.s16),
        children: [
          _buildToolCard(
            context,
            'Semantics Debugger',
            'Overlays the semantic tree on top of the UI to verify screen reader nodes.',
            icon: Icons.view_headline_rounded,
            onTap: () {
              // Toggle global semantics debugger if possible
            },
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          _buildToolCard(
            context,
            'Text Scaling',
            'Test how the UI handles large system fonts.',
            icon: Icons.text_fields_rounded,
            onTap: () {},
          ),
          const SizedBox(height: SoteriaSpacing.s32),
          Text(
            'CURRENT SYSTEM STATE',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          Card(
            child: Column(
              children: [
                _buildStateTile('High Contrast', accessService.isHighContrastEnabled),
                const Divider(height: 1),
                _buildStateTile('Reduced Motion', accessService.isReducedMotionEnabled),
                const Divider(height: 1),
                _buildStateTile('Text Scaler', accessService.textScaler.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolCard(
    BuildContext context,
    String title,
    String description, {
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: const TextStyle(fontSize: 12)),
        onTap: onTap,
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }

  Widget _buildStateTile(String label, dynamic value) {
    return ListTile(
      title: Text(label),
      trailing: Text(
        value.toString().toUpperCase(),
        style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold),
      ),
    );
  }
}
