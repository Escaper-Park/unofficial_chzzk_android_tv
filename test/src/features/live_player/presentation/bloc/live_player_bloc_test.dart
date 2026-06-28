import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_page.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/repositories/category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/repositories/following_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/domain/use_cases/resolve_live_playback_uri.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/bloc/live_player_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/live_player_route_target.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  test('initial target seeds loading primary slot before started event', () {
    final bloc = _livePlayerBloc(
      initialTarget: const LivePlayerInitialTarget(
        channelId: 'channel-a',
        liveId: 1,
        title: 'Initial title',
        thumbnailImageUrl: 'https://example.com/thumb.jpg',
      ),
      liveRepository: _FakeLiveRepository(),
    );
    addTearDown(bloc.close);

    expect(bloc.state.activeSlot.status, LivePlayerSlotStatus.loadingSource);
    expect(bloc.state.activeSlot.channelId, 'channel-a');
    expect(bloc.state.activeSlot.liveId, 1);
    expect(bloc.state.activeSlot.fallbackTitle, 'Initial title');
    expect(
      bloc.state.activeSlot.fallbackThumbnailImageUrl,
      'https://example.com/thumb.jpg',
    );
  });

  test('started resolves initial target into ready primary slot', () async {
    final repository = _FakeLiveRepository(
      detail: _liveDetail(
        playbackUri: 'https://example.com/live.m3u8',
      ),
    );
    final bloc = _livePlayerBloc(liveRepository: repository);
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(
          channelId: 'channel-a',
          liveId: 1,
          title: 'Initial title',
          thumbnailImageUrl: 'https://example.com/thumb.jpg',
        ),
      ),
    );

    await expectLater(
      bloc.stream,
      emitsInOrder([
        isA<LivePlayerState>().having(
          (state) => state.activeSlot.status,
          'slot status',
          LivePlayerSlotStatus.loadingSource,
        ),
        isA<LivePlayerState>()
            .having(
              (state) => state.activeSlot.status,
              'slot status',
              LivePlayerSlotStatus.ready,
            )
            .having(
              (state) => state.activeSlot.playbackUri,
              'playback uri',
              Uri.parse('https://example.com/live.m3u8'),
            )
            .having(
              (state) => state.activeSlot.channelId,
              'channel id',
              'channel-a',
            ),
      ]),
    );
  });

  test(
    'jump to realtime reloads active live with fresh playback source',
    () async {
      final detailsByChannelId = <String, LiveDetail>{
        'channel-a': _liveDetail(
          liveId: 1,
          title: 'Initial live',
          playbackUri: 'https://example.com/initial.m3u8',
        ),
      };
      final repository = _FakeLiveRepository(
        detailsByChannelId: detailsByChannelId,
        status: const LiveStatus(
          title: 'Initial live',
          status: 'OPEN',
          concurrentUserCount: 123,
          adult: false,
          tags: ['initial-tag'],
        ),
      );
      final bloc = _livePlayerBloc(liveRepository: repository);
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.started(
          initialTarget: LivePlayerInitialTarget(
            channelId: 'channel-a',
            liveId: 1,
            title: 'Initial title',
          ),
        ),
      );

      await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.status == LivePlayerSlotStatus.ready &&
            state.activeSlot.playbackUri ==
                Uri.parse('https://example.com/initial.m3u8'),
      );

      detailsByChannelId['channel-a'] = _liveDetail(
        liveId: 2,
        title: 'Fresh live',
        playbackUri: 'https://example.com/fresh.m3u8',
      );
      repository.status = const LiveStatus(
        title: 'Fresh live',
        status: 'OPEN',
        concurrentUserCount: 456,
        adult: false,
        tags: ['fresh-tag'],
      );
      bloc.add(const LivePlayerEvent.jumpToRealtimeRequested());

      final loading = await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.status == LivePlayerSlotStatus.loadingSource &&
            state.activeSlot.channelId == 'channel-a',
      );
      expect(loading.activeSlot.playbackUri, isNull);
      expect(loading.activeSlot.channelName, 'Channel A');
      expect(loading.activeSlot.title, 'Initial live');
      expect(loading.activeSlot.concurrentUserCount, 123);
      expect(loading.activeSlot.tags, ['initial-tag']);

      final refreshed = await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.status == LivePlayerSlotStatus.ready &&
            state.activeSlot.playbackUri ==
                Uri.parse('https://example.com/fresh.m3u8'),
      );

      expect(refreshed.activeSlot.liveId, 2);
      expect(refreshed.activeSlot.title, 'Fresh live');
      expect(refreshed.activeSlot.concurrentUserCount, 456);
      expect(refreshed.activeSlot.tags, ['fresh-tag']);
      expect(repository.getLiveDetailCalls, ['channel-a', 'channel-a']);
    },
  );

  test('started applies live settings to initial playback source', () async {
    final repository = _FakeLiveRepository(
      detail: _liveDetail(
        livePlaybackJson: '''
        {
          "media": [
            {
              "mediaId": "HLS",
              "path": "https://example.com/hls/master.m3u8"
            },
            {
              "mediaId": "LLHLS",
              "path": "https://example.com/llhls/master.m3u8?token=signed"
            }
          ]
        }
        ''',
      ),
    );
    final bloc = _livePlayerBloc(
      liveRepository: repository,
      settingsPreferencesRepository: _FakeSettingsPreferencesRepository(
        preferences: const SettingsPreferences(
          generalSetting: GeneralSetting(
            videoViewTypeIndex: playerVideoViewTypeIndexMax,
          ),
          liveSettings: LiveSettings(
            latencyIndex: 1,
            resolutionIndex: 2,
            chatWindowIndex: 2,
          ),
        ),
      ),
      loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader(
        playlistTextByUri: {
          Uri.parse('https://example.com/llhls/master.m3u8?token=signed'): '''
          #EXTM3U
          #EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360
          360p/index.m3u8
          #EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
          720p/index.m3u8
          ''',
        },
      ),
    );
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
      ),
    );

    await expectLater(
      bloc.stream,
      emitsInOrder([
        isA<LivePlayerState>().having(
          (state) => state.activeSlot.status,
          'slot status',
          LivePlayerSlotStatus.loadingSource,
        ),
        isA<LivePlayerState>()
            .having(
              (state) => state.activeSlot.status,
              'slot status',
              LivePlayerSlotStatus.ready,
            )
            .having(
              (state) => state.activeSlot.playbackUri,
              'playback uri',
              Uri.parse(
                'https://example.com/llhls/720p/index.m3u8?token=signed',
              ),
            )
            .having(
              (state) => state.activeSlot.availableResolutionIndexes,
              'available resolution indexes',
              [0, 2, 4],
            )
            .having(
              (state) => state.activeSlot.videoViewType,
              'video view type',
              PlayerVideoViewType.platformView,
            )
            .having(
              (state) => state.settingsPreferences.liveSettings.chatWindowIndex,
              'chat window index',
              2,
            ),
      ]),
    );
  });

  test('started remembers ready live for the current player session', () async {
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(
          playbackUri: 'https://example.com/channel-a.m3u8',
        ),
        livePage: const LivePage(
          items: [
            Live(
              liveId: 100,
              title: 'Popular live',
              concurrentUserCount: 10,
              adult: false,
              channel: LiveChannel(
                channelId: 'popular-channel',
                channelName: 'Popular Channel',
                verifiedMark: false,
              ),
            ),
          ],
        ),
      ),
    );
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
      ),
    );

    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
    );

    bloc.add(const LivePlayerEvent.browseRequested(isSignedIn: false));
    await bloc.stream.firstWhere(
      (state) =>
          state.overlayMode == LivePlayerOverlayMode.browse &&
          state.browseSection == LivePlayerBrowseSection.popular &&
          state.browseStatus == LivePlayerBrowseLoadStatus.success,
    );

    bloc.add(const LivePlayerEvent.browseNextSectionRequested());
    await bloc.stream.firstWhere(
      (state) =>
          state.browseSection == LivePlayerBrowseSection.category &&
          state.browseStatus == LivePlayerBrowseLoadStatus.empty,
    );

    bloc.add(const LivePlayerEvent.browseNextSectionRequested());
    final recent = await bloc.stream.firstWhere(
      (state) =>
          state.browseSection == LivePlayerBrowseSection.recent &&
          state.browseStatus == LivePlayerBrowseLoadStatus.success,
    );

    expect(recent.browseItems.single.channel?.channelId, 'channel-a');
  });

  test('recent live history keeps ten channels in current session', () async {
    final channelIds = [
      for (var index = 1; index <= 11; index += 1) 'channel-$index',
    ];
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detailsByChannelId: {
          for (final channelId in channelIds)
            channelId: _liveDetail(
              channelId: channelId,
              liveId: int.parse(channelId.split('-').last),
              playbackUri: 'https://example.com/$channelId.m3u8',
            ),
        },
        livePage: const LivePage(
          items: [
            Live(
              liveId: 100,
              title: 'Popular live',
              concurrentUserCount: 10,
              adult: false,
              channel: LiveChannel(
                channelId: 'popular-channel',
                channelName: 'Popular Channel',
                verifiedMark: false,
              ),
            ),
          ],
        ),
      ),
    );
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(channelId: 'channel-1'),
      ),
    );
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
    );

    for (var index = 2; index <= 11; index += 1) {
      final channelId = 'channel-$index';
      bloc.add(
        LivePlayerEvent.browseLiveSelected(
          live: Live(
            liveId: index,
            title: channelId,
            concurrentUserCount: 10,
            adult: false,
            channel: LiveChannel(
              channelId: channelId,
              channelName: channelId,
              verifiedMark: false,
            ),
          ),
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.status == LivePlayerSlotStatus.ready &&
            state.activeSlot.channelId == channelId,
      );
    }

    bloc.add(const LivePlayerEvent.browseRequested(isSignedIn: false));
    await bloc.stream.firstWhere(
      (state) =>
          state.overlayMode == LivePlayerOverlayMode.browse &&
          state.browseSection == LivePlayerBrowseSection.popular &&
          state.browseStatus == LivePlayerBrowseLoadStatus.success,
    );
    bloc.add(const LivePlayerEvent.browseNextSectionRequested());
    await bloc.stream.firstWhere(
      (state) =>
          state.browseSection == LivePlayerBrowseSection.category &&
          state.browseStatus == LivePlayerBrowseLoadStatus.empty,
    );
    bloc.add(const LivePlayerEvent.browseNextSectionRequested());
    final recent = await bloc.stream.firstWhere(
      (state) =>
          state.browseSection == LivePlayerBrowseSection.recent &&
          state.browseStatus == LivePlayerBrowseLoadStatus.success,
    );

    expect(
      recent.browseItems.map((live) => live.channel?.channelId),
      [
        for (var index = 11; index >= 2; index -= 1) 'channel-$index',
      ],
    );
  });

  test('playback source loader resolves fixed live source', () async {
    final loader = LivePlayerPlaybackSourceLoader(
      loadPlaylistText: _fakeLivePlaybackPlaylistTextLoader(
        playlistTextByUri: {
          Uri.parse('https://example.com/llhls/master.m3u8?token=signed'): '''
          #EXTM3U
          #EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360
          360p/index.m3u8
          #EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
          720p/index.m3u8
          ''',
        },
      ),
    );

    final source = await loader.resolve(
      livePlaybackJson: '''
      {
        "media": [
          {
            "mediaId": "HLS",
            "path": "https://example.com/hls/master.m3u8"
          },
          {
            "mediaId": "LLHLS",
            "path": "https://example.com/llhls/master.m3u8?token=signed"
          }
        ]
      }
      ''',
      latencyIndex: 1,
      resolutionIndex: 2,
    );

    expect(
      source?.playbackUri,
      Uri.parse('https://example.com/llhls/720p/index.m3u8?token=signed'),
    );
    expect(source?.availableResolutionIndexes, [0, 2, 4]);
  });

  test('status reader reads live status with player recommendations', () async {
    final repository = _FakeLiveRepository(
      status: const LiveStatus(
        title: 'Live title',
        status: 'OPEN',
        concurrentUserCount: 10,
        adult: false,
      ),
    );
    final reader = LivePlayerStatusReader(
      liveRepository: repository,
      channelRepository: _FakeChannelRepository(),
    );

    await reader.readStatus('channel-a');

    expect(repository.getLiveStatusCalls, [
      (channelId: 'channel-a', includePlayerRecommendContent: true),
    ]);
  });

  test('status reader applies member-only viewer benefits', () async {
    final channelRepository = _FakeChannelRepository(
      myInfo: const ChannelMyInfo(
        channelId: 'channel-a',
        cheatKey: false,
        naverMembership: true,
      ),
    );
    final reader = LivePlayerStatusReader(
      liveRepository: _FakeLiveRepository(),
      channelRepository: channelRepository,
    );

    final blockReason = await reader.blockReasonForStatus(
      const LiveStatus(
        title: 'Member live',
        status: 'OPEN',
        concurrentUserCount: 10,
        adult: false,
        channelId: 'channel-a',
        membershipBenefitType: 'MEMBER_ONLY',
      ),
      fallbackChannelId: 'fallback-channel',
    );

    expect(blockReason, isNull);
    expect(channelRepository.getMyInfoCalls, ['channel-a']);
  });

  test('ended status tracker marks closed status as ended', () {
    final tracker = LivePlayerEndedStatusCheckTracker()
      ..start(
        slotId: 'primary',
        playbackUri: Uri.parse('https://example.com/live.m3u8'),
      );

    final result = tracker.evaluate(
      slotId: 'primary',
      playbackUri: Uri.parse('https://example.com/live.m3u8'),
      liveStatus: const LiveStatus(
        title: 'Closed live',
        status: 'CLOSED',
        concurrentUserCount: 0,
        adult: false,
      ),
    );

    expect(result.action, LivePlayerEndedStatusCheckAction.markEnded);
    expect(result.liveStatus?.status, 'CLOSED');
  });

  test('ended status tracker reloads after non-closed retries', () {
    final tracker = LivePlayerEndedStatusCheckTracker()
      ..start(
        slotId: 'primary',
        playbackUri: Uri.parse('https://example.com/live.m3u8'),
      );

    final waiting = tracker.evaluate(
      slotId: 'primary',
      playbackUri: Uri.parse('https://example.com/live.m3u8'),
      liveStatus: const LiveStatus(
        title: 'Open live',
        status: 'OPEN',
        concurrentUserCount: 10,
        adult: false,
      ),
    );
    final reload = tracker.evaluate(
      slotId: 'primary',
      playbackUri: Uri.parse('https://example.com/live.m3u8'),
      liveStatus: const LiveStatus(
        title: 'Open live',
        status: 'OPEN',
        concurrentUserCount: 10,
        adult: false,
      ),
    );

    expect(waiting.action, LivePlayerEndedStatusCheckAction.keepWaiting);
    expect(reload.action, LivePlayerEndedStatusCheckAction.reloadTarget);
  });

  test('target loader resolves ready target result', () async {
    final repository = _FakeLiveRepository(
      detail: _liveDetail(playbackUri: 'https://example.com/live.m3u8'),
    );
    final loader = LivePlayerTargetLoader(
      liveRepository: repository,
      statusReader: LivePlayerStatusReader(
        liveRepository: repository,
        channelRepository: _FakeChannelRepository(),
      ),
      playbackSourceLoader: LivePlayerPlaybackSourceLoader(
        loadPlaylistText: _fakeLivePlaybackPlaylistTextLoader(),
      ),
    );

    final result = await loader.load(
      target: const LivePlayerInitialTarget(channelId: 'channel-a'),
      settings: const LivePlayerTargetLoadSettings(
        liveSettings: LiveSettings(),
        videoViewType: PlayerVideoViewType.textureView,
      ),
      resolutionIndex: LivePlaybackResolutionOptions.autoIndex,
      isCurrent: () => true,
    );

    expect(result.type, LivePlayerTargetLoadResultType.ready);
    expect(result.detail?.liveId, 1);
    expect(
      result.playbackSource?.playbackUri,
      Uri.parse('https://example.com/live.m3u8'),
    );
  });

  test(
    'preferences changed persists chat mode but not transient resolution',
    () async {
      final repository = _FakeSettingsPreferencesRepository(
        preferences: const SettingsPreferences(
          liveSettings: LiveSettings(
            resolutionIndex: 3,
            multiviewResolutionIndex: 4,
            chatWindowIndex: 0,
          ),
        ),
      );
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(),
        settingsPreferencesRepository: repository,
      );
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.preferencesChanged(
          preferences: SettingsPreferences(
            liveSettings: LiveSettings(
              resolutionIndex: 2,
              multiviewResolutionIndex: 1,
              chatWindowIndex: 0,
            ),
          ),
        ),
      );

      await bloc.stream.firstWhere(
        (state) => state.settingsPreferences.liveSettings.resolutionIndex == 2,
      );
      expect(repository.savedPreferences, isEmpty);

      bloc.add(
        LivePlayerEvent.preferencesChanged(
          preferences: bloc.state.settingsPreferences.copyWith(
            liveSettings: bloc.state.settingsPreferences.liveSettings.copyWith(
              chatWindowIndex: 1,
            ),
            chatSettings: const ChatSettings(
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
        (state) => state.settingsPreferences.liveSettings.chatWindowIndex == 1,
      );

      expect(repository.savedPreferences, hasLength(1));
      expect(
        repository.savedPreferences.single.liveSettings.chatWindowIndex,
        1,
      );
      expect(
        repository.savedPreferences.single.liveSettings.resolutionIndex,
        3,
      );
      expect(
        repository
            .savedPreferences
            .single
            .liveSettings
            .multiviewResolutionIndex,
        0,
      );
      expect(
        repository
            .savedPreferences
            .single
            .chatSettings
            .overlayChatQuickPositionIndex,
        6,
      );
      expect(
        repository.savedPreferences.single.chatSettings.sideChatPositionIndex,
        0,
      );
      expect(bloc.state.settingsPreferences.liveSettings.resolutionIndex, 2);
      expect(
        bloc.state.settingsPreferences.liveSettings.multiviewResolutionIndex,
        1,
      );
    },
  );

  test(
    'preferences changed refreshes playback source for resolution',
    () async {
      final preferencesRepository = _FakeSettingsPreferencesRepository(
        preferences: const SettingsPreferences(
          liveSettings: LiveSettings(
            latencyIndex: 0,
            resolutionIndex: 3,
          ),
        ),
      );
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            livePlaybackJson: '''
          {
            "media": [
              {
                "mediaId": "HLS",
                "path": "https://example.com/hls/master.m3u8"
              }
            ]
          }
          ''',
          ),
        ),
        settingsPreferencesRepository: preferencesRepository,
        loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader(
          playlistTextByUri: {
            Uri.parse('https://example.com/hls/master.m3u8'): '''
          #EXTM3U
          #EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
          720p/index.m3u8
          #EXT-X-STREAM-INF:BANDWIDTH=6000000,RESOLUTION=1920x1080
          1080p/index.m3u8
          ''',
          },
        ),
      );
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.started(
          initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
        ),
      );

      await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.playbackUri ==
            Uri.parse('https://example.com/hls/1080p/index.m3u8'),
      );

      bloc.add(
        LivePlayerEvent.preferencesChanged(
          preferences: bloc.state.settingsPreferences.copyWith(
            liveSettings: bloc.state.settingsPreferences.liveSettings.copyWith(
              resolutionIndex: 2,
            ),
          ),
        ),
      );

      final refreshed = await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.playbackUri ==
            Uri.parse('https://example.com/hls/720p/index.m3u8'),
      );

      expect(refreshed.activeSlot.status, LivePlayerSlotStatus.ready);
      expect(refreshed.activeSlot.availableResolutionIndexes, [2, 3, 4]);
      expect(refreshed.settingsPreferences.liveSettings.resolutionIndex, 2);
      expect(preferencesRepository.savedPreferences, isEmpty);
    },
  );

  test('started without initial target marks slot as failure', () async {
    final bloc = _livePlayerBloc(liveRepository: _FakeLiveRepository());
    addTearDown(bloc.close);

    bloc.add(const LivePlayerEvent.started());

    await expectLater(
      bloc.stream,
      emits(
        isA<LivePlayerState>()
            .having(
              (state) => state.activeSlot.status,
              'slot status',
              LivePlayerSlotStatus.failure,
            )
            .having(
              (state) => state.activeSlot.failureReason,
              'failure reason',
              LivePlayerFailureReason.missingInitialTarget,
            ),
      ),
    );
  });

  test(
    'controls requested opens overlay without refreshing live status',
    () async {
      final repository = _FakeLiveRepository(
        detail: _liveDetail(
          playbackUri: 'https://example.com/live.m3u8',
        ),
        status: const LiveStatus(
          title: 'Polled title',
          status: 'OPEN',
          concurrentUserCount: 1234,
          adult: false,
          tags: ['tag-a', 'tag-b'],
          openDate: '2026-06-15 20:00:00',
        ),
      );
      final bloc = _livePlayerBloc(liveRepository: repository);
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.started(
          initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
        ),
      );

      await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
      );

      final getLiveStatusCallCount = repository.getLiveStatusCalls.length;
      repository.status = const LiveStatus(
        title: 'Overlay should not fetch this',
        status: 'OPEN',
        concurrentUserCount: 9999,
        adult: false,
        tags: ['new-tag'],
        openDate: '2026-06-15 20:00:00',
      );
      bloc.add(const LivePlayerEvent.controlsRequested());

      final opened = await bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == LivePlayerOverlayMode.controls &&
            state.channelMyInfo != null,
      );
      expect(opened.overlayMode, LivePlayerOverlayMode.controls);
      expect(repository.getLiveStatusCalls, hasLength(getLiveStatusCallCount));
      expect(opened.activeSlot.title, 'Polled title');
      expect(opened.activeSlot.tags, ['tag-a', 'tag-b']);
      expect(opened.activeSlot.concurrentUserCount, 1234);
    },
  );

  test('live status refresh updates the matching slot', () async {
    final repository = _FakeLiveRepository(
      detail: _liveDetail(
        playbackUri: 'https://example.com/live.m3u8',
      ),
    );
    final bloc = _livePlayerBloc(liveRepository: repository);
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
      ),
    );

    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
    );

    repository.status = const LiveStatus(
      title: 'Refreshed title',
      status: 'OPEN',
      concurrentUserCount: 1234,
      adult: false,
      liveTokenList: ['token-a'],
      liveTokens: ['token-a'],
    );
    bloc.add(
      const LivePlayerEvent.liveStatusRefreshRequested(
        slotId: 'primary',
        channelId: 'channel-a',
      ),
    );

    final refreshed = await bloc.stream.firstWhere(
      (state) => state.activeSlot.title == 'Refreshed title',
    );

    expect(refreshed.activeSlot.liveTokens, ['token-a']);
    expect(repository.getLiveStatusCalls.last.channelId, 'channel-a');
    expect(
      repository.getLiveStatusCalls.last.includePlayerRecommendContent,
      isTrue,
    );
  });

  test(
    'live status refresh skips overlapping requests for same slot',
    () async {
      final repository = _FakeLiveRepository(
        detail: _liveDetail(
          playbackUri: 'https://example.com/live.m3u8',
        ),
      );
      final bloc = _livePlayerBloc(liveRepository: repository);
      addTearDown(bloc.close);

      await _startReadyLive(bloc);

      final initialStatusCallCount = repository.getLiveStatusCalls.length;
      final pendingStatus = Completer<LiveStatus>();
      repository.pendingStatus = pendingStatus;

      bloc.add(
        const LivePlayerEvent.liveStatusRefreshRequested(
          slotId: 'primary',
          channelId: 'channel-a',
        ),
      );
      await pumpEventQueue();

      expect(
        repository.getLiveStatusCalls,
        hasLength(initialStatusCallCount + 1),
      );

      bloc.add(
        const LivePlayerEvent.liveStatusRefreshRequested(
          slotId: 'primary',
          channelId: 'channel-a',
        ),
      );
      await pumpEventQueue();

      expect(
        repository.getLiveStatusCalls,
        hasLength(initialStatusCallCount + 1),
      );

      repository.pendingStatus = null;
      pendingStatus.complete(
        const LiveStatus(
          title: 'First refresh',
          status: 'OPEN',
          concurrentUserCount: 100,
          adult: false,
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.activeSlot.title == 'First refresh',
      );
      await pumpEventQueue();

      repository.status = const LiveStatus(
        title: 'Second refresh',
        status: 'OPEN',
        concurrentUserCount: 101,
        adult: false,
      );
      bloc.add(
        const LivePlayerEvent.liveStatusRefreshRequested(
          slotId: 'primary',
          channelId: 'channel-a',
        ),
      );

      await bloc.stream.firstWhere(
        (state) => state.activeSlot.title == 'Second refresh',
      );
      expect(
        repository.getLiveStatusCalls,
        hasLength(initialStatusCallCount + 2),
      );
    },
  );

  test('started marks the slot ended when live detail is closed', () async {
    final repository = _FakeLiveRepository(
      detail: _liveDetail(
        status: 'CLOSED',
        playbackUri: 'https://example.com/live.m3u8',
      ),
    );
    final bloc = _livePlayerBloc(liveRepository: repository);
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
      ),
    );

    final ended = await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == LivePlayerSlotStatus.ended,
    );

    expect(ended.activeSlot.playbackUri, isNull);
    expect(ended.activeSlot.detail?.status, 'CLOSED');
  });

  test(
    'started blocks restricted detail before resolving playback source',
    () async {
      final repository = _FakeLiveRepository(
        detail: _liveDetail(
          playbackUri: 'https://example.com/live.m3u8',
        ).copyWith(blindType: 'PRIVATE'),
      );
      final bloc = _livePlayerBloc(liveRepository: repository);
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.started(
          initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
        ),
      );

      final blocked = await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.failure,
      );

      expect(
        blocked.activeSlot.failureReason,
        LivePlayerFailureReason.entryBlocked,
      );
      expect(blocked.activeSlot.playbackUri, isNull);
    },
  );

  test(
    'started blocks adult detail before resolving playback source',
    () async {
      final requestedUris = <Uri>[];
      final repository = _FakeLiveRepository(
        detail: _liveDetail(
          playbackUri: 'https://example.com/live.m3u8',
        ).copyWith(adult: true),
      );
      final bloc = _livePlayerBloc(
        liveRepository: repository,
        loadLivePlaybackPlaylistText: ({required playlistUri}) async {
          requestedUris.add(playlistUri);
          throw StateError('playback should not resolve');
        },
      );
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.started(
          initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
        ),
      );

      final blocked = await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.failure,
      );

      expect(
        blocked.activeSlot.failureReason,
        LivePlayerFailureReason.entryBlocked,
      );
      expect(blocked.activeSlot.playbackUri, isNull);
      expect(requestedUris, isEmpty);
    },
  );

  test(
    'started blocks member-only detail without viewer benefit',
    () async {
      final requestedUris = <Uri>[];
      final channelRepository = _FakeChannelRepository();
      final repository = _FakeLiveRepository(
        detail: _liveDetail(
          playbackUri: 'https://example.com/live.m3u8',
        ).copyWith(membershipBenefitType: 'MEMBER_ONLY'),
      );
      final bloc = _livePlayerBloc(
        liveRepository: repository,
        channelRepository: channelRepository,
        loadLivePlaybackPlaylistText: ({required playlistUri}) async {
          requestedUris.add(playlistUri);
          throw StateError('playback should not resolve');
        },
      );
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.started(
          initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
        ),
      );

      final blocked = await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.failure,
      );

      expect(
        blocked.activeSlot.failureReason,
        LivePlayerFailureReason.entryBlocked,
      );
      expect(blocked.activeSlot.playbackUri, isNull);
      expect(channelRepository.getMyInfoCalls, ['channel-a']);
      expect(requestedUris, isEmpty);
    },
  );

  test(
    'live status refresh marks the matching slot ended when closed',
    () async {
      final repository = _FakeLiveRepository(
        detail: _liveDetail(
          playbackUri: 'https://example.com/live.m3u8',
        ),
      );
      final bloc = _livePlayerBloc(liveRepository: repository);
      addTearDown(bloc.close);

      await _startReadyLive(bloc);

      repository.status = const LiveStatus(
        title: 'Closed live',
        status: 'CLOSED',
        concurrentUserCount: 0,
        adult: false,
      );
      bloc.add(
        const LivePlayerEvent.liveStatusRefreshRequested(
          slotId: 'primary',
          channelId: 'channel-a',
        ),
      );

      final ended = await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.ended,
      );

      expect(ended.activeSlot.playbackUri, isNull);
      expect(ended.activeSlot.liveStatus?.status, 'CLOSED');
      expect(ended.activeSlot.title, 'Closed live');
    },
  );

  test(
    'live status refresh blocks playback when refreshed status is restricted',
    () async {
      final playbackUri = Uri.parse('https://example.com/live.m3u8');
      final repository = _FakeLiveRepository(
        detail: _liveDetail(playbackUri: playbackUri.toString()),
      );
      final bloc = _livePlayerBloc(liveRepository: repository);
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      expect(bloc.state.activeSlot.playbackUri, playbackUri);

      repository.status = const LiveStatus(
        title: 'Restricted live',
        status: 'OPEN',
        concurrentUserCount: 10,
        adult: false,
        blindType: 'PRIVATE',
      );
      bloc.add(
        const LivePlayerEvent.liveStatusRefreshRequested(
          slotId: 'primary',
          channelId: 'channel-a',
        ),
      );

      final blocked = await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.failure,
      );

      expect(
        blocked.activeSlot.failureReason,
        LivePlayerFailureReason.entryBlocked,
      );
      expect(blocked.activeSlot.playbackUri, isNull);
      expect(blocked.activeSlot.liveStatus?.title, 'Restricted live');
    },
  );

  test(
    'playback ended waits for the next status refresh to confirm closed status',
    () async {
      final playbackUri = Uri.parse('https://example.com/live.m3u8');
      final repository = _FakeLiveRepository(
        detail: _liveDetail(playbackUri: playbackUri.toString()),
      );
      final bloc = _livePlayerBloc(liveRepository: repository);
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      bloc.add(
        LivePlayerEvent.playbackReady(
          slotId: 'primary',
          playbackUri: playbackUri,
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.playing,
      );

      final statusCallCount = repository.getLiveStatusCalls.length;
      bloc.add(
        LivePlayerEvent.playbackEnded(
          slotId: 'primary',
          playbackUri: playbackUri,
        ),
      );
      await pumpEventQueue();

      expect(repository.getLiveStatusCalls, hasLength(statusCallCount));
      expect(bloc.state.activeSlot.status, LivePlayerSlotStatus.playing);

      repository.status = const LiveStatus(
        title: 'Closed live',
        status: 'CLOSED',
        concurrentUserCount: 0,
        adult: false,
      );
      bloc.add(
        const LivePlayerEvent.liveStatusRefreshRequested(
          slotId: 'primary',
          channelId: 'channel-a',
        ),
      );

      final ended = await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.ended,
      );

      expect(ended.activeSlot.playbackUri, isNull);
      expect(repository.getLiveStatusCalls.last.channelId, 'channel-a');
    },
  );

  test(
    'playback ended restarts after first non-closed status refresh',
    () async {
      final playbackUri = Uri.parse('https://example.com/live.m3u8');
      final repository = _FakeLiveRepository(
        detail: _liveDetail(playbackUri: playbackUri.toString()),
      );
      final bloc = _livePlayerBloc(liveRepository: repository);
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      bloc.add(
        LivePlayerEvent.playbackReady(
          slotId: 'primary',
          playbackUri: playbackUri,
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.playing,
      );

      bloc.add(
        LivePlayerEvent.playbackEnded(
          slotId: 'primary',
          playbackUri: playbackUri,
        ),
      );
      await pumpEventQueue();

      repository.status = const LiveStatus(
        title: 'Still open',
        status: 'OPEN',
        concurrentUserCount: 10,
        adult: false,
      );
      bloc.add(
        const LivePlayerEvent.liveStatusRefreshRequested(
          slotId: 'primary',
          channelId: 'channel-a',
        ),
      );
      final restarting = await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.status == LivePlayerSlotStatus.loadingSource &&
            state.activeSlot.channelId == 'channel-a',
      );

      expect(restarting.activeSlot.playbackUri, isNull);
    },
  );

  test('watch event reporting is enabled only for single view', () {
    final state = LivePlayerState.initial().copyWith(
      slots: const [
        LivePlayerSlotState(
          slotId: 'primary',
          channelId: 'channel-a',
          liveId: 123,
        ),
      ],
    );

    expect(state.watchEventReportingEnabled, isTrue);
    final multiviewState = state.copyWith(
      viewMode: LivePlayerViewMode.multiview,
    );
    expect(multiviewState.watchEventReportingEnabled, isFalse);
    expect(
      state.canReportWatchEventForSlot(
        slotId: 'primary',
        channelId: 'channel-a',
        liveId: 123,
      ),
      isTrue,
    );
    expect(
      multiviewState.canReportWatchEventForSlot(
        slotId: 'primary',
        channelId: 'channel-a',
        liveId: 123,
      ),
      isFalse,
    );
    expect(
      state.canReportWatchEventForSlot(
        slotId: 'primary',
        channelId: 'channel-b',
        liveId: 123,
      ),
      isFalse,
    );
    expect(
      state.canReportWatchEventForSlot(
        slotId: 'primary',
        channelId: 'channel-a',
        liveId: 456,
      ),
      isFalse,
    );
  });

  test('watch event posting is owned by current single-view slot', () async {
    final repository = _FakeLiveRepository(
      detail: _liveDetail(playbackUri: 'https://example.com/live.m3u8'),
    );
    final bloc = _livePlayerBloc(liveRepository: repository);
    addTearDown(bloc.close);

    await _startReadyLive(bloc);

    await bloc.postWatchEventForSlot(
      slotId: 'primary',
      channelId: 'channel-a',
      liveId: 1,
      watchEventType: 'WATCH_STARTED',
      sessionId: 'session-a',
      eventDurationSeconds: 30,
      positionSeconds: 5,
      awtSeconds: null,
      liveTokens: const ['token-a'],
      autoPlay: false,
      radioMode: false,
    );

    expect(repository.watchEventCalls, hasLength(1));
    expect(repository.watchEventCalls.single.channelId, 'channel-a');
    expect(repository.watchEventCalls.single.liveId, 1);

    await bloc.postWatchEventForSlot(
      slotId: 'missing',
      channelId: 'channel-a',
      liveId: 1,
      watchEventType: 'WATCH_CONTINUED',
      sessionId: 'session-a',
      eventDurationSeconds: 30,
      positionSeconds: 35,
      awtSeconds: 30,
      liveTokens: const ['token-a'],
      autoPlay: false,
      radioMode: false,
    );
    expect(repository.watchEventCalls, hasLength(1));

    await bloc.postWatchEventForSlot(
      slotId: 'primary',
      channelId: 'channel-a',
      liveId: 999,
      watchEventType: 'WATCH_ENDED',
      sessionId: 'session-a',
      eventDurationSeconds: 30,
      positionSeconds: 65,
      awtSeconds: 60,
      liveTokens: const ['token-a'],
      autoPlay: false,
      radioMode: false,
      allowStaleSlotTarget: true,
    );
    expect(repository.watchEventCalls, hasLength(2));
    expect(repository.watchEventCalls.last.liveId, 999);
    expect(repository.watchEventCalls.last.watchEventType, 'WATCH_ENDED');

    await bloc.postWatchEventForSlot(
      slotId: 'primary',
      channelId: 'channel-a',
      liveId: 999,
      watchEventType: 'WATCH_PAUSED',
      sessionId: 'session-a',
      eventDurationSeconds: 30,
      positionSeconds: 65,
      awtSeconds: 60,
      liveTokens: const ['token-a'],
      autoPlay: false,
      radioMode: false,
      allowStaleSlotTarget: true,
    );
    expect(repository.watchEventCalls, hasLength(2));

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await bloc.stream.firstWhere((state) => state.isMultiview);

    await bloc.postWatchEventForSlot(
      slotId: 'primary',
      channelId: 'channel-a',
      liveId: 1,
      watchEventType: 'WATCH_CONTINUED',
      sessionId: 'session-a',
      eventDurationSeconds: 30,
      positionSeconds: 65,
      awtSeconds: 60,
      liveTokens: const ['token-a'],
      autoPlay: false,
      radioMode: false,
    );
    expect(repository.watchEventCalls, hasLength(2));
  });

  test(
    'multiview selection initializes layout, resolution, and audio',
    () async {
      final bloc = _livePlayerBloc(liveRepository: _FakeLiveRepository());
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.viewModeSelected(
          viewMode: LivePlayerViewMode.multiview,
        ),
      );

      final multiview = await bloc.stream.firstWhere(
        (state) => state.viewMode == LivePlayerViewMode.multiview,
      );

      expect(
        multiview.multiviewLayoutMode,
        LivePlayerMultiviewLayoutMode.pbp,
      );
      expect(multiview.audibleSlotIds, {'primary'});
      expect(multiview.effectiveAudibleSlotIds, {'primary'});
      expect(multiview.slotVolumeById, isEmpty);
      expect(multiview.slotStoredVolume('primary'), 1);
      expect(multiview.slotPlaybackVolume('primary'), 1);

      bloc.add(
        const LivePlayerEvent.viewModeSelected(
          viewMode: LivePlayerViewMode.single,
        ),
      );

      final single = await bloc.stream.firstWhere(
        (state) => state.viewMode == LivePlayerViewMode.single,
      );
      expect(single.audibleSlotIds, isEmpty);
      expect(single.slotVolumeById, isEmpty);
      expect(single.effectiveAudibleSlotIds, {'primary'});
    },
  );

  test(
    'slot audibility falls back to active slot when stored ids are stale',
    () {
      final state = LivePlayerState.initial().copyWith(
        viewMode: LivePlayerViewMode.multiview,
        activeSlotId: 'slot-1',
        slots: const [
          LivePlayerSlotState(slotId: 'primary'),
          LivePlayerSlotState(slotId: 'slot-1'),
        ],
        audibleSlotIds: {'stale-slot'},
      );

      expect(state.effectiveAudibleSlotIds, {'slot-1'});
      expect(state.isSlotAudible('slot-1'), isTrue);
      expect(state.isSlotAudible('primary'), isFalse);
      expect(state.isSlotAudible('stale-slot'), isFalse);
    },
  );

  test('started applies configured multiview screen mode', () async {
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(playbackUri: 'https://example.com/live.m3u8'),
      ),
      settingsPreferencesRepository: _FakeSettingsPreferencesRepository(
        preferences: const SettingsPreferences(
          liveSettings: LiveSettings(multiviewScreenModeIndex: 2),
        ),
      ),
    );
    addTearDown(bloc.close);

    await _startReadyLive(bloc);

    expect(bloc.state.multiviewLayoutMode, LivePlayerMultiviewLayoutMode.focus);
  });

  test('multiview browse selection appends a stable inactive slot', () async {
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(playbackUri: 'https://example.com/channel-a.m3u8'),
        detailsByChannelId: {
          'channel-b': _liveDetail(
            channelId: 'channel-b',
            liveId: 2,
            title: 'Channel B live',
            playbackUri: 'https://example.com/channel-b.m3u8',
          ),
        },
      ),
    );
    addTearDown(bloc.close);

    await _startReadyLive(bloc);
    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await bloc.stream.firstWhere((state) => state.isMultiview);

    bloc.add(
      const LivePlayerEvent.browseLiveSelected(
        live: Live(
          liveId: 2,
          title: 'Channel B',
          concurrentUserCount: 20,
          adult: false,
          channel: LiveChannel(
            channelId: 'channel-b',
            channelName: 'Channel B',
            verifiedMark: false,
          ),
        ),
      ),
    );

    final loading = await bloc.stream.firstWhere(
      (state) =>
          state.activeSlotId == 'primary' &&
          state.slotById('slot-1')?.status ==
              LivePlayerSlotStatus.loadingSource,
    );
    expect(loading.slots.map((slot) => slot.slotId), ['primary', 'slot-1']);
    expect(loading.audibleSlotIds, {'primary'});

    final ready = await bloc.stream.firstWhere(
      (state) =>
          state.activeSlotId == 'primary' &&
          state.slotById('slot-1')?.status == LivePlayerSlotStatus.ready,
    );

    expect(ready.slots.map((slot) => slot.slotId), ['primary', 'slot-1']);
    expect(ready.activeSlotId, 'primary');
    expect(ready.slotById('primary')?.channelId, 'channel-a');
    expect(ready.slotById('slot-1')?.channelId, 'channel-b');
    expect(ready.canAddMultiviewSlot, isFalse);
    expect(
      ready.slotById('slot-1')?.playbackUri,
      Uri.parse('https://example.com/channel-b.m3u8'),
    );
  });

  test('multiview browse selection reports an existing live slot', () async {
    const channelBLive = Live(
      liveId: 2,
      title: 'Channel B',
      concurrentUserCount: 20,
      adult: false,
      channel: LiveChannel(
        channelId: 'channel-b',
        channelName: 'Channel B',
        verifiedMark: false,
      ),
    );
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(playbackUri: 'https://example.com/channel-a.m3u8'),
        detailsByChannelId: {
          'channel-b': _liveDetail(
            channelId: 'channel-b',
            liveId: 2,
            title: 'Channel B live',
            playbackUri: 'https://example.com/channel-b.m3u8',
          ),
        },
      ),
    );
    addTearDown(bloc.close);

    await _startReadyLive(bloc);
    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await bloc.stream.firstWhere((state) => state.isMultiview);
    bloc.add(const LivePlayerEvent.browseLiveSelected(live: channelBLive));
    await bloc.stream.firstWhere(
      (state) =>
          state.activeSlotId == 'primary' &&
          state.slotById('slot-1')?.status == LivePlayerSlotStatus.ready,
    );

    bloc.add(const LivePlayerEvent.browseLiveSelected(live: channelBLive));
    final reported = await bloc.stream.firstWhere(
      (state) =>
          state.feedbackType ==
          LivePlayerFeedbackType.multiviewLiveAlreadyAdded,
    );

    expect(reported.slots.map((slot) => slot.slotId), ['primary', 'slot-1']);
    expect(reported.activeSlotId, 'primary');
    expect(reported.slotById('primary')?.channelId, 'channel-a');
    expect(reported.slotById('slot-1')?.channelId, 'channel-b');
    expect(reported.audibleSlotIds, {'primary'});
    expect(reported.pendingReplacementLive, isNull);
  });

  test('multiview default resolution initializes added slots only', () async {
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(
          livePlaybackJson: _livePlaybackJsonForChannel('channel-a'),
        ),
        detailsByChannelId: {
          'channel-b': _liveDetail(
            channelId: 'channel-b',
            liveId: 2,
            livePlaybackJson: _livePlaybackJsonForChannel('channel-b'),
          ),
          'channel-c': _liveDetail(
            channelId: 'channel-c',
            liveId: 3,
            livePlaybackJson: _livePlaybackJsonForChannel('channel-c'),
          ),
        },
      ),
      loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader(
        playlistTextByUri: _playlistTextByChannelIds([
          'channel-a',
          'channel-b',
          'channel-c',
        ]),
      ),
      settingsPreferencesRepository: _FakeSettingsPreferencesRepository(
        preferences: const SettingsPreferences(
          liveSettings: LiveSettings(multiviewMaxCount: 4),
        ),
      ),
    );
    addTearDown(bloc.close);

    await _startReadyLive(bloc);
    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    final oneSlot = await bloc.stream.firstWhere(
      (state) =>
          state.isMultiview &&
          state.slotById('primary')?.playbackUri ==
              _resolutionUri('channel-a', '1080p'),
    );
    expect(oneSlot.multiviewLayoutMode, LivePlayerMultiviewLayoutMode.pbp);

    await _enterMultiviewAndAddLive(
      bloc,
      channelId: 'channel-b',
      liveId: 2,
    );
    expect(
      bloc.state.slotById('primary')?.playbackUri,
      _resolutionUri('channel-a', '1080p'),
    );
    expect(
      bloc.state.slotById('slot-1')?.playbackUri,
      _resolutionUri('channel-b', '360p'),
    );

    await _enterMultiviewAndAddLive(
      bloc,
      channelId: 'channel-c',
      liveId: 3,
    );
    final threeSlots = bloc.state;

    expect(
      threeSlots.slotById('primary')?.playbackUri,
      _resolutionUri('channel-a', '1080p'),
    );
    expect(
      threeSlots.slotById('slot-1')?.playbackUri,
      _resolutionUri('channel-b', '360p'),
    );
    expect(
      threeSlots.slotById('slot-2')?.playbackUri,
      _resolutionUri('channel-c', '360p'),
    );
    expect(threeSlots.slots.map((slot) => slot.slotId), [
      'primary',
      'slot-1',
      'slot-2',
    ]);
  });

  test('multiview slot resolution changes only the selected slot', () async {
    final preferencesRepository = _FakeSettingsPreferencesRepository(
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(multiviewMaxCount: 4),
      ),
    );
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(
          livePlaybackJson: _livePlaybackJsonForChannel('channel-a'),
        ),
        detailsByChannelId: {
          'channel-b': _liveDetail(
            channelId: 'channel-b',
            liveId: 2,
            livePlaybackJson: _livePlaybackJsonForChannel('channel-b'),
          ),
          'channel-c': _liveDetail(
            channelId: 'channel-c',
            liveId: 3,
            livePlaybackJson: _livePlaybackJsonForChannel('channel-c'),
          ),
        },
      ),
      loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader(
        playlistTextByUri: _playlistTextByChannelIds([
          'channel-a',
          'channel-b',
          'channel-c',
        ]),
      ),
      settingsPreferencesRepository: preferencesRepository,
    );
    addTearDown(bloc.close);

    await _startReadyLive(bloc);
    await _enterMultiviewAndAddLive(
      bloc,
      channelId: 'channel-b',
      liveId: 2,
    );
    await _enterMultiviewAndAddLive(
      bloc,
      channelId: 'channel-c',
      liveId: 3,
    );

    bloc.add(
      const LivePlayerEvent.slotResolutionSelected(
        slotId: 'slot-1',
        resolutionIndex: 2,
      ),
    );

    final changed = await bloc.stream.firstWhere(
      (state) =>
          state.slotById('slot-1')?.playbackUri ==
          _resolutionUri('channel-b', '720p'),
    );

    expect(
      changed.slotById('primary')?.playbackUri,
      _resolutionUri('channel-a', '1080p'),
    );
    expect(
      changed.slotById('slot-1')?.playbackUri,
      _resolutionUri('channel-b', '720p'),
    );
    expect(
      changed.slotById('slot-2')?.playbackUri,
      _resolutionUri('channel-c', '360p'),
    );
    expect(changed.slotById('slot-1')?.playbackResolutionIndex, 2);
    expect(
      changed.settingsPreferences.liveSettings.multiviewResolutionIndex,
      0,
    );
    expect(preferencesRepository.savedPreferences, isEmpty);
  });

  test(
    'configured multiview resolution applies to added slots only',
    () async {
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            livePlaybackJson: _livePlaybackJsonForChannel('channel-a'),
          ),
          detailsByChannelId: {
            'channel-b': _liveDetail(
              channelId: 'channel-b',
              liveId: 2,
              livePlaybackJson: _livePlaybackJsonForChannel('channel-b'),
            ),
          },
        ),
        settingsPreferencesRepository: _FakeSettingsPreferencesRepository(
          preferences: const SettingsPreferences(
            liveSettings: LiveSettings(multiviewResolutionIndex: 1),
          ),
        ),
        loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader(
          playlistTextByUri: _playlistTextByChannelIds([
            'channel-a',
            'channel-b',
          ]),
        ),
      );
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      bloc.add(
        const LivePlayerEvent.viewModeSelected(
          viewMode: LivePlayerViewMode.multiview,
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.isMultiview &&
            state.slotById('primary')?.playbackUri ==
                _resolutionUri('channel-a', '1080p'),
      );

      await _enterMultiviewAndAddLive(
        bloc,
        channelId: 'channel-b',
        liveId: 2,
      );
      expect(
        bloc.state.slotById('primary')?.playbackUri,
        _resolutionUri('channel-a', '1080p'),
      );
      expect(
        bloc.state.slotById('slot-1')?.playbackUri,
        _resolutionUri('channel-b', '480p'),
      );

      bloc.add(
        const LivePlayerEvent.multiviewLayoutModeSelected(
          layoutMode: LivePlayerMultiviewLayoutMode.pip,
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip,
      );
      bloc.add(const LivePlayerEvent.activeSlotShiftRequested(delta: 1));
      final shifted = await bloc.stream.firstWhere(
        (state) =>
            state.activeSlotId == 'slot-1' &&
            state.slotById('primary')?.playbackUri ==
                _resolutionUri('channel-a', '480p') &&
            state.slotById('slot-1')?.playbackUri ==
                _resolutionUri('channel-b', '1080p'),
      );

      expect(
        shifted.slotById('primary')?.playbackUri,
        _resolutionUri('channel-a', '480p'),
      );
      expect(
        shifted.slotById('slot-1')?.playbackUri,
        _resolutionUri('channel-b', '1080p'),
      );
    },
  );

  test(
    'PIP active slot change applies main and overlay resolutions',
    () async {
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            livePlaybackJson: _livePlaybackJsonForChannel('channel-a'),
          ),
          detailsByChannelId: {
            'channel-b': _liveDetail(
              channelId: 'channel-b',
              liveId: 2,
              livePlaybackJson: _livePlaybackJsonForChannel('channel-b'),
            ),
          },
        ),
        loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader(
          playlistTextByUri: _playlistTextByChannelIds([
            'channel-a',
            'channel-b',
          ]),
        ),
      );
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      await _enterMultiviewAndAddLive(bloc, channelId: 'channel-b', liveId: 2);

      bloc.add(
        const LivePlayerEvent.multiviewLayoutModeSelected(
          layoutMode: LivePlayerMultiviewLayoutMode.pip,
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip &&
            state.slotById('primary')?.playbackUri ==
                _resolutionUri('channel-a', '1080p') &&
            state.slotById('slot-1')?.playbackUri ==
                _resolutionUri('channel-b', '360p'),
      );

      bloc.add(const LivePlayerEvent.activeSlotShiftRequested(delta: 1));
      final shifted = await bloc.stream.firstWhere(
        (state) =>
            state.activeSlotId == 'slot-1' &&
            state.slotById('primary')?.playbackUri ==
                _resolutionUri('channel-a', '360p') &&
            state.slotById('slot-1')?.playbackUri ==
                _resolutionUri('channel-b', '1080p'),
      );

      expect(shifted.audibleSlotIds, {'slot-1'});
    },
  );

  test('PIP layout preference change applies role resolutions', () async {
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(
          livePlaybackJson: _livePlaybackJsonForChannel('channel-a'),
        ),
        detailsByChannelId: {
          'channel-b': _liveDetail(
            channelId: 'channel-b',
            liveId: 2,
            livePlaybackJson: _livePlaybackJsonForChannel('channel-b'),
          ),
        },
      ),
      loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader(
        playlistTextByUri: _playlistTextByChannelIds([
          'channel-a',
          'channel-b',
        ]),
      ),
    );
    addTearDown(bloc.close);

    await _startReadyLive(bloc);
    await _enterMultiviewAndAddLive(bloc, channelId: 'channel-b', liveId: 2);
    bloc.add(
      const LivePlayerEvent.slotResolutionSelected(
        slotId: 'slot-1',
        resolutionIndex: 2,
      ),
    );
    await bloc.stream.firstWhere(
      (state) =>
          state.slotById('slot-1')?.playbackUri ==
          _resolutionUri('channel-b', '720p'),
    );

    bloc.add(
      LivePlayerEvent.preferencesChanged(
        preferences: bloc.state.settingsPreferences.copyWith(
          liveSettings: bloc.state.settingsPreferences.liveSettings.copyWith(
            multiviewScreenModeIndex: 1,
          ),
        ),
      ),
    );

    await bloc.stream.firstWhere(
      (state) =>
          state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip &&
          state.slotById('primary')?.playbackUri ==
              _resolutionUri('channel-a', '1080p') &&
          state.slotById('slot-1')?.playbackUri ==
              _resolutionUri('channel-b', '360p'),
    );
  });

  test(
    'PIP role resolution changes survive active slot switches for the session',
    () async {
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            livePlaybackJson: _livePlaybackJsonForChannel('channel-a'),
          ),
          detailsByChannelId: {
            'channel-b': _liveDetail(
              channelId: 'channel-b',
              liveId: 2,
              livePlaybackJson: _livePlaybackJsonForChannel('channel-b'),
            ),
          },
        ),
        loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader(
          playlistTextByUri: _playlistTextByChannelIds([
            'channel-a',
            'channel-b',
          ]),
        ),
      );
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      await _enterMultiviewAndAddLive(bloc, channelId: 'channel-b', liveId: 2);
      bloc.add(
        const LivePlayerEvent.multiviewLayoutModeSelected(
          layoutMode: LivePlayerMultiviewLayoutMode.pip,
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip &&
            state.slotById('primary')?.playbackUri ==
                _resolutionUri('channel-a', '1080p') &&
            state.slotById('slot-1')?.playbackUri ==
                _resolutionUri('channel-b', '360p'),
      );

      bloc.add(
        const LivePlayerEvent.slotResolutionSelected(
          slotId: 'primary',
          resolutionIndex: 2,
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.slotById('primary')?.playbackUri ==
            _resolutionUri('channel-a', '720p'),
      );

      bloc.add(const LivePlayerEvent.activeSlotShiftRequested(delta: 1));
      await bloc.stream.firstWhere(
        (state) =>
            state.activeSlotId == 'slot-1' &&
            state.slotById('primary')?.playbackUri ==
                _resolutionUri('channel-a', '360p') &&
            state.slotById('slot-1')?.playbackUri ==
                _resolutionUri('channel-b', '720p'),
      );

      bloc.add(
        const LivePlayerEvent.slotResolutionSelected(
          slotId: 'primary',
          resolutionIndex: 1,
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.slotById('primary')?.playbackUri ==
            _resolutionUri('channel-a', '480p'),
      );

      bloc.add(const LivePlayerEvent.activeSlotShiftRequested(delta: 1));
      await bloc.stream.firstWhere(
        (state) =>
            state.activeSlotId == 'primary' &&
            state.slotById('primary')?.playbackUri ==
                _resolutionUri('channel-a', '720p') &&
            state.slotById('slot-1')?.playbackUri ==
                _resolutionUri('channel-b', '480p'),
      );
    },
  );

  test('PIP role resolution memory resets with a new player session', () async {
    final liveRepository = _FakeLiveRepository(
      detail: _liveDetail(
        livePlaybackJson: _livePlaybackJsonForChannel('channel-a'),
      ),
      detailsByChannelId: {
        'channel-b': _liveDetail(
          channelId: 'channel-b',
          liveId: 2,
          livePlaybackJson: _livePlaybackJsonForChannel('channel-b'),
        ),
      },
    );
    final loadLivePlaybackPlaylistText = _fakeLivePlaybackPlaylistTextLoader(
      playlistTextByUri: _playlistTextByChannelIds([
        'channel-a',
        'channel-b',
      ]),
    );
    final firstBloc = _livePlayerBloc(
      liveRepository: liveRepository,
      loadLivePlaybackPlaylistText: loadLivePlaybackPlaylistText,
    );
    var firstBlocClosed = false;
    addTearDown(() async {
      if (!firstBlocClosed) {
        await firstBloc.close();
      }
    });

    await _startReadyLive(firstBloc);
    await _enterMultiviewAndAddLive(
      firstBloc,
      channelId: 'channel-b',
      liveId: 2,
    );
    firstBloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.pip,
      ),
    );
    await firstBloc.stream.firstWhere(
      (state) => state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip,
    );
    firstBloc.add(
      const LivePlayerEvent.slotResolutionSelected(
        slotId: 'primary',
        resolutionIndex: 2,
      ),
    );
    await firstBloc.stream.firstWhere(
      (state) =>
          state.slotById('primary')?.playbackUri ==
          _resolutionUri('channel-a', '720p'),
    );
    await firstBloc.close();
    firstBlocClosed = true;

    final secondBloc = _livePlayerBloc(
      liveRepository: liveRepository,
      loadLivePlaybackPlaylistText: loadLivePlaybackPlaylistText,
    );
    addTearDown(secondBloc.close);
    await _startReadyLive(secondBloc);
    await _enterMultiviewAndAddLive(
      secondBloc,
      channelId: 'channel-b',
      liveId: 2,
    );
    secondBloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.pip,
      ),
    );

    await secondBloc.stream.firstWhere(
      (state) =>
          state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip &&
          state.slotById('primary')?.playbackUri ==
              _resolutionUri('channel-a', '1080p') &&
          state.slotById('slot-1')?.playbackUri ==
              _resolutionUri('channel-b', '360p'),
    );
  });

  test(
    'multiview layout change skips reload when slot resolution is unchanged',
    () async {
      final playlistLoads = <Uri>[];
      final playlistTextByUri = _playlistTextByChannelIds([
        'channel-a',
        'channel-b',
      ]);
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            livePlaybackJson: _livePlaybackJsonForChannel('channel-a'),
          ),
          detailsByChannelId: {
            'channel-b': _liveDetail(
              channelId: 'channel-b',
              liveId: 2,
              livePlaybackJson: _livePlaybackJsonForChannel('channel-b'),
            ),
          },
        ),
        loadLivePlaybackPlaylistText: ({required playlistUri}) async {
          playlistLoads.add(playlistUri);
          return playlistTextByUri[playlistUri]!;
        },
      );
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      await _enterMultiviewAndAddLive(bloc, channelId: 'channel-b', liveId: 2);
      bloc.add(
        const LivePlayerEvent.multiviewLayoutModeSelected(
          layoutMode: LivePlayerMultiviewLayoutMode.pip,
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip &&
            state.slotById('primary')?.playbackResolutionIndex == 3 &&
            state.slotById('slot-1')?.playbackResolutionIndex == 0,
      );

      playlistLoads.clear();
      bloc.add(
        const LivePlayerEvent.multiviewLayoutModeSelected(
          layoutMode: LivePlayerMultiviewLayoutMode.focus,
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.focus,
      );

      expect(playlistLoads, isEmpty);
    },
  );

  test(
    'multiview applies changed video view type without source reload',
    () async {
      final playlistLoads = <Uri>[];
      final playlistTextByUri = _playlistTextByChannelIds(['channel-a']);
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            livePlaybackJson: _livePlaybackJsonForChannel('channel-a'),
          ),
        ),
        loadLivePlaybackPlaylistText: ({required playlistUri}) async {
          playlistLoads.add(playlistUri);
          return playlistTextByUri[playlistUri]!;
        },
      );
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      bloc.add(
        const LivePlayerEvent.viewModeSelected(
          viewMode: LivePlayerViewMode.multiview,
        ),
      );
      await bloc.stream.firstWhere(
        (state) =>
            state.isMultiview &&
            state.activeSlot.videoViewType == PlayerVideoViewType.textureView &&
            state.activeSlot.playbackResolutionIndex == 3,
      );

      playlistLoads.clear();
      bloc.add(
        LivePlayerEvent.preferencesChanged(
          preferences: bloc.state.settingsPreferences.copyWith(
            generalSetting: const GeneralSetting(
              videoViewTypeIndex: playerVideoViewTypeIndexMax,
            ),
          ),
        ),
      );
      final changed = await bloc.stream.firstWhere(
        (state) =>
            state.activeSlot.videoViewType == PlayerVideoViewType.platformView,
      );

      expect(
        changed.activeSlot.playbackUri,
        _resolutionUri('channel-a', '1080p'),
      );
      expect(playlistLoads, isEmpty);
    },
  );

  test('leaving multiview resets slots and closes overlay', () async {
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(playbackUri: 'https://example.com/channel-a.m3u8'),
        detailsByChannelId: {
          'channel-b': _liveDetail(
            channelId: 'channel-b',
            liveId: 2,
            playbackUri: 'https://example.com/channel-b.m3u8',
          ),
        },
      ),
    );
    addTearDown(bloc.close);

    await _startReadyLive(bloc);
    await _enterMultiviewAndAddLive(bloc, channelId: 'channel-b', liveId: 2);
    bloc.add(const LivePlayerEvent.activeSlotSelected(slotId: 'slot-1'));
    await bloc.stream.firstWhere((state) => state.activeSlotId == 'slot-1');
    bloc.add(const LivePlayerEvent.controlsRequested());
    await bloc.stream.firstWhere(
      (state) => state.overlayMode == LivePlayerOverlayMode.controls,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.single,
      ),
    );
    final single = await bloc.stream.firstWhere(
      (state) => state.viewMode == LivePlayerViewMode.single,
    );

    expect(single.overlayMode, LivePlayerOverlayMode.none);
    expect(single.slots, hasLength(1));
    expect(single.activeSlotId, 'primary');
    expect(single.activeSlot.channelId, 'channel-b');

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    final multiview = await bloc.stream.firstWhere(
      (state) => state.viewMode == LivePlayerViewMode.multiview,
    );

    expect(multiview.slots, hasLength(1));
    expect(multiview.activeSlot.channelId, 'channel-b');
  });

  test(
    'multiview active slot changes preserve audio only when multiple slots are audible',
    () async {
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            playbackUri: 'https://example.com/channel-a.m3u8',
          ),
          detailsByChannelId: {
            'channel-b': _liveDetail(
              channelId: 'channel-b',
              liveId: 2,
              playbackUri: 'https://example.com/channel-b.m3u8',
            ),
          },
        ),
      );
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      await _enterMultiviewAndAddLive(bloc, channelId: 'channel-b', liveId: 2);

      bloc.add(const LivePlayerEvent.slotAudioToggled(slotId: 'slot-1'));
      final multiAudio = await bloc.stream.firstWhere(
        (state) => state.audibleSlotIds.contains('slot-1'),
      );
      expect(multiAudio.audibleSlotIds, {'primary', 'slot-1'});
      expect(multiAudio.effectiveAudibleSlotIds, {'primary', 'slot-1'});

      final previousHighlightSerial = multiAudio.activeSlotHighlightSerial;
      bloc.add(const LivePlayerEvent.activeSlotShiftRequested(delta: 1));

      final shifted = await bloc.stream.firstWhere(
        (state) => state.activeSlotId == 'slot-1',
      );

      expect(shifted.audibleSlotIds, {'primary', 'slot-1'});
      expect(shifted.effectiveAudibleSlotIds, {'primary', 'slot-1'});
      expect(
        shifted.activeSlotHighlightSerial,
        previousHighlightSerial + 1,
      );
    },
  );

  test(
    'multiview audio toggle restores the last slot volume in the session',
    () async {
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            playbackUri: 'https://example.com/channel-a.m3u8',
          ),
        ),
      );
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      bloc.add(
        const LivePlayerEvent.viewModeSelected(
          viewMode: LivePlayerViewMode.multiview,
        ),
      );
      await bloc.stream.firstWhere((state) => state.isMultiview);

      bloc.add(
        const LivePlayerEvent.slotVolumeChanged(
          slotId: 'primary',
          volume: 0.7,
        ),
      );
      final adjusted = await bloc.stream.firstWhere(
        (state) => state.slotStoredVolume('primary') == 0.7,
      );
      expect(adjusted.slotPlaybackVolume('primary'), 0.7);

      bloc.add(const LivePlayerEvent.slotAudioToggled(slotId: 'primary'));
      final muted = await bloc.stream.firstWhere(
        (state) => !state.isSlotAudible('primary'),
      );
      expect(muted.audibleSlotIds, isEmpty);
      expect(muted.slotStoredVolume('primary'), 0.7);
      expect(muted.slotPlaybackVolume('primary'), 0);

      bloc.add(const LivePlayerEvent.slotAudioToggled(slotId: 'primary'));
      final restored = await bloc.stream.firstWhere(
        (state) => state.isSlotAudible('primary'),
      );
      expect(restored.audibleSlotIds, {'primary'});
      expect(restored.slotStoredVolume('primary'), 0.7);
      expect(restored.slotPlaybackVolume('primary'), 0.7);

      bloc.add(
        const LivePlayerEvent.viewModeSelected(
          viewMode: LivePlayerViewMode.single,
        ),
      );
      final single = await bloc.stream.firstWhere(
        (state) => state.viewMode == LivePlayerViewMode.single,
      );
      expect(single.slotVolumeById, isEmpty);
    },
  );

  test('slot close compacts visual order while preserving slot ids', () async {
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(playbackUri: 'https://example.com/channel-a.m3u8'),
        detailsByChannelId: {
          'channel-b': _liveDetail(
            channelId: 'channel-b',
            liveId: 2,
            playbackUri: 'https://example.com/channel-b.m3u8',
          ),
          'channel-c': _liveDetail(
            channelId: 'channel-c',
            liveId: 3,
            playbackUri: 'https://example.com/channel-c.m3u8',
          ),
        },
      ),
      settingsPreferencesRepository: _FakeSettingsPreferencesRepository(
        preferences: const SettingsPreferences(
          liveSettings: LiveSettings(multiviewMaxCount: 4),
        ),
      ),
    );
    addTearDown(bloc.close);

    await _startReadyLive(bloc);
    await _enterMultiviewAndAddLive(bloc, channelId: 'channel-b', liveId: 2);
    await _enterMultiviewAndAddLive(bloc, channelId: 'channel-c', liveId: 3);

    expect(bloc.state.slots.map((slot) => slot.slotId), [
      'primary',
      'slot-1',
      'slot-2',
    ]);

    bloc.add(const LivePlayerEvent.activeSlotSelected(slotId: 'slot-1'));
    await bloc.stream.firstWhere((state) => state.activeSlotId == 'slot-1');

    bloc.add(const LivePlayerEvent.slotCloseConfirmed(slotId: 'slot-1'));
    final closed = await bloc.stream.firstWhere(
      (state) => state.slots.length == 2,
    );

    expect(closed.slots.map((slot) => slot.slotId), ['primary', 'slot-2']);
    expect(closed.activeSlotId, 'slot-2');
    expect(closed.audibleSlotIds, {'slot-2'});
    expect(closed.slotById('slot-2')?.channelId, 'channel-c');
  });

  test(
    'full multiview replacement preserves active slot rules and slot ids',
    () async {
      const existingLive = Live(
        liveId: 3,
        title: 'Channel C',
        concurrentUserCount: 30,
        adult: false,
        channel: LiveChannel(
          channelId: 'channel-c',
          channelName: 'Channel C',
          verifiedMark: false,
        ),
      );
      const inactiveReplacementLive = Live(
        liveId: 5,
        title: 'Channel E',
        concurrentUserCount: 50,
        adult: false,
        channel: LiveChannel(
          channelId: 'channel-e',
          channelName: 'Channel E',
          verifiedMark: false,
        ),
      );
      const activeReplacementLive = Live(
        liveId: 6,
        title: 'Channel F',
        concurrentUserCount: 60,
        adult: false,
        channel: LiveChannel(
          channelId: 'channel-f',
          channelName: 'Channel F',
          verifiedMark: false,
        ),
      );
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            playbackUri: 'https://example.com/channel-a.m3u8',
          ),
          detailsByChannelId: {
            'channel-b': _liveDetail(
              channelId: 'channel-b',
              liveId: 2,
              playbackUri: 'https://example.com/channel-b.m3u8',
            ),
            'channel-c': _liveDetail(
              channelId: 'channel-c',
              liveId: 3,
              playbackUri: 'https://example.com/channel-c.m3u8',
            ),
            'channel-d': _liveDetail(
              channelId: 'channel-d',
              liveId: 4,
              playbackUri: 'https://example.com/channel-d.m3u8',
            ),
            'channel-e': _liveDetail(
              channelId: 'channel-e',
              liveId: 5,
              playbackUri: 'https://example.com/channel-e.m3u8',
            ),
            'channel-f': _liveDetail(
              channelId: 'channel-f',
              liveId: 6,
              playbackUri: 'https://example.com/channel-f.m3u8',
            ),
          },
          livePage: const LivePage(
            items: [
              existingLive,
              inactiveReplacementLive,
              activeReplacementLive,
            ],
          ),
        ),
        settingsPreferencesRepository: _FakeSettingsPreferencesRepository(
          preferences: const SettingsPreferences(
            liveSettings: LiveSettings(multiviewMaxCount: 4),
          ),
        ),
      );
      addTearDown(bloc.close);

      await _startReadyLive(bloc);
      await _enterMultiviewAndAddLive(bloc, channelId: 'channel-b', liveId: 2);
      await _enterMultiviewAndAddLive(bloc, channelId: 'channel-c', liveId: 3);
      await _enterMultiviewAndAddLive(bloc, channelId: 'channel-d', liveId: 4);

      expect(bloc.state.canAddMultiviewSlot, isFalse);
      expect(bloc.state.slots.map((slot) => slot.slotId), [
        'primary',
        'slot-1',
        'slot-2',
        'slot-3',
      ]);
      expect(bloc.state.activeSlotId, 'primary');
      expect(bloc.state.audibleSlotIds, {'primary'});

      bloc.add(const LivePlayerEvent.browseRequested(isSignedIn: false));
      await bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == LivePlayerOverlayMode.browse &&
            state.browseStatus == LivePlayerBrowseLoadStatus.success,
      );

      bloc.add(const LivePlayerEvent.browseLiveSelected(live: existingLive));
      final existing = await bloc.stream.firstWhere(
        (state) =>
            state.feedbackType ==
            LivePlayerFeedbackType.multiviewLiveAlreadyAdded,
      );
      expect(existing.activeSlotId, 'primary');
      expect(existing.pendingReplacementLive, isNull);
      expect(existing.slots.map((slot) => slot.slotId), [
        'primary',
        'slot-1',
        'slot-2',
        'slot-3',
      ]);

      bloc.add(
        const LivePlayerEvent.browseLiveSelected(
          live: inactiveReplacementLive,
        ),
      );
      final pending = await bloc.stream.firstWhere(
        (state) => state.pendingReplacementLive == inactiveReplacementLive,
      );
      expect(pending.overlayMode, LivePlayerOverlayMode.browse);

      bloc.add(
        const LivePlayerEvent.browseReplacementSlotSelected(slotId: 'slot-1'),
      );

      final ready = await bloc.stream.firstWhere(
        (state) =>
            state.pendingReplacementLive == null &&
            state.slotById('slot-1')?.channelId == 'channel-e' &&
            state.slotById('slot-1')?.status == LivePlayerSlotStatus.ready,
      );

      expect(ready.overlayMode, LivePlayerOverlayMode.browse);
      expect(ready.activeSlotId, 'primary');
      expect(ready.audibleSlotIds, {'primary'});
      expect(ready.slots.map((slot) => slot.slotId), [
        'primary',
        'slot-1',
        'slot-2',
        'slot-3',
      ]);
      expect(ready.slotById('primary')?.channelId, 'channel-a');
      expect(ready.slotById('slot-2')?.channelId, 'channel-c');
      expect(ready.slotById('slot-3')?.channelId, 'channel-d');

      bloc.add(
        const LivePlayerEvent.browseLiveSelected(live: activeReplacementLive),
      );
      final activePending = await bloc.stream.firstWhere(
        (state) => state.pendingReplacementLive == activeReplacementLive,
      );
      expect(activePending.overlayMode, LivePlayerOverlayMode.browse);

      bloc.add(
        const LivePlayerEvent.browseReplacementSlotSelected(slotId: 'primary'),
      );

      final activeReady = await bloc.stream.firstWhere(
        (state) =>
            state.pendingReplacementLive == null &&
            state.slotById('primary')?.channelId == 'channel-f' &&
            state.slotById('primary')?.status == LivePlayerSlotStatus.ready,
      );

      expect(activeReady.overlayMode, LivePlayerOverlayMode.browse);
      expect(activeReady.activeSlotId, 'primary');
      expect(activeReady.audibleSlotIds, {'primary'});
      expect(activeReady.slots.map((slot) => slot.slotId), [
        'primary',
        'slot-1',
        'slot-2',
        'slot-3',
      ]);
      expect(activeReady.slotById('slot-1')?.channelId, 'channel-e');
      expect(activeReady.slotById('slot-2')?.channelId, 'channel-c');
      expect(activeReady.slotById('slot-3')?.channelId, 'channel-d');
    },
  );

  test(
    'social commands toggle following and return refreshed my-info',
    () async {
      final channelRepository = _FakeChannelRepository(
        myInfo: _myInfoWithFollowing(channelId: 'channel-a', following: false),
      );
      final commands = LivePlayerSocialCommands(
        channelRepository: channelRepository,
        groupRepository: _FakeGroupRepository(),
      );

      final myInfo = await commands.toggleFollowing(
        channelId: 'channel-a',
        currentlyFollowing: false,
      );

      expect(channelRepository.followCalls, ['channel-a']);
      expect(channelRepository.getMyInfoCalls, ['channel-a']);
      expect(myInfo.following?.following, isTrue);
    },
  );

  test('social commands add channel to group and return collection', () async {
    final groupRepository = _FakeGroupRepository(
      collection: const GroupCollection(
        groups: [
          GroupItem(id: 'group-a', groupName: 'Group A'),
        ],
      ),
    );
    final commands = LivePlayerSocialCommands(
      channelRepository: _FakeChannelRepository(),
      groupRepository: groupRepository,
    );

    final result = await commands.addChannelToGroup(
      groupId: 'group-a',
      channelId: 'channel-a',
    );

    expect(result.result, GroupAddMemberResult.added);
    expect(
      result.collection?.groups.single.memberChannelIds,
      ['channel-a'],
    );
  });

  test('following toggled refreshes channel my-info after mutation', () async {
    final channelRepository = _FakeChannelRepository(
      myInfo: _myInfoWithFollowing(channelId: 'channel-a', following: false),
    );
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(playbackUri: 'https://example.com/live.m3u8'),
      ),
      channelRepository: channelRepository,
    );
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
      ),
    );
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
    );

    bloc.add(const LivePlayerEvent.controlsRequested());
    await bloc.stream.firstWhere(
      (state) => state.canToggleActiveChannelFollowing,
    );

    bloc.add(const LivePlayerEvent.followingToggled());
    final followed = await bloc.stream.firstWhere(
      (state) => state.isFollowingActiveChannel,
    );

    expect(followed.feedbackType, LivePlayerFeedbackType.followSuccess);
    expect(channelRepository.followCalls, ['channel-a']);
    expect(channelRepository.getMyInfoCalls, ['channel-a', 'channel-a']);
  });

  test('following failure keeps current state and emits feedback', () async {
    final channelRepository = _FakeChannelRepository(
      myInfo: _myInfoWithFollowing(channelId: 'channel-a', following: true),
      failUnfollow: true,
    );
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(playbackUri: 'https://example.com/live.m3u8'),
      ),
      channelRepository: channelRepository,
    );
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
      ),
    );
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
    );

    bloc.add(const LivePlayerEvent.controlsRequested());
    await bloc.stream.firstWhere(
      (state) => state.isFollowingActiveChannel,
    );

    bloc.add(const LivePlayerEvent.followingToggled());
    final failed = await bloc.stream.firstWhere(
      (state) => state.feedbackType == LivePlayerFeedbackType.unfollowFailure,
    );

    expect(failed.isFollowingActiveChannel, isTrue);
    expect(channelRepository.unfollowCalls, ['channel-a']);
  });

  test('group add emits success feedback and refreshes collection', () async {
    final groupRepository = _FakeGroupRepository(
      collection: const GroupCollection(
        groups: [
          GroupItem(id: 'group-a', groupName: 'Group A'),
        ],
      ),
    );
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(playbackUri: 'https://example.com/live.m3u8'),
      ),
      groupRepository: groupRepository,
    );
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
      ),
    );
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
    );

    bloc.add(const LivePlayerEvent.groupAddRequested(groupId: 'group-a'));
    final added = await bloc.stream.firstWhere(
      (state) => state.feedbackType == LivePlayerFeedbackType.groupAddSuccess,
    );

    expect(
      added.groupCollection.groups.single.memberChannelIds,
      ['channel-a'],
    );
  });

  test('group add failure emits failure feedback', () async {
    final bloc = _livePlayerBloc(
      liveRepository: _FakeLiveRepository(
        detail: _liveDetail(playbackUri: 'https://example.com/live.m3u8'),
      ),
      groupRepository: _FakeGroupRepository(
        addResult: GroupAddMemberResult.groupNotFound,
      ),
    );
    addTearDown(bloc.close);

    bloc.add(
      const LivePlayerEvent.started(
        initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
      ),
    );
    await bloc.stream.firstWhere(
      (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
    );

    bloc.add(const LivePlayerEvent.groupAddRequested(groupId: 'missing'));
    final failed = await bloc.stream.firstWhere(
      (state) => state.feedbackType == LivePlayerFeedbackType.groupAddFailure,
    );

    expect(failed.activeSlot.channelId, 'channel-a');
  });

  test(
    'browse requested opens following first and fallback loads popular',
    () async {
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(playbackUri: 'https://example.com/live.m3u8'),
          livePage: const LivePage(
            items: [
              Live(
                liveId: 22,
                title: 'Popular live',
                concurrentUserCount: 99,
                adult: false,
                channel: LiveChannel(
                  channelId: 'popular-channel',
                  channelName: 'Popular Channel',
                  verifiedMark: false,
                ),
              ),
            ],
          ),
        ),
        followingRepository: _FakeFollowingRepository(),
      );
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.started(
          initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
      );

      bloc.add(const LivePlayerEvent.browseRequested(isSignedIn: true));
      final followingFallback = await bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == LivePlayerOverlayMode.browse &&
            state.browseSection == LivePlayerBrowseSection.following &&
            state.browseStatus == LivePlayerBrowseLoadStatus.empty,
      );

      expect(
        followingFallback.browseFallbackAction,
        LivePlayerBrowseFallbackAction.showPopular,
      );

      bloc.add(const LivePlayerEvent.browseFallbackPressed());
      final popular = await bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == LivePlayerOverlayMode.browse &&
            state.browseSection == LivePlayerBrowseSection.popular &&
            state.browseStatus == LivePlayerBrowseLoadStatus.success,
      );

      expect(popular.browseItems.single.title, 'Popular live');
    },
  );

  test(
    'browse live selected keeps browse overlay while switching slot',
    () async {
      const selectedLive = Live(
        liveId: 2,
        title: 'Selected live',
        concurrentUserCount: 99,
        adult: false,
        channel: LiveChannel(
          channelId: 'channel-b',
          channelName: 'Channel B',
          verifiedMark: false,
        ),
      );
      const previousLive = Live(
        liveId: 1,
        title: 'Previous live',
        concurrentUserCount: 10,
        adult: false,
        channel: LiveChannel(
          channelId: 'channel-a',
          channelName: 'Channel A',
          verifiedMark: false,
        ),
      );
      final bloc = _livePlayerBloc(
        liveRepository: _FakeLiveRepository(
          detail: _liveDetail(
            playbackUri: 'https://example.com/channel-a.m3u8',
          ),
          detailsByChannelId: {
            'channel-b': _liveDetail(
              channelId: 'channel-b',
              liveId: 2,
              title: 'Selected live detail',
              playbackUri: 'https://example.com/channel-b.m3u8',
            ),
          },
          livePage: const LivePage(items: [selectedLive, previousLive]),
        ),
      );
      addTearDown(bloc.close);

      bloc.add(
        const LivePlayerEvent.started(
          initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
      );

      bloc.add(const LivePlayerEvent.browseRequested(isSignedIn: false));
      await bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == LivePlayerOverlayMode.browse &&
            state.browseStatus == LivePlayerBrowseLoadStatus.success,
      );

      final loading = bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == LivePlayerOverlayMode.browse &&
            state.activeSlot.status == LivePlayerSlotStatus.loadingSource &&
            state.activeSlot.channelId == 'channel-b',
      );
      bloc.add(const LivePlayerEvent.browseLiveSelected(live: selectedLive));

      final loadingState = await loading;
      expect(
        loadingState.browseItems.map((live) => live.channel?.channelId),
        ['channel-b', 'channel-a'],
      );
      expect(loadingState.browseItems.first.title, 'Selected live');
      final ready = await bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == LivePlayerOverlayMode.browse &&
            state.activeSlot.status == LivePlayerSlotStatus.ready &&
            state.activeSlot.channelId == 'channel-b',
      );
      expect(
        ready.activeSlot.playbackUri,
        Uri.parse('https://example.com/channel-b.m3u8'),
      );

      final loadingPrevious = bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == LivePlayerOverlayMode.browse &&
            state.activeSlot.status == LivePlayerSlotStatus.loadingSource &&
            state.activeSlot.channelId == 'channel-a',
      );
      bloc.add(const LivePlayerEvent.browseLiveSelected(live: previousLive));

      await loadingPrevious;
      final previousReady = await bloc.stream.firstWhere(
        (state) =>
            state.overlayMode == LivePlayerOverlayMode.browse &&
            state.activeSlot.status == LivePlayerSlotStatus.ready &&
            state.activeSlot.channelId == 'channel-a',
      );
      expect(
        previousReady.activeSlot.playbackUri,
        Uri.parse('https://example.com/channel-a.m3u8'),
      );
    },
  );

  test('browse sections cycle through signed-in group-enabled order', () {
    final state = LivePlayerState.initial().copyWith(
      isSignedIn: true,
      settingsPreferences: const SettingsPreferences(
        liveSettings: LiveSettings(showGroupInVideoPlayer: 1),
      ),
    );

    expect(state.availableBrowseSections, [
      LivePlayerBrowseSection.following,
      LivePlayerBrowseSection.popular,
      LivePlayerBrowseSection.category,
      LivePlayerBrowseSection.recent,
      LivePlayerBrowseSection.group,
    ]);
    expect(
      state
          .copyWith(browseSection: LivePlayerBrowseSection.following)
          .nextBrowseSection,
      LivePlayerBrowseSection.popular,
    );
    expect(
      state
          .copyWith(browseSection: LivePlayerBrowseSection.group)
          .nextBrowseSection,
      LivePlayerBrowseSection.following,
    );
    expect(
      state
          .copyWith(browseSection: LivePlayerBrowseSection.following)
          .previousBrowseSection,
      LivePlayerBrowseSection.group,
    );
    expect(
      state
          .copyWith(browseSection: LivePlayerBrowseSection.category)
          .nextBrowseSection,
      LivePlayerBrowseSection.recent,
    );
  });

  test('following state ignores my-info from another active channel', () {
    final state = LivePlayerState.initial().copyWith(
      slots: [
        const LivePlayerSlotState(
          slotId: 'primary',
          channelId: 'channel-b',
        ),
      ],
      channelMyInfo: _myInfoWithFollowing(
        channelId: 'channel-a',
        following: true,
      ),
    );

    expect(state.canToggleActiveChannelFollowing, isFalse);
    expect(state.isFollowingActiveChannel, isFalse);
  });
}

