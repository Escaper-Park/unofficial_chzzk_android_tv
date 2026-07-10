import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_platform_interface/video_player_platform_interface.dart';

void main() {
  test(
    'position polling remains single-flight while the platform is stalled',
    () async {
      final previousPlatform = VideoPlayerPlatform.instance;
      final fakePlatform = _BlockingPositionVideoPlayerPlatform();
      VideoPlayerPlatform.instance = fakePlatform;
      final controller = VideoPlayerController.networkUrl(
        Uri.parse('https://example.invalid/live.m3u8'),
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
      );
      addTearDown(() async {
        fakePlatform.completeAllPositionRequests();
        await controller.dispose();
        await fakePlatform.disposeAll();
        VideoPlayerPlatform.instance = previousPlatform;
      });

      await controller.initialize();
      await controller.play();

      await Future<void>.delayed(const Duration(milliseconds: 150));
      expect(fakePlatform.positionCallCount, 1);
      expect(fakePlatform.activePositionCallCount, 1);

      await Future<void>.delayed(const Duration(milliseconds: 350));
      expect(
        fakePlatform.positionCallCount,
        1,
        reason: 'periodic ticks must not enqueue more platform requests',
      );
      expect(fakePlatform.maxActivePositionCallCount, 1);

      fakePlatform.completeNextPositionRequest(
        const Duration(milliseconds: 600),
      );
      await Future<void>.delayed(Duration.zero);
      expect(controller.value.position, const Duration(milliseconds: 600));
      expect(fakePlatform.activePositionCallCount, 0);

      await Future<void>.delayed(const Duration(milliseconds: 150));
      expect(fakePlatform.positionCallCount, 2);
      expect(fakePlatform.maxActivePositionCallCount, 1);

      fakePlatform.completeNextPositionRequest(
        const Duration(milliseconds: 700),
      );
      await Future<void>.delayed(Duration.zero);
      await controller.pause();
      expect(controller.value.position, const Duration(milliseconds: 700));
    },
  );

  test('position polling retries after a platform sample fails', () async {
    final previousPlatform = VideoPlayerPlatform.instance;
    final fakePlatform = _BlockingPositionVideoPlayerPlatform();
    VideoPlayerPlatform.instance = fakePlatform;
    final controller = VideoPlayerController.networkUrl(
      Uri.parse('https://example.invalid/live.m3u8'),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
    );
    addTearDown(() async {
      fakePlatform.completeAllPositionRequests();
      await controller.dispose();
      await fakePlatform.disposeAll();
      VideoPlayerPlatform.instance = previousPlatform;
    });

    await controller.initialize();
    await controller.play();

    await Future<void>.delayed(const Duration(milliseconds: 150));
    expect(fakePlatform.positionCallCount, 1);
    fakePlatform.failNextPositionRequest(StateError('platform stalled'));
    await Future<void>.delayed(Duration.zero);
    expect(fakePlatform.activePositionCallCount, 0);

    await Future<void>.delayed(const Duration(milliseconds: 150));
    expect(
      fakePlatform.positionCallCount,
      2,
      reason: 'a failed sample must release the single-flight guard',
    );
    expect(fakePlatform.maxActivePositionCallCount, 1);

    fakePlatform.completeNextPositionRequest(
      const Duration(milliseconds: 200),
    );
    await Future<void>.delayed(Duration.zero);
    await controller.pause();
    expect(controller.value.position, const Duration(milliseconds: 200));
  });

  test('position polling honors a longer caller-provided interval', () async {
    final previousPlatform = VideoPlayerPlatform.instance;
    final fakePlatform = _BlockingPositionVideoPlayerPlatform();
    VideoPlayerPlatform.instance = fakePlatform;
    final controller = VideoPlayerController.networkUrl(
      Uri.parse('https://example.invalid/live.m3u8'),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
      positionUpdateInterval: const Duration(milliseconds: 500),
    );
    addTearDown(() async {
      fakePlatform.completeAllPositionRequests();
      await controller.dispose();
      await fakePlatform.disposeAll();
      VideoPlayerPlatform.instance = previousPlatform;
    });

    await controller.initialize();
    await controller.play();

    await Future<void>.delayed(const Duration(milliseconds: 200));
    expect(fakePlatform.positionCallCount, 0);

    await Future<void>.delayed(const Duration(milliseconds: 350));
    expect(fakePlatform.positionCallCount, 1);
    expect(fakePlatform.maxActivePositionCallCount, 1);

    fakePlatform.completeNextPositionRequest(
      const Duration(milliseconds: 500),
    );
    await Future<void>.delayed(Duration.zero);
    await controller.pause();
    expect(controller.value.position, const Duration(milliseconds: 500));
  });

  test('null interval disables position polling for live playback', () async {
    final previousPlatform = VideoPlayerPlatform.instance;
    final fakePlatform = _BlockingPositionVideoPlayerPlatform();
    VideoPlayerPlatform.instance = fakePlatform;
    final controller = VideoPlayerController.networkUrl(
      Uri.parse('https://example.invalid/live.m3u8'),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
      positionUpdateInterval: null,
    );
    addTearDown(() async {
      await controller.dispose();
      await fakePlatform.disposeAll();
      VideoPlayerPlatform.instance = previousPlatform;
    });

    await controller.initialize();
    await controller.play();
    await Future<void>.delayed(const Duration(milliseconds: 350));

    expect(fakePlatform.positionCallCount, 0);
  });

  test('failed native creation does not block controller disposal', () async {
    final previousPlatform = VideoPlayerPlatform.instance;
    final fakePlatform = _BlockingPositionVideoPlayerPlatform(
      createError: StateError('create failed'),
    );
    VideoPlayerPlatform.instance = fakePlatform;
    final controller = VideoPlayerController.networkUrl(
      Uri.parse('https://example.invalid/live.m3u8'),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
    );
    addTearDown(() async {
      await fakePlatform.disposeAll();
      VideoPlayerPlatform.instance = previousPlatform;
    });

    await expectLater(controller.initialize(), throwsStateError);
    await expectLater(
      controller.dispose().timeout(const Duration(seconds: 1)),
      completes,
    );
  });

  test('late play completion after dispose does not restart polling', () async {
    final previousPlatform = VideoPlayerPlatform.instance;
    final fakePlatform = _BlockingPositionVideoPlayerPlatform();
    VideoPlayerPlatform.instance = fakePlatform;
    final controller = VideoPlayerController.networkUrl(
      Uri.parse('https://example.invalid/vod.mp4'),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
    );
    addTearDown(() async {
      fakePlatform.completePlay();
      await controller.dispose();
      await fakePlatform.disposeAll();
      VideoPlayerPlatform.instance = previousPlatform;
    });

    await controller.initialize();
    fakePlatform.delayPlay();
    final play = controller.play();
    await Future<void>.delayed(Duration.zero);

    final firstDisposal = controller.dispose();
    final repeatedDisposal = controller.dispose();
    expect(identical(firstDisposal, repeatedDisposal), isTrue);

    fakePlatform.completePlay();
    await play;
    await firstDisposal;
    expect(controller.hasActivePositionTimer, isFalse);
  });

  test('generic event stream errors complete initialization safely', () async {
    final previousPlatform = VideoPlayerPlatform.instance;
    final fakePlatform = _BlockingPositionVideoPlayerPlatform(
      emitInitializedEvent: false,
    );
    VideoPlayerPlatform.instance = fakePlatform;
    final controller = VideoPlayerController.networkUrl(
      Uri.parse('https://example.invalid/live.m3u8'),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
    );
    addTearDown(() async {
      await controller.dispose();
      await fakePlatform.disposeAll();
      VideoPlayerPlatform.instance = previousPlatform;
    });

    final initialization = controller.initialize();
    await Future<void>.delayed(Duration.zero);
    fakePlatform.emitError(StateError('stream failed'));

    await expectLater(initialization, throwsStateError);
    expect(controller.value.errorDescription, contains('stream failed'));
  });
}

