import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/constants/dimensions.dart';
import '../../../../../../../common/constants/styles.dart';
import '../../../../../../../common/widgets/center_widgets.dart';
import '../../../../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../../../channel/widgets/channel_data/channel_name_with_verified_mark.dart';
import '../../../../../../live/widgets/live_container/live_info_card.dart';
import '../../../../../common/controls_overlay_container.dart';
import '../../../../controller/live_playlist_controller.dart';
import '../../../../controller/live_stream_status_controller.dart';
import 'live_stream_status.dart';
import 'live_stream_uptime.dart';

class LiveStreamInfo extends ConsumerWidget {
  const LiveStreamInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveDetail = ref.watch(livePlaylistControllerProvider).first;

    final asyncLiveStatus = ref.watch(liveStreamStatusControllerProvider(
      channelId: liveDetail.channel.channelId,
    ));

    return ControlsOverlayContainer(
      alignment: Alignment.topLeft,
      height: Dimensions.liveStreamInfoContainerHeight,
      backgroundColor: AppColors.blackColor,
      backgroundOpacity: 0.7,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      borderRadius: 12.0,
      useTopBorder: true,
      useBottomBorder: true,
      child: IntrinsicWidth(
        child: switch (asyncLiveStatus) {
          AsyncData(:final value) => value == null
              ? const CenteredText(text: '라이브 정보를 불러올 수 없습니다')
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile image
                    CircleAvatarProfileImage(
                      profileImageUrl: liveDetail.channel.channelImageUrl,
                      useBorder: true,
                      radius: 22.5,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Channel name
                          ChannelNameWithVerifiedMark(
                            channel: liveDetail.channel,
                            fontSize: 12.0,
                            fontColor: AppColors.whiteColor,
                          ),
                          const SizedBox(height: 3.0),
                          LiveStreamTitle(liveTitle: value.liveTitle),
                          const SizedBox(height: 3.0),
                          Row(
                            children: [
                              LiveTagBadge(tag: value.liveCategoryValue),
                              LiveTags(tags: value.tags),
                            ],
                          ),
                          const SizedBox(height: 3.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LiveStreamConcurrentUserCount(
                                  concurrentUserCount:
                                      value.concurrentUserCount),
                              LiveStreamUptime(
                                  strOpenDate: liveDetail.openDate ??
                                      '2024-01-01 00:00:00'),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
          AsyncError() => const CenteredText(text: '라이브 정보를 불러올 수 없습니다'),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}
