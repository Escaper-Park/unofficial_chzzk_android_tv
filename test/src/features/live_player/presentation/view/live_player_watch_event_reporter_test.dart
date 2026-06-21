// ignore_for_file: cascade_invocations

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_watch_event_reporter.dart';

void main() {
  test('reports started and continued every 30 watched seconds', () async {
    var now = DateTime(2026, 1, 1, 0, 2);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
      liveOpenDate: DateTime(2026),
    );

    reporter.start();
    now = now.add(const Duration(seconds: 29));
    reporter.tick();
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 120),
    ]);

    now = now.add(const Duration(seconds: 1));
    reporter.tick();
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 120),
      _call(
        type: 'WATCH_CONTINUED',
        positionSeconds: 150,
        awtSeconds: 30,
      ),
    ]);
  });

  test('guards duplicate continued events within 29 seconds', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
      liveOpenDate: DateTime(2026),
      continuedInterval: const Duration(seconds: 1),
    );

    reporter.start();
    now = now.add(const Duration(seconds: 1));
    reporter.tick();
    now = now.add(const Duration(seconds: 28));
    reporter.tick();
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(type: 'WATCH_CONTINUED', positionSeconds: 1, awtSeconds: 1),
    ]);
  });

  test('reports pause and resume with cumulative watched time', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
      liveOpenDate: DateTime(2026),
      continuedInterval: const Duration(seconds: 10),
    );

    reporter.start();
    now = now.add(const Duration(seconds: 5));
    reporter.pause();
    now = now.add(const Duration(seconds: 30));
    reporter.start();
    now = now.add(const Duration(seconds: 10));
    reporter.tick();
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(type: 'WATCH_PAUSED', positionSeconds: 5, awtSeconds: 5),
      _call(type: 'WATCH_RESUMED', positionSeconds: 35, awtSeconds: 5),
      _call(
        type: 'WATCH_CONTINUED',
        positionSeconds: 45,
        awtSeconds: 15,
      ),
    ]);
  });

  test(
    'suspends controller replacement and resumes without pause or end',
    () async {
      var now = DateTime(2026);
      final calls = <_WatchEventCall>[];
      final reporter = _reporter(
        calls: calls,
        now: () => now,
        liveOpenDate: DateTime(2026),
      );

      reporter.start();
      now = now.add(const Duration(seconds: 7));
      reporter.suspend();
      now = now.add(const Duration(seconds: 3));
      reporter.start();
      await reporter.flush();

      expect(calls, [
        _call(type: 'WATCH_STARTED', positionSeconds: 0),
        _call(type: 'WATCH_RESUMED', positionSeconds: 10, awtSeconds: 7),
      ]);
    },
  );

  test('reports ended without an extra pause', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
      liveOpenDate: DateTime(2026),
    );

    reporter.start();
    now = now.add(const Duration(seconds: 7));
    reporter.end();
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(
        type: 'WATCH_ENDED',
        positionSeconds: 7,
        awtSeconds: 7,
        allowStaleSlotTarget: true,
      ),
    ]);
  });

  test('reports ended after suspension with accumulated watch time', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
      liveOpenDate: DateTime(2026),
    );

    reporter.start();
    now = now.add(const Duration(seconds: 7));
    reporter.suspend();
    now = now.add(const Duration(seconds: 3));
    reporter.end();
    await reporter.flush();

    expect(calls, [
      _call(type: 'WATCH_STARTED', positionSeconds: 0),
      _call(
        type: 'WATCH_ENDED',
        positionSeconds: 10,
        awtSeconds: 7,
        allowStaleSlotTarget: true,
      ),
    ]);
  });

  test('uses latest live tokens for later events', () async {
    var now = DateTime(2026);
    final calls = <_WatchEventCall>[];
    final reporter = _reporter(
      calls: calls,
      now: () => now,
      liveOpenDate: DateTime(2026),
    );

    reporter.start();
    reporter.updateLiveTokens(['token-b']);
    now = now.add(const Duration(seconds: 30));
    reporter.tick();
    await reporter.flush();

    expect(calls.last.liveTokens, ['token-b']);
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

    final reporter = LivePlayerWatchEventReporter(
      channelId: 'channel-a',
      liveId: 19505830,
      sessionId: 'session-a',
      now: () => DateTime(2026),
      postWatchEvent:
          ({
            required channelId,
            required liveId,
            required watchEventType,
            required sessionId,
            required eventDurationSeconds,
            required positionSeconds,
            required awtSeconds,
            required liveTokens,
            required autoPlay,
            required radioMode,
            required allowStaleSlotTarget,
          }) async {
            throw StateError('secret-token');
          },
    );

    reporter.start();
    await reporter.flush();

    expect(messages, ['Failed to post live watch event.']);
    expect(messages.join(), isNot(contains('secret-token')));
  });
}

