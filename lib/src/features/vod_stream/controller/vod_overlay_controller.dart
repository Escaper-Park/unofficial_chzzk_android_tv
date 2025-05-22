import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show VodStreamOverlayType;
import '../../settings/controller/stream_setting_controller.dart';

part 'vod_overlay_controller.g.dart';

@riverpod
class VodOverlayController extends _$VodOverlayController {
  @override
  VodStreamOverlayType build() {
    return VodStreamOverlayType.none;
  }

  void changeOverlay({
    required VodStreamOverlayType overlayType,
    required FocusNode videoFocusNode,
  }) {
    // hide overlay
    if (overlayType == VodStreamOverlayType.none) {
      _setState(overlayType);
      ref.read(vodOverlayTimerProvider.notifier).cancelTimer();
      videoFocusNode.requestFocus();
    }
    // show overlay
    else {
      ref.read(vodOverlayTimerProvider.notifier).startTimer(
        startCallback: () {
          videoFocusNode.unfocus();
          _setState(overlayType);
        },
        endCallback: () {
          // hide overlay and request focus to video focus node.
          _setState(VodStreamOverlayType.none);
          videoFocusNode.requestFocus();
        },
      );
    }
  }

  void resetOverlayTimer({required FocusNode videoFocusNode}) {
    ref.read(vodOverlayTimerProvider.notifier).startTimer(
          startCallback: null,
          endCallback: () {
            _setState(VodStreamOverlayType.none);
            videoFocusNode.requestFocus();
          },
        );
  }

  void _setState(VodStreamOverlayType overlayType) {
    if (state != overlayType) state = overlayType;
  }
}

@Riverpod(keepAlive: true)
class VodOverlayTimer extends _$VodOverlayTimer {
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
