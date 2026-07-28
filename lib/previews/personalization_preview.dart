import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/personalization/presentation/screens/personalization_screen.dart';
import '../core/design_system/design_system.dart';

@Preview(name: 'Personalization - Step 1')
Widget personalizationStep1Preview() {
  return const ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersonalizationScreen(),
    ),
  );
}

@Preview(name: 'Personalization - Dark Mode')
Widget personalizationDarkPreview() {
  return ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SoteriaTheme.dark,
      home: const PersonalizationScreen(),
    ),
  );
}