Future<void> _startReadyLive(LivePlayerBloc bloc) async {
  bloc.add(
    const LivePlayerEvent.started(
      initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
    ),
  );
  await bloc.stream.firstWhere(
    (state) => state.activeSlot.status == LivePlayerSlotStatus.ready,
  );
}

Future<void> _enterMultiviewAndAddLive(
  LivePlayerBloc bloc, {
  required String channelId,
  required int liveId,
}) async {
  if (!bloc.state.isMultiview) {
    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await bloc.stream.firstWhere((state) => state.isMultiview);
  }

  bloc.add(
    LivePlayerEvent.browseLiveSelected(
      live: Live(
        liveId: liveId,
        title: channelId,
        concurrentUserCount: 20,
        adult: false,
        channel: LiveChannel(
          channelId: channelId,
          channelName: channelId,
          verifiedMark: false,
        ),
      ),
    ),
  );
  await bloc.stream.firstWhere(
    (state) => state.slots.any(
      (slot) =>
          slot.liveId == liveId && slot.status == LivePlayerSlotStatus.ready,
    ),
  );
}

String _livePlaybackJsonForChannel(String channelId) {
  return '''
  {
    "media": [
      {
        "mediaId": "HLS",
        "path": "https://example.com/$channelId/master.m3u8"
      }
    ]
  }
  ''';
}

