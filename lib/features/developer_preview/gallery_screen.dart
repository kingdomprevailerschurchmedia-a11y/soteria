import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/design_system/design_system.dart';
import '../../core/design_system/previews/design_system_previews.dart';
import 'widgets/component_preview_wrapper.dart';
import '../../core/widgets/shared/soteria_button.dart';
import '../../core/widgets/shared/soteria_card.dart';
import '../../core/widgets/shared/soteria_badge.dart';
import '../../core/widgets/forms/soteria_text_field.dart';
import '../../core/widgets/shared/soteria_states.dart';
import '../../core/widgets/shared/soteria_layout.dart';
import '../../core/widgets/shared/soteria_components.dart';
import '../../core/widgets/forms/soteria_inputs.dart';
import '../../core/widgets/shared/feature_cards.dart';
import '../../core/widgets/shared/gamification_widgets.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../core/services/logger_service.dart';
import '../../core/services/connectivity_service.dart';
import '../../core/services/ui_service.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/utils/app_animations.dart';

/// GalleryScreen is the main entry point for the Developer Preview Gallery.
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soteria Design System'),
      ),
      body: ListView(
        children: [
          _buildCategory(
            context,
            'Design System',
            [
              _buildItem(context, 'Colors', const ColorPreview()),
              _buildItem(context, 'Typography', const TypographyPreview()),
              _buildItem(context, 'Spacing', const SpacingPreview()),
              _buildItem(context, 'Radius', const RadiusPreview()),
              _buildItem(context, 'Elevation & Shadows', const ElevationPreview()),
              _buildItem(context, 'Animations', const AnimationPreview()),
              _buildItem(context, 'Icons', const IconPreview()),
            ],
          ),
          _buildCategory(
            context,
            'Feature Previews',
            [
              _buildItem(context, 'Onboarding Walkthrough', const OnboardingScreen()),
              _buildItem(context, 'Login Screen', const LoginScreen()),
              _buildItem(context, 'Register Screen', const RegisterScreen()),
            ],
          ),
          _buildCategory(
            context,
            'Gamification',
            [
              _buildItem(context, 'Stats & Progress', const GamificationGallery()),
              _buildItem(context, 'Leaderboard Item', const LeaderboardCard(
                position: 1, 
                name: 'Alex Johnson', 
                score: '12,500 XP',
              )),
              _buildItem(context, 'Current User Rank', const LeaderboardCard(
                position: 42, 
                name: 'You (Soteria Dev)', 
                score: '8,400 XP',
                isCurrentUser: true,
              )),
              _buildItem(context, 'Achievements', const AchievementCard(
                title: 'Design Master', 
                description: 'Build a production-ready design system', 
                icon: Icons.auto_awesome,
              )),
              _buildItem(context, 'Rewards', const RewardCard(
                title: 'Mission Complete', 
                reward: '500 COINS', 
                icon: Icons.card_giftcard,
              )),
              _buildItem(context, 'Profile Card', const ProfileCard(
                name: 'Soteria Explorer', 
                rank: 'Elite Knight', 
                avatarUrl: 'https://i.pravatar.cc/150?u=42',
              )),
            ],
          ),
          _buildCategory(
            context,
            'Shared Components',
            [
              _buildItem(context, 'Buttons', const ButtonGallery()),
              _buildItem(context, 'Cards', const CardGallery()),
              _buildItem(context, 'Badges & Tags', const BadgeGallery()),
              _buildItem(context, 'Avatars', const AvatarGallery()),
              _buildItem(context, 'Section Headers', const SectionHeaderGallery()),
            ],
          ),
          _buildCategory(
            context,
            'Infrastructure Demos',
            [
              _buildItem(context, 'Logger', const LoggerDemo()),
              _buildItem(context, 'Connectivity', const ConnectivityDemo()),
              _buildItem(context, 'Localization', const LocalizationDemo()),
              _buildItem(context, 'Overlays', const OverlayDemo()),
            ],
          ),
          _buildCategory(
            context,
            'Forms',
            [
              _buildItem(context, 'TextFields', const TextFieldGallery()),
              _buildItem(context, 'Selection Controls', const InputGallery()),
            ],
          ),
          _buildCategory(
            context,
            'States',
            [
              _buildItem(context, 'Loading', const SoteriaLoadingState()),
              _buildItem(context, 'Error', const SoteriaErrorState(message: 'Something went wrong')),
              _buildItem(context, 'Empty', const SoteriaEmptyState(title: 'No Data')),
              _buildItem(context, 'Skeleton', const SkeletonGallery()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(SoteriaSpacing.s24),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  letterSpacing: 1.5,
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        ...items,
        const Divider(),
      ],
    );
  }

  Widget _buildItem(BuildContext context, String name, Widget component) {
    return ListTile(
      title: Text(name),
      trailing: const Icon(SoteriaIcons.chevronRight, size: 20),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => ComponentPreviewWrapper(
              component: component,
              name: name,
            ),
          ),
        );
      },
    );
  }
}

