import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../../../../live/model/live_detail.dart';
import '../../../../settings/model/stream_settings.dart';
import '../../../../streaming/widgets/control/stream_control_icon_button.dart';
import 'live_stream_add_group_button.dart';
import 'live_stream_following_button.dart';

class LiveStreamSingleViewControlButtons extends HookWidget {
  const LiveStreamSingleViewControlButtons({
    super.key,
    required this.liveDetail,
    required this.streamSettings,
    required this.controller,
    required this.videoFocusNode,
    required this.resetOverlayTimer,
    required this.playOrPause,
    required this.playInRealTime,
    required this.toggleOverlayChat,
    required this.toggleViewMode,
    required this.showChatSettings,
    required this.showSoundSettings,
    required this.showResolutionSettings,
    required this.showGroupSettings,
    required this.changeToMultiviewMode,
  });

  final LiveDetail liveDetail;
  final StreamSettings streamSettings;
  final VideoPlayerController controller;
  final FocusNode videoFocusNode;

  final VoidCallback resetOverlayTimer;
  final VoidCallback playOrPause;
  final VoidCallback playInRealTime;
  final VoidCallback toggleOverlayChat;
  final VoidCallback toggleViewMode;
  final VoidCallback showChatSettings;
  final VoidCallback showSoundSettings;
  final VoidCallback showResolutionSettings;
  final VoidCallback showGroupSettings;
  final VoidCallback changeToMultiviewMode;

  @override
  Widget build(BuildContext context) {
    final isPlayingState = useState<bool>(controller.value.isPlaying);

    final List<Widget> items = [
      _controlIconButton(
        autofocus: true,
        isPlayingState.value == true
            ? Icons.pause_rounded
            : Icons.play_arrow_rounded,
        isPlayingState.value == true ? '일시정지' : '재생',
        () {
          isPlayingState.value = !isPlayingState.value;
          playOrPause();
        },
      ),
      _controlIconButton(
        Icons.alarm_on_rounded,
        '실시간',
        playInRealTime,
      ),
      _controlIconButton(
        Icons.chat_rounded,
        '채팅',
        toggleOverlayChat,
      ),
      _controlIconButton(
        Icons.settings_overscan_rounded,
        '화면크기',
        toggleViewMode,
      ),
      _controlIconButton(
        Icons.mark_chat_read_rounded,
        '채팅설정',
        showChatSettings,
      ),
      _controlIconButton(
        Icons.volume_up_rounded,
        '소리설정',
        showSoundSettings,
      ),
      _controlIconButton(
        Icons.chat_rounded,
        '화질설정',
        showResolutionSettings,
      ),
      _controlIconButton(
        Icons.group_rounded,
        '그룹설정',
        showGroupSettings,
      ),
      _controlIconButton(
        Icons.window_rounded,
        '멀티뷰',
        changeToMultiviewMode,
      ),
      LiveStreamFollowingButton(
        channel: liveDetail.channel,
        videoFocusNode: videoFocusNode,
      ),
      LiveStreamAddChannelToGroupButton(
        channel: liveDetail.channel,
        videoFocusNode: videoFocusNode,
      ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items,
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
      useKeyRepeatEvent: true,
      resetOverlayTimer: resetOverlayTimer,
      label: label,
      onPressed: onPressed,
    );
  }
}
