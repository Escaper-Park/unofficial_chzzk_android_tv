import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

import '../../../common/constants/enums.dart' show PlaybackDirection;
// import '../../../utils/dio/dio_client.dart';
import '../../../utils/hls_parser/hls_parser.dart';
import '../../../utils/wakelock/wakelock_controller.dart';
import '../../settings/controller/stream_setting_controller.dart';
// import '../../vod/model/vod_event.dart';
// import '../../vod/repository/vod_repository.dart';
import 'vod_chat_controller.dart';
import 'vod_playlist_controller.dart';
import 'vod_seek_indicator_controller.dart';

part 'vod_player_controller.g.dart';

@riverpod
class VodPlayerController extends _$VodPlayerController {
  // vod and vod path
  late VodPlay? _vodPlay;
  late int _resolutionIndex;
  late int _playbackIntervalIndex;
  bool _wakelockEnabled = false;
  // late String _sessionId;
  // late VodRepository _repository;

  /* vod event */
  // Timer? _watchContinuedTimer;
  // int _accumulatedAwtSec = 0;
  // DateTime? _lastPlayTimestamp;
  // bool _isPaused = false;
  // bool _isSeeking = false;

  @override
  FutureOr<Raw<VideoPlayerController?>> build() async {
    // final Dio dio = ref.watch(dioClientProvider);
    // _repository = VodRepository(dio);

    // final uuid = Uuid();
    // _sessionId = uuid.v4();

    _playbackIntervalIndex = ref.read(
      streamSettingsControllerProvider.select(
        (setting) => setting.vodPlaybackIntervalIndex,
      ),
    );

    _resolutionIndex = ref.read(
      streamSettingsControllerProvider.select(
        (setting) => setting.vodResolutionIndex,
      ),
    );

    _vodPlay = ref.read(vodPlaylistControllerProvider);

    // Ensure cleanup when provider is disposed
    ref.onDispose(() async {
      await _cleanupController();
    });

    return await init();
  }

  /// Cleans up controller resources.
  Future<void> _cleanupController() async {
    final controller = state.valueOrNull;
    if (controller != null) {
      controller.removeListener(_checkVideoEnds);
      await controller.dispose();
    }
    await ref.read(wakelockControllerProvider.notifier).disable();
  }

  Future<VideoPlayerController?> init({int? startPos}) async {
    int resolutionIndex = _resolutionIndex;
    VideoPlayerController? controller;

    try {
      if (_vodPlay?.$2 == null) return null;

      final Uri uri = Uri.parse(_vodPlay!.$2);
      final queryParams =
          uri.queryParameters; // add `_lsu_sa_` to all the partial ts files.

      final mediaList = await HlsParser(hlsUrl: uri.toString())
          .getMediaPlaylistSortByResolution(2);

      if (mediaList == null) return null;

      Uri? mediaTrackUri;
      // auto
      if (_resolutionIndex == 2) {
        mediaTrackUri = mediaList.first;
      }
      // others (1080p, 720p)
      else {
        // handle error
        if (mediaList.length < _resolutionIndex + 1) {
          resolutionIndex = mediaList.length - 1;
        }
        mediaTrackUri = mediaList[resolutionIndex];
      }

      controller = _getVideoPlayerController(mediaTrackUri!, queryParams);
      await controller.initialize();

      if (startPos == null) {
        final watchTimeline = _vodPlay!.$1.watchTimeline;
        if (watchTimeline != null) {
          await controller.seekTo(Duration(seconds: watchTimeline));
        }
      } else {
        await controller.seekTo(Duration(seconds: startPos));
      }

      await controller.play();
      controller.addListener(_checkVideoEnds);

      await ref.read(wakelockControllerProvider.notifier).enable();

      // await postEvent(
      //   controller,
      //   WatchEventType.watchStarted,
      //   null,
      // );

      // _lastPlayTimestamp = DateTime.now();
      // _isPaused = false;
      // _startWatchContinuedTimer();

      return controller;
    } catch (_) {
      // Clean up partially initialized controller on error
      await controller?.dispose();
      return null;
    }
  }

