import 'package:flutter/material.dart';
import 'package:soteria/core/design_system/design_system.dart';
import 'search_state.dart';

/// Card for displaying a search result.
class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key, required this.result});
  final SearchResult result;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(result.icon, color: SoteriaColors.primary),
      title: Text(result.title, style: SoteriaTypography.bodyMedium),
      subtitle: result.subtitle != null ? Text(result.subtitle!, style: SoteriaTypography.bodySmall) : null,
      onTap: () {},
    );
  }
}
