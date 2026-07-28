import 'package:flutter/widgets.dart';

/// Represents a single visual state or component to be previewed.
class PreviewItem {
  const PreviewItem({
    required this.id,
    required this.name,
    required this.builder,
    this.description,
    this.tags = const [],
  });

  /// Unique identifier for the preview item.
  final String id;

  /// Display name of the component or state.
  final String name;

  /// A brief description of what this preview represents.
  final String? description;

  /// Function that builds the widget to be previewed.
  final Widget Function(BuildContext context) builder;

  /// Searchable tags associated with this item.
  final List<String> tags;
}

/// Represents a category of preview items (e.g., "Buttons", "Cards").
class PreviewCategory {
  const PreviewCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.items,
    this.description,
  });

  /// Unique identifier for the category.
  final String id;

  /// Display name of the category.
  final String name;

  /// Icon representing the category in the gallery.
  final IconData icon;

  /// List of [PreviewItem]s belonging to this category.
  final List<PreviewItem> items;

  /// A brief description of the category's contents.
  final String? description;
}
