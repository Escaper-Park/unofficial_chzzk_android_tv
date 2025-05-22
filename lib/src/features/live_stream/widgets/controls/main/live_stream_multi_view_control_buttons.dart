import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../streaming/widgets/control/stream_control_icon_button.dart';

class LiveStreamMultiViewControlButtons extends HookWidget {
  const LiveStreamMultiViewControlButtons({
    super.key,
    required this.liveCount,
    required this.videoFocusNode,
    required this.resetOverlayTimer,
    required this.showMultiviewScreenSetting,
    required this.removeLastLive,
    required this.showChatSettings,
    required this.showSoundSettings,
    required this.showResolutionSettings,
    required this.showMultiviewInfo,
    required this.changeToSingleView,
  });

  final int liveCount;
  final FocusNode videoFocusNode;
  final VoidCallback resetOverlayTimer;
  final VoidCallback showMultiviewScreenSetting;
  final VoidCallback removeLastLive;
  final VoidCallback showChatSettings;
  final VoidCallback showSoundSettings;
  final VoidCallback showResolutionSettings;
  final VoidCallback showMultiviewInfo;
  final VoidCallback changeToSingleView;

  @override
  Widget build(BuildContext context) {
    final IconData filterIcon = switch (liveCount) {
      1 => Icons.filter_1_rounded,
      2 => Icons.filter_2_rounded,
      3 => Icons.filter_3_rounded,
      4 => Icons.filter_4_rounded,
      _ => Icons.filter_rounded,
    };

    final List<Widget> items = [
      _controlIconButton(
        autofocus: true,
        Icons.fullscreen_rounded,
        '화면설정',
        showMultiviewScreenSetting,
      ),
      _controlIconButton(
        filterIcon,
        '방송끄기',
        removeLastLive,
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
        Icons.display_settings_rounded,
        '화질설정',
        showResolutionSettings,
      ),
      _controlIconButton(
        Icons.info_outline_rounded,
        '재생정보',
        showMultiviewInfo,
      ),
      _controlIconButton(
        Icons.live_tv_rounded,
        '싱글뷰',
        changeToSingleView,
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
