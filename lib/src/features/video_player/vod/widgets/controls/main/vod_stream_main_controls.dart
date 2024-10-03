import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/vod_player_controller.dart';
import './vod_playback_time_indicator.dart';
import 'vod_control_buttons.dart';
import './vod_playback_time_slider.dart';

class VodStreamMainControls extends HookConsumerWidget {
  const VodStreamMainControls({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackButtonsFSN = useFocusScopeNode();
    final playbackSliderFSN = useFocusScopeNode();
    final controller = ref.watch(vodPlayerControllerProvider).value;

    return ControlsOverlayContainer(
      width: double.infinity,
      height: Dimensions.vodStreamMainControlsHeight,
      useTopBorder: true,
      borderRadius: 12.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: controller == null
          ? const SizedBox.shrink()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VodPlaybackTimeIndicator(controller: controller),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    children: [
                      VodControlButtons(
                        controller: controller,
                        videoFocusNode: videoFocusNode,
                        controlsFSN: playbackButtonsFSN,
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
