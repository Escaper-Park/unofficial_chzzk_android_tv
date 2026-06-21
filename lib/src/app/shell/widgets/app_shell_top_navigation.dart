import 'package:flutter/material.dart';

import '../../../core/tv/focus/focus.dart';
import '../../../core/ui/ui.dart';
import '../../router/app_routes.dart';
import '../app_shell_design.dart';
import 'app_shell_auth_action.dart';
import 'app_shell_destination.dart';
import 'app_shell_tab.dart';

class AppShellTopNavigation extends StatelessWidget {
  const AppShellTopNavigation({
    super.key,
    required this.navigationNode,
    required this.contentNode,
    required this.selectedRoute,
    required this.onHomeReselected,
    required this.onLogoutRequested,
  });

  final FocusScopeNode navigationNode;
  final FocusScopeNode contentNode;
  final AppRoute selectedRoute;
  final VoidCallback onHomeReselected;
  final VoidCallback onLogoutRequested;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppShellDesign.height,
      child: Padding(
        padding: AppShellDesign.padding,
        child: TvFocusSection.list(
          node: navigationNode,
          down: contentNode,
          child: Row(
            children: [
              TvTabRow(
                tabs: [
                  for (final destination in appShellPrimaryDestinations)
                    AppShellTab(
                      destination: destination,
                      selectedRoute: selectedRoute,
                      onReselected: destination.route == AppRoute.home
                          ? onHomeReselected
                          : null,
                    ),
                ],
              ),
              const Spacer(),
              TvTabRow(
                tabs: [
                  for (final destination in appShellUtilityDestinations)
                    AppShellTab(
                      destination: destination,
                      selectedRoute: selectedRoute,
                    ),
                  AppShellAuthAction(
                    selectedRoute: selectedRoute,
                    onLogoutRequested: onLogoutRequested,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
