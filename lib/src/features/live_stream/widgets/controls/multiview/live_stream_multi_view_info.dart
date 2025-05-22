import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/widgets/channel_widgets.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../streaming/widgets/streaming_widgets.dart';
import '../../../live_stream_state.dart';
import '../main/live_stream_status.dart';

class LiveStreamMultiViewInfo extends ConsumerWidget with LiveStreamState {
  const LiveStreamMultiViewInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlist = getLivePlaylist(ref);
    final asyncLiveStatusList = getLiveStatusList(ref);
    const verticalPadding = 5.0;
    const horizontalPadding = 20.0;

    return StreamOverlayContainer(
      width: double.infinity,
      height: (Dimensions.multiviewInfoHeight + verticalPadding) * 2,
      useTopBorder: true,
      borderRadius: 12.0,
      padding: const EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: asyncLiveStatusList.when(
        data: (statusList) {
          if (statusList == null || statusList.isEmpty) {
            return const SizedBox.shrink();
          }

          return GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: Dimensions.multiviewInfoHeight,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
            ),
            itemCount: statusList.length,
            itemBuilder: (context, index) {
              final liveDetail = playlist[index];
              final status = statusList[index];

              return status == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ChannelNameWithVerifiedMark(
                            channel: liveDetail.channel,
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // title
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    status.liveTitle.replaceAll('\n', ' '),
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: AppColors.whiteColor,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                // status
                                Expanded(
                                  flex: 1,
                                  child: LiveStreamStatus(status: status),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            },
          );
        },
        error: (_, __) => const SizedBox.shrink(),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }
}
