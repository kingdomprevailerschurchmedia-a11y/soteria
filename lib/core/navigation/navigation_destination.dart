import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import 'navigation_constants.dart';

/// Represents a top-level destination in the application's navigation shell.
class SoteriaNavigationDestination {
  const SoteriaNavigationDestination({
    required this.route,
    required this.name,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    this.badgeCount,
    this.isDebugOnly = false,
  });

  final String route;
  final String name;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final int? badgeCount;
  final bool isDebugOnly;
}

/// The list of all top-level destinations in the Soteria application.
final List<SoteriaNavigationDestination> appDestinations = [
  const SoteriaNavigationDestination(
    route: NavigationConstants.home,
    name: NavigationConstants.homeName,
    label: 'Home',
    icon: SoteriaIcons.homeOutlined,
    selectedIcon: SoteriaIcons.home,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.practice,
    name: NavigationConstants.practiceName,
    label: 'Practice',
    icon: SoteriaIcons.schoolOutlined,
    selectedIcon: SoteriaIcons.school,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.pro,
    name: NavigationConstants.proName,
    label: 'Pro',
    icon: Icons.star_outline,
    selectedIcon: Icons.star,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.versus,
    name: NavigationConstants.versusName,
    label: 'Versus',
    icon: Icons.bolt_outlined,
    selectedIcon: Icons.bolt,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.tournament,
    name: NavigationConstants.tournamentName,
    label: 'Arena',
    icon: SoteriaIcons.trophyOutlined,
    selectedIcon: SoteriaIcons.trophy,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.leaderboard,
    name: NavigationConstants.leaderboardName,
    label: 'Ranks',
    icon: Icons.leaderboard_outlined,
    selectedIcon: Icons.leaderboard,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.wallet,
    name: NavigationConstants.walletName,
    label: 'Wallet',
    icon: SoteriaIcons.coin, // Reusing coin icon for wallet
    selectedIcon: SoteriaIcons.coin,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.notifications,
    name: NavigationConstants.notificationsName,
    label: 'Alerts',
    icon: Icons.notifications_outlined,
    selectedIcon: Icons.notifications,
    badgeCount: 3,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.profile,
    name: NavigationConstants.profileName,
    label: 'Profile',
    icon: SoteriaIcons.personOutlined,
    selectedIcon: SoteriaIcons.person,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.settings,
    name: NavigationConstants.settingsName,
    label: 'Settings',
    icon: SoteriaIcons.settingsOutlined,
    selectedIcon: SoteriaIcons.settings,
  ),
  const SoteriaNavigationDestination(
    route: NavigationConstants.debug,
    name: NavigationConstants.debugName,
    label: 'Debug',
    icon: Icons.bug_report_outlined,
    selectedIcon: Icons.bug_report,
    isDebugOnly: true,
  ),
];
