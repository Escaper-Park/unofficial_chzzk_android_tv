import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/header_text.dart';
import '../../common/widgets/pop_scope_screen.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/controller/dashboard_controller.dart';
import 'widgets/popular_clip_list.dart';

class PopularClipScreen extends ConsumerWidget {
  const PopularClipScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double horizontalPadding = 20.0;
    const double verticalPadding = 24.0;

    return PopScopeScreen(
      onPopInvoked: (_) {
        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.home);
      },
      body: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(text: '인기 클립', fontSize: 24.0, horizontalPadding: 5.0),
            Expanded(
              child: PopularClipList(
                horizontalPadding: horizontalPadding,
                verticalPadding: verticalPadding,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
