import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../common/control_icon.dart';
import '../../../controller/vod_player_controller.dart';

class VodPlaybackButtons extends HookConsumerWidget {
  /// Video playback buttons with a FocusScope navigator.
  const VodPlaybackButtons({
    super.key,
    required this.controller,
    required this.videoFocusNode,
    required this.playbackButtonsFSN,
    required this.playbackSliderFSN,
  });

  final VideoPlayerController controller;
  final FocusNode videoFocusNode;
  final FocusScopeNode playbackButtonsFSN;
  final FocusScopeNode playbackSliderFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int interval = 10;
    final isPlaying = useState<bool>(controller.value.isPlaying);

    final List<ControlIcon> items = [
      // rewind
      ControlIcon(
        iconData: Icons.replay_10_rounded,
        onPressed: () {
          ref.read(vodPlayerControllerProvider.notifier).seekTo(
                videoFocusNode: videoFocusNode,
                controller: controller,
                direction: PlaybackDirection.backword,
                interval: interval,
              );
        },
      ),
      // play, pause
      ControlIcon(
        autofocus: true,
        iconData:
            isPlaying.value ? Icons.pause_rounded : Icons.play_arrow_rounded,
        onPressed: () {
          isPlaying.value ? controller.pause() : controller.play();
          isPlaying.value = !isPlaying.value;
        },
      ),
      // fast forward
      ControlIcon(
        iconData: Icons.forward_10_rounded,
        onPressed: () {
          ref.read(vodPlayerControllerProvider.notifier).seekTo(
                videoFocusNode: videoFocusNode,
                controller: controller,
                direction: PlaybackDirection.forward,
                interval: interval,
              );
        },
      ),
    ];

    return ControlsNavigator(
      node: playbackButtonsFSN,
      dpadKeyFocusScopeNodeMap: {DpadAction.arrowDown: playbackSliderFSN},
      items: items,
    );
  }
}
