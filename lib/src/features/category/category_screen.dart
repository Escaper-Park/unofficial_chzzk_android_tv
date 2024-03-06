import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/base_scaffold.dart';
import '../../common/widgets/header_text.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/controller/dashboard_controller.dart';
import './widgets/category/category_list.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double horizontalPadding = 16.0;
    const int crossAxisCount = 5;
    const double crossAxisSpacing = 10.0;

    // (Max width - side paddings - sum of gaps) / crossAxisCount
    final double imageWidth = (MediaQuery.of(context).size.width -
            horizontalPadding * 2 -
            (crossAxisCount - 1) * crossAxisSpacing) /
        crossAxisCount;

    final double imageHeight = imageWidth / 3 * 4;

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        // ref.read(dashboardControllerProvider.notifier).popScreen(context);
        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.home);
      },
      child: BaseScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(
              text: '카테고리',
              fontSize: 24.0,
            ),
            Expanded(
              child: CategoryList(
                imageWidth: imageWidth,
                imageHeight: imageHeight,
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
