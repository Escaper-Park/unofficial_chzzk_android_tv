import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../../../common/widgets/header_text.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_player_controller.dart';

class VideoNavigatorOverlay extends ConsumerWidget {
  /// Navigator overlay to explore other vods or live stream channels
  /// when waching video.
  const VideoNavigatorOverlay({
    super.key,
    required this.videoFocusNode,
    required this.headerText,
    required this.contents,
    required this.overlayType,
    required this.aboveType,
    required this.belowType,
  });

  final FocusNode videoFocusNode;
  final String headerText;
  final LiveOverlayType overlayType;
  final LiveOverlayType aboveType;
  final LiveOverlayType belowType;
  final Widget contents;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DpadActionWidget(
      useFocusedBorder: false,
      dpadActionCallbacks: {
        DpadAction.arrowUp: () {
          ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                overlayType: aboveType,
                videoFocusNode: videoFocusNode,
              );
        },
        DpadAction.arrowDown: () {
          ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                overlayType: belowType,
                videoFocusNode: videoFocusNode,
              );
        },
        DpadAction.arrowLeft: () {
          // Reset overlay timer
          ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                overlayType: overlayType,
                videoFocusNode: videoFocusNode,
              );
        },
        DpadAction.arrowRight: () {
          // Reset overlay timer
          ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                overlayType: overlayType,
                videoFocusNode: videoFocusNode,
              );
        },
      },
      child: ControlsOverlayContainer(
        width: double.infinity,
        height: Dimensions.streamVideoNavigatorOverlay,
        borderRadius: 12.0,
        useTopBorder: true,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            SizedBox(
              height: Dimensions.streamVideoNavigatorHeader,
              child: HeaderText(
                text: headerText,
                fontSize: 14.0,
                verticalPadding: 5.0,
              ),
            ),
            // Contents
            Expanded(
              child: contents,
            ),
          ],
        ),
      ),
    );
  }
}
