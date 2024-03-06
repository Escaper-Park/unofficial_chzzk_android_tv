import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/styles.dart';
import '../../../../features/vod/model/vod.dart';
import '../../controller/network_video_controller.dart';
import './vod_playback_controls.dart';
import './vod_remaining_time_indicator.dart';
import './vod_time_slider.dart';

class VodStreamControlOverlay extends ConsumerWidget {
  const VodStreamControlOverlay({
    super.key,
    required this.controller,
    required this.videoFocusNode,
    required this.vod,
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;
  final Vod vod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(controlOverlayTimerProvider.notifier).showOverlayAndStartTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
            );
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: Dimensions.vodStreamingControlOverlayHeight,
          width: double.infinity,
          color: AppColors.blackColor.withOpacity(0.9),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VodPlaybackControls(
                controller: controller,
                videoFocusNode: videoFocusNode,
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: VodTimeSlider(
                      controller: controller,
                      videoFocusNode: videoFocusNode,
                    ),
                  ),
                  VodRemainingTimeIndicator(controller: controller),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
