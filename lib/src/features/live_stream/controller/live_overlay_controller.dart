import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show LiveStreamOverlayType;
import '../../settings/controller/stream_setting_controller.dart';

part 'live_overlay_controller.g.dart';

@riverpod
class LiveOverlayController extends _$LiveOverlayController {
  @override
  LiveStreamOverlayType build() {
    return LiveStreamOverlayType.none;
  }

  void _setState(LiveStreamOverlayType overlayType) {
    if (state != overlayType) state = overlayType;
  }

  void changeOverlay({
    required LiveStreamOverlayType overlayType,
    required FocusNode videoFocusNode,
  }) {
    // hide overlay
    if (overlayType == LiveStreamOverlayType.none) {
      _setState(overlayType);
      ref.read(liveOverlayTimerProvider.notifier).cancelTimer();
      videoFocusNode.requestFocus();
    }
    // show overlay
    else {
      ref.read(liveOverlayTimerProvider.notifier).startTimer(
        startCallback: () {
          videoFocusNode.unfocus();
          _setState(overlayType);
        },
        endCallback: () {
          // hide overlay and request focus to video focus node.
          _setState(LiveStreamOverlayType.none);
          videoFocusNode.requestFocus();
        },
      );
    }
  }

  void resetOverlayTimer({required FocusNode videoFocusNode}) {
    ref.read(liveOverlayTimerProvider.notifier).startTimer(
          startCallback: null,
          endCallback: () {
            _setState(LiveStreamOverlayType.none);
            videoFocusNode.requestFocus();
          },
        );
  }
}

@Riverpod(keepAlive: true)
class LiveOverlayTimer extends _$LiveOverlayTimer {
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

    startCallback?.call();

    state = Timer(
      Duration(seconds: seconds ?? _overlayControlsDisplayTime),
      () {
        // timer ends
        endCallback?.call();
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
