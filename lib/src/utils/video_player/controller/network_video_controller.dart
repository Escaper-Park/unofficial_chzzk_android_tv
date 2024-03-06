import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_video_controller.g.dart';

enum OverlayType {
  none,
  main,
  chatSettings,
  popular,
  following,
  category,
}

@riverpod
class OverlayController extends _$OverlayController {
  @override
  OverlayType build() {
    return OverlayType.none;
  }

  void setState(OverlayType overlayType) {
    state = overlayType;
  }
}

@Riverpod(keepAlive: true)
class ControlOverlayTimer extends _$ControlOverlayTimer {
  /// Timer that measures the duration of the controls overlay visibility.
  @override
  Timer? build() {
    return null;
  }

  void showOverlayAndStartTimer({
    required FocusNode videoFocusNode,
    int seconds = 7,
    OverlayType overlayType = OverlayType.main,
  }) {
    cancelTimer();

    ref.read(overlayControllerProvider.notifier).setState(overlayType);
    state = Timer(Duration(seconds: seconds), () {
      ref.read(overlayControllerProvider.notifier).setState(OverlayType.none);
      videoFocusNode.requestFocus();
      cancelTimer();
    });
  }

  void cancelTimer() {
    state?.cancel();
    state = null;
  }
}

@Riverpod(keepAlive: true)
class PauseTimer extends _$PauseTimer {
  /// Timer that measures the duration of the pause.
  ///
  /// The continuation(restart) of live streaming depends on this.
  @override
  Timer? build() {
    return null;
  }

  void pauseAndStartTimer() {
    cancelTimer();

    state = Timer(const Duration(seconds: 60), () {
      cancelTimer();
    });
  }

  void cancelTimer() {
    state?.cancel();
    state = null;
  }
}
