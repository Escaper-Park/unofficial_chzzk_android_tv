import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/center_widgets.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_mode_controller.dart';
import '../../../controller/live_overlay_controller.dart';
import '../../../controller/live_player_controller.dart';
import '../../../controller/live_playlist_controller.dart';

class MultiStreamMainControls extends StatelessWidget {
  const MultiStreamMainControls({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // controls
        MultiStreamSettingsControls(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
        // multiview indicator
        const ControlsOverlayContainer(
          alignment: Alignment.topLeft,
          height: 50.0,
          width: 100.0,
          backgroundColor: AppColors.blackColor,
          backgroundOpacity: 0.7,
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(10.0),
          borderRadius: 12.0,
          useTopBorder: true,
          useBottomBorder: true,
          child: CenteredText(
            text: '멀티뷰 모드',
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

class MultiStreamSettingsControls extends ConsumerWidget {
  const MultiStreamSettingsControls({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveCount = ref.watch(livePlaylistControllerProvider).length;

    final IconData filterIcon = switch (liveCount) {
      1 => Icons.filter_1_rounded,
      2 => Icons.filter_2_rounded,
      3 => Icons.filter_3_rounded,
      4 => Icons.filter_4_rounded,
      _ => Icons.filter_rounded,
    };

    return FocusScope(
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
              iconData: Icons.fullscreen_rounded,
              label: '화면설정',
              onPressed: () {
                _changeOverlay(ref, LiveOverlayType.multiviewScreenSettings);
              },
            ),
            _controlIconButton(
              ref: ref,
              iconData: filterIcon,
              label: '방송끄기',
              onPressed: () {
                final audioSourceIndex =
                    ref.read(currentActivatedAudioSourceIndexProvider);

                final liveCount = ref
                    .read(livePlaylistControllerProvider.notifier)
                    .getLiveCount();

                ref
                    .read(currentActivatedAudioSourceIndexProvider.notifier)
                    .reset();

                // if activated audio source is last one,
                if (audioSourceIndex == liveCount - 1) {
                  ref
                      .read(
                          singleLivePlayerControllerProvider(index: 0).notifier)
                      .setMute(false);
                }

                ref.read(currentActivatedLiveIndexProvider.notifier).reset();
                ref.read(livePlaylistControllerProvider.notifier).removeLast();
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
            _controlIconButton(
              ref: ref,
              iconData: Icons.volume_up_rounded,
              label: '소리설정',
              onPressed: () {
                _changeOverlay(ref, LiveOverlayType.soundSettings);
              },
            ),
            _controlIconButton(
              ref: ref,
              iconData: Icons.display_settings_rounded,
              label: '화질설정',
              onPressed: () {
                _changeOverlay(ref, LiveOverlayType.resolutionSettings);
              },
            ),
            _controlIconButton(
              ref: ref,
              iconData: Icons.info_outline_rounded,
              label: '재생정보',
              onPressed: () {
                _changeOverlay(ref, LiveOverlayType.multiviewPlayInfo);
              },
            ),
            _controlIconButton(
              ref: ref,
              autofocus: false,
              iconData: Icons.live_tv_rounded,
              label: '싱글뷰',
              onPressed: () {
                ref
                    .read(livePlaylistControllerProvider.notifier)
                    .changeToSingleView();

                ref.read(currentActivatedLiveIndexProvider.notifier).reset();

                ref
                    .read(chatWindowModeControllerProvider.notifier)
                    .toggleLiveMode(LiveMode.singleView);

                ref.read(liveModeControllerProvider.notifier).changeMode();
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

  void _changeOverlay(WidgetRef ref, LiveOverlayType overlayType) {
    ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
          overlayType: overlayType,
          videoFocusNode: videoFocusNode,
        );
  }
}