final class _BlockingPositionVideoPlayerPlatform extends VideoPlayerPlatform {
  _BlockingPositionVideoPlayerPlatform({
    this.createError,
    this.emitInitializedEvent = true,
  });

  final Error? createError;
  final bool emitInitializedEvent;
  final _eventStreams = <int, StreamController<VideoEvent>>{};
  final _pendingPositionRequests = <Completer<Duration>>[];
  Completer<void>? _pendingPlay;
  var _nextPlayerId = 1;

  int positionCallCount = 0;
  int activePositionCallCount = 0;
  int maxActivePositionCallCount = 0;

  @override
  Future<void> init() async {}

  @override
  Future<int?> create(DataSource dataSource) async {
    return _createPlayer();
  }

  @override
  Future<int?> createWithOptions(VideoCreationOptions options) async {
    final error = createError;
    if (error != null) {
      throw error;
    }
    return _createPlayer();
  }

  @override
  Stream<VideoEvent> videoEventsFor(int playerId) {
    return _eventStreams[playerId]!.stream;
  }

  @override
  Future<void> dispose(int playerId) async {
    await _eventStreams.remove(playerId)?.close();
  }

  @override
  Future<void> play(int playerId) async {
    await _pendingPlay?.future;
  }

  @override
  Future<void> pause(int playerId) async {}