Map<Uri, String> _playlistTextByChannelIds(List<String> channelIds) {
  return {
    for (final channelId in channelIds)
      Uri.parse('https://example.com/$channelId/master.m3u8'):
          _variantPlaylistText(),
  };
}

String _variantPlaylistText() {
  return '''
  #EXTM3U
  #EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360
  360p/index.m3u8
  #EXT-X-STREAM-INF:BANDWIDTH=1600000,RESOLUTION=854x480
  480p/index.m3u8
  #EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
  720p/index.m3u8
  #EXT-X-STREAM-INF:BANDWIDTH=6000000,RESOLUTION=1920x1080
  1080p/index.m3u8
  ''';
}

Uri _resolutionUri(String channelId, String resolution) {
  return Uri.parse('https://example.com/$channelId/$resolution/index.m3u8');
}

LivePlayerBloc _livePlayerBloc({
  LivePlayerInitialTarget? initialTarget,
  required LiveRepository liveRepository,
  LoadLivePlaybackPlaylistText? loadLivePlaybackPlaylistText,
  SettingsPreferencesRepository? settingsPreferencesRepository,
  ChannelRepository? channelRepository,
  FollowingRepository? followingRepository,
  CategoryRepository? categoryRepository,
  GroupRepository? groupRepository,
}) {
  return LivePlayerBloc(
    initialTarget: initialTarget,
    liveRepository: liveRepository,
    channelRepository: channelRepository ?? _FakeChannelRepository(),
    followingRepository: followingRepository ?? _FakeFollowingRepository(),
    categoryRepository: categoryRepository ?? _FakeCategoryRepository(),
    groupRepository: groupRepository ?? _FakeGroupRepository(),
    loadLivePlaybackPlaylistText:
        loadLivePlaybackPlaylistText ?? _fakeLivePlaybackPlaylistTextLoader(),
    settingsPreferencesRepository:
        settingsPreferencesRepository ?? _FakeSettingsPreferencesRepository(),
  );
}

