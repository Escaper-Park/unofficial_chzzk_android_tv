import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/center_text.dart';
import '../../../../../common/widgets/focused_outline_button.dart';
import '../../../../../common/widgets/header_text.dart';
import '../../../../../features/home/widgets/home_base_container.dart';
import '../../../../../features/live/controller/live_controller.dart';
import '../../../../../features/live/widgets/live_container.dart';
import '../../../../focus/dpad_widget.dart';
import '../../../../popup/popup_utils.dart';
import '../../../controller/live_stream_controller.dart';
import '../../../controller/network_video_controller.dart';

class LiveStreamFollowingList extends HookConsumerWidget {
  const LiveStreamFollowingList({
    super.key,
    required this.controller,
    required this.videoFocusNode,
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusScopeNode = useFocusScopeNode();

    final asyncFollowingLives = ref.watch(followingLiveControllerProvider);

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(controlOverlayTimerProvider.notifier).showOverlayAndStartTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
              overlayType: OverlayType.following,
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
                  overlayType: OverlayType.category,
                );
          },
          DpadAction.arrowDown: () {
            focusScopeNode.unfocus();

            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.popular,
                );
          },
          DpadAction.arrowLeft: () {
            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.following,
                );
          },
          DpadAction.arrowRight: () {
            ref
                .read(controlOverlayTimerProvider.notifier)
                .showOverlayAndStartTimer(
                  videoFocusNode: videoFocusNode,
                  overlayType: OverlayType.following,
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
                    const HeaderText(text: '팔로잉 라이브 채널'),
                    HomeBaseContainer(
                      child: switch (asyncFollowingLives) {
                        AsyncData(:final value) => (value == null ||
                                value.isEmpty)
                            ? FocusedOutlineButton(
                                autofocus: true,
                                onPressed: () {
                                  ref
                                      .read(
                                          controlOverlayTimerProvider.notifier)
                                      .showOverlayAndStartTimer(
                                        videoFocusNode: videoFocusNode,
                                        seconds: 0,
                                        overlayType: OverlayType.following,
                                      );
                                },
                                child: const CenterText(
                                  text: '팔로잉 채널이 없습니다',
                                ),
                              )
                            : ListView.builder(
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
                        AsyncError() => FocusedOutlineButton(
                            autofocus: true,
                            onPressed: () {
                              ref
                                  .read(controlOverlayTimerProvider.notifier)
                                  .showOverlayAndStartTimer(
                                    videoFocusNode: videoFocusNode,
                                    seconds: 0,
                                    overlayType: OverlayType.following,
                                  );
                            },
                            child:
                                const CenterText(text: '팔로잉 채널을 불러오는데 실패했습니다'),
                          ),
                        _ => const CenterText(
                            text: '팔로잉 채널 불러오는 중...',
                          ),
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
