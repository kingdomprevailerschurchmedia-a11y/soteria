import 'package:flutter/material.dart';

/// RefreshNotifier is a simple [Listenable] that can be used with GoRouter's refreshListenable.
class RefreshNotifier extends ChangeNotifier {
  RefreshNotifier(Listenable listenable) {
    listenable.addListener(notifyListeners);
  }
}
