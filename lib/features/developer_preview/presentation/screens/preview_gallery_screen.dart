import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../application/preview_search_notifier.dart';
import '../../domain/entities/preview_item.dart';
import '../widgets/preview_wrapper.dart';

/// The main dashboard for the Developer Preview Gallery.
class PreviewGalleryScreen extends ConsumerWidget {
  const PreviewGalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCategories = ref.watch(previewSearchProvider.notifier).filteredCategories;
    final totalComponents = filteredCategories.fold(0, (sum, cat) => sum + cat.items.length);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dev Gallery'),
            Text(
              '$totalComponents Components',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.all(SoteriaSpacing.s16),
            child: SearchBar(
              hintText: 'Search components or tags...',
              leading: const Icon(SoteriaIcons.search),
              onChanged: (v) => ref.read(previewSearchProvider.notifier).updateSearch(v),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: SoteriaSpacing.s8),
        itemCount: filteredCategories.length,
        itemBuilder: (context, index) {
          return _CategorySection(category: filteredCategories[index]);
        },
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({required this.category});
  final PreviewCategory category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            SoteriaSpacing.s16, 
            SoteriaSpacing.s24, 
            SoteriaSpacing.s16, 
            SoteriaSpacing.s8
          ),
          child: Row(
            children: [
              Icon(category.icon, size: 20, color: Theme.of(context).primaryColor),
              const SizedBox(width: SoteriaSpacing.s8),
              Text(
                category.name.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ),
        ...category.items.map((item) => _PreviewListTile(item: item)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: SoteriaSpacing.s16),
          child: Divider(),
        ),
      ],
    );
  }
}

class _PreviewListTile extends StatelessWidget {
  const _PreviewListTile({required this.item});
  final PreviewItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: item.description != null ? Text(item.description!) : null,
      trailing: const Icon(SoteriaIcons.chevronRight, size: 16),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => PreviewWrapper(
              title: item.name,
              child: item.builder(context),
            ),
          ),
        );
      },
    );
  }
}
