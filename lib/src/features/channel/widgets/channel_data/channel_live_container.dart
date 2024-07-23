import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/widgets/center_widgets.dart';
import '../../../../common/widgets/header_text.dart';
import '../../../../common/widgets/dpad_widgets.dart';
import '../../../live/model/live.dart';
import '../../../live/widgets/live_container/live_container.dart';
import '../../controller/channel_controller.dart';
import '../../model/channel.dart';

class ChannelLiveContainer extends ConsumerWidget {
  /// If channel is broadcasting,
  const ChannelLiveContainer({
    super.key,
    required this.channel,
    required this.channelLiveFSN,
    required this.channelListFSN,
    required this.aboveFSN,
    required this.belowFSN,
  });

  final Channel channel;
  final FocusScopeNode channelLiveFSN;
  final FocusScopeNode channelListFSN;
  final FocusScopeNode aboveFSN;
  final FocusScopeNode belowFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLiveDetail =
        ref.watch(channelLiveControllerProvider(channelId: channel.channelId));

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const HeaderText(
            text: '라이브 방송',
            horizontalPadding: 0.0,
          ),
          //
          SizedBox(
            height: Dimensions.videoContainerHeight,
            child: switch (asyncLiveDetail) {
              AsyncData(:final value) => value == null
                  ? const Text('라이브를 불러올 수 없습니다')
                  : DpadFocusScopeNavigator(
                      node: channelLiveFSN,
                      dpadKeyFocusScopeNodeMap: {
                        DpadAction.arrowLeft: channelListFSN,
                        DpadAction.arrowUp: aboveFSN,
                        DpadAction.arrowDown: belowFSN,
                      },
                      // Generate LiveInfo from LiveDetail
                      child: LiveContainer(
                        autofocus: true,
                        liveInfo: LiveInfo(
                          liveId: value.liveId,
                          liveImageUrl: value.liveImageUrl,
                          defaultThumbnailImageUrl:
                              value.defaultThumbnailImageUrl,
                          liveTitle: value.liveTitle,
                          concurrentUserCount: value.concurrentUserCount,
                          categoryType: value.categoryType,
                          liveCategory: value.liveCategory,
                          liveCategoryValue: value.liveCategoryValue,
                          adult: value.adult,
                          tags: value.tags,
                          openDate: value.openDate,
                          accumulateCount: value.accumulateCount,
                          blindType: value.blindType,
                          channel: channel,
                        ),
                        channel: channel,
                      ),
                    ),
              AsyncError() => const CenteredText(text: '라이브를 불러올 수 없습니다'),
              _ => const SizedBox.shrink(),
            },
          )
        ],
      ),
    );
  }
}