  // void _updateAwt() {
  //   if (_lastPlayTimestamp != null) {
  //     final now = DateTime.now();
  //     final deltaSec = now.difference(_lastPlayTimestamp!).inSeconds;
  //     _accumulatedAwtSec += deltaSec;
  //     final total = _vodPlay!.$1.duration;
  //     if (_accumulatedAwtSec > total) {
  //       _accumulatedAwtSec = total;
  //     }
  //     _lastPlayTimestamp = now;
  //   }
  // }

  // void _startWatchContinuedTimer() {
  //   _watchContinuedTimer?.cancel();
  //   _watchContinuedTimer = Timer.periodic(
  //     const Duration(seconds: 10),
  //     (timer) async {
  //       if (!_isPaused && !_isSeeking) {
  //         _updateAwt();
  //         await postEvent(
  //           state.value,
  //           WatchEventType.watchContinued,
  //           _accumulatedAwtSec,
  //         );
  //       }
  //     },
  //   );
  // }

  // void _stopWatchContinuedTimer() {
  //   _watchContinuedTimer?.cancel();
  //   _watchContinuedTimer = null;
  // }

  // awt: actual watching time
  // Future<void> postEvent(
  //   VideoPlayerController? controller,
  //   WatchEventType eventType,
  //   int? awt, {
  //   bool init = false,
  // }) async {
  //   if (controller != null) {
  //     final totalLength = _vodPlay!.$1.duration;
  //     final fixedAwt = awt == null
  //         ? null
  //         : awt > totalLength
  //             ? totalLength
  //             : awt;

  //     final watchEvent = VodEvent(
  //       channelId: _vodPlay!.$1.channel!.channelId,
  //       videoNo: _vodPlay!.$1.videoNo,
  //       payload: Payload(
  //         watchEventType: eventType.value,
  //         sessionId: _sessionId,
  //         duration: 10,
  //         positionAt: controller.value.position.inSeconds,
  //         awt: fixedAwt,
  //       ),
  //       totalLength: _vodPlay!.$1.duration,
  //     );
  //     try {

  //     await _repository.postWatchingEvent(event: watchEvent);
  //     }catch (e) {
  //       print('test $e');
  //     }
  //     print('test ${eventType.value} awt $fixedAwt');
  //   }
  // }

  int getCurrentResolutionIndex() => _resolutionIndex;

  Future<void> pause() async {
    // if (_isPaused) return;

    // _updateAwt();
    // await postEvent(
    //   state.value,
    //   WatchEventType.watchPaused,
    //   _accumulatedAwtSec,
    // );
    // _stopWatchContinuedTimer();
    // _isPaused = true;

    await state.value?.pause();
    await ref.read(wakelockControllerProvider.notifier).disable();
  }

  Future<void> resume() async {
    // if (!_isPaused) return;

    if (state.value?.value.isPlaying == false) {
      // _lastPlayTimestamp = DateTime.now();
      // await postEvent(
      //   state.value,
      //   WatchEventType.watchResumed,
      //   _accumulatedAwtSec,
      // );

      // _isPaused = false;
      // _startWatchContinuedTimer();

      await state.value?.play();
      await ref.read(wakelockControllerProvider.notifier).enable();
    }
  }

