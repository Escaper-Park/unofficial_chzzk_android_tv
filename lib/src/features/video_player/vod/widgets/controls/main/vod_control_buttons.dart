import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../../setting/controller/stream_settings_controller.dart';
import '../../../../common/control_icon.dart';
import '../../../controller/vod_mode_controller.dart';
import '../../../controller/vod_overlay_controller.dart';
import '../../../controller/vod_player_controller.dart';
import '../../../controller/vod_playlist_controller.dart';
import 'vod_stream_following_button.dart';

class VodControlButtons extends HookConsumerWidget {
  /// Video playback buttons with a FocusScope navigator.
  const VodControlButtons({
    super.key,
    required this.controller,
    required this.videoFocusNode,
    required this.controlsFSN,
    required this.playbackSliderFSN,
  });

  final VideoPlayerController controller;
  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;
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

    final List<Widget> items = [
      // rewind
      _controlIconButton(
        ref: ref,
        iconData: playbackIconData.$1,
        label: '되감기',
        onPressed: () async {
          await ref.read(vodPlayerControllerProvider.notifier).seekToByButton(
                videoFocusNode: videoFocusNode,
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
        label: isPlaying.value ? '일시정지' : '재생',
        onPressed: () {
          isPlaying.value ? controller.pause() : controller.play();
          isPlaying.value = !isPlaying.value;
        },
      ),
      // fast forward
      _controlIconButton(
        ref: ref,
        iconData: playbackIconData.$2,
        label: '빨리감기',
        onPressed: () async {
          await ref.read(vodPlayerControllerProvider.notifier).seekToByButton(
                videoFocusNode: videoFocusNode,
                direction: PlaybackDirection.forward,
              );
        },
      ),
      // show chat
      _controlIconButton(
        ref: ref,
        iconData: Icons.chat_rounded,
        label: '채팅',
        onPressed: () {
          ref
              .read(vodChatWindowModeControllerProvider.notifier)
              .toggleOverlayChat();
        },
      ),
      // toggle side chat
      _controlIconButton(
        ref: ref,
        iconData: Icons.settings_overscan_rounded,
        label: '화면크기',
        onPressed: () {
          ref
              .read(vodChatWindowModeControllerProvider.notifier)
              .toggleViewMode();
        },
      ),
      // chat settings
      _controlIconButton(
        ref: ref,
        iconData: Icons.mark_chat_read_rounded,
        label: '채팅설정',
        onPressed: () {
          ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                overlayType: VodOverlayType.chatSettings,
                videoFocusNode: videoFocusNode,
              );
        },
      ),
      // quality settings
      _controlIconButton(
        ref: ref,
        iconData: Icons.display_settings_rounded,
        label: '화질설정',
        onPressed: () {
          ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                overlayType: VodOverlayType.resolutionSettings,
                videoFocusNode: videoFocusNode,
              );
        },
      ), // following buttons
      Consumer(
        builder: (context, ref, child) {
          final vod = ref.read(vodPlaylistControllerProvider)!.$1;

          return VodStreamFollowingButton(
            channel: vod.channel,
            videoFocusNode: videoFocusNode,
            controlsFSN: controlsFSN,
            playbackSliderFSN: playbackSliderFSN,
          );
        },
      ),
    ];

    return ControlsNavigator(
      node: controlsFSN,
      dpadKeyFocusScopeNodeMap: {DpadAction.arrowDown: playbackSliderFSN},
      items: items,
    );
  }

  ControlIconButton _controlIconButton({
    required WidgetRef ref,
    required IconData iconData,
    required VoidCallback onPressed,
    required String label,
    bool autofocus = false,
  }) {
    return ControlIconButton(
      autofocus: autofocus,
      padding: const EdgeInsets.all(5.0),
      iconData: iconData,
      iconSize: 25.0,
      label: label,
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
