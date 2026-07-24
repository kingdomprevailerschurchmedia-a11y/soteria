import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../features/profile/profile_screen.dart';

/// Preview for the ProfileScreen.
@Preview(name: 'Profile Screen Preview')
Widget profilePreview() {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
  );
}
