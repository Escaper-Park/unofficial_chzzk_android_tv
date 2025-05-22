import 'package:flutter/material.dart';

import '../../../common/constants/enums.dart' show DpadAction;
import '../../../common/widgets/dpad/dpad_widgets.dart'
    show DpadCallbackShortcuts;

class SidebarCallbackShortcuts extends StatelessWidget {
  /// A simplified version of the [DpadCallbackShortcust] to request
  /// focus to the sidebar [FocusScopeNode]
  const SidebarCallbackShortcuts({
    super.key,
    required this.sidebarFSN,
    required this.child,
  });

  final FocusScopeNode? sidebarFSN;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DpadCallbackShortcuts(
      dpadKeyNodeMap: {DpadAction.arrowLeft: sidebarFSN},
      child: child,
    );
  }
}
