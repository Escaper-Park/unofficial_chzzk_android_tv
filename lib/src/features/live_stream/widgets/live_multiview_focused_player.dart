import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../live/model/live_detail.dart';
import '../live_stream_state.dart';

class LiveMultiviewFocusedPlayer extends ConsumerWidget with LiveStreamState {
  const LiveMultiviewFocusedPlayer({
    super.key,
    required this.currentActivatedLiveIndex,
    required this.singleLivePlayer,
    required this.chatStream,
  });

  final int currentActivatedLiveIndex;
  final Widget Function(int index) singleLivePlayer;
  final Widget Function(LiveDetail liveDetail) chatStream;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveDetails = getLivePlaylist(ref);
    final liveCount = liveDetails.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Focused screen
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: singleLivePlayer(currentActivatedLiveIndex),
              ),
              Expanded(
                flex: 1,
                child: chatStream(liveDetails[currentActivatedLiveIndex]),
              ),
            ],
          ),
        ),
        // Others
        Expanded(
          flex: 1,
          child: ListView.builder(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            addSemanticIndexes: false,
            shrinkWrap: false,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: liveCount,
            itemBuilder: (context, index) {
              if (index == currentActivatedLiveIndex) {
                return const SizedBox.shrink();
              }

              return SizedBox(
                width: context.screenWidth / 3,
                child: singleLivePlayer(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
