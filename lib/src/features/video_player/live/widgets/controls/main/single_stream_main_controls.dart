import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_mode_controller.dart';
import '../../../controller/live_overlay_controller.dart';
import '../../../controller/live_player_controller.dart';
import '../../../controller/live_playlist_controller.dart';
import 'status/live_stream_info.dart';
import 'live_stream_following_button.dart';

class SingleStreamMainControls extends HookConsumerWidget {
  const SingleStreamMainControls({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followingButtonFocusNode = useFocusNode();
    final firstController =
        ref.watch(singleLivePlayerControllerProvider(index: 0)).value;

    final isPlaying = useState<bool>(firstController!.value.isPlaying);
    final pauseTimer = ref.watch(pauseTimerProvider);

    return Stack(
      children: [
        // controls
        FocusScope(
          node: controlsFSN,
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
                _controlIconButton(
                  autofocus: true,
                  ref: ref,
                  iconData: isPlaying.value
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  label: isPlaying.value ? '일시정지' : '재생',
                  onPressed: () {
                    isPlaying.value = !isPlaying.value;
                    ref
                        .read(singleLivePlayerControllerProvider(index: 0)
                            .notifier)
                        .playOrPause(pauseTimer: pauseTimer);
                  },
                ),
                // realtime
                _controlIconButton(
                  ref: ref,
                  iconData: Icons.alarm_on_rounded,
                  label: '실시간',
                  onPressed: () {
                    ref
                        .read(liveOverlayControllerProvider.notifier)
                        .changeOverlay(
                          overlayType: LiveOverlayType.none,
                          videoFocusNode: videoFocusNode,
                        );

                    ref
                        .read(singleLivePlayerControllerProvider(index: 0)
                            .notifier)
                        .changeSource();
                  },
                ),

                // chat
                _controlIconButton(
                  ref: ref,
                  iconData: Icons.chat_rounded,
                  label: '채팅',
                  onPressed: () {
                    ref
                        .read(chatWindowModeControllerProvider.notifier)
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
                        .read(chatWindowModeControllerProvider.notifier)
                        .toggleViewMode();
                  },
                ),
                // show chat settings
                _controlIconButton(
                  ref: ref,
                  iconData: Icons.mark_chat_read_rounded,
                  label: '채팅설정',
                  onPressed: () {
                    _changeOverlay(ref, LiveOverlayType.chatSettings);
                  },
                ),
                // sound
                _controlIconButton(
                  ref: ref,
                  iconData: Icons.volume_up_rounded,
                  label: '소리설정',
                  onPressed: () {
                    _changeOverlay(ref, LiveOverlayType.soundSettings);
                  },
                ),
                // resolution
                _controlIconButton(
                  ref: ref,
                  iconData: Icons.display_settings_rounded,
                  label: '화질설정',
                  onPressed: () {
                    _changeOverlay(ref, LiveOverlayType.resolutionSettings);
                  },
                ),
                // multiview
                _controlIconButton(
                  ref: ref,
                  iconData: Icons.window_rounded,
                  label: '멀티뷰',
                  onPressed: () {
                    // chat off
                    ref
                        .read(chatWindowModeControllerProvider.notifier)
                        .toggleLiveMode(LiveMode.multiView);

                    ref.read(liveModeControllerProvider.notifier).changeMode();
                  },
                ),
                // following buttons
                Consumer(
                  builder: (context, ref, child) {
                    final liveDetail =
                        ref.read(livePlaylistControllerProvider).first;

                    return LiveStreamFollowingButton(
                      channel: liveDetail.channel,
                      followingButtonFocusNode: followingButtonFocusNode,
                      videoFocusNode: videoFocusNode,
                      controlsFSN: controlsFSN,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        // live info
        const LiveStreamInfo(),
      ],
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

  void _changeOverlay(WidgetRef ref, LiveOverlayType overlayType) {
    ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
          overlayType: overlayType,
          videoFocusNode: videoFocusNode,
        );
  }
}
