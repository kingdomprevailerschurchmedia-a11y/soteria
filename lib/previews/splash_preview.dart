import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/widgets/splash_screen.dart';
import '../core/design_system/design_system.dart';

@Preview(name: 'Splash - Default')
Widget splashPreview() {
  return const ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

@Preview(name: 'Splash - Dark Mode')
Widget splashDarkPreview() {
  return ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SoteriaTheme.dark,
      home: const SplashScreen(),
    ),
  );
}

@Preview(name: 'Splash - Tablet')
Widget splashTabletPreview() {
  return const ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
