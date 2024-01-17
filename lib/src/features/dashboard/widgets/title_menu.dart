import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/styles.dart';
import '../controller/dashboard_controller.dart';

class TitleMenu extends ConsumerWidget {
  const TitleMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int dashboardIndex = ref.watch(dashboardControllerProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _menuTextButton(ref, context, '홈', 0, dashboardIndex),
        _menuTextButton(ref, context, '팔로우', 1, dashboardIndex),
        _menuTextButton(ref, context, '검색', 2, dashboardIndex),
      ],
    );
  }

  Widget _menuTextButton(
    WidgetRef ref,
    BuildContext context,
    String text,
    int index,
    int dashboardIndex,
  ) {
    return TextButton(
      onPressed: () {
        ref.read(dashboardControllerProvider.notifier).onTapTitleMenu(
              context,
              index,
            );
      },
      child: Text(
        text,
        style: TextStyle(
          decorationColor: AppColors.chzzkColor,
          color: dashboardIndex == index
              ? AppColors.chzzkColor
              : AppColors.chzzkColor.withOpacity(0.50),
        ),
      ),
    );
  }
}
