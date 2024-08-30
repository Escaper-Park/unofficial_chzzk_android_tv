import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemNavigator;
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../common/widgets/pop_scope_screen.dart';
import '../../utils/popup/popup_utils.dart';
import './widgets/responsive_sidebar.dart';

class DashboardScreen extends HookWidget {
  /// A base [Scaffold] with the sidebar and contents area.
  ///
  /// All of screens that use this [DashboardScreen] must have sidebar [FocusScopeNode] and
  /// content screen [FocusScopeNode].
  const DashboardScreen({
    super.key,
    required this.sidebarFSN,
    required this.contentScreenFSN,
    required this.contentScreen,
  });

  final FocusScopeNode sidebarFSN;
  final FocusScopeNode contentScreenFSN;

  /// The area of contents next to sidebar.
  final Widget contentScreen;

  @override
  Widget build(BuildContext context) {
    const int snackbarDisplaySeconds = 2;
    DateTime? lastPressedBackButtonAt;

    return PopScopeScreen(
      onPopInvoked: (_) async {
        if (sidebarFSN.hasFocus) {
          final currentTime = DateTime.now();

          // Before [Snackbar] is visible
          if (lastPressedBackButtonAt == null ||
              currentTime.difference(lastPressedBackButtonAt!) >
                  const Duration(seconds: snackbarDisplaySeconds)) {
            lastPressedBackButtonAt = currentTime;

            if (context.mounted) {
              // Show Snackbar
              const String msg = '뒤로 가기를 한 번 더 누르면 종료됩니다';
              PopupUtils.showSnackbar(context, msg);
            }
          }
          // While [Snackbar] is Visible
          else {
            // Exit
            SystemNavigator.pop();
          }
        }
        // Request focus to sidebar
        else {
          sidebarFSN.requestFocus();
        }
      },
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveSidebar(
              sidebarFSN: sidebarFSN,
              contentScreenFSN: contentScreenFSN,
            ),
            Expanded(
              child: FocusScope(
                child: contentScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