class _FakeLiveRepository implements LiveRepository {
  _FakeLiveRepository({
    this.detail,
    this.detailsByChannelId = const {},
    this.status,
    this.livePage = const LivePage(),
  });

  final LiveDetail? detail;
  final Map<String, LiveDetail> detailsByChannelId;
  LiveStatus? status;
  Completer<LiveStatus>? pendingStatus;
  final LivePage livePage;
  final getLiveDetailCalls = <String>[];
  final getLiveStatusCalls =
      <({String channelId, bool? includePlayerRecommendContent})>[];
  final watchEventCalls =
      <
        ({
          String channelId,
          int liveId,
          String watchEventType,
          String sessionId,
          int eventDurationSeconds,
          int positionSeconds,
          int? awtSeconds,
          List<String> liveTokens,
          bool autoPlay,
          bool radioMode,
        })
      >[];

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) async {
    getLiveDetailCalls.add(channelId);
    final detail = detailsByChannelId[channelId] ?? this.detail;
    if (detail == null) {
      throw StateError('missing detail');
    }

    return detail;
  }

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) async {
    return livePage;
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) async {
    getLiveStatusCalls.add(
      (
        channelId: channelId,
        includePlayerRecommendContent: includePlayerRecommendContent,
      ),
    );
    final pendingStatus = this.pendingStatus;
    if (pendingStatus != null) {
      return pendingStatus.future;
    }

    final status = this.status;
    if (status == null) {
      throw StateError('missing status');
    }

    return status;
  }

  @override
  Future<void> postLiveWatchEvent({
    required String channelId,
    required int liveId,
    required String watchEventType,
    required String sessionId,
    required int eventDurationSeconds,
    required int positionSeconds,
    required int? awtSeconds,
    List<String> liveTokens = const <String>[],
    bool autoPlay = false,
    bool radioMode = false,
  }) async {
    watchEventCalls.add(
      (
        channelId: channelId,
        liveId: liveId,
        watchEventType: watchEventType,
        sessionId: sessionId,
        eventDurationSeconds: eventDurationSeconds,
        positionSeconds: positionSeconds,
        awtSeconds: awtSeconds,
        liveTokens: [...liveTokens],
        autoPlay: autoPlay,
        radioMode: radioMode,
      ),
    );
  }
}

