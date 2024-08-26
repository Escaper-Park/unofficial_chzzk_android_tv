import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../common/widgets/dpad_widgets.dart';
import '../../live/model/live_stream.dart';
import './controller/live_player_controller.dart';
import './widgets/controls/main/live_stream_main_controls.dart';
import './widgets/controls/chat_settings/chat_settings_controls_overlay.dart';
import './widgets/controls/contents/live_stream_category_lives.dart';
import './widgets/controls/contents/live_stream_following_lives.dart';
import './widgets/controls/contents/live_stream_popular_lives.dart';
import 'widgets/controls/multiview/multiview_play_controls.dart';
import 'widgets/controls/multiview/multiview_play_info.dart';
import 'widgets/controls/multiview/multiview_resolution_controls.dart';
import 'widgets/controls/multiview/multiview_screen_settings.dart';
import 'widgets/controls/sound/sound_controls.dart';

class LiveControlsOverlay extends HookConsumerWidget {
  const LiveControlsOverlay({
    super.key,
    required this.liveStream,
    required this.controllers,
  });

  final List<LiveStream> liveStream;
  final List<VideoPlayerController> controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoFocusNode = useFocusNode();
    final controlsFSN = useFocusScopeNode();

    final liveOverlayType = ref.watch(liveOverlayControllerProvider);
    final liveDetails = liveStream.map((e) => e.liveDetail).toList();

    final Widget currentControls = switch (liveOverlayType) {
      LiveOverlayType.none => const SizedBox.shrink(),
      LiveOverlayType.main => LiveStreamMainControls(
          videoFocusNode: videoFocusNode,
          mainControlsFSN: controlsFSN,
          liveDetails: liveDetails,
          controllers: controllers,
        ),
      LiveOverlayType.chatSettings => ChatSettingsControlsOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.following => LiveStreamFollowingLivesOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.popular => LiveStreamPopularLivesOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.category => LiveStreamCategoryLivesOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
          channelId: liveStream.first.liveDetail.channel.channelId,
        ),
      LiveOverlayType.multiviewScreenSettings => MultiviewScreenSettings(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
          liveDetails: liveDetails,
        ),
      LiveOverlayType.multiviewPlaySetting => MultiviewPlayControls(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
          liveDetails: liveDetails,
        ),
      LiveOverlayType.soundSetting => SoundControls(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
          liveDetails: liveDetails,
          controllers: controllers,
        ),
      LiveOverlayType.resolutionSetting => MultiviewResolutionControls(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
          liveStream: liveStream,
          controllers: controllers,
        ),
      LiveOverlayType.multiviewPlayInfo => MultiviewPlayInfo(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
          liveDetails: liveDetails,
        ),
    };

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        // if overlay is hidden, pop
        if (liveOverlayType == LiveOverlayType.none) {
          context.pop();
        }
        // hide overlay
        else {
          ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                overlayType: LiveOverlayType.none,
                videoFocusNode: videoFocusNode,
              );
        }
      },
      child: Stack(
        children: [
          // Dpad Controller
          DpadActionWidget(
            autofocus: true,
            focusNode: videoFocusNode,
            useFocusedBorder: false,
            useKeyRepeatEvent: false,
            borderRadius: 0.0,
            dpadActionCallbacks: {
              DpadAction.select: () {
                videoFocusNode.unfocus();
                controlsFSN.requestFocus();

                // Show main controls
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.main,
                      videoFocusNode: videoFocusNode,
                    );
              },
              DpadAction.arrowUp: () {
                videoFocusNode.unfocus();
                controlsFSN.requestFocus();

                // Show other contents
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.following,
                      videoFocusNode: videoFocusNode,
                    );
              },
              DpadAction.arrowDown: () {
                // Overlay chat on/off
                if (videoFocusNode.hasFocus) {
                  ref
                      .read(livePlayerScreenModeControllerProvider.notifier)
                      .toggleOverlayChat();
                }
              },
            },
            child: const SizedBox.shrink(),
          ),
          // Current controls
          currentControls,
        ],
      ),
    );
  }
}
