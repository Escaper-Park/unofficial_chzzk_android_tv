import 'package:flutter/material.dart';

import '../../router/app_routes.dart';
import '../app_shell_string.dart';

final class AppShellDestination {
  const AppShellDestination({
    required this.route,
    required this.icon,
    this.label,
  });

  final AppRoute route;
  final IconData icon;
  final String? label;
}

const appShellPrimaryDestinations = [
  AppShellDestination(
    route: AppRoute.home,
    icon: Icons.home,
    label: AppShellString.home,
  ),
  AppShellDestination(
    route: AppRoute.following,
    icon: Icons.favorite,
    label: AppShellString.following,
  ),
  AppShellDestination(
    route: AppRoute.category,
    icon: Icons.category,
    label: AppShellString.category,
  ),
  AppShellDestination(
    route: AppRoute.browse,
    icon: Icons.explore,
    label: AppShellString.browse,
  ),
  AppShellDestination(
    route: AppRoute.group,
    icon: Icons.group,
    label: AppShellString.group,
  ),
];

const appShellUtilityDestinations = [
  AppShellDestination(
    route: AppRoute.search,
    icon: Icons.search,
  ),
  AppShellDestination(
    route: AppRoute.settings,
    icon: Icons.settings,
  ),
];

const appShellAuthDestination = AppShellDestination(
  route: AppRoute.auth,
  icon: Icons.person,
);
