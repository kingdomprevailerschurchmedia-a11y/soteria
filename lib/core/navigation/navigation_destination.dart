import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import 'navigation_constants.dart';

/// Represents a top-level destination in the application's navigation shell.
class SoteriaNavigationDestination {
  const SoteriaNavigationDestination({
    required this.id,
    required this.route,
    required this.name,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    this.isDebugOnly = false,
  });

  final String id;
  final String route;
  final String name;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final bool isDebugOnly;
}

/// The primary 5-item set for the Soteria application shell.
final List<SoteriaNavigationDestination> appDestinations = [
  const SoteriaNavigationDestination(
    id: 'home',
    route: NavigationConstants.home,
    name: NavigationConstants.homeName,
    label: 'Home',
    icon: SoteriaIcons.homeOutlined,
    selectedIcon: SoteriaIcons.home,
  ),
  const SoteriaNavigationDestination(
    id: 'practice',
    route: NavigationConstants.practice,
    name: NavigationConstants.practiceName,
    label: 'Practice',
    icon: SoteriaIcons.schoolOutlined,
    selectedIcon: SoteriaIcons.school,
  ),
  const SoteriaNavigationDestination(
    id: 'compete',
    route: NavigationConstants.versus, // Using versus for "Compete" hub
    name: NavigationConstants.versusName,
    label: 'Compete',
    icon: SoteriaIcons.competeOutlined,
    selectedIcon: SoteriaIcons.compete,
  ),
  const SoteriaNavigationDestination(
    id: 'leaderboard',
    route: NavigationConstants.leaderboard,
    name: NavigationConstants.leaderboardName,
    label: 'Ranks',
    icon: SoteriaIcons.leaderboardOutlined,
    selectedIcon: SoteriaIcons.leaderboard,
  ),
  const SoteriaNavigationDestination(
    id: 'profile',
    route: NavigationConstants.profile,
    name: NavigationConstants.profileName,
    label: 'Profile',
    icon: SoteriaIcons.personOutlined,
    selectedIcon: SoteriaIcons.person,
  ),
];

/// Destinations accessible in debug mode only.
final List<SoteriaNavigationDestination> debugDestinations = [
  const SoteriaNavigationDestination(
    id: 'debug',
    route: NavigationConstants.debug,
    name: NavigationConstants.debugName,
    label: 'Debug',
    icon: Icons.bug_report_outlined,
    selectedIcon: Icons.bug_report,
    isDebugOnly: true,
  ),
];
