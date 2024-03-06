import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/center_text.dart';
import '../../../../../common/widgets/focused_outline_button.dart';
import '../../../../../common/widgets/header_text.dart';
import '../../../../../features/category/controller/category_live_controller.dart';
import '../../../../../features/category/model/category.dart';
import '../../../../../features/home/widgets/home_base_container.dart';
import '../../../../../features/live/model/live.dart';
import '../../../../../features/live/widgets/live_container.dart';
import '../../../../focus/dpad_widget.dart';
import '../../../../popup/popup_utils.dart';
import '../../../controller/live_stream_controller.dart';
import '../../../controller/network_video_controller.dart';

class LiveStreamCategoryLiveList extends HookConsumerWidget {
  const LiveStreamCategoryLiveList({
    super.key,
    required this.controller,
    required this.videoFocusNode,
    required this.liveDetail,
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;
  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final focusScopeNode = useFocusScopeNode();

    final Category category = Category(
      categoryId: liveDetail.liveCategory ?? '?',
      categoryType: liveDetail.categoryType ?? 'ETC',
      categoryValue: '',
      concurrentUserCount: 0,
      openLiveCount: 0,
      posterImageUrl: null,
    );

    useEffect(() {
      scrollController.addListener(() async {
        // -50.0: damping
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - 50.0 &&
            !scrollController.position.outOfRange) {
          await ref
              .read(categoryLiveControllerProvider(category: category).notifier)
              .fetchMore();
        }
      });
      return null;
    }, [scrollController]);

    final asyncCategoryLives = ref.watch(
      categoryLiveControllerProvider(category: category),
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(controlOverlayTimerProvider.notifier).showOverlayAndStartTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
              overlayType: OverlayType.category,
            );
      },
      child: DpadWidget(
        actionCallbacks: {
          DpadAction.arrowUp: () {
            focusScopeNode.unfocus();

            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.popular,
                );
          },
          DpadAction.arrowDown: () {
            focusScopeNode.unfocus();

            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.following,
                );
          },
          DpadAction.arrowLeft: () {
            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.category,
                );
          },
          DpadAction.arrowRight: () {
            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.category,
                );
          },
        },
        child: FocusScope(
          node: focusScopeNode,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.homeBaseContainerHeight + 70.0,
              color: AppColors.blackColor.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderText(text: '카테고리 라이브 채널'),
                    HomeBaseContainer(
                      child: switch (asyncCategoryLives) {
                        AsyncData(:final value) =>
                          (value == null || value.isEmpty)
                              ? const CenterText(text: '카테고리 채널에 동영상이 없습니다')
                              : ListView.builder(
                                  controller: scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: value.length,
                                  itemBuilder: (context, index) {
                                    final liveDetail = value[index];

                                    return LiveContainer(
                                      autofocus: index == 0 ? true : false,
                                      liveDetail: liveDetail,
                                      onPressed: () async {
                                        await watchLive(
                                          context,
                                          ref,
                                          liveDetail,
                                          category,
                                        );
                                      },
                                    );
                                  },
                                ),
                        AsyncError() => FocusedOutlineButton(
                            autofocus: true,
                            onPressed: () {
                              ref
                                  .read(controlOverlayTimerProvider.notifier)
                                  .showOverlayAndStartTimer(
                                    videoFocusNode: videoFocusNode,
                                    seconds: 0,
                                    overlayType: OverlayType.category,
                                  );
                            },
                            child: const CenterText(
                                text:
                                    '카테고리 채널을 불러오는데 실패했거나, 카테고리가 설정되어 있지 않습니다.'),
                          ),
                        _ => const CenterText(text: '카테고리 채널 불러오는 중...'),
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> watchLive(
    BuildContext context,
    WidgetRef ref,
    LiveDetail partialLiveDetail,
    Category category,
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
          ref.read(liveStreamControllerProvider.notifier).playAnotherLive(
                context,
                controller,
                liveDetail,
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
