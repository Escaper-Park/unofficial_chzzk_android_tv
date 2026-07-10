// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_watch_event_reporter.dart';

void main() {
  test('reports started and continued every 10 watched seconds', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
    );

    reporter.start(positionSeconds: 0);
    now = now.add(const Duration(seconds: 9));
    reporter.tick(positionSeconds: 9);
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
    ]);

    now = now.add(const Duration(seconds: 1));
    reporter.tick(positionSeconds: 10);
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(
        type: 'WATCH_CONTINUED',
        positionSeconds: 10,
        awtSeconds: 10,
      ),
    ]);
  });

  test('reports pause and resume with cumulative watched time', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
    );

    reporter.start(positionSeconds: 0);
    now = now.add(const Duration(seconds: 5));
    reporter.pause(positionSeconds: 5);
    now = now.add(const Duration(seconds: 30));
    reporter.start(positionSeconds: 5);
    now = now.add(const Duration(seconds: 10));
    reporter.tick(positionSeconds: 15);
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(type: 'WATCH_PAUSED', positionSeconds: 5, awtSeconds: 5),
      _call(type: 'WATCH_RESUMED', positionSeconds: 5, awtSeconds: 5),
      _call(
        type: 'WATCH_CONTINUED',
        positionSeconds: 15,
        awtSeconds: 15,
      ),
    ]);
  });

  test(
    'reports resumed when active playback seeks to committed position',
    () async {
      var now = DateTime(2026);
      final calls = <_WatchEventCall>[];
      final reporter = _reporter(
        calls: calls,
        now: () => now,
      );

      reporter.start(positionSeconds: 0);
      now = now.add(const Duration(seconds: 5));
      reporter.seekCommitted(positionSeconds: 30);
      await reporter.flush();

      expect(calls, [
        _call(type: 'WATCH_STARTED', positionSeconds: 0),
        _call(type: 'WATCH_RESUMED', positionSeconds: 30, awtSeconds: 5),
      ]);
    },
  );

  test('suspends source switches without pause or resume events', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
    );

    reporter.start(positionSeconds: 0);
    now = now.add(const Duration(seconds: 5));
    reporter.suspend(positionSeconds: 5);
    now = now.add(const Duration(seconds: 30));
    reporter.start(positionSeconds: 5);
    now = now.add(const Duration(seconds: 5));
    reporter.tick(positionSeconds: 10);
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(
        type: 'WATCH_CONTINUED',
        positionSeconds: 10,
        awtSeconds: 10,
      ),
    ]);
  });

  test('ignores duplicate start and pause calls', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
    );

    reporter.start(positionSeconds: 0);
    reporter.start(positionSeconds: 1);
    now = now.add(const Duration(seconds: 5));
    reporter.pause(positionSeconds: 5);
    reporter.pause(positionSeconds: 6);
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(type: 'WATCH_PAUSED', positionSeconds: 5, awtSeconds: 5),
    ]);
  });

  test('reports paused before ended when playback ends while active', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
    );

    reporter.start(positionSeconds: 0);
    now = now.add(const Duration(seconds: 12));
    reporter.tick(positionSeconds: 12);
    now = now.add(const Duration(seconds: 3));
    reporter.end(positionSeconds: 15);
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(
        type: 'WATCH_CONTINUED',
        positionSeconds: 12,
        awtSeconds: 12,
      ),
      _call(type: 'WATCH_PAUSED', positionSeconds: 15, awtSeconds: 15),
      _call(type: 'WATCH_ENDED', positionSeconds: 15, awtSeconds: 15),
    ]);
  });

  test('reports ended without paused when disposed while active', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
    );

    reporter.start(positionSeconds: 0);
    now = now.add(const Duration(seconds: 7));
    reporter.end(positionSeconds: 7, reportPauseIfActive: false);
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(type: 'WATCH_ENDED', positionSeconds: 7, awtSeconds: 7),
    ]);
  });

  test('ignores duplicate end and later playback calls', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
    );

    reporter.start(positionSeconds: 0);
    now = now.add(const Duration(seconds: 7));
    reporter.end(positionSeconds: 7, reportPauseIfActive: false);
    reporter.end(positionSeconds: 8);
    reporter.start(positionSeconds: 8);
    reporter.pause(positionSeconds: 8);
    reporter.tick(positionSeconds: 8);
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(type: 'WATCH_ENDED', positionSeconds: 7, awtSeconds: 7),
    ]);
  });

  test('clamps position and awt to total length', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
      durationSeconds: 30,
    );

    reporter.start(positionSeconds: -5);
    now = now.add(const Duration(seconds: 120));
    reporter.tick(positionSeconds: 120);
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0, totalLengthSeconds: 30),
      _call(
        type: 'WATCH_CONTINUED',
        positionSeconds: 30,
        awtSeconds: 30,
        totalLengthSeconds: 30,
      ),
    ]);
  });

  test('redacts watch event post failures from debug output', () async {
    final messages = <String>[];
    final previousDebugPrint = debugPrint;
    debugPrint = (message, {wrapWidth}) {
      if (message != null) {
        messages.add(message);
      }
    };
    addTearDown(() {
      debugPrint = previousDebugPrint;
    });

    final reporter = VodPlayerWatchEventReporter(
      channelId: 'channel-a',
      videoNo: 13704728,
      durationSeconds: 60,
      sessionId: 'session-a',
      now: () => DateTime(2026),
      postWatchEvent:
          ({
            required channelId,
            required videoNo,
            required watchEventType,
            required awtSeconds,
            required positionSeconds,
            required sessionId,
            required eventDurationSeconds,
            required totalLengthSeconds,
          }) async {
            throw StateError('secret-token');
          },
    );

    reporter.start(positionSeconds: 0);
    await reporter.flush();

    expect(messages, ['Failed to post VOD watch event.']);
    expect(messages.join(), isNot(contains('secret-token')));
  });

  test('coalesces continued events while a previous post is pending', () async {
    var now = DateTime(2026);
    final firstPost = Completer<void>();
    final calls = <_WatchEventCall>[];
    final reporter = VodPlayerWatchEventReporter(
      channelId: 'channel-a',
      videoNo: 13704728,
      durationSeconds: 60,
      sessionId: 'session-a',
      now: () => now,
      postWatchEvent:
          ({
            required channelId,
            required videoNo,
            required watchEventType,
            required awtSeconds,
            required positionSeconds,
            required sessionId,
            required eventDurationSeconds,
            required totalLengthSeconds,
          }) {
            calls.add(
              _WatchEventCall(
                channelId: channelId,
                videoNo: videoNo,
                watchEventType: watchEventType,
                awtSeconds: awtSeconds,
                positionSeconds: positionSeconds,
                sessionId: sessionId,
                eventDurationSeconds: eventDurationSeconds,
                totalLengthSeconds: totalLengthSeconds,
              ),
            );
            return calls.length == 1 ? firstPost.future : Future<void>.value();
          },
    );

    reporter.start(positionSeconds: 0);
    now = now.add(const Duration(seconds: 10));
    reporter.tick(positionSeconds: 10);
    now = now.add(const Duration(seconds: 10));
    reporter.tick(positionSeconds: 20);

    expect(calls, [_call(type: 'WATCH_STARTED', positionSeconds: 0)]);

    firstPost.complete();
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(
        type: 'WATCH_CONTINUED',
        positionSeconds: 20,
        awtSeconds: 20,
      ),
    ]);
  });
}

