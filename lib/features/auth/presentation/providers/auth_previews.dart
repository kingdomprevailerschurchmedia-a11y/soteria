import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/login_screen.dart';
import 'auth_providers.dart';
import '../../application/auth_state.dart';
import '../../domain/entities/auth_status.dart';
import '../../domain/entities/auth_user.dart';

@Preview(name: 'Auth - Unauthenticated')
Widget authUnauthenticatedPreview() {
  return ProviderScope(
    overrides: [
      authStateProvider.overrideWithValue(
        const AuthState(status: AuthStatus.unauthenticated),
      ),
    ],
    child: const MaterialApp(home: LoginScreen()),
  );
}

@Preview(name: 'Auth - Authenticating')
Widget authAuthenticatingPreview() {
  return ProviderScope(
    overrides: [
      authStateProvider.overrideWithValue(
        const AuthState(status: AuthStatus.authenticating),
      ),
    ],
    child: const MaterialApp(home: LoginScreen()),
  );
}

@Preview(name: 'Auth - Authenticated')
Widget authAuthenticatedPreview() {
  return ProviderScope(
    overrides: [
      authStateProvider.overrideWithValue(
        const AuthState(
          status: AuthStatus.authenticated,
          user: AuthUser(id: '1', email: 'user@soteria.app', username: 'Scholar'),
        ),
      ),
    ],
    child: const MaterialApp(
      home: Scaffold(body: Center(child: Text('Logged In Content'))),
    ),
  );
}
