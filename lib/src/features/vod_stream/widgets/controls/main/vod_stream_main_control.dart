import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/enums.dart'
    show PlaybackDirection, VodStreamOverlayType;
import '../../../../streaming/widgets/streaming_widgets.dart';

import '../../../../vod/model/vod.dart';
import '../../../vod_stream_event.dart';
import '../../../vod_stream_state.dart';
import 'vod_playback_time_indicator.dart';
import 'vod_playback_time_slider.dart';
import 'vod_stream_control_buttons.dart';
import 'vod_stream_info.dart';

class VodStreamMainControl extends HookConsumerWidget
    with VodStreamEvent, VodStreamState {
  const VodStreamMainControl({
    super.key,
    required this.vod,
    required this.videoFocusNode,
  });

  final Vod? vod;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoPlayerController = getVideoPlayerController(ref);
    final streamSettings = getStreamSettings(ref);

    final playbackSliderFSN = useFocusScopeNode();
    final controlsFSN = useFocusScopeNode();

    return vod == null
        ? const SizedBox.shrink()
        : Stack(
            children: [
              // main
              StreamOverlayContainer(
                width: double.infinity,
                height: Dimensions.vodStreamMainControlsHeight,
                useTopBorder: true,
                borderRadius: 12.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: videoPlayerController == null
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          VodPlaybackTimeIndicator(
                            controller: videoPlayerController,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: VodStreamControlButtons(
                                    streamSettings: streamSettings,
                                    vod: vod,
                                    videoFocusNode: videoFocusNode,
                                    controller: videoPlayerController,
                                    controlsFSN: controlsFSN,
                                    playbackSliderFSN: playbackSliderFSN,
                                    resetOverlayTimer: () => resetOverlayTimer(
                                      ref,
                                      videoFocusNode: videoFocusNode,
                                    ),
                                    toStart: () async {
                                      await toStart(ref);
                                    },
                                    seekToByButton: (direction) async =>
                                        await seekToByButton(
                                      ref,
                                      endSeek: true,
                                      direction: direction,
                                    ),
                                    toggleOverlayChat: () async =>
                                        await toggleOverlayChat(ref),
                                    toggleViewMode: () async =>
                                        await toggleViewMode(ref),
                                    changeOverlayToChatSettings: () =>
                                        changeOverlay(
                                      ref,
                                      overlayType:
                                          VodStreamOverlayType.chatSettings,
                                      videoFocusNode: videoFocusNode,
                                    ),
                                    changeOverlayToResolutionSetting: () =>
                                        changeOverlay(
                                      ref,
                                      overlayType: VodStreamOverlayType
                                          .resolutionSettings,
                                      videoFocusNode: videoFocusNode,
                                    ),
                                    changeOverlayToPlaybackSpeedSetting: () =>
                                        changeOverlay(
                                      ref,
                                      overlayType: VodStreamOverlayType
                                          .playbackSpeedSettings,
                                      videoFocusNode: videoFocusNode,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Expanded(
                                  child: VodPlaybackTimeSlider(
                                    controller: videoPlayerController,
                                    playbackButtonsFSN: controlsFSN,
                                    playbackSliderFSN: playbackSliderFSN,
                                    resetOverlayTimer: () {
                                      resetOverlayTimer(
                                        ref,
                                        videoFocusNode: videoFocusNode,
                                      );
                                    },
                                    seekToBySlider: (
                                      PlaybackDirection direction,
                                      bool endSeek,
                                      double pos,
                                    ) {
                                      seekToBySlider(
                                        ref,
                                        direction: direction,
                                        endSeek: endSeek,
                                        pos: pos,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
              // stream info
              VodStreamInfo(vod: vod!),
            ],
          );
  }
}