LivePlayerWatchEventReporter _reporter({
  required List<_WatchEventCall> calls,
  required DateTime Function() now,
  DateTime? liveOpenDate,
  Duration continuedInterval = const Duration(seconds: 30),
}) {
  return LivePlayerWatchEventReporter(
    channelId: 'channel-a',
    liveId: 19505830,
    liveOpenDate: liveOpenDate,
    liveTokens: const ['token-a'],
    sessionId: 'session-a',
    now: now,
    continuedInterval: continuedInterval,
    postWatchEvent:
        ({
          required channelId,
          required liveId,
          required watchEventType,
          required sessionId,
          required eventDurationSeconds,
          required positionSeconds,
          required awtSeconds,
          required liveTokens,
          required autoPlay,
          required radioMode,
          required allowStaleSlotTarget,
        }) async {
          calls.add(
            _WatchEventCall(
              channelId: channelId,
              liveId: liveId,
              watchEventType: watchEventType,
              sessionId: sessionId,
              eventDurationSeconds: eventDurationSeconds,
              positionSeconds: positionSeconds,
              awtSeconds: awtSeconds,
              liveTokens: liveTokens,
              autoPlay: autoPlay,
              radioMode: radioMode,
              allowStaleSlotTarget: allowStaleSlotTarget,
            ),
          );
        },
  );
}

_WatchEventCall _call({
  required String type,
  required int positionSeconds,
  int? awtSeconds,
  bool allowStaleSlotTarget = false,
}) {
  return _WatchEventCall(
    channelId: 'channel-a',
    liveId: 19505830,
    watchEventType: type,
    sessionId: 'session-a',
    eventDurationSeconds: 30,
    positionSeconds: positionSeconds,
    awtSeconds: awtSeconds,
    liveTokens: const ['token-a'],
    autoPlay: false,
    radioMode: false,
    allowStaleSlotTarget: allowStaleSlotTarget,
  );
}

@immutable
final class _WatchEventCall {
  const _WatchEventCall({
    required this.channelId,
    required this.liveId,
    required this.watchEventType,
    required this.sessionId,
    required this.eventDurationSeconds,
    required this.positionSeconds,
    required this.awtSeconds,
    required this.liveTokens,
    required this.autoPlay,
    required this.radioMode,
    required this.allowStaleSlotTarget,
  });

  final String channelId;
  final int liveId;
  final String watchEventType;
  final String sessionId;
  final int eventDurationSeconds;
  final int positionSeconds;
  final int? awtSeconds;
  final List<String> liveTokens;
  final bool autoPlay;
  final bool radioMode;
  final bool allowStaleSlotTarget;

  @override
  bool operator ==(Object other) {
    return other is _WatchEventCall &&
        other.channelId == channelId &&
        other.liveId == liveId &&
        other.watchEventType == watchEventType &&
        other.sessionId == sessionId &&
        other.eventDurationSeconds == eventDurationSeconds &&
        other.positionSeconds == positionSeconds &&
        other.awtSeconds == awtSeconds &&
        _listEquals(other.liveTokens, liveTokens) &&
        other.autoPlay == autoPlay &&
        other.radioMode == radioMode &&
        other.allowStaleSlotTarget == allowStaleSlotTarget;
  }

  @override
  int get hashCode {
    return Object.hash(
      channelId,
      liveId,
      watchEventType,
      sessionId,
      eventDurationSeconds,
      positionSeconds,
      awtSeconds,
      Object.hashAll(liveTokens),
      autoPlay,
      radioMode,
      allowStaleSlotTarget,
    );
  }

  @override
  String toString() {
    return 'WatchEventCall('
        'type: $watchEventType, '
        'position: $positionSeconds, '
        'awt: $awtSeconds, '
        'tokens: $liveTokens, '
        'allowStaleSlotTarget: $allowStaleSlotTarget'
        ')';
  }
}

bool _listEquals(List<String> left, List<String> right) {
  if (left.length != right.length) {
    return false;
  }

  for (var index = 0; index < left.length; index += 1) {
    if (left[index] != right[index]) {
      return false;
    }
  }

  return true;
}
