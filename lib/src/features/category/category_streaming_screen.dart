import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './model/category.dart';

import '../../common/constants/dimensions.dart';
import '../../common/widgets/base_scaffold.dart';
import '../../utils/router/app_router.dart';

import './widgets/streaming/category_live_header.dart';
import './widgets/streaming/category_live_list.dart';
import './widgets/streaming/category_sidebar_buttons.dart';
import 'controller/category_controller.dart';
import 'widgets/streaming/category_vod_list.dart';

class CategoryStreamingScreen extends HookWidget {
  const CategoryStreamingScreen({
    super.key,
    required this.category,
    this.fromHome = false,
  });

  final Category category;
  final bool fromHome;

  @override
  Widget build(BuildContext context) {
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
          if (fromHome) {
            context.goNamed(AppRoute.home.routeName);
          } else {
            context.pop();
          }
        }
        sidebarFocusNode.requestFocus();
      },
      child: BaseScaffold(
        horizontalPadding: horizontalPadding,
        body: Column(
          children: [
            CategoryLiveHeader(category: category),
            const SizedBox(height: 10.0),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: sidebarWidth,
                    child: CategorySidebarButtons(
                      sidebarFocusNode: sidebarFocusNode,
                    ),
                  ),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final categoryItem =
                          ref.watch(currentCategoryItemProvider);

                      return Expanded(
                        child: categoryItem == CategoryItem.live
                            ? CategoryLiveList(
                                category: category,
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: crossAxisSpacing,
                              )
                            : CategoryVodList(
                                category: category,
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: crossAxisSpacing,
                              ),
                      );
                    },
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
