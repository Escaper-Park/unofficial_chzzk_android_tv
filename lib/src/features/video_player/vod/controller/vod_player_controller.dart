import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'vod_player_controller.g.dart';

enum VodOverlayType {
  none,
  main,
  channelData, // show channel data.
}

enum PlaybackDirection {
  forward,
  backword,
}

@riverpod
class VodPlayerController extends _$VodPlayerController {
  @override
  VodOverlayType build() {
    return VodOverlayType.none;
  }

  void setState(VodOverlayType overlayType) {
    if (state != overlayType) state = overlayType;
  }

  void changeOverlay({
    int seconds = 10, // TODO : Change
    required VodOverlayType overlayType,

    /// Request focus to video when the timer ends.
    required FocusNode videoFocusNode,
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
            seconds: seconds,
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

  /// Everytime the button is clicked, the timer is reset to keep the overlay persistent.
  void seekTo({
    required FocusNode videoFocusNode,
    required VideoPlayerController controller,
    required PlaybackDirection direction,
    int interval = 10,
  }) {
    // TODO : Setting interval?
    final currentPos = controller.value.position;

    switch (direction) {
      case PlaybackDirection.forward:
        final newPos = currentPos + Duration(seconds: interval);
        if (newPos <= controller.value.duration) {
          controller.seekTo(newPos);
        }
        break;
      case PlaybackDirection.backword:
        final newPos = currentPos - Duration(seconds: interval);
        controller.seekTo(newPos);
        break;
    }

    ref.read(vodPlayerOverlayTimerProvider.notifier).startTimer(
          startCallback: null, // maintain the previous state.
          endCallback: () {
            // hide overlay and request focus to video
            setState(VodOverlayType.none);
            videoFocusNode.requestFocus();
          },
        );
  }

  void channel() {}
  void follow() {}
  void unfollow() {}
}

/// Set this true to ensure that the existing state is maintained wherever this timer is called.
@Riverpod(keepAlive: true)
class VodPlayerOverlayTimer extends _$VodPlayerOverlayTimer {
  @override
  Timer? build() {
    // TODO : Timer seconds settings
    return null;
  }

  /// Start timer with start callback and stop timer with end callback.
  void startTimer({
    /// The period(or time) when the overlay is displayed.
    int seconds = 10,

    /// Call this when the timer starts.
    ///
    /// Nullable to reset only timer period.
    required VoidCallback? startCallback,

    /// Call this when the timer ends.
    required VoidCallback? endCallback,
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
