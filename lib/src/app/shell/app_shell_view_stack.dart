part of 'app_shell.dart';

class _AppShellViewStack extends StatelessWidget {
  const _AppShellViewStack({
    required this.selectedRoute,
    required this.contentNode,
    required this.navigationNode,
    required this.extendsBehindNavigation,
    required this.translucentNavigationBackdrop,
    required this.showExitNotice,
    required this.onNavigationBackdropChanged,
    required this.onHomeReselected,
    required this.onLogoutRequested,
    required this.child,
  });

  final AppRoute selectedRoute;
  final FocusScopeNode contentNode;
  final FocusScopeNode navigationNode;
  final bool extendsBehindNavigation;
  final bool translucentNavigationBackdrop;
  final bool showExitNotice;
  final ValueChanged<bool> onNavigationBackdropChanged;
  final VoidCallback onHomeReselected;
  final VoidCallback onLogoutRequested;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener<AppShellNavigationBackdropNotification>(
          onNotification: (notification) {
            if (!extendsBehindNavigation) {
              return true;
            }

            onNavigationBackdropChanged(notification.translucent);
            return true;
          },
          child: _AppShellContentSlot(
            node: contentNode,
            extendsBehindNavigation: extendsBehindNavigation,
            child: child,
          ),
        ),
        if (extendsBehindNavigation)
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: AppShellDesign.immersiveNavigationBackdropHeight,
            child: _AppShellNavigationBackdrop(
              translucent: translucentNavigationBackdrop,
            ),
          ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppShellTopNavigation(
            navigationNode: navigationNode,
            contentNode: contentNode,
            selectedRoute: selectedRoute,
            onHomeReselected: onHomeReselected,
            onLogoutRequested: onLogoutRequested,
          ),
        ),
        if (showExitNotice)
          const TvSnackbar(
            message: AppShellString.exitNoticeMessage,
            icon: AppShellDesign.exitNoticeIcon,
          ),
      ],
    );
  }
}
