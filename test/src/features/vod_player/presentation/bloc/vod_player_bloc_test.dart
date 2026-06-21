import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/repositories/vod_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/domain/use_cases/resolve_vod_playback_uri.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/domain/use_cases/vod_playback_cache.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/bloc/vod_player_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/vod_player_route_target.dart';

void main() {
  test(
    'browse loads latest channel vods and appends more pages',
    () async {
      final requestedUris = <Uri>[];
      final cachePaths = <VodPlaybackCache>{};
      final channelRepository = _FakeChannelRepository(
        videoPages: [
          ChannelVideoPage(
            items: [_channelVideo(videoNo: 2, title: 'Next VOD')],
            page: 0,
            size: 1,
            totalPages: 2,
          ),
          ChannelVideoPage(
            items: [_channelVideo(videoNo: 3, title: 'Later VOD')],
            page: 1,
            size: 1,
            totalPages: 2,
          ),
        ],
      );
      final bloc = VodPlayerBloc(
        vodRepository: _FakeVodRepository(
          detail: _vodDetail(),
          playback: const VodPlayback(
            masterPlaylistUrl:
                'https://vod.example.com/master.m3u8?token=signed',
          ),
        ),
        channelRepository: channelRepository,
        groupRepository: _FakeGroupRepository(),
        settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
        loadVodPlaybackPlaylistText: _playlistTextLoader(
          requestedUris: requestedUris,
        ),
      );
      final subscription = bloc.stream.listen((state) {
        final playbackCache = state.activeSlot.playbackCache;
        if (playbackCache != null) {
          cachePaths.add(playbackCache);
        }
      });
      addTearDown(() async {
        await subscription.cancel();
        await bloc.close();
        for (final playbackCache in cachePaths) {
          await playbackCache.delete();
        }
      });

      bloc.add(
        const VodPlayerEvent.started(
          initialTarget: VodPlayerInitialTarget(videoNo: 1),
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == VodPlayerSlotStatus.ready,
      );

      bloc.add(const VodPlayerEvent.browseRequested());
      final browseReady = await bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == VodPlayerOverlayMode.browse &&
            state.browseStatus == VodPlayerBrowseLoadStatus.success,
      );

      expect(browseReady.browseItems.map((item) => item.videoNo), [2]);
      expect(browseReady.browseItems.first.channel?.channelId, 'channel-a');
      expect(browseReady.browseHasMore, isTrue);
      expect(channelRepository.videoRequests, [
        (channelId: 'channel-a', page: 0, size: 12),
      ]);

      bloc.add(const VodPlayerEvent.browseLoadMoreRequested());
      final moreReady = await bloc.stream.firstWhere(
        (state) => state.browseItems.length == 2,
      );

      expect(moreReady.browseItems.map((item) => item.videoNo), [2, 3]);
      expect(moreReady.browseHasMore, isFalse);
      expect(channelRepository.videoRequests, [
        (channelId: 'channel-a', page: 0, size: 12),
        (channelId: 'channel-a', page: 1, size: 12),
      ]);
    },
  );

  test(
    'browse load more failure keeps the next page available for retry',
    () async {
      final requestedUris = <Uri>[];
      final cachePaths = <VodPlaybackCache>{};
      final channelRepository = _FakeChannelRepository(
        videoPages: [
          ChannelVideoPage(
            items: [_channelVideo(videoNo: 2, title: 'Next VOD')],
            page: 0,
            size: 1,
            totalPages: 2,
          ),
          ChannelVideoPage(
            items: [_channelVideo(videoNo: 3, title: 'Later VOD')],
            page: 1,
            size: 1,
            totalPages: 2,
          ),
        ],
        failingVideoPages: {1},
      );
      final bloc = VodPlayerBloc(
        vodRepository: _FakeVodRepository(
          detail: _vodDetail(),
          playback: const VodPlayback(
            masterPlaylistUrl:
                'https://vod.example.com/master.m3u8?token=signed',
          ),
        ),
        channelRepository: channelRepository,
        groupRepository: _FakeGroupRepository(),
        settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
        loadVodPlaybackPlaylistText: _playlistTextLoader(
          requestedUris: requestedUris,
        ),
      );
      final subscription = bloc.stream.listen((state) {
        final playbackCache = state.activeSlot.playbackCache;
        if (playbackCache != null) {
          cachePaths.add(playbackCache);
        }
      });
      addTearDown(() async {
        await subscription.cancel();
        await bloc.close();
        for (final playbackCache in cachePaths) {
          await playbackCache.delete();
        }
      });

      bloc.add(
        const VodPlayerEvent.started(
          initialTarget: VodPlayerInitialTarget(videoNo: 1),
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == VodPlayerSlotStatus.ready,
      );

      bloc.add(const VodPlayerEvent.browseRequested());
      await bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == VodPlayerOverlayMode.browse &&
            state.browseStatus == VodPlayerBrowseLoadStatus.success,
      );

      bloc.add(const VodPlayerEvent.browseLoadMoreRequested());
      final failureState = await bloc.stream.firstWhere(
        (state) =>
            state.feedbackType == VodPlayerFeedbackType.browseLoadMoreFailure,
      );

      expect(failureState.browseItems.map((item) => item.videoNo), [2]);
      expect(failureState.browseNextPage, 1);
      expect(failureState.browseHasMore, isTrue);
      expect(failureState.browseLoadingMore, isFalse);

      bloc.add(const VodPlayerEvent.browseLoadMoreRequested());
      final retryState = await bloc.stream.firstWhere(
        (state) => state.browseItems.length == 2,
      );

      expect(retryState.browseItems.map((item) => item.videoNo), [2, 3]);
      expect(retryState.browseHasMore, isFalse);
      expect(channelRepository.videoRequests, [
        (channelId: 'channel-a', page: 0, size: 12),
        (channelId: 'channel-a', page: 1, size: 12),
        (channelId: 'channel-a', page: 1, size: 12),
      ]);
    },
  );

  test(
    'preferences changed persists chat settings',
    () async {
      final preferencesRepository = _FakeSettingsPreferencesRepository();
      final bloc = VodPlayerBloc(
        vodRepository: _FakeVodRepository(
          detail: _vodDetail(),
          playback: const VodPlayback(
            masterPlaylistUrl:
                'https://vod.example.com/master.m3u8?token=signed',
          ),
        ),
        channelRepository: _FakeChannelRepository(),
        groupRepository: _FakeGroupRepository(),
        settingsPreferencesRepository: preferencesRepository,
        loadVodPlaybackPlaylistText: _playlistTextLoader(
          requestedUris: <Uri>[],
        ),
      );
      addTearDown(bloc.close);

      bloc.add(
        const VodPlayerEvent.preferencesChanged(
          preferences: SettingsPreferences(
            vodSettings: VodSettings(resolutionIndex: 0),
            chatSettings: ChatSettings(
              overlayChatQuickPositionIndex: 6,
              overlayChatPositionX: 0,
              overlayChatPositionY: 100,
              sideChatPositionIndex: 0,
              chatSidePanelPositionX: 0,
            ),
          ),
        ),
      );

      await bloc.stream.firstWhere(
        (state) =>
            state.settingsPreferences.chatSettings.sideChatPositionIndex == 0,
      );
      await _waitForSavedPreferences(preferencesRepository);

      expect(preferencesRepository.savedPreferences, hasLength(1));
      expect(
        preferencesRepository
            .savedPreferences
            .single
            .chatSettings
            .overlayChatQuickPositionIndex,
        6,
      );
      expect(
        preferencesRepository
            .savedPreferences
            .single
            .chatSettings
            .sideChatPositionIndex,
        0,
      );
      expect(bloc.state.settingsPreferences.vodSettings.resolutionIndex, 0);
    },
  );

  test('watch event posting is owned by current playback slot', () async {
    final requestedUris = <Uri>[];
    final cachePaths = <VodPlaybackCache>{};
    final repository = _FakeVodRepository(
      detail: _vodDetail(),
      playback: const VodPlayback(
        masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
      ),
    );
    final bloc = VodPlayerBloc(
      vodRepository: repository,
      channelRepository: _FakeChannelRepository(),
      groupRepository: _FakeGroupRepository(),
      settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
      loadVodPlaybackPlaylistText: _playlistTextLoader(
        requestedUris: requestedUris,
      ),
    );
    final subscription = bloc.stream.listen((state) {
      final playbackCache = state.activeSlot.playbackCache;
      if (playbackCache != null) {
        cachePaths.add(playbackCache);
      }
    });
    addTearDown(() async {
      await subscription.cancel();
      await bloc.close();
      for (final playbackCache in cachePaths) {
        await playbackCache.delete();
      }
    });

    bloc.add(
      const VodPlayerEvent.started(
        initialTarget: VodPlayerInitialTarget(videoNo: 1),
      ),
    );
    final ready = await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == VodPlayerSlotStatus.ready,
    );
    expect(ready.activeSlot.playbackUri, isNotNull);

    await bloc.postWatchEventForSlot(
      slotId: 'primary',
      channelId: 'channel-a',
      videoNo: 1,
      watchEventType: 'WATCH_STARTED',
      awtSeconds: null,
      positionSeconds: 5,
      sessionId: 'session-a',
      eventDurationSeconds: 10,
      totalLengthSeconds: 600,
    );

    expect(repository.watchEventCalls, hasLength(1));
    expect(repository.watchEventCalls.single.channelId, 'channel-a');
    expect(repository.watchEventCalls.single.videoNo, 1);

    await bloc.postWatchEventForSlot(
      slotId: 'primary',
      channelId: 'channel-a',
      videoNo: 1,
      watchEventType: 'WATCH_CONTINUED',
      awtSeconds: 10,
      positionSeconds: 15,
      sessionId: 'session-a',
      eventDurationSeconds: 10,
      totalLengthSeconds: 600,
    );
    expect(repository.watchEventCalls, hasLength(2));

    await bloc.postWatchEventForSlot(
      slotId: 'primary',
      channelId: 'channel-b',
      videoNo: 1,
      watchEventType: 'WATCH_CONTINUED',
      awtSeconds: 20,
      positionSeconds: 25,
      sessionId: 'session-a',
      eventDurationSeconds: 10,
      totalLengthSeconds: 600,
    );
    expect(repository.watchEventCalls, hasLength(2));

    await bloc.postWatchEventForSlot(
      slotId: 'primary',
      channelId: 'channel-a',
      videoNo: 2,
      watchEventType: 'WATCH_CONTINUED',
      awtSeconds: 20,
      positionSeconds: 25,
      sessionId: 'session-a',
      eventDurationSeconds: 10,
      totalLengthSeconds: 600,
    );
    expect(repository.watchEventCalls, hasLength(2));

    await bloc.postWatchEventForSlot(
      slotId: 'primary',
      channelId: 'channel-a',
      videoNo: 2,
      watchEventType: 'WATCH_ENDED',
      awtSeconds: 20,
      positionSeconds: 25,
      sessionId: 'session-a',
      eventDurationSeconds: 10,
      totalLengthSeconds: 600,
      allowStaleSlotTarget: true,
    );
    expect(repository.watchEventCalls, hasLength(3));
    expect(repository.watchEventCalls.last.watchEventType, 'WATCH_ENDED');
  });

  test(
    'preferences changed refreshes playback source for resolution',
    () async {
      final requestedUris = <Uri>[];
      final repository = _FakeVodRepository(
        detail: _vodDetail(),
        playback: const VodPlayback(
          masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
        ),
      );
      final preferencesRepository = _FakeSettingsPreferencesRepository(
        preferences: const SettingsPreferences(
          vodSettings: VodSettings(resolutionIndex: 2),
        ),
      );
      final bloc = VodPlayerBloc(
        vodRepository: repository,
        channelRepository: _FakeChannelRepository(),
        groupRepository: _FakeGroupRepository(),
        settingsPreferencesRepository: preferencesRepository,
        loadVodPlaybackPlaylistText: _playlistTextLoader(
          requestedUris: requestedUris,
        ),
      );
      final cachePaths = <VodPlaybackCache>{};
      final subscription = bloc.stream.listen((state) {
        final playbackCache = state.activeSlot.playbackCache;
        if (playbackCache != null) {
          cachePaths.add(playbackCache);
        }
      });
      addTearDown(() async {
        await subscription.cancel();
        await bloc.close();
        for (final playbackCache in cachePaths) {
          await playbackCache.delete();
        }
      });

      bloc.add(
        const VodPlayerEvent.started(
          initialTarget: VodPlayerInitialTarget(videoNo: 1),
        ),
      );

      final initialReady = await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.status == VodPlayerSlotStatus.ready &&
            state.activeSlot.playbackUri != null,
      );
      final initialPlaybackUri = initialReady.activeSlot.playbackUri!;
      expect(
        requestedUris.last,
        Uri.parse('https://vod.example.com/720p/index.m3u8?token=signed'),
      );

      bloc.add(
        VodPlayerEvent.playbackPositionChanged(
          slotId: initialReady.activeSlot.slotId,
          playbackUri: initialPlaybackUri,
          position: const Duration(seconds: 65),
          duration: const Duration(minutes: 10),
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.activeSlot.position == const Duration(seconds: 65),
      );

      final loadingFuture = bloc.stream.firstWhere(
        (state) =>
            state.settingsPreferences.vodSettings.resolutionIndex == 0 &&
            state.activeSlot.status == VodPlayerSlotStatus.ready &&
            state.activeSlot.playbackUri == null,
      );

      bloc.add(
        VodPlayerEvent.preferencesChanged(
          preferences: bloc.state.settingsPreferences.copyWith(
            vodSettings: bloc.state.settingsPreferences.vodSettings.copyWith(
              resolutionIndex: 0,
            ),
          ),
        ),
      );

      final loading = await loadingFuture;
      final refreshed = await bloc.stream.firstWhere(
        (state) =>
            state.settingsPreferences.vodSettings.resolutionIndex == 0 &&
            state.activeSlot.playbackUri != null &&
            state.activeSlot.playbackUri != initialPlaybackUri,
      );

      expect(loading.activeSlot.startPosition, const Duration(seconds: 65));
      expect(
        requestedUris.last,
        Uri.parse('https://vod.example.com/360p/index.m3u8?token=signed'),
      );
      expect(refreshed.activeSlot.status, VodPlayerSlotStatus.ready);
      expect(refreshed.activeSlot.availableResolutionIndexes, [0, 2, 4]);
      expect(refreshed.activeSlot.startPosition, const Duration(seconds: 65));
      expect(preferencesRepository.savedPreferences, isEmpty);

      final playlistText = File.fromUri(
        refreshed.activeSlot.playbackUri!,
      ).readAsStringSync();
      expect(
        playlistText,
        contains('#EXT-X-START:TIME-OFFSET=65,PRECISE=YES'),
      );
    },
  );

  test(
    'failed resolution refresh restores current playback source',
    () async {
      final requestedUris = <Uri>[];
      final failLowVariant = Completer<void>();
      var highVariantRequestCount = 0;
      final repository = _FakeVodRepository(
        detail: _vodDetail(),
        playback: const VodPlayback(
          masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
        ),
      );
      final bloc = VodPlayerBloc(
        vodRepository: repository,
        channelRepository: _FakeChannelRepository(),
        groupRepository: _FakeGroupRepository(),
        settingsPreferencesRepository: _FakeSettingsPreferencesRepository(
          preferences: const SettingsPreferences(
            vodSettings: VodSettings(resolutionIndex: 2),
          ),
        ),
        loadVodPlaybackPlaylistText: ({required playlistUri}) async {
          requestedUris.add(playlistUri);
          if (playlistUri.path.endsWith('/master.m3u8')) {
            return '''
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360
360p/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
720p/index.m3u8
''';
          }
          if (playlistUri.path.endsWith('/720p/index.m3u8')) {
            highVariantRequestCount += 1;
            if (highVariantRequestCount > 1) {
              throw StateError('high variant failed');
            }
            return '''
#EXTM3U
#EXTINF:6.0,
high0.ts
''';
          }
          if (playlistUri.path.endsWith('/360p/index.m3u8')) {
            await failLowVariant.future;
            throw StateError('low variant failed');
          }

          throw StateError('missing playlist text for $playlistUri');
        },
      );
      final cachePaths = <VodPlaybackCache>{};
      final subscription = bloc.stream.listen((state) {
        final playbackCache = state.activeSlot.playbackCache;
        if (playbackCache != null) {
          cachePaths.add(playbackCache);
        }
      });
      addTearDown(() async {
        await subscription.cancel();
        await bloc.close();
        for (final playbackCache in cachePaths) {
          await playbackCache.delete();
        }
      });

      bloc.add(
        const VodPlayerEvent.started(
          initialTarget: VodPlayerInitialTarget(videoNo: 1),
        ),
      );
      final initialReady = await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.status == VodPlayerSlotStatus.ready &&
            state.activeSlot.playbackUri != null,
      );
      final initialPlaybackUri = initialReady.activeSlot.playbackUri!;
      bloc.add(
        VodPlayerEvent.playbackReady(
          slotId: initialReady.activeSlot.slotId,
          playbackUri: initialPlaybackUri,
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == VodPlayerSlotStatus.playing,
      );

      final loadingFuture = bloc.stream.firstWhere(
        (state) =>
            state.settingsPreferences.vodSettings.resolutionIndex == 0 &&
            state.activeSlot.status == VodPlayerSlotStatus.ready &&
            state.activeSlot.playbackUri == null,
      );

      bloc.add(
        VodPlayerEvent.preferencesChanged(
          preferences: bloc.state.settingsPreferences.copyWith(
            vodSettings: bloc.state.settingsPreferences.vodSettings.copyWith(
              resolutionIndex: 0,
            ),
          ),
        ),
      );

      final loading = await loadingFuture;
      final restoredFuture = bloc.stream.firstWhere(
        (state) =>
            state.settingsPreferences.vodSettings.resolutionIndex == 0 &&
            state.activeSlot.status == VodPlayerSlotStatus.playing &&
            state.activeSlot.playbackUri == initialPlaybackUri,
      );
      failLowVariant.complete();
      final restored = await restoredFuture;

      expect(loading.activeSlot.playbackUri, isNull);
      expect(restored.activeSlot.playbackUri, initialPlaybackUri);
      expect(
        requestedUris.map((uri) => uri.path),
        containsAll(['/360p/index.m3u8', '/720p/index.m3u8']),
      );
    },
  );

  test(
    'started blocks restricted detail before loading playback',
    () async {
      final requestedUris = <Uri>[];
      final repository = _FakeVodRepository(
        detail: _vodDetail().copyWith(blindType: 'PRIVATE'),
        playback: const VodPlayback(
          masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
        ),
      );
      final bloc = VodPlayerBloc(
        vodRepository: repository,
        channelRepository: _FakeChannelRepository(),
        groupRepository: _FakeGroupRepository(),
        settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
        loadVodPlaybackPlaylistText: _playlistTextLoader(
          requestedUris: requestedUris,
        ),
      );
      addTearDown(bloc.close);

      bloc.add(
        const VodPlayerEvent.started(
          initialTarget: VodPlayerInitialTarget(videoNo: 1),
        ),
      );

      final blocked = await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == VodPlayerSlotStatus.failure,
      );

      expect(
        blocked.activeSlot.failureReason,
        VodPlayerFailureReason.entryBlocked,
      );
      expect(blocked.activeSlot.playbackUri, isNull);
      expect(repository.getPlaybackCalls, isEmpty);
      expect(requestedUris, isEmpty);
    },
  );

  test(
    'started blocks adult detail before loading playback',
    () async {
      final requestedUris = <Uri>[];
      final repository = _FakeVodRepository(
        detail: _vodDetail().copyWith(adult: true),
        playback: const VodPlayback(
          masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
        ),
      );
      final bloc = VodPlayerBloc(
        vodRepository: repository,
        channelRepository: _FakeChannelRepository(),
        groupRepository: _FakeGroupRepository(),
        settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
        loadVodPlaybackPlaylistText: _playlistTextLoader(
          requestedUris: requestedUris,
        ),
      );
      addTearDown(bloc.close);

      bloc.add(
        const VodPlayerEvent.started(
          initialTarget: VodPlayerInitialTarget(videoNo: 1),
        ),
      );

      final blocked = await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == VodPlayerSlotStatus.failure,
      );

      expect(
        blocked.activeSlot.failureReason,
        VodPlayerFailureReason.entryBlocked,
      );
      expect(blocked.activeSlot.playbackUri, isNull);
      expect(repository.getPlaybackCalls, isEmpty);
      expect(requestedUris, isEmpty);
    },
  );

  test(
    'started blocks member-only detail without viewer benefit',
    () async {
      final requestedUris = <Uri>[];
      final channelRepository = _FakeChannelRepository();
      final repository = _FakeVodRepository(
        detail: _vodDetail().copyWith(membershipBenefitType: 'MEMBER_ONLY'),
        playback: const VodPlayback(
          masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
        ),
      );
      final bloc = VodPlayerBloc(
        vodRepository: repository,
        channelRepository: channelRepository,
        groupRepository: _FakeGroupRepository(),
        settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
        loadVodPlaybackPlaylistText: _playlistTextLoader(
          requestedUris: requestedUris,
        ),
      );
      addTearDown(bloc.close);

      bloc.add(
        const VodPlayerEvent.started(
          initialTarget: VodPlayerInitialTarget(videoNo: 1),
        ),
      );

      final blocked = await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == VodPlayerSlotStatus.failure,
      );

      expect(
        blocked.activeSlot.failureReason,
        VodPlayerFailureReason.entryBlocked,
      );
      expect(blocked.activeSlot.playbackUri, isNull);
      expect(channelRepository.getMyInfoCalls, ['channel-a']);
      expect(repository.getPlaybackCalls, isEmpty);
      expect(requestedUris, isEmpty);
    },
  );

  test(
    'deletes stale playback cache when target changes during resolution',
    () async {
      final requestedUris = <Uri>[];
      final existingCachePaths = _vodCacheDirectories();
      final staleCachePaths = <String>{};
      final firstVariantRequested = Completer<void>();
      final firstVariantText = Completer<String>();
      var shouldDelayVariant = true;
      final bloc = VodPlayerBloc(
        vodRepository: _FakeVodRepository(
          detail: _vodDetail(),
          playback: const VodPlayback(
            masterPlaylistUrl:
                'https://vod.example.com/master.m3u8?token=signed',
          ),
        ),
        channelRepository: _FakeChannelRepository(),
        groupRepository: _FakeGroupRepository(),
        settingsPreferencesRepository: _FakeSettingsPreferencesRepository(
          preferences: const SettingsPreferences(
            vodSettings: VodSettings(resolutionIndex: 2),
          ),
        ),
        loadVodPlaybackPlaylistText: ({required playlistUri}) async {
          requestedUris.add(playlistUri);
          if (playlistUri.path.endsWith('/master.m3u8')) {
            return '''
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
720p/index.m3u8
''';
          }

          if (shouldDelayVariant) {
            shouldDelayVariant = false;
            staleCachePaths.addAll(
              _vodCacheDirectories().difference(existingCachePaths),
            );
            firstVariantRequested.complete();
            return firstVariantText.future;
          }

          return '''
#EXTM3U
#EXTINF:6.0,
high0.ts
''';
        },
      );
      final cachePaths = <VodPlaybackCache>{};
      final subscription = bloc.stream.listen((state) {
        final playbackCache = state.activeSlot.playbackCache;
        if (playbackCache != null) {
          cachePaths.add(playbackCache);
        }
      });
      addTearDown(() async {
        await subscription.cancel();
        await bloc.close();
        for (final playbackCache in cachePaths) {
          await playbackCache.delete();
        }
        for (final path in staleCachePaths) {
          final directory = Directory(path);
          if (directory.existsSync()) {
            await directory.delete(recursive: true);
          }
        }
      });

      bloc.add(
        const VodPlayerEvent.started(
          initialTarget: VodPlayerInitialTarget(videoNo: 1),
        ),
      );
      await firstVariantRequested.future;
      expect(staleCachePaths, isNotEmpty);

      bloc.add(
        const VodPlayerEvent.targetSelected(
          target: VodPlayerInitialTarget(videoNo: 2),
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.status == VodPlayerSlotStatus.ready &&
            state.activeSlot.playbackCache != null,
      );

      firstVariantText.complete('''
#EXTM3U
#EXTINF:6.0,
stale0.ts
''');
      await _waitForDeleted(staleCachePaths);

      expect(
        staleCachePaths.map((path) => Directory(path).existsSync()),
        everyElement(isFalse),
      );
    },
  );

  test('following toggled refreshes channel my-info after mutation', () async {
    final requestedUris = <Uri>[];
    final cachePaths = <VodPlaybackCache>{};
    final channelRepository = _FakeChannelRepository(
      myInfo: _channelMyInfo(following: false),
    );
    final bloc = VodPlayerBloc(
      vodRepository: _FakeVodRepository(
        detail: _vodDetail(),
        playback: const VodPlayback(
          masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
        ),
      ),
      channelRepository: channelRepository,
      groupRepository: _FakeGroupRepository(),
      settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
      loadVodPlaybackPlaylistText: _playlistTextLoader(
        requestedUris: requestedUris,
      ),
    );
    final subscription = bloc.stream.listen((state) {
      final playbackCache = state.activeSlot.playbackCache;
      if (playbackCache != null) {
        cachePaths.add(playbackCache);
      }
    });
    addTearDown(() async {
      await subscription.cancel();
      await bloc.close();
      for (final playbackCache in cachePaths) {
        await playbackCache.delete();
      }
    });

    bloc.add(
      const VodPlayerEvent.started(
        initialTarget: VodPlayerInitialTarget(videoNo: 1),
      ),
    );
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == VodPlayerSlotStatus.ready,
    );

    bloc.add(const VodPlayerEvent.controlsRequested());
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.canToggleFollowing,
    );

    bloc.add(const VodPlayerEvent.followingToggled());
    final followed = await bloc.stream.firstWhere(
      (state) => state.activeSlot.isFollowing,
    );

    expect(followed.feedbackType, VodPlayerFeedbackType.followSuccess);
    expect(channelRepository.followCalls, ['channel-a']);
    expect(channelRepository.getMyInfoCalls, ['channel-a', 'channel-a']);
  });

  test('following failure keeps current state and emits feedback', () async {
    final requestedUris = <Uri>[];
    final cachePaths = <VodPlaybackCache>{};
    final channelRepository = _FakeChannelRepository(
      myInfo: _channelMyInfo(following: true),
      failUnfollow: true,
    );
    final bloc = VodPlayerBloc(
      vodRepository: _FakeVodRepository(
        detail: _vodDetail(),
        playback: const VodPlayback(
          masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
        ),
      ),
      channelRepository: channelRepository,
      groupRepository: _FakeGroupRepository(),
      settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
      loadVodPlaybackPlaylistText: _playlistTextLoader(
        requestedUris: requestedUris,
      ),
    );
    final subscription = bloc.stream.listen((state) {
      final playbackCache = state.activeSlot.playbackCache;
      if (playbackCache != null) {
        cachePaths.add(playbackCache);
      }
    });
    addTearDown(() async {
      await subscription.cancel();
      await bloc.close();
      for (final playbackCache in cachePaths) {
        await playbackCache.delete();
      }
    });

    bloc.add(
      const VodPlayerEvent.started(
        initialTarget: VodPlayerInitialTarget(videoNo: 1),
      ),
    );
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == VodPlayerSlotStatus.ready,
    );

    bloc.add(const VodPlayerEvent.controlsRequested());
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.isFollowing,
    );

    bloc.add(const VodPlayerEvent.followingToggled());
    final failed = await bloc.stream.firstWhere(
      (state) => state.feedbackType == VodPlayerFeedbackType.unfollowFailure,
    );

    expect(failed.activeSlot.isFollowing, isTrue);
    expect(channelRepository.unfollowCalls, ['channel-a']);
  });

  test('group add emits success feedback and refreshes collection', () async {
    final requestedUris = <Uri>[];
    final cachePaths = <VodPlaybackCache>{};
    final groupRepository = _FakeGroupRepository(
      collection: const GroupCollection(
        groups: [
          GroupItem(id: 'group-a', groupName: 'Group A'),
        ],
      ),
    );
    final bloc = VodPlayerBloc(
      vodRepository: _FakeVodRepository(
        detail: _vodDetail(),
        playback: const VodPlayback(
          masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
        ),
      ),
      channelRepository: _FakeChannelRepository(),
      groupRepository: groupRepository,
      settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
      loadVodPlaybackPlaylistText: _playlistTextLoader(
        requestedUris: requestedUris,
      ),
    );
    final subscription = bloc.stream.listen((state) {
      final playbackCache = state.activeSlot.playbackCache;
      if (playbackCache != null) {
        cachePaths.add(playbackCache);
      }
    });
    addTearDown(() async {
      await subscription.cancel();
      await bloc.close();
      for (final playbackCache in cachePaths) {
        await playbackCache.delete();
      }
    });

    bloc.add(
      const VodPlayerEvent.started(
        initialTarget: VodPlayerInitialTarget(videoNo: 1),
      ),
    );
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == VodPlayerSlotStatus.ready,
    );

    bloc.add(const VodPlayerEvent.groupAddRequested(groupId: 'group-a'));
    final added = await bloc.stream.firstWhere(
      (state) => state.feedbackType == VodPlayerFeedbackType.groupAddSuccess,
    );

    expect(
      added.groupCollection.groups.single.memberChannelIds,
      ['channel-a'],
    );
  });

  test('group add failure emits failure feedback', () async {
    final requestedUris = <Uri>[];
    final cachePaths = <VodPlaybackCache>{};
    final bloc = VodPlayerBloc(
      vodRepository: _FakeVodRepository(
        detail: _vodDetail(),
        playback: const VodPlayback(
          masterPlaylistUrl: 'https://vod.example.com/master.m3u8?token=signed',
        ),
      ),
      channelRepository: _FakeChannelRepository(),
      groupRepository: _FakeGroupRepository(
        addResult: GroupAddMemberResult.groupNotFound,
      ),
      settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
      loadVodPlaybackPlaylistText: _playlistTextLoader(
        requestedUris: requestedUris,
      ),
    );
    final subscription = bloc.stream.listen((state) {
      final playbackCache = state.activeSlot.playbackCache;
      if (playbackCache != null) {
        cachePaths.add(playbackCache);
      }
    });
    addTearDown(() async {
      await subscription.cancel();
      await bloc.close();
      for (final playbackCache in cachePaths) {
        await playbackCache.delete();
      }
    });

    bloc.add(
      const VodPlayerEvent.started(
        initialTarget: VodPlayerInitialTarget(videoNo: 1),
      ),
    );
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == VodPlayerSlotStatus.ready,
    );

    bloc.add(const VodPlayerEvent.groupAddRequested(groupId: 'missing'));
    final failed = await bloc.stream.firstWhere(
      (state) => state.feedbackType == VodPlayerFeedbackType.groupAddFailure,
    );

    expect(failed.activeSlot.channelId, 'channel-a');
  });
}

