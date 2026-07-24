import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../features/home/home_screen.dart';

/// Preview for the HomeScreen.
@Preview(name: 'Home Screen Preview')
Widget homePreview() {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  );
}
