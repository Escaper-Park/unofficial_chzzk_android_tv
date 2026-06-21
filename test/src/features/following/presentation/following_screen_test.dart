import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';
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
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/bloc/following_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/following_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/following_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/repositories/vod_repository.dart';

void main() {
  testWidgets(
    'channel modal Watch Live uses shared blocked entry popup',
    (tester) async {
      tester.view.physicalSize = const Size(960, 540);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final authBloc = AuthSessionBloc(_FakeAuthSessionRepository());
      addTearDown(authBloc.close);
      await authBloc.restoreSessionFromCookies();

      final liveRepository = _FakeLiveRepository(
        status: _liveStatus(membershipBenefitType: 'MEMBER_ONLY'),
      );
      final channelRepository = _FakeChannelRepository(
        myInfo: const ChannelMyInfo(
          channelId: 'channel-1',
          cheatKey: false,
          naverMembership: false,
        ),
      );

      await tester.pumpWidget(
        _FollowingScreenHarness(
          authBloc: authBloc,
          followingRepository: const _FakeFollowingRepository(
            channelPage: FollowingChannelPage(
              items: [
                FollowingChannel(
                  channelId: 'channel-1',
                  channelName: 'Live Channel',
                  verifiedMark: false,
                  openLive: true,
                  liveInfo: FollowingLiveInfo(
                    liveId: 1,
                    title: 'Blocked Live',
                    concurrentUserCount: 10,
                    adult: false,
                  ),
                ),
              ],
            ),
          ),
          channelRepository: channelRepository,
          liveRepository: liveRepository,
        ),
      );
      await _pumpFollowingScreen(tester);

      await tester.tap(
        find.text(FollowingScreenString.tabLabel(FollowingTab.channel)),
      );
      await _pumpFollowingScreen(tester);

      await tester.tap(find.text('Live Channel').first);
      await _pumpFollowingScreen(tester);

      await tester.tap(find.text(FollowingScreenString.watchLive));
      await _pumpFollowingScreen(tester);

      expect(liveRepository.statusChannelIds, ['channel-1']);
      expect(channelRepository.myInfoChannelIds, ['channel-1']);
      expect(find.byType(TvDialog), findsOneWidget);
    },
  );
}

Future<void> _pumpFollowingScreen(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 250));
}

class _FollowingScreenHarness extends StatelessWidget {
  const _FollowingScreenHarness({
    required this.authBloc,
    required this.followingRepository,
    required this.channelRepository,
    required this.liveRepository,
  });

  final AuthSessionBloc authBloc;
  final FollowingRepository followingRepository;
  final ChannelRepository channelRepository;
  final LiveRepository liveRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorTokens.brandColor,
          brightness: Brightness.dark,
        ),
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<FollowingRepository>.value(
            value: followingRepository,
          ),
          RepositoryProvider<VodRepository>(
            create: (_) => _FakeVodRepository(),
          ),
          RepositoryProvider<CategoryRepository>(
            create: (_) => _FakeCategoryRepository(),
          ),
          RepositoryProvider<ChannelRepository>.value(
            value: channelRepository,
          ),
          RepositoryProvider<GroupRepository>(
            create: (_) => _FakeGroupRepository(),
          ),
          RepositoryProvider<LiveRepository>.value(value: liveRepository),
        ],
        child: BlocProvider<AuthSessionBloc>.value(
          value: authBloc,
          child: const Scaffold(body: FollowingScreen()),
        ),
      ),
    );
  }
}

final class _FakeAuthSessionRepository implements AuthSessionRepository {
  @override
  Future<NaverSessionCookie?> readRequiredSessionCookie() async {
    return const NaverSessionCookie(nidAut: 'aut', nidSes: 'ses');
  }

  @override
  Future<bool> clearAllCookies() async => true;
}

final class _FakeFollowingRepository implements FollowingRepository {
  const _FakeFollowingRepository({
    this.channelPage = const FollowingChannelPage(),
  });

  final FollowingChannelPage channelPage;

  @override
  Future<FollowingChannelPage> fetchFollowingChannels({
    int? page,
    int? size,
    FollowingChannelSort? sortType,
  }) async {
    return channelPage;
  }

  @override
  Future<FollowingLivePage> fetchFollowingLives({
    FollowingLiveSort? sortType,
  }) async {
    return const FollowingLivePage();
  }
}

final class _FakeChannelRepository implements ChannelRepository {
  _FakeChannelRepository({
    required this.myInfo,
  });

  final ChannelMyInfo myInfo;
  final myInfoChannelIds = <String>[];

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getChannel');
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) async {
    myInfoChannelIds.add(channelId);
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
  Future<void> followChannel({required String channelId}) async {}

  @override
  Future<void> unfollowChannel({required String channelId}) async {}

  @override
  Future<void> enableChannelNotification({required String channelId}) async {}

  @override
  Future<void> disableChannelNotification({required String channelId}) async {}
}

final class _FakeLiveRepository implements LiveRepository {
  _FakeLiveRepository({
    required this.status,
  });

  final LiveStatus status;
  final statusChannelIds = <String>[];

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
    statusChannelIds.add(channelId);
    return status;
  }

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) {
    return _unsupportedFakeOperation('LiveRepository.getLiveDetail');
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

final class _FakeVodRepository implements VodRepository {
  @override
  Future<VodPage> getVods({
    int? size,
    VodSort? sortType,
    VodCursor? cursor,
  }) async {
    return const VodPage();
  }

  @override
  Future<FollowingVodPage> getFollowingVods({
    int? size,
    FollowingVodCursor? cursor,
  }) async {
    return const FollowingVodPage();
  }

  @override
  Future<VodDetail> getVodDetail({required int videoNo}) {
    return _unsupportedFakeOperation('VodRepository.getVodDetail');
  }

  @override
  Future<VodPlayback> getPlayback({
    required String videoId,
    required String key,
  }) {
    return _unsupportedFakeOperation('VodRepository.getPlayback');
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
  }) async {}
}

final class _FakeCategoryRepository implements CategoryRepository {
  @override
  Future<CategoryPage> fetchCategories({CategoryPageCursor? cursor}) async {
    return const CategoryPage();
  }

  @override
  Future<List<CategoryItem>> fetchFollowingCategories() async {
    return const [];
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
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategoryLives');
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
  }) async {}

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) async {}
}

final class _FakeGroupRepository implements GroupRepository {
  @override
  Future<GroupCollection> read() async => const GroupCollection();

  @override
  Future<void> save(GroupCollection collection) async {}

  @override
  Future<GroupCreateResult> createGroup({required String groupName}) {
    return _unsupportedFakeOperation('GroupRepository.createGroup');
  }

  @override
  Future<GroupMutationResult> deleteGroup({required String groupId}) {
    return _unsupportedFakeOperation('GroupRepository.deleteGroup');
  }

  @override
  Future<GroupActivationResult> activateGroup({required String groupId}) {
    return _unsupportedFakeOperation('GroupRepository.activateGroup');
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
    return GroupAddMemberResult.added;
  }
}

LiveStatus _liveStatus({
  String? membershipBenefitType,
}) {
  return LiveStatus(
    title: 'Blocked Live',
    status: 'OPEN',
    concurrentUserCount: 10,
    adult: false,
    membershipBenefitType: membershipBenefitType,
  );
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
