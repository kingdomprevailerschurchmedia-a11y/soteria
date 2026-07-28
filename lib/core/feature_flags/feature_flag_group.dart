/// Defines the logical categories for feature flags.
enum FeatureCategory {
  gameplay,
  wallet,
  notifications,
  social,
  leaderboard,
  tournament,
  developerTools,
  experimental,
  ui,
  security,
}

extension FeatureCategoryExtension on FeatureCategory {
  String get displayName {
    switch (this) {
      case FeatureCategory.gameplay: return 'Gameplay';
      case FeatureCategory.wallet: return 'Wallet';
      case FeatureCategory.notifications: return 'Notifications';
      case FeatureCategory.social: return 'Social';
      case FeatureCategory.leaderboard: return 'Leaderboard';
      case FeatureCategory.tournament: return 'Tournament';
      case FeatureCategory.developerTools: return 'Developer Tools';
      case FeatureCategory.experimental: return 'Experimental';
      case FeatureCategory.ui: return 'User Interface';
      case FeatureCategory.security: return 'Security';
    }
  }
}