  Future<void> seekToByButton({
    required PlaybackDirection direction,
    required bool endSeek,
  }) async {
    // _isSeeking = true;
    // _stopWatchContinuedTimer();
    // _updateAwt();

    final chatQueueNotifier = ref.read(
      vodChatQueueControllerProvider(videoNo: _vodPlay!.$1.videoNo).notifier,
    );

    chatQueueNotifier.toggleIsSeeking(true);

    ref
        .read(
          vodChatControllerProvider(
            controller: state.value!,
            videoNo: _vodPlay!.$1.videoNo,
          ).notifier,
        )
        .clearChatBufer();

    final value = state.value?.value;
    final int playbackInterval =
        _getPlaybackIntervalByIndex(_playbackIntervalIndex);

    if (value != null) {
      final currentPos = value.position;

      switch (direction) {
        case PlaybackDirection.forward:
          final newPos = currentPos + Duration(seconds: playbackInterval);
          if (newPos <= value.duration) {
            ref
                .read(vodSeekIndicatorControllerProvider.notifier)
                .startTimer(direction);

            await state.value!.seekTo(newPos);
            if (endSeek) {
              await chatQueueNotifier.endSeekAndUpdateChat(
                direction,
                newPos.inMilliseconds,
              );
            }
          }
          break;
        case PlaybackDirection.backward:
          final newPos = currentPos - Duration(seconds: playbackInterval);
          ref
              .read(vodSeekIndicatorControllerProvider.notifier)
              .startTimer(direction);
          await state.value!.seekTo(newPos);

          if (endSeek) {
            await chatQueueNotifier.endSeekAndUpdateChat(
              direction,
              newPos.inMilliseconds,
            );
          }
          break;
      }
    }
    chatQueueNotifier.toggleIsSeeking(false);
    // _isSeeking = false;
    // if (!_isPaused) {
    //   _lastPlayTimestamp = DateTime.now();
    //   _startWatchContinuedTimer();
    // }
  }

  Future<void> seekTo({
    required bool endSeek,
    required PlaybackDirection direction,
    required Duration duration,
  }) async {
    final chatQueueNotifier = ref.read(
      vodChatQueueControllerProvider(videoNo: _vodPlay!.$1.videoNo).notifier,
    );

    chatQueueNotifier.toggleIsSeeking(true);
    // _isSeeking = true;

    ref
        .read(
          vodChatControllerProvider(
            controller: state.value!,
            videoNo: _vodPlay!.$1.videoNo,
          ).notifier,
        )
        .clearChatBufer();
    await state.value!.seekTo(duration);
    if (endSeek) {
      await chatQueueNotifier.endSeekAndUpdateChat(
        direction,
        duration.inMilliseconds,
      );
    }
    chatQueueNotifier.toggleIsSeeking(false);
    // _isSeeking = false;
  }

  Future<void> dispose() async {
    // _updateAwt();
    // await postEvent(
    //   state.value,
    //   WatchEventType.watchEnded,
    //   _accumulatedAwtSec,
    // );
    // _stopWatchContinuedTimer();

    state.value?.removeListener(_checkVideoEnds);
    await ref.read(wakelockControllerProvider.notifier).disable();
    await state.value?.dispose();
  }

  Future<void> changeSource({int? startPos}) async {
    await dispose();
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      _vodPlay = ref.read(vodPlaylistControllerProvider);
      return await init(startPos: startPos);
    });
  }

  Future<void> changeResolution({required int resolutionIndex}) async {
    final lastPos = state.value?.value.position.inSeconds;
    _resolutionIndex = resolutionIndex;

    await changeSource(startPos: lastPos);
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

  Future<void> _checkVideoEnds() async {
    final controller = state.value!;
    final ended = _isVideoEnded(controller);

    if (ended) {
      if (_wakelockEnabled) {
        await ref.read(wakelockControllerProvider.notifier).disable();
        _wakelockEnabled = false;
        state = const AsyncValue.data(null);
      }

      await dispose();
    } else {
      if (!_wakelockEnabled) {
        await ref.read(wakelockControllerProvider.notifier).enable();
        _wakelockEnabled = true;
      }
    }
  }

  bool _isVideoEnded(VideoPlayerController controller) {
    final value = controller.value;

    if (!value.isInitialized) return false;

    final position = value.position;
    final duration = value.duration;

    if (!value.isPlaying && position == duration) {
      return true;
    }

    if (position > duration) {
      return true;
    }

    const threshold = Duration(milliseconds: 200);
    if (duration - position <= threshold) {
      return true;
    }

    if (!value.isLooping &&
        !value.isPlaying &&
        !value.isBuffering &&
        position >= duration) {
      return true;
    }

    return false;
  }

  int _getPlaybackIntervalByIndex(int playbackIntervalIndex) {
    return switch (playbackIntervalIndex) {
      0 => 5,
      1 => 10,
      2 => 30,
      _ => 10,
    };
  }
}
