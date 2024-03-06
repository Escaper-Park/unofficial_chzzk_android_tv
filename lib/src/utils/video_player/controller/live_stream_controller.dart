import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/settings/repository/settings_repository.dart';
import '../../router/app_router.dart';
import '../../shared_preferences/shared_prefs.dart';
import './network_video_controller.dart';
import '../../../features/live/model/live.dart';

part 'live_stream_controller.g.dart';

enum LiveStreamScreenMode {
  full('FULL'),
  chat('CHAT'),
  overlayChat('OVERLAYCHAT');

  final String screenMode;

  const LiveStreamScreenMode(this.screenMode);
}

@riverpod
class LiveStreamController extends _$LiveStreamController {
  @override
  void build() {
    return;
  }

  Future<void> playOrPause(
    // ignore: avoid_build_context_in_providers
    BuildContext context,
    LiveDetail liveDetail,
    ChewieController controller,
    Timer? pauseTimer,
  ) async {
    // Pause
    if (controller.isPlaying) {
      controller.pause();
      // Start pause Timer
      ref.read(pauseTimerProvider.notifier).pauseAndStartTimer();
    }

    // Play
    else {
      // Play back from pause
      if (pauseTimer != null && pauseTimer.isActive) {
        ref.read(pauseTimerProvider.notifier).cancelTimer(); // Cancel timer
        controller.play(); // from pause
      }
      // Play in real-time
      else {
        playAnotherLive(context, controller, liveDetail); // Realtime
      }
    }
  }

  Future<void> playAnotherLive(
    // ignore: avoid_build_context_in_providers
    BuildContext context,
    ChewieController controller,
    LiveDetail liveDetail,
  ) async {
    controller.pause();
    ref.read(controlOverlayTimerProvider.notifier).cancelTimer();

    if (context.mounted) {
      context.pushReplacementNamed(
        AppRoute.liveStreaming.routeName,
        extra: liveDetail,
      );
    }
  }
}

@Riverpod(keepAlive: true)
class LiveStreamScreenModeController extends _$LiveStreamScreenModeController {
  late SettingsRepository _settingRepository;

  @override
  LiveStreamScreenMode build() {
    final SharedPreferences sharedPreferences = ref.read(sharedPrefsProvider);
    _settingRepository = SettingsRepository(sharedPreferences);

    return convertStringToScreenMode(_settingRepository.getScreenMode());
  }

  void showOrHideChat() {
    switch (state) {
      case LiveStreamScreenMode.full:
        _setScreenMode(LiveStreamScreenMode.overlayChat);
      case LiveStreamScreenMode.chat:
        _setScreenMode(LiveStreamScreenMode.full);
      case LiveStreamScreenMode.overlayChat:
        _setScreenMode(LiveStreamScreenMode.full);
    }
  }

  void changeScreenSize() {
    switch (state) {
      case LiveStreamScreenMode.full:
        _setScreenMode(LiveStreamScreenMode.chat);
      case LiveStreamScreenMode.chat:
        _setScreenMode(LiveStreamScreenMode.overlayChat);
      case LiveStreamScreenMode.overlayChat:
        _setScreenMode(LiveStreamScreenMode.chat);
    }
  }

  LiveStreamScreenMode convertStringToScreenMode(String screenModeString) {
    if (screenModeString == 'FULL') {
      return LiveStreamScreenMode.full;
    } else if (screenModeString == 'CHAT') {
      return LiveStreamScreenMode.chat;
    } else if (screenModeString == 'OVERLAYCHAT') {
      return LiveStreamScreenMode.overlayChat;
    } else {
      return LiveStreamScreenMode.full;
    }
  }

  void _setScreenMode(LiveStreamScreenMode mode) {
    state = mode;
    _settingRepository.setScreenMode(mode.screenMode);
  }
}
