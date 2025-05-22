import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../live/model/live_detail.dart';
import '../../../../live/model/live_status.dart';
import '../../../../live/widgets/live_widgets.dart';
import '../../../../streaming/widgets/streaming_widgets.dart';
import '../../../live_stream_state.dart';
import 'live_stream_status.dart';

class LiveStreamSingleInfo extends ConsumerWidget with LiveStreamState {
  const LiveStreamSingleInfo({super.key, required this.liveDetail});

  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLiveStatus = getLiveStatusList(ref);

    return asyncLiveStatus.when(
      data: (status) {
        if (status == null) return const SizedBox.shrink();

        final LiveStatus singleStatus = status.first!;

        return StreamInfoContainer(
          streamInfoDetail: StreamInfoDetail(
            isLive: true,
            channel: liveDetail.channel,
            profileImageUrl: liveDetail.channel.channelImageUrl,
            videoTitle: status.first!.liveTitle,
            tagsWidget: LiveTagsAll(
              categoryValue: singleStatus.liveCategoryValue,
              watchPartyTag: singleStatus.watchPartyTag,
              tags: singleStatus.tags,
            ),
            statusWidget: LiveStreamStatus(status: singleStatus),
          ),
        );
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
