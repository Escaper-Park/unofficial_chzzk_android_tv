part of '../video_grid_view_screen.dart';

class _VideoGridViewBody extends StatelessWidget {
  const _VideoGridViewBody({
    required this.baseRoute,
    required this.sidebarFSN,
    required this.gridViewFSN,
    this.headerFSN,
    required this.headerWidget,
    required this.sidebarItems,
    required this.gridView,
    required this.onPopInvoked,
  });

  final AppRoute baseRoute;

  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode? headerFSN;

  final Widget headerWidget;
  final List<(String, void Function(int index))> sidebarItems;
  final Widget gridView;

  final void Function(OnPopInvokedHandler handler) onPopInvoked;

  @override
  Widget build(BuildContext context) {
    return AdaptiveGridViewScreen(
      baseRoute: baseRoute,
      onPopInvoked: onPopInvoked,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      headerFSN: headerFSN,
      headerWidget: headerWidget,
      gridView: gridView,
      sidebarItems: sidebarItems,
    );
  }
}