class _FakeFollowingRepository implements FollowingRepository {
  _FakeFollowingRepository();

  final FollowingLivePage livePage = const FollowingLivePage();

  @override
  Future<FollowingChannelPage> fetchFollowingChannels({
    int? page,
    int? size,
    FollowingChannelSort? sortType,
  }) {
    return _unsupportedFakeOperation(
      'FollowingRepository.fetchFollowingChannels',
    );
  }

  @override
  Future<FollowingLivePage> fetchFollowingLives({
    FollowingLiveSort? sortType,
  }) async {
    return livePage;
  }
}

class _FakeCategoryRepository implements CategoryRepository {
  _FakeCategoryRepository();

  final CategoryLivePage livePage = const CategoryLivePage();

  @override
  Future<CategoryPage> fetchCategories({
    CategoryPageCursor? cursor,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategories');
  }

  @override
  Future<CategoryInfo> fetchCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategoryInfo');
  }

  @override
  Future<CategoryLivePage> fetchCategoryLives({
    required String categoryType,
    required String categoryId,
    CategoryLiveCursor? cursor,
  }) async {
    return livePage;
  }

  @override
  Future<List<CategoryItem>> fetchFollowingCategories() {
    return _unsupportedFakeOperation(
      'CategoryRepository.fetchFollowingCategories',
    );
  }

