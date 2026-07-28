import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/feature_flags/feature_flag_provider.dart';
import '../../../../core/feature_flags/feature_flag_group.dart';
import '../../../../core/widgets/feature_flags/feature_flag_card.dart';

class FeatureFlagSettingsScreen extends ConsumerStatefulWidget {
  const FeatureFlagSettingsScreen({super.key});

  @override
  ConsumerState<FeatureFlagSettingsScreen> createState() => _FeatureFlagSettingsScreenState();
}

class _FeatureFlagSettingsScreenState extends ConsumerState<FeatureFlagSettingsScreen> {
  String _searchQuery = '';
  FeatureCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final flags = ref.watch(featureFlagsProvider);
    
    final filteredFlags = flags.where((f) {
      final matchesSearch = f.name.toLowerCase().contains(_searchQuery.toLowerCase()) || 
                          f.id.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == null || f.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return SoteriaScaffold(
      appBar: AppBar(
        title: const Text('Feature Flags'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.read(featureFlagsProvider.notifier).resetAll(),
            tooltip: 'Reset all overrides',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(SoteriaSpacing.s16),
              itemCount: filteredFlags.length,
              separatorBuilder: (context, index) => const SizedBox(height: SoteriaSpacing.s12),
              itemBuilder: (context, index) {
                final flag = filteredFlags[index];
                return FeatureFlagCard(
                  flag: flag,
                  onToggle: () => ref.read(featureFlagsProvider.notifier).toggleFlag(flag.id),
                  onReset: () => ref.read(featureFlagsProvider.notifier).resetFlag(flag.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      child: Column(
        children: [
          SearchBar(
            hintText: 'Search flags...',
            onChanged: (v) => setState(() => _searchQuery = v),
            leading: const Icon(Icons.search),
            elevation: WidgetStateProperty.all(0),
            backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)),
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: _selectedCategory == null,
                  onSelected: (v) => setState(() => _selectedCategory = null),
                ),
                const SizedBox(width: 8),
                ...FeatureCategory.values.map((cat) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(cat.displayName),
                      selected: _selectedCategory == cat,
                      onSelected: (v) => setState(() => _selectedCategory = v ? cat : null),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
