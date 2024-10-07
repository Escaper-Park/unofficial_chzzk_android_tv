import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../setting/controller/stream_settings_controller.dart';
import '../../../../common/chat/chat_window_mode.dart';
import '../../../controller/vod_mode_controller.dart';
import '../../../controller/vod_player_controller.dart';

class VodSeekIndicatorIcon extends ConsumerWidget {
  const VodSeekIndicatorIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSeekIcon = ref.watch(vodSeekIndicatorProvider);
    final screenSize = MediaQuery.of(context).size;

    final playbackIntervalIndex = ref.watch(streamSettingsControllerProvider
        .select((value) => value.vodPlaybackIntervalIndex));

    // (replay, forward) icons
    final (IconData, IconData) playbackIconData =
        switch (playbackIntervalIndex) {
      0 => (Icons.replay_5_rounded, Icons.forward_5_rounded),
      1 => (Icons.replay_10_rounded, Icons.forward_10_rounded),
      2 => (Icons.replay_30_rounded, Icons.forward_30_rounded),
      _ => (Icons.replay_rounded, Icons.fast_forward_rounded),
    };

    final playbackDirection =
        ref.read(vodSeekIndicatorProvider.notifier).getCurrentDirection();

    final iconData = playbackDirection == PlaybackDirection.backword
        ? playbackIconData.$1
        : playbackIconData.$2;

    final chatWindowMode = ref.watch(vodChatWindowModeControllerProvider);

    double left;
    // Side Chat
    if (chatWindowMode == ChatWindowMode.side) {
      final videoWidth = screenSize.width / 4 * 3;
      left = playbackDirection == PlaybackDirection.backword
          ? videoWidth / 4
          : videoWidth / 4 * 3;
    }
    // Full
    else {
      left = playbackDirection == PlaybackDirection.backword
          ? screenSize.width / 4
          : screenSize.width / 4 * 3;
    }

    return showSeekIcon
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