  @override
  Future<CategoryVideoPage> fetchCategoryVideos({
    required String categoryType,
    required String categoryId,
    CategoryVideoCursor? cursor,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategoryVideos');
  }

  @override
  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.followCategory');
  }

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.unfollowCategory');
  }
}

class _FakeChannelRepository implements ChannelRepository {
  _FakeChannelRepository({
    ChannelMyInfo? myInfo,
    this.failUnfollow = false,
  }) : myInfo =
           myInfo ??
           const ChannelMyInfo(
             channelId: 'channel-a',
             cheatKey: false,
             naverMembership: false,
           );

  ChannelMyInfo myInfo;
  final bool failUnfollow;
  final getMyInfoCalls = <String>[];
  final followCalls = <String>[];
  final unfollowCalls = <String>[];

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getChannel');
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) async {
    getMyInfoCalls.add(channelId);
    return myInfo;
  }

  @override
  Future<ChannelVideoPage> getChannelVideos({
    required String channelId,
    VodSort? sortType,
    int? page,
    int? size,
    String? publishDateAt,
    String? videoType,
  }) {
    return _unsupportedFakeOperation('ChannelRepository.getChannelVideos');
  }

  @override
  Future<void> followChannel({required String channelId}) async {
    followCalls.add(channelId);

    myInfo = _myInfoWithFollowing(channelId: channelId, following: true);
  }

  @override
  Future<void> unfollowChannel({required String channelId}) async {
    unfollowCalls.add(channelId);
    if (failUnfollow) {
      throw StateError('unfollow failed');
    }

    myInfo = _myInfoWithFollowing(channelId: channelId, following: false);
  }

  @override
  Future<void> enableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      'ChannelRepository.enableChannelNotification',
    );
  }

  @override
  Future<void> disableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      'ChannelRepository.disableChannelNotification',
    );
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
  Future<GroupCollection> read() async {
    return collection;
  }

  @override
  Future<void> save(GroupCollection collection) async {
    this.collection = collection;
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
  Future<GroupActivationResult> activateGroup({required String groupId}) async {
    collection = collection.copyWith(activatedGroupId: groupId);
    return GroupActivationResult.activated;
  }

  @override
  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  }) {
    return _unsupportedFakeOperation('GroupRepository.removeMember');
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
}

