import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../application/assist_controller.dart';
import '../../domain/entities/assist_type.dart';
import 'assist_button.dart';

class AssistBar extends ConsumerWidget {
  const AssistBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(assistControllerProvider);
    final notifier = ref.read(assistControllerProvider.notifier);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: SoteriaSpacing.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: SoteriaColors.premiumBorder),
          const SizedBox(height: SoteriaSpacing.s8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.currentAssists.map((assist) {
                return Padding(
                  padding: const EdgeInsets.only(right: SoteriaSpacing.s8),
                  child: AssistButton(
                    usage: assist,
                    onTap: () => notifier.useAssist(assist.type),
                    isLoading: state.isLoading,
                  ),
                );
              }).toList(),
            ),
          ),
          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: SoteriaSpacing.s8),
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: SoteriaColors.error, fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }
}
