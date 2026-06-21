import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/live_feed.dart';
import 'live_preview_settings.dart';
import 'live_preview_state.dart';

typedef LivePreviewSettingsReader = Future<LivePreviewSettings?> Function();

typedef LivePreviewPlaybackUriResolver =
    Future<Uri?> Function({
      required Live item,
      required LivePreviewSettings settings,
      required bool Function() isCancelled,
    });

final class LivePreviewController extends ValueNotifier<LivePreviewState> {
  LivePreviewController() : super(LivePreviewState.inactive());

  final _progressTimer = PeriodicCallbackTimer();
  Timer? _waitTimer;
  Timer? _playbackTimer;
  var _generation = 0;
  var _disposed = false;

  Future<void> start({
    required bool hasFocus,
    required Live item,
    required LivePreviewSettings? settings,
    required LivePreviewSettingsReader readSettings,
    required LivePreviewPlaybackUriResolver resolvePlaybackUri,
  }) async {
    if (!hasFocus) {
      stop();
      return;
    }

    final requestGeneration = _beginRequest();
    final resolvedSettings = settings ?? await _readSettings(readSettings);
    if (!_isCurrent(requestGeneration)) {
      return;
    }

    if (resolvedSettings == null ||
        !resolvedSettings.enabled ||
        !canAttemptLivePreviewFromFeed(item)) {
      stop();
      return;
    }

    _startWaiting(
      requestGeneration: requestGeneration,
      item: item,
      settings: resolvedSettings,
      resolvePlaybackUri: resolvePlaybackUri,
    );
  }

  void stop({bool resetState = true}) {
    if (_disposed) {
      return;
    }

    _generation += 1;
    _cancelTimers();
    if (resetState) {
      value = LivePreviewState.inactive();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _generation += 1;
    _cancelTimers();
    super.dispose();
  }

  int _beginRequest() {
    _generation += 1;
    _cancelTimers();
    return _generation;
  }

  Future<LivePreviewSettings?> _readSettings(
    LivePreviewSettingsReader readSettings,
  ) async {
    try {
      return await readSettings();
    } on Object {
      return null;
    }
  }

  void _startWaiting({
    required int requestGeneration,
    required Live item,
    required LivePreviewSettings settings,
    required LivePreviewPlaybackUriResolver resolvePlaybackUri,
  }) {
    final waitDuration = settings.waitDuration;
    if (waitDuration <= Duration.zero) {
      unawaited(
        _playPreview(
          requestGeneration: requestGeneration,
          item: item,
          settings: settings,
          resolvePlaybackUri: resolvePlaybackUri,
        ),
      );
      return;
    }

    final startedAt = DateTime.now();
    value = LivePreviewState.waiting(0);
    _progressTimer.start(
      interval: _progressTick,
      onTick: () {
        if (!_isCurrent(requestGeneration)) {
          return;
        }

        final elapsed = DateTime.now().difference(startedAt);
        value = LivePreviewState.waiting(
          elapsed.inMicroseconds / waitDuration.inMicroseconds,
        );
      },
    );
    _waitTimer = Timer(waitDuration, () {
      unawaited(
        _playPreview(
          requestGeneration: requestGeneration,
          item: item,
          settings: settings,
          resolvePlaybackUri: resolvePlaybackUri,
        ),
      );
    });
  }

  Future<void> _playPreview({
    required int requestGeneration,
    required Live item,
    required LivePreviewSettings settings,
    required LivePreviewPlaybackUriResolver resolvePlaybackUri,
  }) async {
    _progressTimer.stop();
    if (_isCurrent(requestGeneration)) {
      value = LivePreviewState.waiting(1);
    }

    final playbackUri = await resolvePlaybackUri(
      item: item,
      settings: settings,
      isCancelled: () => !_isCurrent(requestGeneration),
    );
    if (!_isCurrent(requestGeneration)) {
      return;
    }

    if (playbackUri == null) {
      _finish(requestGeneration);
      return;
    }

    value = LivePreviewState.playing(
      playbackUri: playbackUri,
      muted: !settings.audioEnabled,
      videoViewType: settings.videoViewType,
    );

    final playbackDuration = settings.playbackDuration;
    if (playbackDuration == null) {
      return;
    }

    _playbackTimer = Timer(
      playbackDuration,
      () => _finish(requestGeneration),
    );
  }

  void _finish(int requestGeneration) {
    if (!_isCurrent(requestGeneration)) {
      return;
    }

    _cancelTimers();
    value = LivePreviewState.finished();
  }

  bool _isCurrent(int requestGeneration) {
    return !_disposed && _generation == requestGeneration;
  }

  void _cancelTimers() {
    _progressTimer.stop();
    _waitTimer?.cancel();
    _waitTimer = null;
    _playbackTimer?.cancel();
    _playbackTimer = null;
  }
}

const _progressTick = Duration(milliseconds: 50);
