import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/dpad_widgets.dart';
import '../../vod/model/vod.dart';

import './controller/vod_player_controller.dart';
import './widgets/controls/main/vod_stream_main_controls.dart';
import './widgets/status/vod_stream_info.dart';
import './widgets/controls/channel/vod_stream_channel_data_controls.dart';

class VodControlsOverlay extends HookConsumerWidget {
  const VodControlsOverlay({
    super.key,
    required this.controller,
    required this.vod,
  });

  final VideoPlayerController controller;
  final Vod vod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoFocusNode = useFocusNode();
    final mainControlsFSN = useFocusScopeNode();
    final channelDataControlsFSN = useFocusScopeNode();

    final vodOverlayType = ref.watch(vodOverlayControllerProvider);

    final Widget currentControls = switch (vodOverlayType) {
      VodOverlayType.none => const SizedBox.shrink(),
      VodOverlayType.main => FocusScope(
          node: mainControlsFSN,
          child: Stack(
            children: [
              VodStreamInfo(vod: vod),
              VodStreamMainControls(
                controller: controller,
                videoFocusNode: videoFocusNode,
                vod: vod,
              ),
            ],
          ),
        ),
      VodOverlayType.channelData => FocusScope(
          node: channelDataControlsFSN,
          child: VodStreamChannelDataControls(
            videoFocusNode: videoFocusNode,
            vod: vod,
          ),
        ),
    };

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        // if overlay is hidden, pop
        if (vodOverlayType == VodOverlayType.none) {
          context.pop();
        }
        // hide overlay
        else {
          ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                overlayType: VodOverlayType.none,
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
                mainControlsFSN.requestFocus();

                ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: VodOverlayType.main,
                      videoFocusNode: videoFocusNode,
                    );
              },
              DpadAction.arrowUp: () {
                videoFocusNode.unfocus();
                channelDataControlsFSN.requestFocus();

                ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: VodOverlayType.channelData,
                      videoFocusNode: videoFocusNode,
                    );
              },
            },
            child: const SizedBox.shrink(),
          ),
          // Controls
          currentControls,
        ],
      ),
    );
  }
}
