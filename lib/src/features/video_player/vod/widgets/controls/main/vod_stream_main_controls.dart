import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../vod/model/vod.dart';
import '../../../../common/controls_overlay_container.dart';
import './vod_playback_time_indicator.dart';
import './vod_playback_buttons.dart';
import './vod_playback_time_slider.dart';

class VodStreamMainControls extends HookWidget {
  const VodStreamMainControls({
    super.key,
    required this.controller,
    required this.videoFocusNode,
    required this.vod,
  });

  final VideoPlayerController controller;
  final FocusNode videoFocusNode;
  final Vod vod;

  @override
  Widget build(BuildContext context) {
    final playbackButtonsFSN = useFocusScopeNode();
    final playbackSliderFSN = useFocusScopeNode();

    return ControlsOverlayContainer(
      width: double.infinity,
      height: Dimensions.vodStreamMainControlsHeight,
      useTopBorder: true,
      borderRadius: 12.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VodPlaybackTimeIndicator(controller: controller),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              children: [
                VodPlaybackButtons(
                  controller: controller,
                  videoFocusNode: videoFocusNode,
                  playbackButtonsFSN: playbackButtonsFSN,
                  playbackSliderFSN: playbackSliderFSN,
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: VodPlaybackTimeSlider(
                    controller: controller,
                    videoFocusNode: videoFocusNode,
                    playbackButtonsFSN: playbackButtonsFSN,
                    playbackSliderFSN: playbackSliderFSN,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
