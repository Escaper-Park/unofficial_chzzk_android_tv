import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_video_controller.g.dart';

enum ControlType {
  main,
  chat,
}

@Riverpod(keepAlive: true)
class VideoControlsTimer extends _$VideoControlsTimer {
  @override
  Timer? build() {
    return null;
  }

  void showControlsWithTimer({
    required FocusNode videoFocusNode,
    int seconds = 5,
    ControlType controlType = ControlType.main,
  }) {
    cancelTimer();

    // Main Controls
    if (controlType == ControlType.main) {
      ref.read(showControlsProvider.notifier).setState(true);

      state = Timer(Duration(seconds: seconds), () {
        ref.read(showControlsProvider.notifier).setState(false);
        videoFocusNode.requestFocus();
        cancelTimer();
      });
    }
    // Chat Controls
    else {
      ref.read(showChatControlsProvider.notifier).setState(true);

      state = Timer(Duration(seconds: seconds), () {
        ref.read(showChatControlsProvider.notifier).setState(false);
        videoFocusNode.requestFocus();
        cancelTimer();
      });
    }
  }

  void cancelTimer() {
    state?.cancel();
    state = null;
  }
}

@Riverpod(keepAlive: true)
class PauseTimer extends _$PauseTimer {
  @override
  Timer? build() {
    return null;
  }

  void pauseWithStartTimer() {
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
class ShowChatControls extends _$ShowChatControls {
  @override
  bool build() {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}

enum SingleViewScreenMode {
  full,
  chat,
  overlayChat,
}

@riverpod
class SingleViewScreenController extends _$SingleViewScreenController {
  @override
  SingleViewScreenMode build() {
    return SingleViewScreenMode.full;
  }

  void showOrHideChat() {
    switch (state) {
      case SingleViewScreenMode.full:
        setScreenMode(SingleViewScreenMode.overlayChat);
      case SingleViewScreenMode.chat:
        setScreenMode(SingleViewScreenMode.full);
      case SingleViewScreenMode.overlayChat:
        setScreenMode(SingleViewScreenMode.full);
    }
  }

  void changeScreenSize() {
    switch (state) {
      case SingleViewScreenMode.full:
        setScreenMode(SingleViewScreenMode.chat);
      case SingleViewScreenMode.chat:
        setScreenMode(SingleViewScreenMode.overlayChat);
      case SingleViewScreenMode.overlayChat:
        setScreenMode(SingleViewScreenMode.chat);
    }
  }

  void setScreenMode(SingleViewScreenMode mode) {
    state = mode;
  }
}
