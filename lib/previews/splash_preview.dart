import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../core/widgets/splash_screen.dart';

/// Preview for the SplashScreen.
@Preview(name: 'Splash Screen Preview')
Widget splashPreview() {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  );
}