LoadLivePlaybackPlaylistText _fakeLivePlaybackPlaylistTextLoader({
  Map<Uri, String> playlistTextByUri = const <Uri, String>{},
}) {
  return ({required Uri playlistUri}) async {
    final playlistText = playlistTextByUri[playlistUri];
    if (playlistText == null) {
      throw StateError('missing playlist text for $playlistUri');
    }

    return playlistText;
  };
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

ChannelMyInfo _myInfoWithFollowing({
  required String channelId,
  required bool following,
}) {
  return ChannelMyInfo(
    channelId: channelId,
    cheatKey: false,
    naverMembership: false,
    following: ChannelPersonalFollowing(
      following: following,
      notification: false,
    ),
  );
}

LiveDetail _liveDetail({
  String channelId = 'channel-a',
  int liveId = 1,
  String title = 'Live title',
  String status = 'OPEN',
  String? playbackUri,
  String? livePlaybackJson,
}) {
  return LiveDetail(
    liveId: liveId,
    title: title,
    status: status,
    concurrentUserCount: 10,
    adult: false,
    livePlaybackJson:
        livePlaybackJson ??
        '{"media":[{"mediaId":"HLS","path":"$playbackUri"}]}',
    channel: const LiveChannel(
      channelId: 'channel-a',
      channelName: 'Channel A',
      verifiedMark: false,
    ).copyWith(channelId: channelId),
  );
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
