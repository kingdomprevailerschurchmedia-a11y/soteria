import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/preview_registry.dart';
import '../domain/entities/preview_item.dart';

part 'preview_search_notifier.g.dart';

/// Notifier that handles searching and filtering of preview items.
@riverpod
class PreviewSearchNotifier extends _$PreviewSearchNotifier {
  @override
  String build() => '';

  void updateSearch(String query) => state = query.toLowerCase();

  /// Returns a filtered list of categories based on the current search query.
  List<PreviewCategory> get filteredCategories {
    if (state.isEmpty) return PreviewRegistry.categories;

    return PreviewRegistry.categories.map((category) {
      final filteredItems = category.items.where((item) {
        final query = state.toLowerCase();
        final matchesName = item.name.toLowerCase().contains(query);
        final matchesTags = item.tags.any((tag) => tag.toLowerCase().contains(query));
        // Search by ID or description if available
        final matchesId = item.id.toLowerCase().contains(query);

        return matchesName || matchesTags || matchesId;
      }).toList();

      return PreviewCategory(
        id: category.id,
        name: category.name,
        icon: category.icon,
        items: filteredItems,
        description: category.description,
      );
    }).where((category) => category.items.isNotEmpty).toList();
  }
}
