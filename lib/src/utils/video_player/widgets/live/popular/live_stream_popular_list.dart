import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/center_text.dart';
import '../../../../../common/widgets/header_text.dart';
import '../../../../../features/home/widgets/home_base_container.dart';
import '../../../../../features/live/controller/live_controller.dart';
import '../../../../../features/live/widgets/live_container.dart';
import '../../../../focus/dpad_widget.dart';
import '../../../../popup/popup_utils.dart';
import '../../../controller/live_stream_controller.dart';
import '../../../controller/network_video_controller.dart';
import '../../common/live_explore_error_button.dart';

class LiveStreamPopularList extends HookConsumerWidget {
  const LiveStreamPopularList({
    super.key,
    required this.controller,
    required this.videoFocusNode,
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusScopeNode = useFocusScopeNode();

    final scrollController = useScrollController();
    final asyncPopularLives = ref.watch(popularLivesControllerProvider);

    useEffect(() {
      scrollController.addListener(() async {
        // -50.0: damping
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - 50.0 &&
            !scrollController.position.outOfRange) {
          await ref.read(popularLivesControllerProvider.notifier).fetchMore();
        }
      });
      return null;
    }, [scrollController]);

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(controlOverlayTimerProvider.notifier).showOverlayAndStartTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
              overlayType: OverlayType.popular,
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
                  overlayType: OverlayType.following,
                );
          },
          DpadAction.arrowDown: () {
            focusScopeNode.unfocus();

            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.category,
                );
          },
          DpadAction.arrowLeft: () {
            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.popular,
                );
          },
          DpadAction.arrowRight: () {
            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.popular,
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
                    const HeaderText(text: '인기 채널'),
                    HomeBaseContainer(
                      child: switch (asyncPopularLives) {
                        AsyncData(:final value) => value == null
                            ? LiveExploreErrorButton(
                                text: '인기 채널을 불러오는 데 실패했습니다',
                                onPressed: () {
                                  ref
                                      .read(
                                          controlOverlayTimerProvider.notifier)
                                      .showOverlayAndStartTimer(
                                        videoFocusNode: videoFocusNode,
                                        seconds: 0,
                                        overlayType: OverlayType.popular,
                                      );
                                },
                              )
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
                                      if (context.mounted) {
                                        if (liveDetail.livePath == null) {
                                          await PopupUtils.showSingleDialog(
                                            context: context,
                                            titleText: '19금 연령 제한',
                                            contentText:
                                                '연령 제한된 콘텐츠는 로그인해야 시청할 수 있습니다',
                                          );
                                        } else {
                                          // controller disappear
                                          ref
                                              .read(controlOverlayTimerProvider
                                                  .notifier)
                                              .showOverlayAndStartTimer(
                                                videoFocusNode: videoFocusNode,
                                                seconds: 0,
                                                overlayType:
                                                    OverlayType.popular,
                                              );

                                          ref
                                              .read(liveStreamControllerProvider
                                                  .notifier)
                                              .playAnotherLive(
                                                context,
                                                controller,
                                                liveDetail,
                                              );
                                        }
                                      }
                                    },
                                  );
                                },
                              ),
                        AsyncError() => LiveExploreErrorButton(
                            text: '인기 채널을 불러오는 데 실패했습니다',
                            onPressed: () {
                              ref
                                  .read(controlOverlayTimerProvider.notifier)
                                  .showOverlayAndStartTimer(
                                    videoFocusNode: videoFocusNode,
                                    seconds: 0,
                                    overlayType: OverlayType.popular,
                                  );
                            },
                          ),
                        _ => const CenterText(text: '인기 채널 불러오는 중...'),
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
}
