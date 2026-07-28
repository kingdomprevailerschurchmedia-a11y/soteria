import 'feature_flag.dart';
import 'feature_flag_group.dart';

/// Centralized registry for all Feature Flags in the application.
class FeatureFlagRegistry {
  static const List<FeatureFlag> defaults = [
    FeatureFlag(
      id: 'enablePracticeMode',
      name: 'Practice Mode',
      description: 'Enables access to solo practice sessions.',
      category: FeatureCategory.gameplay,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableProMode',
      name: 'Pro Mode',
      description: 'Enables access to professional certification exams.',
      category: FeatureCategory.gameplay,
      defaultValue: false,
    ),
    FeatureFlag(
      id: 'enableVersusMode',
      name: 'Versus Mode',
      description: 'Enables 1v1 real-time competitive duels.',
      category: FeatureCategory.gameplay,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableTournamentMode',
      name: 'Tournament Arena',
      description: 'Enables participation in massive multiplayer events.',
      category: FeatureCategory.tournament,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableLeaderboard',
      name: 'Global Leaderboard',
      description: 'Enables the ranking and leaderboard screens.',
      category: FeatureCategory.leaderboard,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableWallet',
      name: 'Wallet & Rewards',
      description: 'Enables coin management and reward redemptions.',
      category: FeatureCategory.wallet,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableNotifications',
      name: 'Push Notifications',
      description: 'Enables system and social push notifications.',
      category: FeatureCategory.notifications,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableAchievements',
      name: 'Achievements System',
      description: 'Enables badges and academic achievement tracking.',
      category: FeatureCategory.social,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableDailyRewards',
      name: 'Daily Login Rewards',
      description: 'Enables collection of coins for consecutive daily logins.',
      category: FeatureCategory.wallet,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableAdvertisements',
      name: 'Monetization Ads',
      description: 'Enables in-app banner and interstitial ads.',
      category: FeatureCategory.experimental,
      defaultValue: false,
    ),
    FeatureFlag(
      id: 'enableDeveloperTools',
      name: 'Developer Dashboard',
      description: 'Enables the floating bug icon and debug dashboard.',
      category: FeatureCategory.developerTools,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableAnalytics',
      name: 'Usage Analytics',
      description: 'Enables tracking of user behavior for product improvement.',
      category: FeatureCategory.experimental,
      defaultValue: true,
    ),
    FeatureFlag(
      id: 'enableExperimentalFeatures',
      name: 'Beta Features',
      description: 'Enables access to work-in-progress experimental components.',
      category: FeatureCategory.experimental,
      defaultValue: false,
    ),
  ];
}
