import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/router/app_router.dart';

import '../../../../common/widgets/center_text.dart';
import '../../controller/category_controller.dart';
import 'category_container.dart';

class CategoryList extends HookConsumerWidget {
  const CategoryList({
    super.key,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.imageWidth,
    required this.imageHeight,
  });

  final int crossAxisCount;
  final double crossAxisSpacing;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final asyncCategories = ref.watch(categoryControllerProvider);

    useEffect(() {
      scrollController.addListener(() async {
        // -5.0: damping
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - 24.0 &&
            !scrollController.position.outOfRange) {
          await ref.read(categoryControllerProvider.notifier).fetchMore();
        }
      });
      return null;
    }, [scrollController]);

    return switch (asyncCategories) {
      AsyncData(:final value) => value == null
          ? const CenterText(text: '카테고리를 불러올 수 없습니다')
          : GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: 10.0,
                mainAxisExtent: imageHeight + 100.0,
              ),
              controller: scrollController,
              itemCount: value.length,
              itemBuilder: (context, index) {
                final category = value[index];

                return CategoryContainer(
                  imageWidth: imageWidth,
                  imageHeight: imageHeight,
                  autofocus: index == 0 ? true : false,
                  category: category,
                  onPressed: () {
                    context.pushNamed(
                      AppRoute.categoryStreaming.routeName,
                      extra: {
                        'category': category,
                        'fromHome': false,
                      },
                    );
                  },
                );
              },
            ),
      AsyncError() => const CenterText(text: '카테고리를 불러올 수 없습니다'),
      _ => const SizedBox.shrink(),
    };
  }
}
