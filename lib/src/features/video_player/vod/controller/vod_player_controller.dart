import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../utils/hls_parser/hls_parser.dart';
import '../../../setting/controller/stream_settings_controller.dart';
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
      final bool checkEnds = value.hasError == true ||
          (value.isInitialized &&
              (value.position >= value.duration) &&
              !value.isPlaying);

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

  void seekTo({
    required VideoPlayerController controller,
    required FocusNode videoFocusNode,
    required PlaybackDirection direction,
  }) {
    final currentPos = controller.value.position;

    switch (direction) {
      case PlaybackDirection.forward:
        final newPos = currentPos + Duration(seconds: _playbackInterval);
        if (newPos <= controller.value.duration) {
          controller.seekTo(newPos);
        }
        break;
      case PlaybackDirection.backword:
        final newPos = currentPos - Duration(seconds: _playbackInterval);
        controller.seekTo(newPos);
        break;
    }

    // keep overlay state
    ref
        .read(vodOverlayControllerProvider.notifier)
        .resetOverlayTimer(videoFocusNode: videoFocusNode);
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
