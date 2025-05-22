import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../streaming/widgets/navigator/stream_navigator.dart';
import '../../../../vod/model/vod.dart';
import '../../../vod_stream_event.dart';
import '../../../vod_stream_state.dart';
import 'vod_stream_channel_vod_container.dart';

class VodStreamChannelDataControl extends ConsumerWidget
    with VodStreamState, VodStreamEvent {
  const VodStreamChannelDataControl({
    super.key,
    required this.vod,
    required this.videoFocusNode,
    required this.contentsFSN,
  });

  final Vod? vod;
  final FocusNode videoFocusNode;
  final FocusScopeNode contentsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return vod == null
        ? const SizedBox.shrink()
        : StreamNavigatorWithContents<Vod>(
            headerText: '${vod!.channel!.channelName} 채널의 동영상',
            resetOverlayTimer: () =>
                resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
            asyncValue: getChannelVod(ref, channel: vod!.channel!),
            listViewFSN: contentsFSN,
            useFetchMore: true,
            fetchMore: () async =>
                channelVodFetchMore(ref, channel: vod!.channel!),
            emptyText: '${vod!.channel!.channelName} 채널에 동영상이 없습니다',
            errorText: '${vod!.channel!.channelName} 채널의 동영상을 불러올 수 없습니다',
            itemBuilder: (index, node, item) {
              return VodStreamChannelVodContainer(
                autofocus: index == 0,
                focusNode: node,
                vod: item,
                changeSource: (newVod) async {
                  final currentVod = getVod(ref);

                  if (currentVod!.videoNo != newVod.videoNo) {
                    await changeSource(ref, vod: newVod);
                  }
                },
              );
            },
          );
  }
}
