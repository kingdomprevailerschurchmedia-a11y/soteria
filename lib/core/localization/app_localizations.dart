import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AppLocalizations handles application-wide localization settings.
class AppLocalizations {
  static const List<Locale> supportedLocales = [
    Locale('en', ''),
  ];

  static const List<LocalizationsDelegate<dynamic>> delegates = [
    // Add generated localization delegates here later.
  ];
}

/// Provider for the current application [Locale].
class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en', ''));

  void setLocale(Locale locale) {
    if (AppLocalizations.supportedLocales.contains(locale)) {
      state = locale;
    }
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
