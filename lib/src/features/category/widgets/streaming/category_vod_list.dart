import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/widgets/center_text.dart';
import '../../../vod/widgets/vod_container.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';
import './category_vod_channel_info.dart';

class CategoryVodList extends HookConsumerWidget {
  const CategoryVodList({
    super.key,
    required this.category,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
  });

  final Category category;
  final int crossAxisCount;
  final double crossAxisSpacing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final asyncCategoryLives =
        ref.watch(categoryVodControllerProvider(category: category));

    useEffect(() {
      scrollController.addListener(() async {
        // -15.0: damping
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - 15.0 &&
            !scrollController.position.outOfRange) {
          await ref
              .read(categoryVodControllerProvider(category: category).notifier)
              .fetchMore();
        }
      });
      return null;
    }, [scrollController]);

    return switch (asyncCategoryLives) {
      AsyncData(:final value) => (value == null || value.isEmpty)
          ? CenterText(text: '${category.categoryValue} 카테고리에 동영상이 없습니다')
          : GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: 15.0,
                mainAxisExtent: Dimensions.homeBaseContainerHeight,
              ),
              controller: scrollController,
              itemCount: value.length,
              itemBuilder: (context, index) {
                final vod = value[index];

                return Stack(
                  children: [
                    VodContainer(
                      autofocus: index == 0 ? true : false,
                      vod: vod,
                      getVodPath: () async {
                        return await ref
                            .read(categoryVodControllerProvider(
                              category: category,
                            ).notifier)
                            .getVodPath(videoNo: vod.videoNo);
                      },
                    ),
                    CategoryVodChannelInfo(channel: vod.channel),
                  ],
                );
              },
            ),
      AsyncError() => const CenterText(text: '카테고리 동영상을 불러올 수 없습니다'),
      _ => const SizedBox.shrink(),
    };
  }
}
