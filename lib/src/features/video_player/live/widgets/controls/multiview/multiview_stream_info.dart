import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/center_widgets.dart';
import '../../../../../live/model/live.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_playlist_controller.dart';
import '../../../controller/live_stream_status_controller.dart';
import '../main/status/live_stream_uptime.dart';

class MultiviewPlayInfo extends ConsumerWidget {
  const MultiviewPlayInfo({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePlaylist = ref.watch(livePlaylistControllerProvider);

    return FocusScope(
      node: controlsFSN,
      child: ControlsOverlayContainer(
        width: double.infinity,
        height: Dimensions.liveStreamMainControlsHeight,
        useTopBorder: true,
        borderRadius: 12.0,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: GridView.builder(
          itemCount: livePlaylist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 35.0,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 5.0,
          ),
          itemBuilder: (context, index) {
            return SimplePlayInfo(liveDetail: livePlaylist[index]);
          },
        ),
      ),
    );
  }
}

class SimplePlayInfo extends ConsumerWidget {
  const SimplePlayInfo({
    super.key,
    required this.liveDetail,
  });

  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLiveStatus = ref.watch(liveStreamStatusControllerProvider(
      channelId: liveDetail.channel.channelId,
    ));

    return switch (asyncLiveStatus) {
      AsyncData(:final value) => value == null
          ? const CenteredText(text: '라이브가 종료되었습니다')
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        liveDetail.channel.channelName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      LiveStreamUptime(
                          strOpenDate:
                              liveDetail.openDate ?? '2024-01-01 00:00:00')
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    value.liveTitle.replaceAll('\n', ' '),
                    style: const TextStyle(
                      fontSize: 11.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
      AsyncError() => const CenteredText(text: '라이브가 종료되었습니다'),
      _ => const SizedBox.shrink(),
    };
  }
}
