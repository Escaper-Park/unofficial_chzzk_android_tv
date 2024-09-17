import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/features/video_player/live/controller/live_overlay_controller.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../../common/widgets/dpad_widgets.dart';
import '../../../../../common/widgets/focused_widget.dart';
import '../../../../../utils/popup/popup_utils.dart';
import '../../../../channel/model/channel.dart';
import '../../../../channel/widgets/channel_data/channel_name_with_verified_mark.dart';
import '../../../../live/controller/live_controller.dart';
import '../../../../live/model/live.dart';
import '../../../../live/widgets/live_container/live_thumbnail.dart';
import '../../../common/controls_overlay_container.dart';
import '../../controller/live_mode_controller.dart';
import '../../controller/live_player_controller.dart';
import '../../controller/live_playlist_controller.dart';
import './live_stream_user_count_and_category.dart';

class LiveStreamContainer extends ConsumerWidget {
  const LiveStreamContainer({
    super.key,
    required this.autofocus,
    required this.focusNode,
    required this.videoFocusNode,
    required this.liveInfo,
    required this.channel,
  });

  final bool autofocus;
  final FocusNode focusNode;
  final FocusNode videoFocusNode;
  final LiveInfo liveInfo;
  final Channel channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final concurrentUserCount = liveInfo.concurrentUserCount;

    // warp the DpadAction widget with sizedBox to calculate with the border width.
    // Check the scroll controller in [DpadHorizontalListViewContainer].
    return SizedBox(
      height: Dimensions.liveStreamContentsContainerHeight,
      width: Dimensions.liveStreamThumbnailWidth,
      child: DpadActionWidget(
        autofocus: autofocus,
        focusNode: focusNode,
        useFocusedBorder: true,
        useKeyRepeatEvent: false,
        dpadActionCallbacks: {
          DpadAction.select: () async {
            if (liveInfo.channel?.personalData?.privateUserBlock == true) {
              return;
            }
            // Adult restriction
            if (liveInfo.adult! && liveInfo.liveImageUrl == null) {
              if (context.mounted) {
                await PopupUtils.showButtonDialog(
                  context: context,
                  titleText: '시청 제한 안내',
                  contentText:
                      '사용자 보호를 위해 연령 제한이 설정된 라이브입니다.\n시청을 원하면 로그인 후 본인 인증을 완료해주세요.',
                );
              }
              return;
            }

            // get live detail
            final liveDetail = await ref
                .read(liveControllerProvider.notifier)
                .getLiveDetail(channelId: channel.channelId);

            if (liveDetail != null && context.mounted) {
              // check already playing
              final bool isContains = ref
                  .read(livePlaylistControllerProvider.notifier)
                  .checkIsContains(liveDetail: liveDetail);

              // already playing
              if (isContains) return;

              if (liveDetail.livePlaybackJson.media.isEmpty) {
                await PopupUtils.showButtonDialog(
                  context: context,
                  titleText: '종료된 방송',
                  contentText: '종료된 방송입니다. 방송 목록을 새로고침 해주세요.',
                );
                return;
              }

              final screenMode = ref.read(liveModeControllerProvider);

              // Single view
              if (screenMode == LiveMode.singleView) {
                // reset
                ref.read(livePlaylistControllerProvider.notifier).reset();
                // add live
                ref
                    .read(livePlaylistControllerProvider.notifier)
                    .addLive(liveDetail: liveDetail);

                if (context.mounted) {
                  ref
                      .read(
                          singleLivePlayerControllerProvider(index: 0).notifier)
                      .changeSource();
                }
              }
              // Multi view
              else {
                final liveCount =
                    ref.read(livePlaylistControllerProvider).length;

                // Max count is 4.
                if (liveCount >= 4 && context.mounted) {
                  ref
                      .read(liveOverlayControllerProvider.notifier)
                      .changeOverlay(
                        seconds: 6000, // keep focus
                        overlayType: LiveOverlayType.main,
                        videoFocusNode: videoFocusNode,
                      );

                  await PopupUtils.showWidgetDialog(
                    context: context,
                    titleText: '멀티뷰 개수 제한',
                    content: (dialogContext) => MultiviewReplaceDialog(
                      videoFocusNode: videoFocusNode,
                      dialogContext: dialogContext,
                      newLiveDetail: liveDetail,
                    ),
                  );
                  return;
                }

                ref
                    .read(livePlaylistControllerProvider.notifier)
                    .addLive(liveDetail: liveDetail);
              }
            }
          },
        },
        child: Stack(
          children: [
            // Thumbnail
            LiveThumbnail(
              liveInfo: liveInfo,
              imageHeight: Dimensions.liveStreamThumbnailHeight,
              imageWidth: Dimensions.liveStreamThumbnailWidth,
            ),
            // Live Status
            LiveStreamUserCountAndCategory(
              concurrentUserCount: concurrentUserCount,
              liveCategoryValue: liveInfo.liveCategoryValue,
            ),
            // Title
            ControlsOverlayContainer(
              height: 45.0,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              backgroundColor: AppColors.blackColor,
              borderRadius: 12.0,
              backgroundOpacity: 0.5,
              useTopBorder: false,
              useBottomBorder: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    CircleAvatarProfileImage(
                      profileImageUrl: channel.channelImageUrl,
                      radius: 15.0,
                      useBorder: true,
                      borderWidth: 1.5,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChannelNameWithVerifiedMark(
                            channel: channel,
                            fontColor: AppColors.whiteColor,
                            fontSize: 12.0,
                          ),
                          Text(
                            liveInfo.liveTitle?.replaceAll('\n', '') ?? ' ',
                            style: const TextStyle(
                              fontSize: 11.0,
                              color: AppColors.whiteColor,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiviewReplaceDialog extends ConsumerWidget {
  const MultiviewReplaceDialog({
    super.key,
    required this.videoFocusNode,
    required this.dialogContext,
    required this.newLiveDetail,
  });

  final FocusNode videoFocusNode;
  final BuildContext dialogContext;
  final LiveDetail newLiveDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePlaylist = ref.watch(livePlaylistControllerProvider);

    return SizedBox(
      width: Dimensions.multiviewLimitPopupDialogSize.width,
      height: Dimensions.multiviewLimitPopupDialogSize.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '교체할 영상을 선택해주세요',
            style: TextStyle(
              fontSize: 14.0,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                mainAxisExtent: 80.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                final liveDetail = livePlaylist[index];

                return FocusedOutlinedButton(
                  autofocus: index == 0,
                  padding: const EdgeInsets.all(10.0),
                  onPressed: () {
                    // replace video

                    // change live playlist source
                    ref
                        .read(livePlaylistControllerProvider.notifier)
                        .changeSource(index: index, liveDetail: newLiveDetail);

                    // change video controller's source
                    ref
                        .read(singleLivePlayerControllerProvider(index: index)
                            .notifier)
                        .changeSource();

                    ref
                        .read(liveOverlayControllerProvider.notifier)
                        .changeOverlay(
                          overlayType: LiveOverlayType.none,
                          videoFocusNode: videoFocusNode,
                        );

                    Navigator.pop(dialogContext);
                  },
                  child: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatarProfileImage(
                        profileImageUrl: liveDetail.channel.channelImageUrl,
                        radius: 20.0,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(liveDetail.channel.channelName),
                            Expanded(
                              child: Text(
                                liveDetail.liveTitle ?? ' ',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: AppColors.whiteColor,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
