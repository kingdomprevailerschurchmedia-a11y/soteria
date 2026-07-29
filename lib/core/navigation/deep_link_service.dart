import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// DeepLinkService handles the parsing and processing of incoming link intents.
class DeepLinkService {
  DeepLinkService(this.ref);
  final Ref ref;

  Future<void> handleInitialLink(Uri uri) async {
    // Parsing and navigation logic
    debugPrint('Processing deep link: $uri');
  }

  void handleLink(Uri uri) {
    // Navigation routing logic
    debugPrint('Handling deep link: $uri');
  }
}

final deepLinkServiceProvider = Provider((ref) => DeepLinkService(ref));
