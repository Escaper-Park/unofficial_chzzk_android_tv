import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_video_controller.g.dart';

@riverpod
class VideoControlsTimer extends _$VideoControlsTimer {
  @override
  Timer? build() {
    return null;
  }

  void showControlsWithTimer({
    required FocusNode videoFocusNode,
    int seconds = 5,
  }) {
    ref.read(showControlsProvider.notifier).setState(true);
    state?.cancel();

    state = Timer(Duration(seconds: seconds), () {
      ref.read(showControlsProvider.notifier).setState(false);
      videoFocusNode.requestFocus();
      state?.cancel();
    });
  }
}

@riverpod
class ShowControls extends _$ShowControls {
  @override
  bool build() {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}

@riverpod
class ShowChat extends _$ShowChat {
  @override
  bool build() {
    return false;
  }

  void setState() {
    state = !state;
  }
}
