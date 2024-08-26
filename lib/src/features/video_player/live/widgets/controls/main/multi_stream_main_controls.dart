import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/center_widgets.dart';
import '../../../../../live/model/live.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_player_controller.dart';
import '../../../controller/live_playlist_controller.dart';

class MultiStreamMainControls extends StatelessWidget {
  const MultiStreamMainControls({
    super.key,
    required this.videoFocusNode,
    required this.mainControlsFSN,
    required this.liveDetails,
    required this.controllers,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode mainControlsFSN;
  final List<LiveDetail> liveDetails;
  final List<VideoPlayerController> controllers;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Indicator
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
        // controls
        MultiStreamSettingsControls(
          videoFocusNode: videoFocusNode,
          mainControlsFSN: mainControlsFSN,
          liveDetails: liveDetails,
          controllers: controllers,
        ),
      ],
    );
  }
}

class MultiStreamSettingsControls extends ConsumerWidget {
  const MultiStreamSettingsControls({
    super.key,
    required this.videoFocusNode,
    required this.mainControlsFSN,
    required this.liveDetails,
    required this.controllers,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode mainControlsFSN;
  final List<LiveDetail> liveDetails;
  final List<VideoPlayerController> controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final IconData filterIcon = switch (liveDetails.length) {
      1 => Icons.filter_1_rounded,
      2 => Icons.filter_2_rounded,
      3 => Icons.filter_3_rounded,
      4 => Icons.filter_4_rounded,
      _ => Icons.filter_rounded,
    };

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
            _controlIconButton(
              autofocus: true,
              ref: ref,
              iconData: Icons.fullscreen_rounded,
              label: '화면설정',
              onPressed: () {
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.multiviewScreenSettings,
                      videoFocusNode: videoFocusNode,
                    );
              },
            ),
            _controlIconButton(
              ref: ref,
              iconData: filterIcon,
              label: '재생설정',
              onPressed: () {
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.multiviewPlaySetting,
                      videoFocusNode: videoFocusNode,
                    );
              },
            ),
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
            _controlIconButton(
              ref: ref,
              iconData: Icons.info_outline_rounded,
              label: '재생정보',
              onPressed: () {
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.multiviewPlayInfo,
                      videoFocusNode: videoFocusNode,
                    );
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

                ref
                    .read(livePlayerScreenModeControllerProvider.notifier)
                    .toggleViewMode();
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
