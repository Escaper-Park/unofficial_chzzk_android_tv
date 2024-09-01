import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../setting/controller/stream_settings_controller.dart';

part 'live_overlay_controller.g.dart';

enum LiveOverlayType {
  none,
  main,
  /* contents */
  following,
  popular,
  category,
  /* settings */
  chatSettings,
  soundSettings,
  resolutionSettings,
  /* multiview */
  multiviewPlayInfo,
  multiviewScreenSettings,
}

@riverpod
class LiveOverlayController extends _$LiveOverlayController {
  late int _overlayControlsDisplayTime;

  @override
  LiveOverlayType build() {
    final streamSettings = ref.read(streamSettingsControllerProvider);
    _overlayControlsDisplayTime = streamSettings.overlayControlsDisplayTime;

    return LiveOverlayType.none;
  }

  void setState(LiveOverlayType overlayType) {
    if (state != overlayType) state = overlayType;
  }

  void changeOverlay({
    /// live overlay type
    required LiveOverlayType overlayType,

    /// Request focus to video when the timer ends
    required FocusNode videoFocusNode,

    /// overlay display time
    int? seconds,
  }) {
    // Hide overlay
    if (overlayType == LiveOverlayType.none) {
      setState(overlayType);
      ref.read(livePlayerOverlayTimerProvider.notifier).cancelTimer();
      videoFocusNode.requestFocus();
    }
    // Show overlay
    else {
      ref.read(livePlayerOverlayTimerProvider.notifier).startTimer(
            seconds: seconds ?? _overlayControlsDisplayTime,
            startCallback: () {
              videoFocusNode.unfocus();
              setState(overlayType);
            },
            endCallback: () {
              // hide overlay and request focus to video
              setState(LiveOverlayType.none);
              videoFocusNode.requestFocus();
            },
          );
    }
  }

  /// Each time the button is clicked, the timer resets to keep the overlay active.
  void resetOverlayTimer({required FocusNode videoFocusNode}) {
    ref.read(livePlayerOverlayTimerProvider.notifier).startTimer(
          startCallback: null, // maintain the previous state.
          seconds: _overlayControlsDisplayTime,
          endCallback: () {
            // hide overlay and request focus to video
            setState(LiveOverlayType.none);
            videoFocusNode.requestFocus();
          },
        );
  }
}

/// Set this true to ensure that the existing state is maintained wherever this timer is called.
@Riverpod(keepAlive: true)
class LivePlayerOverlayTimer extends _$LivePlayerOverlayTimer {
  @override
  Timer? build() {
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
    required int seconds,
  }) {
    // reset before start.
    cancelTimer();

    if (startCallback != null) startCallback();

    state = Timer(
      Duration(seconds: seconds),
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
