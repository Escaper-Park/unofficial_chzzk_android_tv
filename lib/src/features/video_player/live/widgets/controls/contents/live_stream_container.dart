import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../../../utils/hls_parser/hls_parser.dart';
import '../../../../../../utils/popup/popup_utils.dart';
import '../../../../../channel/model/channel.dart';
import '../../../../../channel/widgets/channel_data/channel_name_with_verified_mark.dart';
import '../../../../../live/controller/live_controller.dart';
import '../../../../../live/model/live.dart';
import '../../../../../live/model/live_stream.dart';
import '../../../../../live/widgets/live_container/live_thumbnail.dart';
import '../../../../../setting/controller/stream_settings_controller.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_player_controller.dart';
import '../../../controller/live_playlist_controller.dart';
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
    final currentScreenMode = ref.watch(livePlayerScreenModeControllerProvider);
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
              final streamSettings = ref.read(streamSettingsControllerProvider);
              final mediaList = await HlsParser(liveDetail
                      .livePlaybackJson.media[streamSettings.latencyIndex].path)
                  .getMediaPlaylistUrls();

              // Multiview
              if (currentScreenMode == LivePlayerScreenMode.multiview) {
                // Check playlist length and show popup if lenght > 4
                final liveCount = ref
                    .read(livePlaylistControllerProvider.notifier)
                    .getLiveCount();

                if (liveCount >= 4 && context.mounted) {
                  await PopupUtils.showButtonDialog(
                    context: context,
                    titleText: '멀티뷰 개수 제한',
                    contentText: '최대 4개까지 재생할 수 있습니다.',
                  );
                  return;
                }

                final List<Uri?> mediaTrackUris = mediaList!;

                final LiveStream liveStream = LiveStream(
                  liveDetail: liveDetail,
                  uris: mediaTrackUris,
                );

                ref
                    .read(livePlaylistControllerProvider.notifier)
                    .addLive(liveStream: liveStream);
              }
              // singleView
              else {
                final List<Uri?> mediaTrackUris = mediaList!;

                final LiveStream liveStream = LiveStream(
                  liveDetail: liveDetail,
                  uris: mediaTrackUris,
                );

                // reset
                ref.read(livePlaylistControllerProvider.notifier).reset();

                // add playlist
                ref
                    .read(livePlaylistControllerProvider.notifier)
                    .addLive(liveStream: liveStream);

                if (context.mounted) {
                  ref
                      .read(livePlayerControllerProvider.notifier)
                      .playAnotherLive(context: context);
                }
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
            ),
          ],
        ),
      ),
    );
  }
}
