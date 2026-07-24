import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';

/// HomeScreen is the main landing page of the application after login/splash.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppConstants.appName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (kDebugMode) ...[
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => context.pushNamed('gallery'),
                icon: const Icon(Icons.palette_outlined),
                label: const Text('Open Design Gallery'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
