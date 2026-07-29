import 'package:flutter/material.dart';
import '../../core/widgets/app_bar/soteria_app_bar.dart';
import '../../core/widgets/navigation/soteria_scaffold.dart';

/// NavigationScaffold is a base scaffold for screens inside the AppShell.
class NavigationScaffold extends StatelessWidget {
  const NavigationScaffold({
    super.key,
    required this.body,
    this.appBarTitle,
    this.showStats = true,
    this.floatingActionButton,
  });

  final Widget body;
  final String? appBarTitle;
  final bool showStats;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return SoteriaScaffold(
      appBar: SoteriaAppBar(title: appBarTitle, showStats: showStats),
      body: body,
      floatingActionButton: floatingActionButton,
      useSafeArea: true,
    );
  }
}
