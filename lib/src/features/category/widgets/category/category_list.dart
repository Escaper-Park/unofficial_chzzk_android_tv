import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/widgets/center_widgets.dart';
import '../../../../utils/image/image_utils.dart';
import '../../../../utils/router/app_router.dart';
import '../../controller/category_controller.dart';
import './category_container.dart';

class CategoryList extends HookConsumerWidget {
  const CategoryList({
    super.key,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  /// For calculate dynamic size of category container.
  final double horizontalPadding;

  /// Damping for infinite scrolls.
  final double verticalPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final asyncCategories = ref.watch(categoryControllerProvider);

    useEffect(() {
      scrollController.addListener(() async {
        // damping: -verticalPadding
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - verticalPadding &&
            !scrollController.position.outOfRange) {
          await ref.read(categoryControllerProvider.notifier).fetchMore();
        }
      });
      return null;
    }, [scrollController]);

    const int crossAxisCount = 5;
    const double crossAxisSpacing = 10.0;

    // Calculate image size
    final imageWidth = ImageUtils.imageWidthByCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      context: context,
    );

    final imageHeight = ImageUtils.imageHeightByRatio(
      w: 3,
      h: 4,
      imageWidth: imageWidth,
    );

    return switch (asyncCategories) {
      AsyncData(:final value) => value == null
          ? const CenteredText(text: '카테고리를 불러올 수 없습니다')
          : GridView.builder(
              controller: scrollController,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: 10.0,
                mainAxisExtent: imageHeight + Dimensions.categoryInfoCardHeight,
              ),
              itemCount: value.length,
              itemBuilder: (BuildContext context, int index) {
                final category = value[index];

                return CategoryContainer(
                  autofocus: index == 0 ? true : false,
                  imageWidth: imageWidth,
                  imageHeight: imageHeight,
                  infoCardHeight: Dimensions.categoryInfoCardHeight,
                  category: category,
                  onPressed: () {
                    if (context.mounted) {
                      context.pushNamed(
                        AppRoute.categoryDetail.routeName,
                        extra: {'category': category},
                      );
                    }
                  },
                );
              },
            ),
      AsyncError() => const CenteredText(text: '카테고리를 불러올 수 없습니다'),
      _ => const SizedBox.shrink(),
    };
  }
}
