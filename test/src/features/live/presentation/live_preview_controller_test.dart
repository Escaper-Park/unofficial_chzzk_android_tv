import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_preview_controller.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_preview_settings.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';

void main() {
  test('stop invalidates a pending preview resolver result', () async {
    final controller = LivePreviewController();
    addTearDown(controller.dispose);

    final resolverEntered = Completer<void>();
    final releaseResolver = Completer<Uri?>();
    var resolverWasCancelled = false;

    await controller.start(
      hasFocus: true,
      item: _previewableLive,
      settings: _immediatePreviewSettings,
      readSettings: () => Future.value(null),
      resolvePlaybackUri:
          ({required item, required settings, required isCancelled}) async {
            resolverEntered.complete();
            final uri = await releaseResolver.future;
            resolverWasCancelled = isCancelled();
            return uri;
          },
    );
    await resolverEntered.future;

    controller.stop();
    releaseResolver.complete(Uri.parse('https://example.com/live.m3u8'));
    await Future<void>.delayed(Duration.zero);

    expect(resolverWasCancelled, isTrue);
    expect(controller.value.isPlaying, isFalse);
  });

  test('does not start new asynchronous work after disposal', () async {
    final controller = LivePreviewController()..dispose();
    var settingsReadCount = 0;
    var resolveCount = 0;

    await controller.start(
      hasFocus: true,
      item: _previewableLive,
      settings: null,
      readSettings: () async {
        settingsReadCount += 1;
        return _immediatePreviewSettings;
      },
      resolvePlaybackUri:
          ({required item, required settings, required isCancelled}) async {
            resolveCount += 1;
            return Uri.parse('https://example.com/live.m3u8');
          },
    );

    expect(settingsReadCount, 0);
    expect(resolveCount, 0);
  });
}

const _previewableLive = Live(
  liveId: 10,
  title: 'Live title',
  concurrentUserCount: 1234,
  adult: false,
  channel: LiveChannel(
    channelId: 'channel-id',
    channelName: 'Channel',
    verifiedMark: false,
  ),
);

const _immediatePreviewSettings = LivePreviewSettings(
  enabled: true,
  audioEnabled: false,
  waitDuration: Duration.zero,
  playbackDuration: Duration(seconds: 10),
  resolutionIndex: 0,
  videoViewType: PlayerVideoViewType.textureView,
);
