import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/presentation/providers/auth_providers.dart';
import '../auth/application/auth_controller.dart';
import '../../core/widgets/buttons/soteria_button.dart';
import '../../core/design_system/design_system.dart';

/// ProfileScreen displays the user's profile information.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(SoteriaIcons.person, size: 50),
            ),
            const SizedBox(height: SoteriaSpacing.s24),
            Text(
              auth.user?.username ?? 'Anonymous',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              auth.user?.email ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            SoteriaButton(
              onPressed: () => ref.read(authControllerProvider.notifier).signOut(),
              label: 'LOGOUT',
              type: SoteriaButtonType.outlined,
            ),
          ],
        ),
      ),
    );
  }
}
