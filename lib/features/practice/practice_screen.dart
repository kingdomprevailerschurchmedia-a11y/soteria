import 'package:flutter/material.dart';
import '../../core/widgets/containers/soteria_placeholder_screen.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SoteriaPlaceholderScreen(
      title: 'Practice Mode',
      description: 'Master your subjects with focused practice sessions.',
      icon: Icons.school_outlined,
    );
  }
}
