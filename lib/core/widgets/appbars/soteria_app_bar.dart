import 'package:flutter/material.dart';

/// SoteriaAppBar is a standardized app bar with support for subtitles, search mode, and transparent mode.
class SoteriaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SoteriaAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.isTransparent = false,
    this.showBackButton = true,
    this.centerTitle = true,
    this.isSearchMode = false,
    this.searchController,
    this.onSearchChanged,
    this.onSearchClosed,
    this.bottom,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final bool isTransparent;
  final bool showBackButton;
  final bool centerTitle;
  final bool isSearchMode;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchClosed;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isTransparent ? Colors.transparent : null,
      elevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: showBackButton && !isSearchMode,
      title: isSearchMode ? _buildSearchField(context) : _buildTitle(context),
      actions: isSearchMode
          ? [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onSearchClosed,
              ),
            ]
          : actions,
      bottom: bottom,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey),
          ),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      controller: searchController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
      ),
      style: Theme.of(context).textTheme.bodyLarge,
      onChanged: onSearchChanged,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
      );
}