VodPlayerWatchEventReporter _reporter({
  required List<_WatchEventCall> calls,
  required DateTime Function() now,
  int durationSeconds = 60,
}) {
  return VodPlayerWatchEventReporter(
    channelId: 'channel-a',
    videoNo: 13704728,
    durationSeconds: durationSeconds,
    sessionId: 'session-a',
    now: now,
    postWatchEvent:
        ({
          required channelId,
          required videoNo,
          required watchEventType,
          required awtSeconds,
          required positionSeconds,
          required sessionId,
          required eventDurationSeconds,
          required totalLengthSeconds,
        }) async {
          calls.add(
            _WatchEventCall(
              channelId: channelId,
              videoNo: videoNo,
              watchEventType: watchEventType,
              awtSeconds: awtSeconds,
              positionSeconds: positionSeconds,
              sessionId: sessionId,
              eventDurationSeconds: eventDurationSeconds,
              totalLengthSeconds: totalLengthSeconds,
            ),
          );
        },
  );
}

_WatchEventCall _call({
  required String type,
  required int positionSeconds,
  int? awtSeconds,
  int totalLengthSeconds = 60,
}) {
  return _WatchEventCall(
    channelId: 'channel-a',
    videoNo: 13704728,
    watchEventType: type,
    awtSeconds: awtSeconds,
    positionSeconds: positionSeconds,
    sessionId: 'session-a',
    eventDurationSeconds: 10,
    totalLengthSeconds: totalLengthSeconds,
  );
}

@immutable
final class _WatchEventCall {
  const _WatchEventCall({
    required this.channelId,
    required this.videoNo,
    required this.watchEventType,
    required this.awtSeconds,
    required this.positionSeconds,
    required this.sessionId,
    required this.eventDurationSeconds,
    required this.totalLengthSeconds,
  });

  final String channelId;
  final int videoNo;
  final String watchEventType;
  final int? awtSeconds;
  final int positionSeconds;
  final String sessionId;
  final int eventDurationSeconds;
  final int totalLengthSeconds;

  @override
  bool operator ==(Object other) {
    return other is _WatchEventCall &&
        other.channelId == channelId &&
        other.videoNo == videoNo &&
        other.watchEventType == watchEventType &&
        other.awtSeconds == awtSeconds &&
        other.positionSeconds == positionSeconds &&
        other.sessionId == sessionId &&
        other.eventDurationSeconds == eventDurationSeconds &&
        other.totalLengthSeconds == totalLengthSeconds;
  }

  @override
  int get hashCode {
    return Object.hash(
      channelId,
      videoNo,
      watchEventType,
      awtSeconds,
      positionSeconds,
      sessionId,
      eventDurationSeconds,
      totalLengthSeconds,
    );
  }

  @override
  String toString() {
    return 'WatchEventCall('
        'type: $watchEventType, '
        'position: $positionSeconds, '
        'awt: $awtSeconds, '
        'duration: $eventDurationSeconds, '
        'totalLength: $totalLengthSeconds'
        ')';
  }
}