// --- Specific Galleries ---

class ColorGallery extends StatelessWidget {
  const ColorGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      ('Primary', Theme.of(context).colorScheme.primary),
      ('Secondary', Theme.of(context).colorScheme.secondary),
      ('Gold (Coin)', SoteriaColors.coinGold),
      ('Purple (XP)', SoteriaColors.xpPurple),
      ('Orange (Streak)', SoteriaColors.streakOrange),
      ('Red (Life)', SoteriaColors.lifeRed),
      ('Success', SoteriaColors.success),
      ('Error', Theme.of(context).colorScheme.error),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundColor: color.$2),
            title: Text(color.$1),
            subtitle: Text(color.$2.toString().toUpperCase()),
          ),
        );
      },
    );
  }
}

class SpacingGallery extends StatelessWidget {
  const SpacingGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = [
      ('XS', SoteriaSpacing.s4),
      ('S', SoteriaSpacing.s8),
      ('M', SoteriaSpacing.s12),
      ('L', SoteriaSpacing.s16),
      ('XL', SoteriaSpacing.s20),
      ('XXL', SoteriaSpacing.s24),
      ('XXXL', SoteriaSpacing.s32),
      ('HUGE', SoteriaSpacing.s48),
      ('MASSIVE', SoteriaSpacing.s64),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      itemCount: scale.length,
      itemBuilder: (context, index) {
        final item = scale[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              SizedBox(width: 80, child: Text(item.$1)),
              Container(
                height: 24,
                width: item.$2,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8),
              Text('${item.$2}px'),
            ],
          ),
        );
      },
    );
  }
}

class MotionGallery extends StatelessWidget {
  const MotionGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      children: [
        _buildMotionItem(
          context,
          'Bounce Click (Button Interaction)',
          AppAnimations.bounceClick(
            onTap: () {},
            child: const SoteriaCard(child: Center(child: Text('Tap Me'))),
          ),
        ),
        const SizedBox(height: SoteriaSpacing.s24),
        _buildMotionItem(
          context,
          'Slide In (Entrance Animation)',
          AppAnimations.slideIn(
            child: const SoteriaCard(child: Center(child: Text('I Slid In'))),
          ),
        ),
        const SizedBox(height: SoteriaSpacing.s24),
        _buildMotionItem(
          context,
          'Scale In (Celebration Entrance)',
          AppAnimations.scaleIn(
            child: const SoteriaCard(
              color: SoteriaColors.coinGold,
              child: Center(child: Text('I Scaled In')),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMotionItem(BuildContext context, String name, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: SoteriaSpacing.s8),
        child,
      ],
    );
  }
}

class IconGallery extends StatelessWidget {
  const IconGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      SoteriaIcons.home, SoteriaIcons.homeOutlined,
      SoteriaIcons.school, SoteriaIcons.schoolOutlined,
      SoteriaIcons.trophy, SoteriaIcons.trophyOutlined,
      SoteriaIcons.coin, Icons.monetization_on_outlined,
      SoteriaIcons.streak, Icons.local_fire_department_outlined,
      SoteriaIcons.life, Icons.favorite_border,
      SoteriaIcons.person, SoteriaIcons.personOutlined,
      SoteriaIcons.settings, SoteriaIcons.settingsOutlined,
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: icons.length,
      itemBuilder: (context, index) => Icon(icons[index], size: 32),
    );
  }
}

