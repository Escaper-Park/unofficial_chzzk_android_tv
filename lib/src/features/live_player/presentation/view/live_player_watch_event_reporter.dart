// ignore_for_file: prefer_initializing_formals

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/utils.dart';

typedef PostLivePlayerWatchEvent =
    Future<void> Function({
      required String channelId,
      required int liveId,
      required String watchEventType,
      required String sessionId,
      required int eventDurationSeconds,
      required int positionSeconds,
      required int? awtSeconds,
      required List<String> liveTokens,
      required bool autoPlay,
      required bool radioMode,
      required bool allowStaleSlotTarget,
    });

typedef _PendingLiveWatchEvent = ({
  String watchEventType,
  int positionSeconds,
  int? awtSeconds,
  List<String> liveTokens,
});

final class LivePlayerWatchEventReporter {
  LivePlayerWatchEventReporter({
    required String channelId,
    required int liveId,
    required PostLivePlayerWatchEvent postWatchEvent,
    DateTime? liveOpenDate,
    List<String> liveTokens = const <String>[],
    bool autoPlay = false,
    bool radioMode = false,
    String? sessionId,
    DateTime Function()? now,
    Duration continuedInterval = const Duration(seconds: 30),
    Duration continuedGuard = const Duration(seconds: 29),
  }) : _channelId = channelId,
       _liveId = liveId,
       _postWatchEvent = postWatchEvent,
       _liveOpenDate = liveOpenDate,
       _liveTokens = liveTokens,
       _autoPlay = autoPlay,
       _radioMode = radioMode,
       _sessionId = sessionId ?? const Uuid().v4(),
       _now = now ?? DateTime.now,
       _continuedInterval = continuedInterval,
       _continuedGuard = continuedGuard;

  static const _watchStarted = 'WATCH_STARTED';
  static const _watchContinued = 'WATCH_CONTINUED';
  static const _watchPaused = 'WATCH_PAUSED';
  static const _watchResumed = 'WATCH_RESUMED';
  static const _watchEnded = 'WATCH_ENDED';
  static const _reportedDurationSeconds = 30;
  static const watchEndedEventType = _watchEnded;

  final String _channelId;
  final int _liveId;
  final PostLivePlayerWatchEvent _postWatchEvent;
  final DateTime? _liveOpenDate;
  final bool _autoPlay;
  final bool _radioMode;
  final String _sessionId;
  final DateTime Function() _now;
  final Duration _continuedInterval;
  final Duration _continuedGuard;

  final List<_PendingLiveWatchEvent> _pendingEvents = [];
  Future<void> _sendLoopDone = Future<void>.value();
  int? _replaceableContinuedEventIndex;
  var _sendLoopRunning = false;
  List<String> _liveTokens;
  bool _hasStarted = false;
  bool _isPlaybackActive = false;
  bool _hasPaused = false;
  bool _hasEnded = false;
  DateTime? _lastContinuedSentAt;
  final WatchTimeTracker _watchTime = WatchTimeTracker();
  Duration _lastContinuedWatchTime = Duration.zero;

  void updateLiveTokens(List<String> liveTokens) {
    _liveTokens = liveTokens;
  }

  void start() {
    if (_hasEnded) {
      return;
    }

    if (!_hasStarted) {
      _hasStarted = true;
      _send(watchEventType: _watchStarted);
    }

    if (_isPlaybackActive) {
      return;
    }

    if (_hasPaused) {
      _send(
        watchEventType: _watchResumed,
        awtSeconds: _awtSeconds(),
      );
      _lastContinuedWatchTime = _watchTime.accumulated;
    }

    _hasPaused = false;
    _isPlaybackActive = true;
    _watchTime.start(_now());
  }

