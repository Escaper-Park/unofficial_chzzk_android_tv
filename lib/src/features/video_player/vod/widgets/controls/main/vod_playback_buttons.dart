import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../../setting/controller/stream_settings_controller.dart';
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
    final isPlaying = useState<bool>(controller.value.isPlaying);
    final streamSettings = ref.watch(streamSettingsControllerProvider);

    // (replay, forward) icons
    final (IconData, IconData) playbackIconData =
        switch (streamSettings.vodPlaybackIntervalIndex) {
      0 => (Icons.replay_5_rounded, Icons.forward_5_rounded),
      1 => (Icons.replay_10_rounded, Icons.forward_10_rounded),
      2 => (Icons.replay_30_rounded, Icons.forward_30_rounded),
      _ => (Icons.replay_rounded, Icons.fast_forward_rounded),
    };

    final List<ControlIconButton> items = [
      // rewind
      _controlIconButton(
        ref: ref,
        iconData: playbackIconData.$1,
        onPressed: () {
          ref.read(vodPlayerControllerProvider.notifier).seekTo(
                videoFocusNode: videoFocusNode,
                controller: controller,
                direction: PlaybackDirection.backword,
              );
        },
      ),
      // play, pause
      _controlIconButton(
        autofocus: true,
        ref: ref,
        iconData:
            isPlaying.value ? Icons.pause_rounded : Icons.play_arrow_rounded,
        onPressed: () {
          isPlaying.value ? controller.pause() : controller.play();
          isPlaying.value = !isPlaying.value;
        },
      ),
      // fast forward
      _controlIconButton(
        ref: ref,
        iconData: playbackIconData.$2,
        onPressed: () {
          ref.read(vodPlayerControllerProvider.notifier).seekTo(
                videoFocusNode: videoFocusNode,
                controller: controller,
                direction: PlaybackDirection.forward,
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

  ControlIconButton _controlIconButton({
    required WidgetRef ref,
    required IconData iconData,
    required VoidCallback onPressed,
    bool autofocus = false,
  }) {
    return ControlIconButton(
      autofocus: autofocus,
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      iconData: iconData,
      useKeyRepeatEvent: true,
      resetOverlayTimer: () {
        ref.read(vodOverlayControllerProvider.notifier).resetOverlayTimer(
              videoFocusNode: videoFocusNode,
            );
      },
      onPressed: onPressed,
    );
  }
}
