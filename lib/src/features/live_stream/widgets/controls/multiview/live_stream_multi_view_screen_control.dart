import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../streaming/widgets/control/stream_control_icon_button.dart';
import '../../../../streaming/widgets/control/stream_setting_control.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';

class LiveStreamMultiViewScreenControl extends ConsumerWidget
    with LiveStreamEvent, LiveStreamState {
  const LiveStreamMultiViewScreenControl({
    super.key,
    required this.currentActivatedLiveIndex,
    required this.videoFocusNode,
  });

  final int? currentActivatedLiveIndex;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlist = getLivePlaylist(ref);

    final multiviewScreenFocusItems = List.generate(
      playlist.length,
      (index) {
        final liveDetail = playlist[index];

        return _controlButton(
          index == 0,
          index,
          liveDetail.channel.channelName,
          () => resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
          () => setFocusedScreenIndex(ref, index: index),
        );
      },
    );

    return StreamSettingControl(
      streamSettingsControlItems: multiviewScreenFocusItems,
      headerText: '화면설정',
      text1: '클릭',
      text2: '크게\u00b7같이 보기',
      text3: '멀티뷰 화면에서 리모컨 아래 버튼',
      text4: '크게 보기',
    );
  }

  Widget _controlButton(
    bool autofocus,
    int itemIndex,
    String channelName,
    VoidCallback resetOverlayTimer,
    VoidCallback setFocusScreenIndex,
  ) {
    return StreamControlIconButton(
      autofocus: autofocus,
      label: channelName,
      iconData: currentActivatedLiveIndex == itemIndex
          ? Icons.fullscreen_rounded
          : Icons.fullscreen_exit_rounded,
      iconColor: currentActivatedLiveIndex == itemIndex
          ? AppColors.chzzkColor
          : AppColors.whiteColor,
      resetOverlayTimer: resetOverlayTimer,
      onPressed: setFocusScreenIndex,
    );
  }
}