Future<void> _waitForSavedPreferences(
  _FakeSettingsPreferencesRepository repository,
) async {
  for (var attempt = 0; attempt < 20; attempt += 1) {
    if (repository.savedPreferences.isNotEmpty) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 1));
  }
}

Future<void> _waitForDeleted(Set<String> paths) async {
  for (var attempt = 0; attempt < 20; attempt += 1) {
    if (paths.every((path) => !Directory(path).existsSync())) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 5));
  }
}

Set<String> _vodCacheDirectories() {
  return {
    for (final entity in Directory.systemTemp.listSync())
      if (entity is Directory &&
          entity.path
              .split(Platform.pathSeparator)
              .last
              .startsWith(
                'chzzk_vod_player_',
              ))
        entity.path,
  };
}

LoadVodPlaybackPlaylistText _playlistTextLoader({
  required List<Uri> requestedUris,
}) {
  return ({required Uri playlistUri}) async {
    requestedUris.add(playlistUri);
    if (playlistUri.path.endsWith('/master.m3u8')) {
      return '''
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360
360p/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
720p/index.m3u8
''';
    }
    if (playlistUri.path.endsWith('/360p/index.m3u8')) {
      return '''
#EXTM3U
#EXTINF:6.0,
low0.ts
''';
    }
    if (playlistUri.path.endsWith('/720p/index.m3u8')) {
      return '''
#EXTM3U
#EXTINF:6.0,
high0.ts
''';
    }

    throw StateError('missing playlist text for $playlistUri');
  };
}

