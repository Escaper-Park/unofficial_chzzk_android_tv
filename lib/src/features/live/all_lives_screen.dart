import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/dimensions.dart';
import '../../common/widgets/base_scaffold.dart';
import '../../common/widgets/header_text.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/controller/dashboard_controller.dart';
import './widgets/all_lives/all_lives_sidebar_buttons.dart';
import './widgets/all_lives/all_lives_list.dart';

class AllLivesScreen extends HookConsumerWidget {
  const AllLivesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double horizontalPadding = 16.0;
    const double crossAxisSpacing = 5.0;
    const int crossAxisCount = 3;

    final double sidebarWidth = MediaQuery.of(context).size.width -
        horizontalPadding * 2 -
        crossAxisSpacing * 2 * (crossAxisCount - 1) -
        Dimensions.liveThumbnailSize.width * crossAxisCount;

    final sidebarFocusNode = useFocusNode();

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        if (sidebarFocusNode.hasFocus && context.mounted) {
          ref
              .read(dashboardControllerProvider.notifier)
              .changeScreen(context, AppRoute.home);
        }
        sidebarFocusNode.requestFocus();
      },
      child: BaseScaffold(
        horizontalPadding: horizontalPadding,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(
              text: '전체 라이브 둘러보기',
              fontSize: 24.0,
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: sidebarWidth,
                    child: AllLivesSidebarButtons(
                      sidebarFocusNode: sidebarFocusNode,
                    ),
                  ),
                  const Expanded(
                    child: AllLivesList(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: crossAxisSpacing,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