  void tick() {
    if (!_isPlaybackActive || _hasEnded) {
      return;
    }

    final currentTime = _now();
    final lastSentAt = _lastContinuedSentAt;
    if (lastSentAt != null &&
        currentTime.difference(lastSentAt) < _continuedGuard) {
      return;
    }

    if (_watchTime.valueAt(currentTime) - _lastContinuedWatchTime <
        _continuedInterval) {
      return;
    }

    _watchTime.accumulateUntil(currentTime);
    _send(
      watchEventType: _watchContinued,
      awtSeconds: _awtSeconds(),
    );
    _lastContinuedSentAt = currentTime;
    _lastContinuedWatchTime = _watchTime.accumulated;
  }

  void pause() {
    if (!_isPlaybackActive || _hasEnded) {
      return;
    }

    _watchTime.stop(_now());
    _isPlaybackActive = false;
    _hasPaused = true;

    _send(
      watchEventType: _watchPaused,
      awtSeconds: _awtSeconds(),
    );
  }

  void suspend() {
    if (!_isPlaybackActive || _hasEnded) {
      return;
    }

    _watchTime.stop(_now());
    _isPlaybackActive = false;
    _hasPaused = true;
  }

  void end() {
    if (_hasEnded) {
      return;
    }

    if (_isPlaybackActive) {
      _watchTime.stop(_now());
    }

    _isPlaybackActive = false;
    _hasEnded = true;
    if (!_hasStarted) {
      return;
    }

    _send(
      watchEventType: _watchEnded,
      awtSeconds: _awtSeconds(),
    );
  }

  Future<void> flush() async {
    while (_sendLoopRunning || _pendingEvents.isNotEmpty) {
      await _sendLoopDone;
    }
  }

  int? _awtSeconds() {
    final seconds = _watchTime.accumulated.inSeconds;
    return seconds <= 0 ? null : seconds;
  }

  int _positionSeconds() {
    final openDate = _liveOpenDate;
    if (openDate == null) {
      return 0;
    }

    final seconds = _now().difference(openDate).inSeconds;
    return seconds < 0 ? 0 : seconds;
  }

  void _send({
    required String watchEventType,
    int? awtSeconds,
  }) {
    final event = (
      watchEventType: watchEventType,
      positionSeconds: _positionSeconds(),
      awtSeconds: awtSeconds,
      liveTokens: [..._liveTokens],
    );
    final replaceableIndex = _replaceableContinuedEventIndex;
    if (watchEventType == _watchContinued && replaceableIndex != null) {
      _pendingEvents[replaceableIndex] = event;
    } else {
      _pendingEvents.add(event);
      _replaceableContinuedEventIndex = watchEventType == _watchContinued
          ? _pendingEvents.length - 1
          : null;
    }
    _ensureSendLoop();
  }

  void _ensureSendLoop() {
    if (_sendLoopRunning || _pendingEvents.isEmpty) {
      return;
    }

    _sendLoopRunning = true;
    final done = Completer<void>();
    _sendLoopDone = done.future;
    unawaited(
      _drainSendQueue().whenComplete(() {
        _sendLoopRunning = false;
        done.complete();
        _ensureSendLoop();
      }),
    );
  }

  Future<void> _drainSendQueue() async {
    while (_pendingEvents.isNotEmpty) {
      final event = _pendingEvents.removeAt(0);
      final replaceableIndex = _replaceableContinuedEventIndex;
      if (replaceableIndex != null) {
        _replaceableContinuedEventIndex = replaceableIndex == 0
            ? null
            : replaceableIndex - 1;
      }

      try {
        await _postWatchEvent(
          channelId: _channelId,
          liveId: _liveId,
          watchEventType: event.watchEventType,
          sessionId: _sessionId,
          eventDurationSeconds: _reportedDurationSeconds,
          positionSeconds: event.positionSeconds,
          awtSeconds: event.awtSeconds,
          liveTokens: event.liveTokens,
          autoPlay: _autoPlay,
          radioMode: _radioMode,
          allowStaleSlotTarget: event.watchEventType == _watchEnded,
        );
      } on Object {
        debugPrint('Failed to post live watch event.');
      }
    }
  }
}
