import 'package:flutter/material.dart';
import '../../core/widgets/navigation/soteria_scaffold.dart';

/// NavigationScaffold is a base scaffold for screens inside the AppShell.
class NavigationScaffold extends StatelessWidget {
  const NavigationScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return SoteriaScaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      useSafeArea: true,
    );
  }
}
