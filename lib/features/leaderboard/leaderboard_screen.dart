import 'package:flutter/material.dart';
import '../../core/widgets/containers/soteria_placeholder_screen.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SoteriaPlaceholderScreen(
      title: 'Global Ranks',
      description: 'See how you stack up against scholars across the nation.',
      icon: Icons.leaderboard_outlined,
    );
  }
}
