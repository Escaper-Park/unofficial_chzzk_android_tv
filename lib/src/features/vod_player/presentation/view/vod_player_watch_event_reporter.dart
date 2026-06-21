// ignore_for_file: prefer_initializing_formals

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/utils.dart';

typedef PostVodPlayerWatchEvent =
    Future<void> Function({
      required String channelId,
      required int videoNo,
      required String watchEventType,
      required int? awtSeconds,
      required int positionSeconds,
      required String sessionId,
      required int eventDurationSeconds,
      required int totalLengthSeconds,
    });

final class VodPlayerWatchEventReporter {
  VodPlayerWatchEventReporter({
    required String channelId,
    required int videoNo,
    required int durationSeconds,
    required PostVodPlayerWatchEvent postWatchEvent,
    String? sessionId,
    DateTime Function()? now,
    Duration continuedInterval = const Duration(seconds: 10),
  }) : _channelId = channelId,
       _videoNo = videoNo,
       _durationSeconds = durationSeconds,
       _postWatchEvent = postWatchEvent,
       _sessionId = sessionId ?? const Uuid().v4(),
       _now = now ?? DateTime.now,
       _continuedInterval = continuedInterval;

  static const _watchStarted = 'WATCH_STARTED';
  static const _watchContinued = 'WATCH_CONTINUED';
  static const _watchPaused = 'WATCH_PAUSED';
  static const _watchResumed = 'WATCH_RESUMED';
  static const _watchEnded = 'WATCH_ENDED';
  static const _reportedDurationSeconds = 10;
  static const watchEndedEventType = _watchEnded;

  final String _channelId;
  final int _videoNo;
  final int _durationSeconds;
  final PostVodPlayerWatchEvent _postWatchEvent;
  final String _sessionId;
  final DateTime Function() _now;
  final Duration _continuedInterval;

  Future<void> _pendingSend = Future<void>.value();
  bool _hasStarted = false;
  bool _isPlaybackActive = false;
  bool _hasPaused = false;
  bool _hasEnded = false;
  final WatchTimeTracker _watchTime = WatchTimeTracker();
  Duration _lastContinuedWatchTime = Duration.zero;

  void start({required int positionSeconds}) {
    if (_hasEnded) {
      return;
    }

    if (!_hasStarted) {
      _hasStarted = true;
      _send(
        watchEventType: _watchStarted,
        positionSeconds: positionSeconds,
      );
    }

    if (_isPlaybackActive) {
      return;
    }

    if (_hasPaused) {
      _send(
        watchEventType: _watchResumed,
        positionSeconds: positionSeconds,
        awtSeconds: _awtSeconds(),
      );
      _lastContinuedWatchTime = _watchTime.accumulated;
    }

    _hasPaused = false;
    _isPlaybackActive = true;
    _watchTime.start(_now());
  }

  void tick({required int positionSeconds}) {
    if (!_isPlaybackActive || _hasEnded) {
      return;
    }

    final currentTime = _now();
    if (_watchTime.valueAt(currentTime) - _lastContinuedWatchTime >=
        _continuedInterval) {
      _watchTime.accumulateUntil(currentTime);
      _send(
        watchEventType: _watchContinued,
        positionSeconds: positionSeconds,
        awtSeconds: _awtSeconds(),
      );
      _lastContinuedWatchTime = _watchTime.accumulated;
    }
  }

  void seekCommitted({required int positionSeconds}) {
    if (!_isPlaybackActive || _hasEnded || !_hasStarted) {
      return;
    }

    _watchTime.accumulateUntil(_now());
    _send(
      watchEventType: _watchResumed,
      positionSeconds: positionSeconds,
      awtSeconds: _awtSeconds(),
    );
    _lastContinuedWatchTime = _watchTime.accumulated;
  }

  void pause({required int positionSeconds}) {
    if (!_isPlaybackActive || _hasEnded) {
      return;
    }

    _watchTime.stop(_now());
    _isPlaybackActive = false;
    _hasPaused = true;

    _send(
      watchEventType: _watchPaused,
      positionSeconds: positionSeconds,
      awtSeconds: _awtSeconds(),
    );
  }

  void suspend({required int positionSeconds}) {
    if (!_isPlaybackActive || _hasEnded) {
      return;
    }

    _watchTime.stop(_now());
    _isPlaybackActive = false;
    _hasPaused = false;
  }

  void end({
    required int positionSeconds,
    bool reportPauseIfActive = true,
  }) {
    if (_hasEnded) {
      return;
    }

    final wasPlaybackActive = _isPlaybackActive;
    if (_isPlaybackActive) {
      _watchTime.stop(_now());
    }

    _isPlaybackActive = false;
    _hasEnded = true;
    if (!_hasStarted) {
      return;
    }

    if (wasPlaybackActive && reportPauseIfActive) {
      _send(
        watchEventType: _watchPaused,
        positionSeconds: positionSeconds,
        awtSeconds: _awtSeconds(),
      );
    }
    _send(
      watchEventType: _watchEnded,
      positionSeconds: positionSeconds,
      awtSeconds: _awtSeconds(),
    );
  }

  Future<void> flush() {
    return _pendingSend;
  }

  int? _awtSeconds() {
    final seconds = _watchTime.accumulated.inSeconds
        .clamp(0, _durationSeconds)
        .toInt();
    return seconds <= 0 ? null : seconds;
  }

  void _send({
    required String watchEventType,
    required int positionSeconds,
    int? awtSeconds,
  }) {
    _pendingSend = _pendingSend.then((_) async {
      try {
        await _postWatchEvent(
          channelId: _channelId,
          videoNo: _videoNo,
          watchEventType: watchEventType,
          awtSeconds: awtSeconds,
          positionSeconds: positionSeconds.clamp(0, _durationSeconds).toInt(),
          sessionId: _sessionId,
          eventDurationSeconds: _reportedDurationSeconds,
          totalLengthSeconds: _durationSeconds,
        );
      } on Object {
        debugPrint('Failed to post VOD watch event.');
      }
    });
  }
}
