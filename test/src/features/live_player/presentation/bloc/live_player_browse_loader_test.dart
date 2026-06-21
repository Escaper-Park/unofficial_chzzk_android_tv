import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_page.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/repositories/category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/repositories/following_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/bloc/live_player_bloc.dart';

void main() {
  test('loads popular lives and skips non-selectable lives', () async {
    const cursor = LiveCursor(liveId: 2);
    final liveRepository = _FakeLiveRepository(
      livePage: const LivePage(
        items: [
          Live(
            liveId: 1,
            title: 'Selectable',
            concurrentUserCount: 10,
            adult: false,
            channel: LiveChannel(
              channelId: 'channel-a',
              channelName: 'Channel A',
              verifiedMark: false,
            ),
          ),
          Live(
            liveId: 2,
            title: 'Missing channel',
            concurrentUserCount: 20,
            adult: false,
          ),
        ],
        cursor: cursor,
      ),
    );

    final result =
        await _loader(
          liveRepository: liveRepository,
        ).load(
          const LivePlayerBrowseRequest(
            section: LivePlayerBrowseSection.popular,
          ),
        );

    expect(result.items.map((live) => live.title), ['Selectable']);
    expect(result.liveCursor, cursor);
    expect(result.hasMore, isTrue);
    expect(liveRepository.getLivesCalls.single.size, 12);
  });

  test('maps following live channels and skips unavailable channels', () async {
    final followingRepository = _FakeFollowingRepository(
      livePage: const FollowingLivePage(
        items: [
          FollowingChannel(
            channelId: 'channel-a',
            channelName: 'Channel A',
            verifiedMark: true,
            openLive: true,
            liveInfo: FollowingLiveInfo(
              liveId: 10,
              title: null,
              concurrentUserCount: 100,
              adult: false,
            ),
          ),
          FollowingChannel(
            channelId: 'channel-b',
            channelName: 'Channel B',
            verifiedMark: false,
            openLive: false,
          ),
          FollowingChannel(
            channelId: 'channel-c',
            channelName: 'Channel C',
            verifiedMark: false,
            openLive: true,
            liveInfo: FollowingLiveInfo(
              concurrentUserCount: 1,
              adult: false,
            ),
          ),
        ],
      ),
    );

    final result =
        await _loader(
          followingRepository: followingRepository,
        ).load(
          const LivePlayerBrowseRequest(
            section: LivePlayerBrowseSection.following,
          ),
        );

    expect(result.items, hasLength(1));
    expect(result.items.single.title, 'Channel A');
    expect(result.items.single.channel?.channelId, 'channel-a');
    expect(result.items.single.channel?.verifiedMark, isTrue);
  });

  test('loads category lives from the requested category context', () async {
    const cursor = CategoryLiveCursor(liveId: 12);
    final categoryRepository = _FakeCategoryRepository(
      livePage: const CategoryLivePage(
        items: [
          CategoryLive(
            liveId: 12,
            title: 'Category live',
            concurrentUserCount: 30,
            channel: CategoryLiveChannel(
              channelId: 'channel-category',
              channelName: 'Category Channel',
            ),
          ),
          CategoryLive(
            liveId: 13,
            title: 'Missing channel',
            concurrentUserCount: 40,
          ),
        ],
        cursor: cursor,
      ),
    );

    final result =
        await _loader(
          categoryRepository: categoryRepository,
        ).load(
          const LivePlayerBrowseRequest(
            section: LivePlayerBrowseSection.category,
            categoryType: 'GAME',
            categoryId: 'game-1',
          ),
        );

    expect(result.items.map((live) => live.title), ['Category live']);
    expect(result.categoryCursor, cursor);
    expect(result.hasMore, isTrue);
    expect(
      categoryRepository.fetchCategoryLivesCalls.single.categoryType,
      'GAME',
    );
    expect(
      categoryRepository.fetchCategoryLivesCalls.single.categoryId,
      'game-1',
    );
  });

  test(
    'loads group member details and skips closed or unavailable members',
    () async {
      final liveRepository = _FakeLiveRepository(
        detailsByChannelId: {
          'channel-open': _liveDetail(channelId: 'channel-open', title: 'Open'),
          'channel-closed': _liveDetail(
            channelId: 'channel-closed',
            title: 'Closed',
            status: 'CLOSED',
          ),
        },
      );

      final result =
          await _loader(
            liveRepository: liveRepository,
          ).load(
            const LivePlayerBrowseRequest(
              section: LivePlayerBrowseSection.group,
              groupMemberChannelIds: [
                'channel-open',
                'channel-closed',
                'channel-missing',
              ],
            ),
          );

      expect(result.items.map((live) => live.title), ['Open']);
      expect(liveRepository.getLiveDetailCalls, [
        'channel-open',
        'channel-closed',
        'channel-missing',
      ]);
    },
  );

  test(
    'loads recent live details and only checks up to ten channels',
    () async {
      final channelIds = [
        for (var index = 1; index <= 12; index += 1) 'channel-$index',
      ];
      final liveRepository = _FakeLiveRepository(
        detailsByChannelId: {
          for (var index = 1; index <= 10; index += 1)
            'channel-$index': _liveDetail(
              channelId: 'channel-$index',
              title: 'Live $index',
              status: index == 2 ? 'CLOSED' : 'OPEN',
            ),
        }..remove('channel-3'),
      );

      final result =
          await _loader(
            liveRepository: liveRepository,
          ).load(
            LivePlayerBrowseRequest(
              section: LivePlayerBrowseSection.recent,
              recentLiveChannelIds: channelIds,
            ),
          );

      expect(
        liveRepository.getLiveDetailCalls,
        channelIds.take(10).toList(growable: false),
      );
      expect(
        result.items.map((live) => live.channel?.channelId),
        [
          'channel-1',
          for (var index = 4; index <= 10; index += 1) 'channel-$index',
        ],
      );
    },
  );
}