class GamificationGallery extends StatelessWidget {
  const GamificationGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      children: [
        const XPProgressBar(progress: 0.65, level: 12),
        const SizedBox(height: SoteriaSpacing.s24),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CoinCounter(amount: 1250),
            StreakIndicator(days: 7),
          ],
        ),
        const SizedBox(height: SoteriaSpacing.s24),
        const Center(child: LifeIndicator(count: 3)),
        const SizedBox(height: SoteriaSpacing.s40),
        const StatisticCard(
          label: 'Win Rate',
          value: '84%',
          icon: Icons.trending_up,
          trend: '+2.4%',
        ),
      ],
    );
  }
}

class ButtonGallery extends StatelessWidget {
  const ButtonGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      children: [
        SoteriaButton(label: 'Primary Button', onPressed: () {}),
        const SizedBox(height: SoteriaSpacing.s16),
        SoteriaButton(
          label: 'Reward Button', 
          type: SoteriaButtonType.reward, 
          icon: SoteriaIcons.reward, 
          onPressed: () {},
        ),
        const SizedBox(height: SoteriaSpacing.s16),
        SoteriaButton(
          label: 'Outlined Button', 
          type: SoteriaButtonType.outlined, 
          onPressed: () {},
        ),
        const SizedBox(height: SoteriaSpacing.s16),
        SoteriaButton(
          label: 'Danger Action', 
          type: SoteriaButtonType.danger, 
          onPressed: () {},
        ),
        const SizedBox(height: SoteriaSpacing.s16),
        const SoteriaButton(
          label: 'Disabled Button', 
          onPressed: null, 
          isDisabled: true,
        ),
      ],
    );
  }
}

class CardGallery extends StatelessWidget {
  const CardGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      children: [
        const SoteriaCard(child: Text('Standard Card with shadow and large radius')),
        const SizedBox(height: SoteriaSpacing.s16),
        SoteriaCard(
          borderColor: Theme.of(context).primaryColor,
          child: const Text('Bordered Active Card'),
        ),
        const SizedBox(height: SoteriaSpacing.s16),
        Stack(
          children: [
            const Placeholder(fallbackHeight: 100),
            Positioned.fill(
              child: Center(
                child: SoteriaCard(
                  isGlass: true,
                  color: Theme.of(context).primaryColor,
                  child: const Text('Glassmorphism Card over Image', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: SoteriaSpacing.s16),
        const QuizCard(
          title: 'Advanced Mathematics', 
          questionCount: 15, 
          difficulty: 'Hard',
        ),
        const SizedBox(height: SoteriaSpacing.s16),
        const TournamentCard(
          title: 'Summer Championship', 
          prizePool: '\$1,000', 
          timeLeft: '2D 14H', 
          entryFee: '50 Coins',
        ),
      ],
    );
  }
}

class TypographyGallery extends StatelessWidget {
  const TypographyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      children: [
        Text('Display Large', style: theme.displayLarge),
        Text('Display Medium', style: theme.displayMedium),
        Text('Display Small', style: theme.displaySmall),
        const Divider(),
        Text('Headline Large', style: theme.headlineLarge),
        Text('Title Large', style: theme.titleLarge),
        Text('Title Medium', style: theme.titleMedium),
        const Divider(),
        Text('Body Large', style: theme.bodyLarge),
        Text('Label Large', style: theme.labelLarge),
      ],
    );
  }
}

class BadgeGallery extends StatelessWidget {
  const BadgeGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Wrap(
            spacing: 8,
            children: [
              SoteriaBadge(label: 'PRIMARY'),
              SoteriaBadge(label: 'NEW', color: SoteriaColors.success),
              SoteriaBadge(label: 'LIVE', color: SoteriaColors.lifeRed),
            ],
          ),
          const SizedBox(height: 24),
          const Wrap(
            spacing: 8,
            children: [
              SoteriaTag(label: 'HARD', color: Colors.deepOrange),
              SoteriaTag(label: 'PREMIUM', color: SoteriaColors.coinGold),
            ],
          ),
          const SizedBox(height: 24),
          const SoteriaChip(label: 'Selectable Filter', isSelected: true),
        ],
      ),
    );
  }
}

