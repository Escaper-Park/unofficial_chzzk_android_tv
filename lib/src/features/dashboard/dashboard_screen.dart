import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../common/widgets/base_scaffold.dart';
import './widgets/responsive_sidebar.dart';

class DashboardScreen extends HookWidget {
  const DashboardScreen({
    super.key,
    required this.screen,
    this.appBar,
  });

  final Widget screen;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    final sidebarFocusNode = useFocusNode();

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        if (sidebarFocusNode.hasFocus) {
          SystemNavigator.pop();
        }
        sidebarFocusNode.requestFocus();
      },
      child: BaseScaffold(
        appBar: appBar,
        useTextField: true,
        body: Row(
          children: [
            ResponsiveSidebar(sidebarFocusNode),
            Expanded(child: screen),
          ],
        ),
      ),
    );
  }
}
