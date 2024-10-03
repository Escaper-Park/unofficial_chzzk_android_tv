import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../setting/controller/stream_settings_controller.dart';

part 'vod_overlay_controller.g.dart';

enum VodOverlayType {
  none,
  main,
  channelData, // show channel data.
  chatSettings,
  resolutionSettings,
}

@riverpod
class VodOverlayController extends _$VodOverlayController {
  late int _overlayControlsDisplayTime;

  @override
  VodOverlayType build() {
    final streamSettings = ref.read(streamSettingsControllerProvider);

    _overlayControlsDisplayTime = streamSettings.overlayControlsDisplayTime;

    return VodOverlayType.none;
  }

  void setState(VodOverlayType overlayType) {
    if (state != overlayType) state = overlayType;
  }

  void changeOverlay({
    /// Vod overlay type
    required VodOverlayType overlayType,

    /// Request focus to video when the timer ends.
    required FocusNode videoFocusNode,

    /// overlay display time
    int? seconds,
  }) {
    // Hide overlay
    if (overlayType == VodOverlayType.none) {
      setState(overlayType);
      ref.read(vodPlayerOverlayTimerProvider.notifier).cancelTimer();
      videoFocusNode.requestFocus();
    }
    // Show overlay
    else {
      ref.read(vodPlayerOverlayTimerProvider.notifier).startTimer(
            seconds: seconds ?? _overlayControlsDisplayTime,
            startCallback: () {
              videoFocusNode.unfocus();
              setState(overlayType);
            },
            endCallback: () {
              // hide overlay and request focus to video
              setState(VodOverlayType.none);
              videoFocusNode.requestFocus();
            },
          );
    }
  }

  /// Each time the button is clicked, the timer resets to keep the overlay active.
  void resetOverlayTimer({required FocusNode videoFocusNode}) {
    ref.read(vodPlayerOverlayTimerProvider.notifier).startTimer(
          startCallback: null, // maintain the previous state.
          endCallback: () {
            // hide overlay and request focus to video
            setState(VodOverlayType.none);
            videoFocusNode.requestFocus();
          },
        );
  }
}

/// Set this true to ensure that the existing state is maintained wherever this timer is called.
@Riverpod(keepAlive: true)
class VodPlayerOverlayTimer extends _$VodPlayerOverlayTimer {
  late int _overlayControlsDisplayTime;

  @override
  Timer? build() {
    final streamSettings = ref.read(streamSettingsControllerProvider);
    _overlayControlsDisplayTime = streamSettings.overlayControlsDisplayTime;

    return null;
  }

  /// Start timer with start callback and stop timer with end callback.
  void startTimer({
    /// Call this when the timer starts.
    ///
    /// Nullable to reset only timer period.
    required VoidCallback? startCallback,

    /// Call this when the timer ends.
    required VoidCallback? endCallback,

    /// The period(or time) when the overlay is displayed.
    int? seconds,
  }) {
    // reset before start.
    cancelTimer();

    if (startCallback != null) startCallback();

    state = Timer(
      Duration(seconds: seconds ?? _overlayControlsDisplayTime),
      () {
        // timer ends
        if (endCallback != null) endCallback();
        // stop timer.
        cancelTimer();
      },
    );
  }

  void cancelTimer() {
    state?.cancel();
    state = null;
  }
}