class _FakeVodRepository implements VodRepository {
  _FakeVodRepository({
    required this.detail,
    required this.playback,
  });

  final VodDetail detail;
  final VodPlayback playback;
  final getPlaybackCalls = <({String videoId, String key})>[];
  final watchEventCalls =
      <
        ({
          String channelId,
          int videoNo,
          String watchEventType,
          int? awtSeconds,
          int positionSeconds,
          String sessionId,
          int eventDurationSeconds,
          int totalLengthSeconds,
        })
      >[];

  @override
  Future<FollowingVodPage> getFollowingVods({
    int? size,
    FollowingVodCursor? cursor,
  }) {
    return _unsupportedFakeOperation('VodRepository.getFollowingVods');
  }

  @override
  Future<VodPlayback> getPlayback({
    required String videoId,
    required String key,
  }) async {
    getPlaybackCalls.add((videoId: videoId, key: key));
    return playback;
  }

  @override
  Future<VodDetail> getVodDetail({required int videoNo}) async {
    return detail;
  }

  @override
  Future<VodPage> getVods({
    int? size,
    VodSort? sortType,
    VodCursor? cursor,
  }) {
    return _unsupportedFakeOperation('VodRepository.getVods');
  }

  @override
  Future<void> postVideoWatchEvent({
    required String channelId,
    required int videoNo,
    required String watchEventType,
    required int? awtSeconds,
    required int positionSeconds,
    required String sessionId,
    required int eventDurationSeconds,
    required int totalLengthSeconds,
  }) async {
    watchEventCalls.add(
      (
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
  }
}

class _FakeChannelRepository implements ChannelRepository {
  _FakeChannelRepository({
    this.videoPages = const [],
    Set<int> failingVideoPages = const <int>{},
    ChannelMyInfo? myInfo,
    this.failUnfollow = false,
  }) : failingVideoPages = {...failingVideoPages},
       myInfo = myInfo ?? _channelMyInfo(following: false);

  final List<ChannelVideoPage> videoPages;
  final Set<int> failingVideoPages;
  ChannelMyInfo myInfo;
  final bool failUnfollow;
  final videoRequests = <({String channelId, int? page, int? size})>[];
  final getMyInfoCalls = <String>[];
  final followCalls = <String>[];
  final unfollowCalls = <String>[];

  @override
  Future<void> disableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      'ChannelRepository.disableChannelNotification',
    );
  }

