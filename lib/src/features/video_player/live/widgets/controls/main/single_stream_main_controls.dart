import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../live/model/live.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../../common/stream_channel_following_button.dart';
import '../../../controller/live_player_controller.dart';
import '../../status/live_stream_info.dart';
import 'live_stream_following_button.dart';

class SingleStreamMainControls extends StatelessWidget {
  const SingleStreamMainControls({
    super.key,
    required this.videoFocusNode,
    required this.mainControlsFSN,
    required this.liveDetail,
    required this.controller,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode mainControlsFSN;
  final LiveDetail liveDetail;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // live info
        LiveStreamInfo(liveDetail: liveDetail),
        // controls
        SingleStreamVideoAndSettingControls(
          videoFocusNode: videoFocusNode,
          mainControlsFSN: mainControlsFSN,
          controller: controller,
          liveDetail: liveDetail,
        ),
      ],
    );
  }
}

class SingleStreamVideoAndSettingControls extends HookConsumerWidget {
  const SingleStreamVideoAndSettingControls({
    super.key,
    required this.videoFocusNode,
    required this.mainControlsFSN,
    required this.controller,
    required this.liveDetail,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode mainControlsFSN;
  final VideoPlayerController controller;
  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = useState<bool>(controller.value.isPlaying);
    final followingButtonFocusNode = useFocusNode();
    final pauseTimer = ref.watch(pauseTimerProvider);

    return FocusScope(
      node: mainControlsFSN,
      child: ControlsOverlayContainer(
        width: double.infinity,
        height: Dimensions.liveStreamMainControlsHeight,
        useTopBorder: true,
        borderRadius: 12.0,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // play or pause
            _controlIconButton(
              autofocus: true,
              ref: ref,
              iconData: isPlaying.value
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              label: isPlaying.value ? '일시정지' : '재생',
              onPressed: () {
                isPlaying.value = !isPlaying.value;
                ref.read(livePlayerControllerProvider.notifier).playOrPause(
                      context: context,
                      controller: controller,
                      pauseTimer: pauseTimer,
                    );
              },
            ),
            // real time
            _controlIconButton(
              ref: ref,
              iconData: Icons.alarm_on_rounded,
              label: '실시간',
              onPressed: () {
                ref
                    .read(livePlayerControllerProvider.notifier)
                    .playAnotherLive(context: context);
              },
            ),
            // toggle overlay chat
            _controlIconButton(
              ref: ref,
              iconData: Icons.chat_rounded,
              label: '채팅',
              onPressed: () {
                ref
                    .read(livePlayerScreenModeControllerProvider.notifier)
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
                    .read(livePlayerScreenModeControllerProvider.notifier)
                    .changeScreenSize();
              },
            ),
            // show chat settings
            _controlIconButton(
              ref: ref,
              iconData: Icons.mark_chat_read_rounded,
              label: '채팅설정',
              onPressed: () {
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.chatSettings,
                      videoFocusNode: videoFocusNode,
                    );
              },
            ),
            // change to multiview mode
            _controlIconButton(
              ref: ref,
              iconData: Icons.window_rounded,
              label: '멀티뷰',
              onPressed: () {
                ref
                    .read(livePlayerScreenModeControllerProvider.notifier)
                    .toggleViewMode();
              },
            ),
            // Sound
            _controlIconButton(
              ref: ref,
              iconData: Icons.volume_up_rounded,
              label: '소리설정',
              onPressed: () {
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.soundSetting,
                      videoFocusNode: videoFocusNode,
                    );
              },
            ),
            // Resolution
            _controlIconButton(
              ref: ref,
              iconData: Icons.display_settings_rounded,
              label: '화질설정',
              onPressed: () {
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.resolutionSetting,
                      videoFocusNode: videoFocusNode,
                    );
              },
            ),

            // Following
            StreamChannelFollowingButton(
              channel: liveDetail.channel,
              pauseTimer: () {
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      seconds: 6000, // Keep focus
                      overlayType: LiveOverlayType.main,
                      videoFocusNode: mainControlsFSN,
                    );
              },
              restartTimer: () {
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      seconds: 10,
                      overlayType: LiveOverlayType.main,
                      videoFocusNode: videoFocusNode,
                    );
                followingButtonFocusNode.requestFocus();
              },
              cancelTimer: () {
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      seconds: 0,
                      overlayType: LiveOverlayType.none,
                      videoFocusNode: videoFocusNode,
                    );
              },
              placeHolder: LiveStreamFollowingButton(
                focusNode: null,
                isFollowing: false,
                onPressed: () {},
              ),
              childBuilder: (context, onPressed, isFollowing) {
                return LiveStreamFollowingButton(
                  focusNode: followingButtonFocusNode,
                  isFollowing: isFollowing,
                  onPressed: onPressed,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _controlIconButton({
    required WidgetRef ref,
    required IconData iconData,
    required String label,
    required VoidCallback onPressed,
    bool autofocus = false,
  }) {
    return ControlIconButton(
      autofocus: autofocus,
      iconData: iconData,
      label: label,
      resetOverlayTimer: () {
        ref
            .read(liveOverlayControllerProvider.notifier)
            .resetOverlayTimer(videoFocusNode: videoFocusNode);
      },
      onPressed: onPressed,
    );
  }
}
