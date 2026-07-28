/// Holds constant strings for event names and parameter keys.
class AnalyticsConstants {
  // Event Names
  static const String screenView = 'screen_view';
  static const String buttonClick = 'button_click';
  static const String quizStart = 'quiz_start';
  static const String quizComplete = 'quiz_complete';
  static const String tournamentJoin = 'tournament_join';
  static const String tournamentComplete = 'tournament_complete';
  static const String walletView = 'wallet_view';
  static const String coinsEarned = 'coins_earned';
  static const String coinsSpent = 'coins_spent';
  static const String notificationOpen = 'notification_open';
  static const String settingsChange = 'settings_change';
  static const String searchPerform = 'search_performed';
  static const String errorOccur = 'error_occurred';

  // Parameter Keys
  static const String paramScreenName = 'screen_name';
  static const String paramButtonId = 'button_id';
  static const String paramQuizId = 'quiz_id';
  static const String paramQuizCategory = 'quiz_category';
  static const String paramScore = 'score';
  static const String paramTournamentId = 'tournament_id';
  static const String paramAmount = 'amount';
  static const String paramCurrency = 'currency';
  static const String paramNotificationId = 'notification_id';
  static const String paramSettingKey = 'setting_key';
  static const String paramSearchQuery = 'search_query';
  static const String paramErrorMessage = 'error_message';
  static const String paramErrorCode = 'error_code';

  // User Property Keys
  static const String propAppVersion = 'app_version';
  static const String propPlatform = 'platform';
  static const String propTheme = 'theme';
  static const String propLanguage = 'language';
  static const String propDeviceType = 'device_type';
  static const String propEnvironment = 'environment';
}