  @override
  Future<void> enableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      'ChannelRepository.enableChannelNotification',
    );
  }

  @override
  Future<void> followChannel({required String channelId}) async {
    followCalls.add(channelId);

    myInfo = _channelMyInfo(following: true);
  }

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getChannel');
  }

  @override
  Future<ChannelVideoPage> getChannelVideos({
    required String channelId,
    VodSort? sortType,
    int? page,
    int? size,
    String? publishDateAt,
    String? videoType,
  }) async {
    videoRequests.add((channelId: channelId, page: page, size: size));
    final index = page ?? 0;
    if (failingVideoPages.remove(index)) {
      throw StateError('channel videos failed');
    }

    if (index < 0 || index >= videoPages.length) {
      return ChannelVideoPage(page: index, size: size ?? 0);
    }

    return videoPages[index];
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) async {
    getMyInfoCalls.add(channelId);
    return myInfo;
  }

  @override
  Future<void> unfollowChannel({required String channelId}) async {
    unfollowCalls.add(channelId);
    if (failUnfollow) {
      throw StateError('unfollow failed');
    }

    myInfo = _channelMyInfo(following: false);
  }
}

class _FakeGroupRepository implements GroupRepository {
  _FakeGroupRepository({
    GroupCollection? collection,
    this.addResult = GroupAddMemberResult.added,
  }) : collection = collection ?? defaultGroupCollection;

