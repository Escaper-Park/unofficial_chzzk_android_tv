import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/live_player_entry_flow.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  testWidgets('entry flow shows the shared blocked dialog', (tester) async {
    final liveRepository = _FakeLiveRepository(
      status: _status(membershipBenefitType: 'MEMBER_ONLY'),
    );
    const channelRepository = _FakeChannelRepository(
      myInfo: ChannelMyInfo(
        channelId: 'channel-a',
        cheatKey: false,
        naverMembership: false,
      ),
    );
    var allowed = false;
    Future<void>? entryFuture;

    await tester.pumpWidget(
      _Harness(
        liveRepository: liveRepository,
        channelRepository: channelRepository,
        onPressed: (context) {
          entryFuture = handleLivePlayerEntryFromCard(
            context,
            _live(),
            onAllowed: (_, _) {
              allowed = true;
            },
          );
        },
      ),
    );

    await tester.tap(find.text('open'));
    await _pumpEntryTransition(tester);

    expect(find.byType(TvDialog), findsOneWidget);
    expect(allowed, isFalse);

    await tester.tap(find.byType(FilledButton));
    await _pumpEntryTransition(tester);
    await entryFuture;

    expect(find.byType(TvDialog), findsNothing);
    expect(allowed, isFalse);
  });

  testWidgets('entry flow calls the allowed callback when checks pass', (
    tester,
  ) async {
    final liveRepository = _FakeLiveRepository(status: _status());
    const channelRepository = _FakeChannelRepository(
      myInfo: ChannelMyInfo(
        channelId: 'channel-a',
        cheatKey: false,
        naverMembership: false,
      ),
    );
    String? allowedChannelId;
    Future<void>? entryFuture;

    await tester.pumpWidget(
      _Harness(
        liveRepository: liveRepository,
        channelRepository: channelRepository,
        onPressed: (context) {
          entryFuture = handleLivePlayerEntryFromCard(
            context,
            _live(),
            onAllowed: (_, channelId) {
              allowedChannelId = channelId;
            },
          );
        },
      ),
    );

    await tester.tap(find.text('open'));
    await entryFuture;
    await tester.pump();

    expect(find.byType(TvDialog), findsNothing);
    expect(allowedChannelId, 'channel-a');
  });

  testWidgets('entry flow blocks closed live status', (tester) async {
    final liveRepository = _FakeLiveRepository(
      status: _status(status: 'CLOSED'),
    );
    const channelRepository = _FakeChannelRepository(
      myInfo: ChannelMyInfo(
        channelId: 'channel-a',
        cheatKey: true,
        naverMembership: true,
      ),
    );
    var allowed = false;
    Future<void>? entryFuture;

    await tester.pumpWidget(
      _Harness(
        liveRepository: liveRepository,
        channelRepository: channelRepository,
        onPressed: (context) {
          entryFuture = handleLivePlayerEntryFromCard(
            context,
            _live(),
            onAllowed: (_, _) {
              allowed = true;
            },
          );
        },
      ),
    );

    await tester.tap(find.text('open'));
    await _pumpEntryTransition(tester);

    expect(find.byType(TvDialog), findsOneWidget);
    expect(find.text('종료된 방송입니다.'), findsOneWidget);
    expect(allowed, isFalse);

    await tester.tap(find.byType(FilledButton));
    await _pumpEntryTransition(tester);
    await entryFuture;
  });

  testWidgets(
    'in-player live switching can bypass route pending entry guard',
    (tester) async {
      final liveRepository = _FakeLiveRepository(status: _status());
      const channelRepository = _FakeChannelRepository(
        myInfo: ChannelMyInfo(
          channelId: 'channel-a',
          cheatKey: false,
          naverMembership: false,
        ),
      );
      late BuildContext entryContext;

      await tester.pumpWidget(
        _Harness(
          liveRepository: liveRepository,
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
        handleLivePlayerEntryFromCard(
          entryContext,
          _live(),
          onAllowed: (_, _) {
            allowedCount += 1;
            return firstAllowed.future;
          },
        ),
      );
      await _pumpUntil(tester, () => allowedCount == 1);

      await handleLivePlayerEntryFromCard(
        entryContext,
        _live(),
        onAllowed: (_, _) {
          allowedCount += 1;
        },
      );
      expect(allowedCount, 1);

      await handleLivePlayerEntryFromCard(
        entryContext,
        _live(),
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

Future<void> _pumpEntryTransition(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 300));
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
    required this.liveRepository,
    required this.channelRepository,
    required this.onPressed,
  });

  final LiveRepository liveRepository;
  final ChannelRepository channelRepository;
  final ValueChanged<BuildContext> onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LiveRepository>.value(value: liveRepository),
          RepositoryProvider<ChannelRepository>.value(value: channelRepository),
        ],
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
    );
  }
}

class _FakeLiveRepository implements LiveRepository {
  const _FakeLiveRepository({
    required this.status,
  });

  final LiveStatus status;

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) {
    return _unsupportedFakeOperation('LiveRepository.getLiveDetail');
  }

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) {
    return _unsupportedFakeOperation('LiveRepository.getLives');
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) async {
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
  }) {
    return _unsupportedFakeOperation('LiveRepository.postLiveWatchEvent');
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

Live _live() {
  return const Live(
    liveId: 1,
    title: 'Live',
    concurrentUserCount: 100,
    adult: false,
    channel: LiveChannel(
      channelId: 'channel-a',
      channelName: 'Channel A',
      verifiedMark: false,
    ),
  );
}

LiveStatus _status({
  String status = 'OPEN',
  bool adult = false,
  String? blindType,
  String? membershipBenefitType,
  String? userAdultStatus,
}) {
  return LiveStatus(
    title: 'Live',
    status: status,
    concurrentUserCount: 100,
    adult: adult,
    blindType: blindType,
    membershipBenefitType: membershipBenefitType,
    userAdultStatus: userAdultStatus,
  );
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
