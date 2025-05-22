import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

import '../../../common/constants/enums.dart' show LiveMode;
import './live_mode_controller.dart';
import '../../../utils/dio/dio_client.dart';
import '../../../utils/hls_parser/hls_parser.dart';
import '../../../utils/wakelock/wakelock_controller.dart';
import '../../live/model/live_detail.dart';
import '../../live/repository/live_repository.dart';
import '../../settings/controller/stream_setting_controller.dart';
import 'live_playlist_controller.dart';

part 'live_player_controller.g.dart';

@riverpod
class LivePlayerController extends _$LivePlayerController {
  late LiveStatusRepository _repository;
  late LiveDetail _liveDetail;
  late int _latencyIndex;
  late int _resolutionIndex;
  bool _wakelockEnabled = false;

  @override
  FutureOr<Raw<VideoPlayerController?>> build({required int index}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveStatusRepository(dio);

    final streamSettings = ref.read(streamSettingsControllerProvider);
    final liveDetails = ref.read(livePlaylistControllerProvider);

    _latencyIndex = streamSettings.latencyIndex;
    _resolutionIndex = index == 0
        ? streamSettings.resolutionIndex
        : streamSettings.multiviewResolutionIndex;

    _liveDetail = liveDetails[index];

    return await init();
  }

  Future<VideoPlayerController?> init({bool mute = true}) async {
    int resolutionIndex = _resolutionIndex;
    try {
      // find media by latency
      final media = _liveDetail.livePlaybackJson.media.firstWhere(
        (m) {
          return _latencyIndex == 0 ? m.mediaId == "HLS" : m.mediaId == "LLHLS";
        },
      );

      final mediaList = await HlsParser(hlsUrl: media.path)
          .getMediaPlaylistSortByResolution(4);

      if (mediaList == null) return null;

      Uri? mediaTrackUri;
      // auto
      if (_resolutionIndex == 4) {
        mediaTrackUri =
            Uri.parse(_liveDetail.livePlaybackJson.media[_latencyIndex].path);
      }
      // others
      else {
        if (mediaList.length < _resolutionIndex + 1) {
          resolutionIndex = mediaList.length - 1;
        }
        mediaTrackUri = mediaList[resolutionIndex];
      }

      final controller = _getVideoPlayerController(mediaTrackUri!);
      await controller.initialize();

      if (index != 0 && mute) controller.setVolume(0.0);

      await controller.play();
      controller.addListener(_checkVideoEnds);

      return controller;
    } catch (_) {
      return null;
    }
  }

  Future<void> changeSource() async {
    await dispose();
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        _liveDetail = ref.read(livePlaylistControllerProvider)[index];

        return await init();
      },
    );
  }

  Future<void> changeResolution({required int resolutionIndex}) async {
    await dispose();
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        final currentActivatedAudioSourceIndex =
            ref.read(currentActivatedAudioControllerProvider);

        _resolutionIndex = resolutionIndex;
        return await init(mute: index != currentActivatedAudioSourceIndex);
      },
    );
  }

  Future<void> pause() async {
    await state.value!.pause();
    await ref.read(wakelockControllerProvider.notifier).disable();
  }

  Future<void> resume() async {
    if (state.value?.value.isPlaying == false) {
      await state.value?.play();
      await ref.read(wakelockControllerProvider.notifier).enable();
    }
  }

  Future<void> dispose() async {
    state.value?.removeListener(_checkVideoEnds);
    await ref.read(wakelockControllerProvider.notifier).disable();
    await state.value?.dispose();
  }

  Future<void> _checkVideoEnds() async {
    final controller = state.value!;
    final ended = await _isVideoEnded(controller);

    if (ended) {
      if (_wakelockEnabled) {
        final liveMode = ref.read(liveModeControllerProvider);

        if (liveMode == LiveMode.single) {
          await ref.read(wakelockControllerProvider.notifier).disable();
          _wakelockEnabled = false;
        }
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

  Future<bool> _isVideoEnded(VideoPlayerController controller) async {
    final value = controller.value;

    if (!value.isInitialized) return false;

    bool res = false;
    if (!value.isPlaying) {
      await Future.delayed(const Duration(seconds: 120));

      final liveStatus = await _repository.getLiveStatus(
        includePlayerRecommendContent: false,
        channelId: _liveDetail.channel.channelId,
      );

      return liveStatus == null || liveStatus.status == "CLOSE";
    }

    return res;
  }

  Future<void> toggleMute(bool mute) async {
    state.value!.setVolume(mute ? 0.0 : 1.0);
  }

  VideoPlayerController _getVideoPlayerController(Uri uri) {
    return VideoPlayerController.networkUrl(
      uri,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
  }

  Future<void> playOrPause() async {
    final controller = state.value!;
    final liveMode = ref.read(liveModeControllerProvider);
    // pause
    if (controller.value.isPlaying) {
      await controller.pause();

      // start pause timer for real time play after 45s.
      ref.read(pauseTimerProvider.notifier).pauseAndStartTimer();

      if (liveMode == LiveMode.single) {
        await ref.read(wakelockControllerProvider.notifier).disable();
      }
    }
    // play
    else {
      final pauseTimer = ref.read(pauseTimerProvider);
      // resume
      if (pauseTimer != null && pauseTimer.isActive) {
        ref.read(pauseTimerProvider.notifier).cancelTimer();
        await controller.play();
      }
      // play in real time
      else {
        await dispose();
        await changeSource();
      }
      await ref.read(wakelockControllerProvider.notifier).enable();
    }
  }

  int getCurrentResolutionIndex() => _resolutionIndex;
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
