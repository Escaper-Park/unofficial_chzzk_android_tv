import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../common/dpad_slider.dart';
import '../../../controller/vod_overlay_controller.dart';
import '../../../controller/vod_player_controller.dart';

class VodPlaybackTimeSlider extends ConsumerWidget {
  const VodPlaybackTimeSlider({
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
    return DpadSlider(
      controller: controller,
      sliderFSN: playbackSliderFSN,
      dpadKeyFocusScopeNodeMap: {DpadAction.arrowUp: playbackButtonsFSN},
      minValue: 0.0,
      maxValue: controller.value.duration.inSeconds.toDouble(),
      initialValue: controller.value.position.inSeconds.toDouble(),
      updateSliderEverySecond: true,
      keyRepeatEndCallback: (String keyLabel) {
        final direction = keyLabel == "Arrow Left"
            ? PlaybackDirection.backword
            : PlaybackDirection.forward;

        ref.read(vodPlayerControllerProvider.notifier).updateChat(direction);
      },
      sliderMoveCallback: (position) {
        ref
            .read(vodPlayerControllerProvider.notifier)
            .seekToBySlider(duration: Duration(seconds: position.toInt()));
      },
      resetTimerCallback: () {
        ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
              overlayType: VodOverlayType.main,
              videoFocusNode: videoFocusNode,
            );
      },
    );
  }
}
