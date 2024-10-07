import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../utils/hls_parser/hls_parser.dart';
import '../../../setting/controller/stream_settings_controller.dart';
import 'vod_chat_controller.dart';
import 'vod_overlay_controller.dart';
import 'vod_playlist_controller.dart';

part 'vod_player_controller.g.dart';

enum PlaybackDirection {
  forward,
  backword,
}

@riverpod
class VodPlayerController extends _$VodPlayerController {
  late int _playbackInterval;
  late int _resolutionIndex;
  late VodPlay? _vodPlay;
  Timer? _vodChatSeekTimer;

  VodPlay? getVodPlay() => _vodPlay;

  @override
  FutureOr<Raw<VideoPlayerController?>> build() async {
    final playbackIntervalIndex = ref.read(streamSettingsControllerProvider
        .select((value) => value.vodPlaybackIntervalIndex));

    _resolutionIndex = ref.read(streamSettingsControllerProvider.select(
      (value) => value.vodResolutionIndex,
    ));

    _playbackInterval = switch (playbackIntervalIndex) {
      0 => 5,
      1 => 10,
      2 => 30,
      _ => 10,
    };

    _vodPlay = ref.read(vodPlaylistControllerProvider);

    return await init();
  }

  Future<VideoPlayerController?> init({int duration = 0}) async {
    try {
      if (_vodPlay?.$2 != null) {
        final Uri uri = Uri.parse(_vodPlay!.$2);
        final queryParams = uri.queryParameters;

        final mediaList =
            await HlsParser(uri.toString()).getVodMediaPlaylistUris();
        int resolutionIndex = _resolutionIndex;

        if (mediaList != null) {
          Uri? mediaTrackUrl;
          // Auto
          if (_resolutionIndex == 2) {
            mediaTrackUrl = mediaList.first;
          }
          // Selected
          else {
            if (mediaList.length < _resolutionIndex + 1) {
              resolutionIndex = mediaList.length - 1;
            }
            mediaTrackUrl = mediaList[resolutionIndex];
          }

          final controller =
              _getVideoPlayerController(mediaTrackUrl!, queryParams);

          await controller.initialize();

          if (duration != 0) {
            await controller.seekTo(Duration(seconds: duration));
          }

          await controller.play();
          controller.addListener(_checkVideoEnds);

          return controller;
        }
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  void _checkVideoEnds() async {
    final value = state.value?.value;

    if (value != null) {
      final bool checkEnds =
          value.hasError == true || (value.isInitialized && value.isCompleted);

      if (checkEnds) {
        state = const AsyncValue.data(null);
        await WakelockPlus.disable();
        // Check again
        WakelockPlus.enabled.then(
          (value) async {
            if (value == true) await WakelockPlus.disable();
          },
        );
      }
    }
  }

  Future<void> dispose() async {
    _vodChatSeekTimer?.cancel();
    _vodChatSeekTimer = null;

    ref.read(vodChatQueueProvider.notifier).reset();

    if (state.value?.value.isPlaying == true) {
      await state.value!.pause();
    }
    state.value?.removeListener(_checkVideoEnds);
    state.value?.dispose();
  }

  void changeResolution(int resolutionIndex) async {
    final lastPosition = state.value?.value.position.inSeconds;
    _resolutionIndex = resolutionIndex;

    await changeSource(duration: lastPosition!);
  }

  Future<void> changeSource({int duration = 0}) async {
    dispose();
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        _vodPlay = ref.read(vodPlaylistControllerProvider);
        return await init(duration: duration);
      },
    );
  }

  VideoPlayerController _getVideoPlayerController(
    Uri uri,
    Map<String, String> queryParams,
  ) {
    return VideoPlayerController.networkUrl(
      uri,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false),
      httpHeaders: queryParams,
    );
  }

  int getCurrentResolutionIndex() => _resolutionIndex;

  Future<void> seekToByButton({
    required FocusNode videoFocusNode,
    required PlaybackDirection direction,
  }) async {
    final value = state.value?.value;

    if (value != null) {
      final currentPos = value.position;

      switch (direction) {
        case PlaybackDirection.forward:
          final newPos = currentPos + Duration(seconds: _playbackInterval);
          if (newPos <= value.duration) {
            ref.read(vodSeekIndicatorProvider.notifier).startTimer(direction);

            await state.value!.seekTo(newPos);
            updateChat(direction);
          }
          break;
        case PlaybackDirection.backword:
          final newPos = currentPos - Duration(seconds: _playbackInterval);
          ref.read(vodSeekIndicatorProvider.notifier).startTimer(direction);
          await state.value!.seekTo(newPos);

          updateChat(direction);
          break;
      }

      // keep overlay state
      ref
          .read(vodOverlayControllerProvider.notifier)
          .resetOverlayTimer(videoFocusNode: videoFocusNode);
    }
  }

  Future<void> seekToBySlider({required Duration duration}) async {
    _removeChatListener();
    await state.value!.seekTo(duration);
  }

  Future<void> updateChat(PlaybackDirection direction) async {
    // Vod Chat
    if (_vodPlay?.$1.videoChatEnabled == true) {
      _removeChatListener();
      _vodChatSeekTimer?.cancel();
      _vodChatSeekTimer = Timer(
        const Duration(milliseconds: 500),
        () async {
          // forward
          if (direction == PlaybackDirection.forward) {
            await ref
                .read(vodChatControllerProvider(controller: state.value!)
                    .notifier)
                .vodChatForwardSeekTo();
          }
          // backward
          else {
            await ref
                .read(vodChatControllerProvider(controller: state.value!)
                    .notifier)
                .vodChatBackwardSeekTo();
          }
        },
      );
    }
  }

  void _removeChatListener() {
    ref
        .read(vodChatControllerProvider(controller: state.value!).notifier)
        .removeListener();
  }

  void pause() {
    state.value?.pause();
  }

  void resume() {
    if (!state.value!.value.isPlaying) {
      state.value?.play();
    }
  }

  // // TODO: POST Paused Event
  // void pause({
  //   required Vod vod,
  //   required VideoPlayerController controller,
  //   required FocusNode videoFocusNode,
  // }) {
  //   final VodEvent event = VodEvent(
  //     channelId: vod.channel.channelId,
  //     videoNo: vod.videoNo,
  //     payload: Payload(
  //       watchEventType: WatchEventType.watchPaused.value,
  //       sessionId: '', // TODO: Get Session From Server
  //       duration: vod.duration,
  //       positionAt: controller.value.position.inSeconds,
  //     ),
  //     totalLength: vod.duration,
  //   );

  //   // keep overlay state
  //   // ref
  //   //     .read(vodOverlayControllerProvider.notifier)
  //   //     .resetOverlayTimer(videoFocusNode: videoFocusNode);
  // }

  // // TODO: POST Ended Event
  // void end() {}
}

@riverpod
class VodSeekIndicator extends _$VodSeekIndicator {
  Timer? _timer;
  late PlaybackDirection? _direction;

  PlaybackDirection? getCurrentDirection() => _direction;

  @override
  bool build() {
    _direction = null;
    // if true, show icon
    return false;
  }

  void startTimer(PlaybackDirection direction) {
    _direction = direction;
    _resetTimer();

    state = true;
    _timer = Timer(
      const Duration(milliseconds: 500),
      () {
        state = false;
        _resetTimer();
      },
    );
  }

  void _resetTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
