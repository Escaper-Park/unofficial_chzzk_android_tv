import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/router/app_router.dart';
import '../../../live/controller/live_controller.dart';
import '../../../live/model/live.dart';
import '../../../setting/controller/stream_settings_controller.dart';

part 'live_player_controller.g.dart';

enum LiveOverlayType {
  none,
  main,
  following,
  popular,
  category,
  chatSettings,
  soundSetting,
  resolutionSetting,
  multiviewScreenSettings,
  multiviewPlaySetting,
  multiviewPlayInfo,
}

enum LivePlayerScreenMode {
  singleFull,
  singleChat,
  singleOverlayChat,
  multiview,
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

@riverpod
class LivePlayerController extends _$LivePlayerController {
  @override
  void build() {
    return;
  }

  Future<void> playOrPause({
    // ignore: avoid_build_context_in_providers
    required BuildContext context,
    required VideoPlayerController controller,
    required Timer? pauseTimer,
  }) async {
    // pause
    if (controller.value.isPlaying) {
      controller.pause();
      // Start pause timer
      ref.read(pauseTimerProvider.notifier).pauseAndStartTimer();
    }
    // Play
    else {
      // playback from pause
      if (pauseTimer != null && pauseTimer.isActive) {
        ref.read(pauseTimerProvider.notifier).cancelTimer();
        controller.play();
      }
      // play in realtime.
      else {
        playAnotherLive(context: context);
      }
    }
  }

  void playAnotherLive({
    // ignore: avoid_build_context_in_providers
    required BuildContext context,
  }) {
    ref.read(livePlayerOverlayTimerProvider.notifier).cancelTimer();
    ref
        .read(liveOverlayControllerProvider.notifier)
        .setState(LiveOverlayType.none);

    if (context.mounted) {
      context.pushReplacementNamed(AppRoute.liveStreaming.routeName);
    }
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

@riverpod
class LivePlayerScreenModeController extends _$LivePlayerScreenModeController {
  late LivePlayerScreenMode _lastMode;

  @override
  LivePlayerScreenMode build() {
    final streamSettings = ref.read(streamSettingsControllerProvider);
    _lastMode = _getScreenModeFromIndex(streamSettings.screenModeIndex);

    return _lastMode;
  }

  LivePlayerScreenMode _getScreenModeFromIndex(int index) {
    return switch (index) {
      0 => LivePlayerScreenMode.singleFull,
      1 => LivePlayerScreenMode.singleOverlayChat,
      2 => LivePlayerScreenMode.singleChat,
      3 => LivePlayerScreenMode.multiview,
      _ => LivePlayerScreenMode.singleFull,
    };
  }

  /// Change Screen Size and Show or Hid Chat
  void changeScreenSize() {
    switch (state) {
      case LivePlayerScreenMode.singleFull:
        _setScreenMode(LivePlayerScreenMode.singleChat);
        break;
      case LivePlayerScreenMode.singleChat:
        if (_lastMode == LivePlayerScreenMode.singleChat) {
          _lastMode = LivePlayerScreenMode.singleFull;
        }

        _setScreenMode(_lastMode);
        break;
      case LivePlayerScreenMode.singleOverlayChat:
        _setScreenMode(LivePlayerScreenMode.singleChat);
        break;
      case LivePlayerScreenMode.multiview:
        break;
    }
  }

  /// toggle single to multi view or vice versa
  void toggleViewMode() {
    _setScreenMode(state == LivePlayerScreenMode.multiview
        ? _lastMode
        : LivePlayerScreenMode.multiview);
  }

  void _setScreenMode(LivePlayerScreenMode mode) {
    state = mode;

    switch (mode) {
      case LivePlayerScreenMode.singleFull:
        _lastMode = state;
        ref
            .read(streamSettingsControllerProvider.notifier)
            .setScreenModeIndex(0);
        break;
      case LivePlayerScreenMode.singleOverlayChat:
        _lastMode = state;
        ref
            .read(streamSettingsControllerProvider.notifier)
            .setScreenModeIndex(1);
        break;
      case LivePlayerScreenMode.singleChat:
        ref
            .read(streamSettingsControllerProvider.notifier)
            .setScreenModeIndex(2);
        break;

      case LivePlayerScreenMode.multiview:
        break;
    }
  }

  /// Overlay chat on/off
  void toggleOverlayChat() {
    // On
    if (state == LivePlayerScreenMode.singleFull) {
      state = LivePlayerScreenMode.singleOverlayChat;
      _lastMode = state;
      ref.read(streamSettingsControllerProvider.notifier).setScreenModeIndex(1);
    }
    // Off
    else if (state == LivePlayerScreenMode.singleOverlayChat) {
      state = LivePlayerScreenMode.singleFull;
      _lastMode = state;
      ref.read(streamSettingsControllerProvider.notifier).setScreenModeIndex(0);
    }
    // Off
    else if (state == LivePlayerScreenMode.singleChat) {
      int screenModeIndex = 0;
      // to full
      if (_lastMode == LivePlayerScreenMode.singleFull) {
        state = LivePlayerScreenMode.singleFull;
        _lastMode = state;
        screenModeIndex = 0;
      }
      // to overlay
      else if (_lastMode == LivePlayerScreenMode.singleOverlayChat) {
        state = LivePlayerScreenMode.singleOverlayChat;
        _lastMode = state;
        screenModeIndex = 1;
      } else if (_lastMode == LivePlayerScreenMode.singleChat) {
        state = LivePlayerScreenMode.singleOverlayChat;
        _lastMode = state;
        screenModeIndex = 1;
      }

      ref
          .read(streamSettingsControllerProvider.notifier)
          .setScreenModeIndex(screenModeIndex);
    }
  }
}

/// Show current live status with the main controls
@riverpod
class LiveStatusController extends _$LiveStatusController {
  @override
  FutureOr<LiveStatus?> build({required String channelId}) async {
    return await ref
        .read(liveControllerProvider.notifier)
        .getLiveStatus(channelId: channelId);
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

    state = Timer(const Duration(seconds: 45), () {
      cancelTimer();
    });
  }

  void cancelTimer() {
    state?.cancel();
    state = null;
  }
}

@riverpod
class MultiviewMainScreenIndex extends _$MultiviewMainScreenIndex {
  @override
  int? build() {
    return null;
  }

  /// Display the selected screen larger.
  void setFocusMode(int index) {
    state == index ? state = null : state = index;
  }
}
