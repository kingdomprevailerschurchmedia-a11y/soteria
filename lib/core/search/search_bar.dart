import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soteria/core/design_system/design_system.dart';
import 'search_controller.dart';

/// Reusable search bar for Soteria.
class SoteriaSearchBar extends ConsumerWidget {
  const SoteriaSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(searchControllerProvider.notifier).setOverlayVisible(true),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s16),
        decoration: BoxDecoration(
          color: SoteriaColors.surfaceContainer,
          borderRadius: BorderRadius.circular(SoteriaRadius.full),
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: SoteriaColors.onSurfaceVariant),
            SizedBox(width: SoteriaSpacing.s8),
            Text('Search...', style: TextStyle(color: SoteriaColors.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