  GroupCollection collection;
  final GroupAddMemberResult addResult;

  @override
  Future<GroupActivationResult> activateGroup({required String groupId}) {
    return _unsupportedFakeOperation('GroupRepository.activateGroup');
  }

  @override
  Future<GroupAddMemberResult> addMember({
    required String groupId,
    required String channelId,
  }) async {
    if (addResult != GroupAddMemberResult.added) {
      return addResult;
    }

    collection = collection.copyWith(
      groups: [
        for (final group in collection.groups)
          group.id == groupId
              ? group.copyWith(
                  memberChannelIds: {
                    ...group.memberChannelIds,
                    channelId,
                  }.toList(),
                )
              : group,
      ],
    );
    return GroupAddMemberResult.added;
  }

  @override
  Future<GroupCreateResult> createGroup({required String groupName}) {
    return _unsupportedFakeOperation('GroupRepository.createGroup');
  }

  @override
  Future<GroupMutationResult> deleteGroup({required String groupId}) {
    return _unsupportedFakeOperation('GroupRepository.deleteGroup');
  }

  @override
  Future<GroupCollection> read() async {
    return collection;
  }

  @override
  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  }) {
    return _unsupportedFakeOperation('GroupRepository.removeMember');
  }

  @override
  Future<void> save(GroupCollection collection) {
    return _unsupportedFakeOperation('GroupRepository.save');
  }
}

