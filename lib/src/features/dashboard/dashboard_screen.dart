import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemNavigator;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show DpadAction, AppRoute, DialogButtonType;
import '../../common/constants/styles.dart' show AppColors;
import '../../common/widgets/screen/screen_widgets.dart' show PopScopeScreen;
import '../../common/constants/dimensions.dart' show Dimensions;
import '../../common/widgets/dpad/dpad_widgets.dart'
    show DpadFocusScopeNavigator;
import '../../utils/extensions/custom_extensions.dart' show DimensionsX;

import '../../utils/popup/popup_utils.dart';
import 'dashboard_event.dart' show DashboardEvent;
import 'widgets/dashboard_widgets.dart';

part './widgets/screen/dashboard_body.dart';
part './widgets/screen/responsive_sidebar.dart';
part './widgets/screen/contents_area.dart';

class DashboardScreen extends HookWidget {
  /// A base [Scaffold] with a sidebar and a content area.
  ///
  /// All screens that use this [DashboardScreen] must have a sidebar
  /// [FocusScopeNode] and a content area [FocusScopeNode].
  const DashboardScreen({
    super.key,
    required this.state,
    required this.child,
  });

  /// This state is used to get the currently active screen name.
  final GoRouterState state;

  /// The contents area screen.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentLocationName = state.matchedLocation.replaceAll('/', '');

    final sidebarFSN = useFocusScopeNode();
    final contentsFSN = useFocusScopeNode();

    return InheritedSidebarFocusScope(
      node: sidebarFSN,
      child: PopScopeScreen(
        onPopInvoked: (onPopInvokedHandler) {
          onPopInvokedHandler.doubleBackExit(
            context: context,
            condition: sidebarFSN.hasFocus,
            exitAction: () => SystemNavigator.pop(),
            fallbackAction: () => sidebarFSN.requestFocus(),
          );
        },
        child: _DashboardBody(
          sidebar: _ResponsiveSidebar(
            sidebarFSN: sidebarFSN,
            contentsFSN: contentsFSN,
            currentLocationName: currentLocationName,
          ),
          contents: _ContentsArea(
            contentsFSN: contentsFSN,
            child: SizedBox(
              height: context.screenHeight,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
