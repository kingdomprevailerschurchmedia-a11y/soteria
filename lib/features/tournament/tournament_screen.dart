import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widgets/containers/soteria_placeholder_screen.dart';
import '../../core/widgets/navigation/soteria_scaffold.dart';
import '../auth/presentation/providers/auth_providers.dart';
import '../auth/presentation/widgets/guest/restricted_feature_card.dart';

class TournamentScreen extends ConsumerWidget {
  const TournamentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);

    if (auth.isGuest) {
      return const SoteriaScaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: RestrictedFeatureCard(
              title: 'Tournament Arena',
              description: 'Real-time competition with massive prize pools is reserved for registered scholars.',
              icon: Icons.emoji_events_outlined,
            ),
          ),
        ),
      );
    }

    return const SoteriaPlaceholderScreen(
      title: 'Tournament Arena',
      description: 'Join massive multiplayer events and win huge prizes.',
      icon: Icons.emoji_events_outlined,
    );
  }
}
