import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../../../../../common/constants/enums.dart'
    show DpadAction, PlaybackDirection;
import '../../../../../common/widgets/dpad/dpad_widgets.dart';
import '../../../../settings/model/stream_settings.dart';
import '../../../../streaming/widgets/control/stream_control_icon_button.dart';
import '../../../../vod/model/vod.dart';
import 'vod_stream_following_button.dart';

class VodStreamControlButtons extends HookWidget {
  const VodStreamControlButtons({
    super.key,
    required this.streamSettings,
    required this.controller,
    required this.vod,
    required this.videoFocusNode,
    required this.controlsFSN,
    required this.playbackSliderFSN,
    required this.resetOverlayTimer,
    required this.toStart,
    required this.seekToByButton,
    required this.toggleOverlayChat,
    required this.toggleViewMode,
    required this.changeOverlayToChatSettings,
    required this.changeOverlayToResolutionSetting,
  });

  final StreamSettings streamSettings;
  final VideoPlayerController controller;
  final Vod? vod;
  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;
  final FocusScopeNode playbackSliderFSN;
  final VoidCallback resetOverlayTimer;
  final VoidCallback toStart;
  final void Function(PlaybackDirection direction) seekToByButton;
  final VoidCallback toggleOverlayChat;
  final VoidCallback toggleViewMode;
  final VoidCallback changeOverlayToChatSettings;
  final VoidCallback changeOverlayToResolutionSetting;

  @override
  Widget build(BuildContext context) {
    // (replay, forward) icons
    final (IconData, IconData) playbackIconData =
        switch (streamSettings.vodPlaybackIntervalIndex) {
      0 => (Icons.replay_5_rounded, Icons.forward_5_rounded),
      1 => (Icons.replay_10_rounded, Icons.forward_10_rounded),
      2 => (Icons.replay_30_rounded, Icons.forward_30_rounded),
      _ => (Icons.replay_rounded, Icons.fast_forward_rounded),
    };

    final isPlayingState = useState<bool>(controller.value.isPlaying);

    final List<Widget> items = [
      // rewind
      _controlIconButton(
        Icons.first_page_rounded,
        '처음으로',
        () => toStart(),
      ),
      _controlIconButton(
        playbackIconData.$1,
        '되감기',
        () => seekToByButton(PlaybackDirection.backward),
      ),
      // play, pause
      _controlIconButton(
        autofocus: true,
        isPlayingState.value ? Icons.pause_rounded : Icons.play_arrow_rounded,
        isPlayingState.value ? '일시정지' : '재생',
        () {
          isPlayingState.value ? controller.pause() : controller.play();
          isPlayingState.value = !isPlayingState.value;
        },
      ),
      // fast forward
      _controlIconButton(
        playbackIconData.$2,
        '빨리감기',
        () => seekToByButton(PlaybackDirection.forward),
      ),
      // show chat
      _controlIconButton(
        Icons.chat_rounded,
        '채팅',
        toggleOverlayChat,
      ),
      // toggle side chat
      _controlIconButton(
        Icons.settings_overscan_rounded,
        '화면크기',
        toggleViewMode,
      ),
      // chat settings
      _controlIconButton(
        Icons.mark_chat_read_rounded,
        '채팅설정',
        changeOverlayToChatSettings,
      ),
      // quality settings
      _controlIconButton(
        Icons.display_settings_rounded,
        '화질설정',
        changeOverlayToResolutionSetting,
      ),
      VodStreamFollowingButton(
        videoFocusNode: videoFocusNode,
        vod: vod,
      ),
    ];

    return DpadFocusScopeNavigator(
      node: controlsFSN,
      dpadKeyNodeMap: {
        DpadAction.arrowDown: playbackSliderFSN,
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items,
      ),
    );
  }

  Widget _controlIconButton(
    IconData iconData,
    String label,
    VoidCallback onPressed, {
    bool autofocus = false,
  }) {
    return StreamControlIconButton(
      autofocus: autofocus,
      iconData: iconData,
      useKeyRepeatEvent: false,
      resetOverlayTimer: resetOverlayTimer,
      label: label,
      onPressed: onPressed,
    );
  }
}