LivePlayerBrowseLoader _loader({
  _FakeLiveRepository? liveRepository,
  _FakeFollowingRepository? followingRepository,
  _FakeCategoryRepository? categoryRepository,
}) {
  return LivePlayerBrowseLoader(
    liveRepository: liveRepository ?? _FakeLiveRepository(),
    followingRepository: followingRepository ?? _FakeFollowingRepository(),
    categoryRepository: categoryRepository ?? _FakeCategoryRepository(),
  );
}

final class _FakeLiveRepository implements LiveRepository {
  _FakeLiveRepository({
    this.livePage = const LivePage(),
    this.detailsByChannelId = const {},
  });

  final LivePage livePage;
  final Map<String, LiveDetail> detailsByChannelId;
  final getLivesCalls = <({int? size, LiveCursor? cursor})>[];
  final getLiveDetailCalls = <String>[];

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) async {
    getLiveDetailCalls.add(channelId);
    final detail = detailsByChannelId[channelId];
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
    getLivesCalls.add((size: size, cursor: cursor));
    return livePage;
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) {
    return _unsupportedFakeOperation('LiveRepository.getLiveStatus');
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

final class _FakeFollowingRepository implements FollowingRepository {
  _FakeFollowingRepository({this.livePage = const FollowingLivePage()});

  final FollowingLivePage livePage;

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

final class _FakeCategoryRepository implements CategoryRepository {
  _FakeCategoryRepository({this.livePage = const CategoryLivePage()});

  final CategoryLivePage livePage;
  final fetchCategoryLivesCalls =
      <
        ({String categoryType, String categoryId, CategoryLiveCursor? cursor})
      >[];

  @override
  Future<CategoryPage> fetchCategories({CategoryPageCursor? cursor}) {
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
    fetchCategoryLivesCalls.add(
      (categoryType: categoryType, categoryId: categoryId, cursor: cursor),
    );
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

LiveDetail _liveDetail({
  required String channelId,
  required String title,
  String status = 'OPEN',
}) {
  return LiveDetail(
    liveId: 1,
    title: title,
    status: status,
    concurrentUserCount: 10,
    adult: false,
    channel: LiveChannel(
      channelId: channelId,
      channelName: channelId,
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