class AvatarGallery extends StatelessWidget {
  const AvatarGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(SoteriaSpacing.s24),
      child: Wrap(
        spacing: 16,
        children: [
          const SoteriaAvatar(initials: 'JD'),
          const SoteriaAvatar(imageUrl: 'https://i.pravatar.cc/150?u=1', size: 64),
          const SoteriaAvatar(initials: 'ST', size: 80),
        ],
      ),
    );
  }
}

class TextFieldGallery extends StatelessWidget {
  const TextFieldGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      children: [
        const SoteriaTextField(label: 'Username', hintText: 'Enter your username'),
        const SizedBox(height: SoteriaSpacing.s16),
        const SoteriaTextField(
          label: 'Password', 
          obscureText: true, 
          suffixIcon: Icon(SoteriaIcons.visibilityOff),
        ),
      ],
    );
  }
}

class InputGallery extends StatelessWidget {
  const InputGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      children: [
        SoteriaSwitch(label: 'Mute Sounds', value: false, onChanged: (v) {}),
        SoteriaCheckbox(label: 'Accept Terms', value: true, onChanged: (v) {}),
        SoteriaDropdown<String>(
          label: 'Difficulty',
          value: 'Easy',
          items: const [
            DropdownMenuItem(value: 'Easy', child: Text('Easy')),
            DropdownMenuItem(value: 'Hard', child: Text('Hard')),
          ],
          onChanged: (v) {},
        ),
      ],
    );
  }
}

class SkeletonGallery extends StatelessWidget {
  const SkeletonGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      children: [
        const SoteriaSkeleton(height: 20, width: 200),
        const SizedBox(height: SoteriaSpacing.s16),
        const SoteriaSkeleton(height: 120),
        const SizedBox(height: SoteriaSpacing.s16),
        const Row(
          children: [
            SoteriaSkeleton(height: 48, width: 48, radius: 24),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SoteriaSkeleton(height: 12, width: 150),
                SizedBox(height: 8),
                SoteriaSkeleton(height: 12, width: 100),
              ],
            )
          ],
        )
      ],
    );
  }
}

class SectionHeaderGallery extends StatelessWidget {
  const SectionHeaderGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SoteriaSectionHeader(title: 'Top Scorers'),
        const SoteriaDivider(),
        SoteriaSectionHeader(
          title: 'Daily Rewards', 
          actionLabel: 'Claim All', 
          onActionPressed: () {},
        ),
      ],
    );
  }
}

// --- Infrastructure Demos ---

class LoggerDemo extends ConsumerWidget {
  const LoggerDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.watch(loggerProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () => logger.debug('User clicked debug'), child: const Text('Log Debug')),
          ElevatedButton(onPressed: () => logger.warning('Something looks odd'), child: const Text('Log Warning')),
          ElevatedButton(onPressed: () => logger.error('Critical failure'), child: const Text('Log Error')),
        ],
      ),
    );
  }
}

class ConnectivityDemo extends ConsumerWidget {
  const ConnectivityDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(connectivityStatusProvider);
    return Center(
      child: status.when(
        data: (s) => Text('Network Status: ${s.name.toUpperCase()}'),
        loading: () => const CircularProgressIndicator(),
        error: (e, s) => Text('Error: $e'),
      ),
    );
  }
}

class LocalizationDemo extends ConsumerWidget {
  const LocalizationDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Locale: ${locale.languageCode}'),
          ElevatedButton(
            onPressed: () => ref.read(localeProvider.notifier).setLocale(const Locale('en')), 
            child: const Text('Set English'),
          ),
        ],
      ),
    );
  }
}

class OverlayDemo extends ConsumerWidget {
  const OverlayDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ui = ref.watch(uiServiceProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => ui.showSnackBar(context: context, message: 'Achievement Unlocked!', type: SnackBarType.success), 
            child: const Text('Show Success SnackBar'),
          ),
          ElevatedButton(
            onPressed: () async {
              ui.showLoadingOverlay(context);
              await Future<void>.delayed(const Duration(seconds: 2));
              ui.hideLoadingOverlay();
            }, 
            child: const Text('Global Loading Overlay'),
          ),
        ],
      ),
    );
  }
}
