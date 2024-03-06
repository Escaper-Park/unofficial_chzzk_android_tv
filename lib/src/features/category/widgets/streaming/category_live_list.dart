import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/widgets/center_text.dart';
import '../../../../utils/popup/popup_utils.dart';
import '../../../../utils/router/app_router.dart';
import '../../../live/model/live.dart';
import '../../../live/widgets/live_container.dart';
import '../../controller/category_live_controller.dart';
import '../../model/category.dart';

class CategoryLiveList extends HookConsumerWidget {
  const CategoryLiveList({
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
        ref.watch(categoryLiveControllerProvider(category: category));

    useEffect(() {
      scrollController.addListener(() async {
        // -15.0: damping
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - 15.0 &&
            !scrollController.position.outOfRange) {
          await ref
              .read(categoryLiveControllerProvider(category: category).notifier)
              .fetchMore();
        }
      });
      return null;
    }, [scrollController]);

    return switch (asyncCategoryLives) {
      AsyncData(:final value) => (value == null || value.isEmpty)
          ? CenterText(text: '${category.categoryValue} 카테고리에 라이브 중인 방송이 없습니다')
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
                final partialLiveDetail = value[index];

                return LiveContainer(
                  autofocus: index == 0 ? true : false,
                  liveDetail: partialLiveDetail,
                  onPressed: () async {
                    watchLive(context, ref, partialLiveDetail);
                  },
                );
              },
            ),
      AsyncError() => const CenterText(text: '카테고리 라이브를 불러올 수 없습니다'),
      _ => const SizedBox.shrink(),
    };
  }

  Future<void> watchLive(
    BuildContext context,
    WidgetRef ref,
    LiveDetail partialLiveDetail,
  ) async {
    final liveDetail = await ref
        .read(categoryLiveControllerProvider(category: category).notifier)
        .getLiveDetail(
          partialLiveDetail.channel.channelId,
        );

    if (liveDetail != null) {
      final String? livePath = liveDetail.livePath;

      if (context.mounted) {
        if (livePath == null) {
          await PopupUtils.showSingleDialog(
            context: context,
            titleText: '19금 연령 제한',
            contentText: '연령 제한된 콘텐츠는 로그인해야 시청할 수 있습니다',
          );
        } else {
          context.pushNamed(
            AppRoute.liveStreaming.routeName,
            extra: liveDetail,
          );
        }
      }
    } else {
      if (context.mounted) {
        await PopupUtils.showSingleDialog(
          context: context,
          titleText: '재생 오류',
          contentText: '이 영상을 재생할 수 없습니다',
        );
      }
    }
  }
}
