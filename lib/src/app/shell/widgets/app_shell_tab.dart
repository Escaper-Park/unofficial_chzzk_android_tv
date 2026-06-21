import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui/ui.dart';
import '../../router/app_routes.dart';
import 'app_shell_destination.dart';

class AppShellTab extends StatelessWidget {
  const AppShellTab({
    super.key,
    required this.destination,
    required this.selectedRoute,
    this.onReselected,
  });

  final AppShellDestination destination;
  final AppRoute selectedRoute;
  final VoidCallback? onReselected;

  @override
  Widget build(BuildContext context) {
    final selected = selectedRoute == destination.route;
    final icon = selected && destination.route == AppRoute.home
        ? Icons.refresh
        : destination.icon;

    return TvTab(
      label: destination.label,
      icon: icon,
      showIcon: true,
      showLabel: destination.label != null,
      selected: selected,
      autofocus: selected,
      onPressed: () {
        if (selected) {
          onReselected?.call();
          return;
        }

        context.go(destination.route.path);
      },
    );
  }
}