class _FakeSettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  _FakeSettingsPreferencesRepository({
    this.preferences = defaultSettingsPreferences,
  });

  SettingsPreferences preferences;
  final savedPreferences = <SettingsPreferences>[];

  @override
  Future<SettingsPreferences> read() async {
    return preferences;
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {
    this.preferences = preferences;
    savedPreferences.add(preferences);
  }
}

VodDetail _vodDetail() {
  return const VodDetail(
    videoNo: 1,
    videoId: 'video-id',
    title: 'VOD title',
    videoType: 'REPLAY',
    publishDate: '2026-06-15 20:00:00',
    duration: 600,
    readCount: 1,
    publishDateAt: 1,
    adult: false,
    livePv: 0,
    chapterActive: false,
    inKey: 'in-key',
    videoChatEnabled: false,
    channel: VodChannel(
      channelId: 'channel-a',
      channelName: 'Channel A',
      verifiedMark: false,
    ),
  );
}

ChannelMyInfo _channelMyInfo({
  required bool following,
}) {
  return ChannelMyInfo(
    channelId: 'channel-a',
    following: ChannelPersonalFollowing(
      following: following,
      notification: false,
    ),
    cheatKey: false,
    naverMembership: false,
  );
}

ChannelVideo _channelVideo({
  required int videoNo,
  required String title,
}) {
  return ChannelVideo(
    videoNo: videoNo,
    videoId: 'video-$videoNo',
    title: title,
    videoType: 'REPLAY',
    publishDate: '2026-06-15 20:00:00',
    duration: 600,
    readCount: 1,
    publishDateAt: videoNo,
    adult: false,
    livePv: 0,
  );
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
