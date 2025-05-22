import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/enums.dart'
    show ChatWindowMode, PlaybackDirection;
import '../vod_stream_event.dart';
import '../vod_stream_state.dart';

class VodSeekIndicator extends ConsumerWidget
    with VodStreamEvent, VodStreamState {
  const VodSeekIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showSeekIndicator = getShowSeekIndicatorState(ref);
    final int playbackIntervalIndex = getPlaybackIntervalIndex(ref);
    final screenSize = MediaQuery.of(context).size;

    // (replay, forward) icons
    final (IconData, IconData) playbackIconData =
        switch (playbackIntervalIndex) {
      0 => (Icons.replay_5_rounded, Icons.forward_5_rounded),
      1 => (Icons.replay_10_rounded, Icons.forward_10_rounded),
      2 => (Icons.replay_30_rounded, Icons.forward_30_rounded),
      _ => (Icons.replay_rounded, Icons.fast_forward_rounded),
    };

    final playbackDirection = getPlaybackDirection(ref);

    final iconData = playbackDirection == PlaybackDirection.backward
        ? playbackIconData.$1
        : playbackIconData.$2;

    final chatWindowMode = getChatWindowMode(ref);

    double left;
    // Side Chat
    if (chatWindowMode == ChatWindowMode.side) {
      final videoWidth = screenSize.width / 4 * 3;
      left = playbackDirection == PlaybackDirection.backward
          ? videoWidth / 4
          : videoWidth / 4 * 3;
    }
    // Full
    else {
      left = playbackDirection == PlaybackDirection.backward
          ? screenSize.width / 4
          : screenSize.width / 4 * 3;
    }

    return showSeekIndicator
        ? Positioned(
            top: screenSize.height / 2,
            left: left,
            child: Icon(
              iconData,
              size: 50.0,
            ),
          )
        : const SizedBox.shrink();
  }
}
