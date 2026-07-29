import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widgets/containers/soteria_placeholder_screen.dart';
import '../../core/widgets/navigation/soteria_scaffold.dart';
import '../auth/presentation/providers/auth_providers.dart';
import '../auth/presentation/widgets/guest/restricted_feature_card.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);

    if (auth.isGuest) {
      return const SoteriaScaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: RestrictedFeatureCard(
              title: 'My Wallet',
              description: 'Earnings management and reward redemptions are available for authenticated scholars.',
              icon: Icons.account_balance_wallet_outlined,
            ),
          ),
        ),
      );
    }

    return const SoteriaPlaceholderScreen(
      title: 'My Wallet',
      description: 'Manage your coins, gems, and claim your rewards.',
      icon: Icons.account_balance_wallet_outlined,
    );
  }
}