  @override
  Future<Duration> getPosition(int playerId) async {
    positionCallCount += 1;
    activePositionCallCount += 1;
    if (activePositionCallCount > maxActivePositionCallCount) {
      maxActivePositionCallCount = activePositionCallCount;
    }
    final completer = Completer<Duration>();
    _pendingPositionRequests.add(completer);
    try {
      return await completer.future;
    } finally {
      activePositionCallCount -= 1;
    }
  }

  @override
  Future<void> seekTo(int playerId, Duration position) async {}

  @override
  Future<void> setLooping(int playerId, bool looping) async {}

  @override
  Future<void> setVolume(int playerId, double volume) async {}

  @override
  Future<void> setPlaybackSpeed(int playerId, double speed) async {}

  @override
  Future<void> setMixWithOthers(bool mixWithOthers) async {}

  @override
  Widget buildView(int playerId) => const SizedBox.shrink();

  void completeNextPositionRequest(Duration position) {
    _pendingPositionRequests.removeAt(0).complete(position);
  }

  void failNextPositionRequest(Object error) {
    _pendingPositionRequests.removeAt(0).completeError(error);
  }

  void completeAllPositionRequests() {
    for (final completer in _pendingPositionRequests) {
      if (!completer.isCompleted) {
        completer.complete(Duration.zero);
      }
    }
    _pendingPositionRequests.clear();
  }

  void delayPlay() {
    _pendingPlay = Completer<void>();
  }

  void completePlay() {
    final pendingPlay = _pendingPlay;
    _pendingPlay = null;
    if (pendingPlay != null && !pendingPlay.isCompleted) {
      pendingPlay.complete();
    }
  }

  void emitError(Object error) {
    _eventStreams.values.single.addError(error);
  }

  Future<void> disposeAll() async {
    for (final stream in _eventStreams.values) {
      await stream.close();
    }
    _eventStreams.clear();
  }

  int _createPlayer() {
    final playerId = _nextPlayerId++;
    final stream = StreamController<VideoEvent>();
    if (emitInitializedEvent) {
      stream.add(
        VideoEvent(
          eventType: VideoEventType.initialized,
          duration: const Duration(hours: 1),
          size: const Size(1920, 1080),
        ),
      );
    }
    _eventStreams[playerId] = stream;
    return playerId;
  }
}
