import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/repositories/vod_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/presentation/vod_player_entry_flow.dart';

void main() {
  testWidgets(
    'in-player vod switching can bypass route pending entry guard',
    (tester) async {
      final authBloc = AuthSessionBloc(const _FakeAuthSessionRepository());
      final vodRepository = _FakeVodRepository(detail: _vodDetail());
      const channelRepository = _FakeChannelRepository(
        myInfo: ChannelMyInfo(
          channelId: 'channel-a',
          cheatKey: false,
          naverMembership: false,
        ),
      );
      late BuildContext entryContext;

      addTearDown(authBloc.close);

      await tester.pumpWidget(
        _Harness(
          authBloc: authBloc,
          vodRepository: vodRepository,
          channelRepository: channelRepository,
          onPressed: (context) {
            entryContext = context;
          },
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pump();

      final firstAllowed = Completer<void>();
      var allowedCount = 0;

      unawaited(
        handleVodPlayerEntryFromCard(
          entryContext,
          _vod(),
          onAllowed: (_, _) {
            allowedCount += 1;
            return firstAllowed.future;
          },
        ),
      );
      await _pumpUntil(tester, () => allowedCount == 1);

      await handleVodPlayerEntryFromCard(
        entryContext,
        _vod(),
        onAllowed: (_, _) {
          allowedCount += 1;
        },
      );
      expect(allowedCount, 1);

      await handleVodPlayerEntryFromCard(
        entryContext,
        _vod(),
        usePendingEntryGuard: false,
        onAllowed: (_, _) {
          allowedCount += 1;
        },
      );
      expect(allowedCount, 2);

      firstAllowed.complete();
      await tester.pump();
    },
  );
}

Future<void> _pumpUntil(
  WidgetTester tester,
  bool Function() condition,
) async {
  for (var attempts = 0; attempts < 20; attempts += 1) {
    await tester.pump();
    if (condition()) {
      return;
    }
  }

  fail('Expected condition to become true.');
}

class _Harness extends StatelessWidget {
  const _Harness({
    required this.authBloc,
    required this.vodRepository,
    required this.channelRepository,
    required this.onPressed,
  });

  final AuthSessionBloc authBloc;
  final VodRepository vodRepository;
  final ChannelRepository channelRepository;
  final ValueChanged<BuildContext> onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<VodRepository>.value(value: vodRepository),
          RepositoryProvider<ChannelRepository>.value(value: channelRepository),
        ],
        child: BlocProvider<AuthSessionBloc>.value(
          value: authBloc,
          child: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: TextButton(
                    onPressed: () => onPressed(context),
                    child: const Text('open'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FakeAuthSessionRepository implements AuthSessionRepository {
  const _FakeAuthSessionRepository();

  @override
  Future<bool> clearAllCookies() async {
    return true;
  }

  @override
  Future<NaverSessionCookie?> readRequiredSessionCookie() async {
    return null;
  }
}

class _FakeVodRepository implements VodRepository {
  const _FakeVodRepository({
    required this.detail,
  });

  final VodDetail detail;

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
  }) {
    return _unsupportedFakeOperation('VodRepository.getPlayback');
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
  }) {
    return _unsupportedFakeOperation('VodRepository.postVideoWatchEvent');
  }
}

class _FakeChannelRepository implements ChannelRepository {
  const _FakeChannelRepository({
    required this.myInfo,
  });

  final ChannelMyInfo myInfo;

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
  Future<void> followChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.followChannel');
  }

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getChannel');
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) async {
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
  Future<void> unfollowChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.unfollowChannel');
  }
}

Vod _vod() {
  return const Vod(
    videoNo: 1,
    videoId: 'video-a',
    title: 'VOD title',
    videoType: 'REPLAY',
    publishDate: '2026-06-15 20:00:00',
    duration: 600,
    readCount: 1,
    publishDateAt: 1,
    adult: false,
    livePv: 0,
    channel: VodChannel(
      channelId: 'channel-a',
      channelName: 'Channel A',
      verifiedMark: false,
    ),
  );
}

VodDetail _vodDetail() {
  return const VodDetail(
    videoNo: 1,
    videoId: 'video-a',
    title: 'VOD title',
    videoType: 'REPLAY',
    publishDate: '2026-06-15 20:00:00',
    duration: 600,
    readCount: 1,
    publishDateAt: 1,
    adult: false,
    livePv: 0,
    chapterActive: false,
    videoChatEnabled: true,
    videoChatChannelId: 'chat-vod',
    channel: VodChannel(
      channelId: 'channel-a',
      channelName: 'Channel A',
      verifiedMark: false,
    ),
  );
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
