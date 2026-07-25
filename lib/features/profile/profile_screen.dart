import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/presentation/providers/auth_provider.dart';
import '../../core/widgets/shared/soteria_button.dart';
import '../../core/design_system/design_system.dart';

/// ProfileScreen displays the user's profile information.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authProvider).dataOrNull;

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
              authUser?.username ?? 'Anonymous',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              authUser?.email ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            SoteriaButton(
              onPressed: () => ref.read(authProvider.notifier).logout(),
              label: 'LOGOUT',
              type: SoteriaButtonType.outlined,
            ),
          ],
        ),
      ),
    );
  }
}
