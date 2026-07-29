import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soteria/core/design_system/design_system.dart';
import 'search_controller.dart';

/// Fullscreen search overlay.
class SearchOverlay extends ConsumerWidget {
  const SearchOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchControllerProvider);

    if (!state.isOverlayVisible) return const SizedBox.shrink();

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: GestureDetector(
            onTap: () => ref.read(searchControllerProvider.notifier).setOverlayVisible(false),
            child: Container(color: Colors.black.withValues(alpha: 0.6)),
          ),
        ),
        Center(
          child: Container(
            width: 600,
            height: 400,
            decoration: BoxDecoration(
              color: SoteriaColors.surface,
              borderRadius: BorderRadius.circular(SoteriaRadius.l),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(SoteriaSpacing.s16),
                  child: TextField(
                    onChanged: (value) => ref.read(searchControllerProvider.notifier).updateQuery(value),
                    autofocus: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search anything...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Divider(),
                // Results go here
              ],
            ),
          ),
        ),
      ],
    );
  }
}
