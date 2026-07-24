import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../features/settings/settings_screen.dart';

/// Preview for the SettingsScreen.
@Preview(name: 'Settings Screen Preview')
Widget settingsPreview() {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SettingsScreen(),
  );
}
