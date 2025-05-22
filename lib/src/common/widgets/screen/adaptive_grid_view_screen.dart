import 'package:flutter/material.dart';
import '../../../utils/extensions/custom_extensions.dart';

import '../../constants/dimensions.dart';
import '../../constants/enums.dart' show AppRoute;
import 'adaptive_grid_view/adaptive_grid_view_sidebar.dart';
import 'screen_widgets.dart' show PopScopeScreen, OnPopInvokedHandler;

class AdaptiveGridViewScreen extends StatelessWidget {
  /// Gridview with a sidebar.
  const AdaptiveGridViewScreen({
    super.key,
    required this.baseRoute,
    required this.onPopInvoked,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 5.0,
    this.itemWidth = Dimensions.videoContainerWidth,
    this.horizontalPadding = 10.0,
    this.verticalPadding = 10.0,
    required this.sidebarFSN,
    required this.gridViewFSN,
    this.headerFSN,
    required this.headerWidget,
    required this.gridView,
    required this.sidebarItems,
  });

  final AppRoute baseRoute;

  final void Function(OnPopInvokedHandler onPopInvokedHandler) onPopInvoked;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double itemWidth;
  final double horizontalPadding;
  final double verticalPadding;

  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode? headerFSN;

  /// Top header widget.
  final Widget headerWidget;

  /// Gridview widget.
  final Widget gridView;

  final List<GridViewSidebarItem> sidebarItems;

  @override
  Widget build(BuildContext context) {
    final sidebarWidth = _calcSidebarWidth(context);

    return PopScopeScreen(
      onPopInvoked: onPopInvoked,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            headerWidget,
            // sidebar and gridview
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // sidebar
                  SizedBox(
                    width: sidebarWidth,
                    child: AdaptiveGridViewSidebar(
                      baseRoute: baseRoute,
                      sidebarFSN: sidebarFSN,
                      gridViewFSN: gridViewFSN,
                      headerFSN: headerFSN,
                      horizontalPadding: horizontalPadding,
                      sidebarItems: sidebarItems,
                    ),
                  ),
                  // gridview
                  Expanded(child: gridView), //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calcSidebarWidth(BuildContext context) {
    final double screenWidth = context.screenWidth;
    final double availableGridWidth = screenWidth - horizontalPadding * 2;
    final double gridItemsWidth = itemWidth * crossAxisCount;
    final double gridSpacingWidth = crossAxisSpacing;

    final double sidebarWidth =
        availableGridWidth - gridItemsWidth - gridSpacingWidth;

    return sidebarWidth;
  }
}
