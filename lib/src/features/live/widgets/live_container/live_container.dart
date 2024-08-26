import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/center_widgets.dart';
import '../../../../common/widgets/rounded_container.dart';
import '../../../../common/widgets/focused_widget.dart';
import '../../../../utils/hls_parser/hls_parser.dart';
import '../../../../utils/popup/popup_utils.dart';
import '../../../../utils/router/app_router.dart';
import '../../../channel/model/channel.dart';
import '../../../setting/controller/stream_settings_controller.dart';
import '../../../video_player/live/controller/live_playlist_controller.dart';
import '../../controller/live_controller.dart';
import '../../model/live.dart';

import '../../model/live_stream.dart';
import './live_container_widgets.dart';

class LiveContainer extends ConsumerWidget {
  /// A live streaming container.
  const LiveContainer({
    super.key,
    this.autofocus = false,
    this.focusNode,
    required this.liveInfo,
    required this.channel,
  });

  final bool autofocus;
  final FocusNode? focusNode;

  /// Live stream information.
  final LiveInfo liveInfo;

  /// Some of liveInfo response don't have channel data, so add this.
  final Channel channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RoundedContainer(
      width: Dimensions.videoThumbnailWidth,
      backgroundColor: AppColors.greyContainerColor,
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: () async {
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
          // Get LiveDetail;
          else {
            final liveDetail = await ref
                .read(liveControllerProvider.notifier)
                .getLiveDetail(channelId: channel.channelId);

            if (liveDetail != null && context.mounted) {
              final streamSettings = ref.read(streamSettingsControllerProvider);
              final mediaList = await HlsParser(liveDetail
                      .livePlaybackJson.media[streamSettings.latencyIndex].path)
                  .getMediaPlaylistUrls();

              final List<Uri?> mediaTrackUri = mediaList!;

              final LiveStream liveStream = LiveStream(
                liveDetail: liveDetail,
                uris: mediaTrackUri,
              );

              // reset
              ref.read(livePlaylistControllerProvider.notifier).reset();

              // add playlist
              ref
                  .read(livePlaylistControllerProvider.notifier)
                  .addLive(liveStream: liveStream);

              if (context.mounted) {
                context.pushNamed(AppRoute.liveStreaming.routeName);
              }
            }
            return;
          }
        },
        child: (hasFocus) => liveInfo.channel?.personalData?.privateUserBlock ==
                true
            ? const CenteredText(text: '차단한 유저의 라이브입니다')
            : Column(
                children: [
                  // Top Side
                  SizedBox(
                    width: Dimensions.videoThumbnailWidth,
                    height: Dimensions.videoThumbnailHeight,
                    child: Stack(
                      children: [
                        // Thumbnail image
                        LiveThumbnail(liveInfo: liveInfo),
                        // userCount,
                        LiveStatusContainer(
                            concurrentUserCount: liveInfo.concurrentUserCount),
                        // Uptime
                        if (liveInfo.openDate != null)
                          LiveUptime(strOpenDate: liveInfo.openDate),
                      ],
                    ),
                  ),
                  // Bottom Side
                  Expanded(
                    child: LiveInfoCard(
                      hasFocus: hasFocus ?? false,
                      channel: channel,
                      liveInfo: liveInfo,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
