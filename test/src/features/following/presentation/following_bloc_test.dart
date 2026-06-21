import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_page.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/repositories/category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/repositories/following_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/bloc/following_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/repositories/vod_repository.dart';

void main() {
  test('started signed out does not load tab data', () async {
    final followingRepository = _FakeFollowingRepository();
    final bloc = _createBloc(followingRepository: followingRepository)
      ..add(const FollowingEvent.started(isSignedIn: false));
    await pumpEventQueue();

    expect(bloc.state.isSignedIn, false);
    expect(bloc.state.live.status, FollowingLoadStatus.initial);
    expect(followingRepository.liveSortTypes, isEmpty);

    await bloc.close();
  });

  test('initial signed in state starts with Live loading', () async {
    final bloc = _createBloc(initialIsSignedIn: true);

    expect(bloc.state.isSignedIn, true);
    expect(bloc.state.selectedTab, FollowingTab.live);
    expect(bloc.state.live.status, FollowingLoadStatus.loading);

    await bloc.close();
  });

  test('started signed in emits loading as the first visible state', () async {
    final liveCompleter = Completer<FollowingLivePage>();
    final followingRepository = _FakeFollowingRepository(
      liveResult: liveCompleter.future,
    );
    final bloc = _createBloc(followingRepository: followingRepository);
    final states = <FollowingState>[];
    final subscription = bloc.stream.listen(states.add);

    bloc.add(const FollowingEvent.started(isSignedIn: true));
    await pumpEventQueue();

    expect(states, isNotEmpty);
    expect(states.first.isSignedIn, true);
    expect(states.first.live.status, FollowingLoadStatus.loading);
    expect(
      states.where(
        (state) =>
            state.isSignedIn &&
            state.live.status == FollowingLoadStatus.initial,
      ),
      isEmpty,
    );

    liveCompleter.complete(const FollowingLivePage());
    await pumpEventQueue();

    expect(bloc.state.live.status, FollowingLoadStatus.ready);

    await subscription.cancel();
    await bloc.close();
  });

  test('started signed in loads Live tab with POPULAR sort', () async {
    final followingRepository = _FakeFollowingRepository(
      livePage: FollowingLivePage(items: [_liveChannel('live')]),
    );
    final bloc = _createBloc(followingRepository: followingRepository)
      ..add(const FollowingEvent.started(isSignedIn: true));
    await pumpEventQueue();

    expect(bloc.state.isSignedIn, true);
    expect(bloc.state.live.status, FollowingLoadStatus.ready);
    expect(bloc.state.live.items.single.title, 'Live title live');
    expect(followingRepository.liveSortTypes, [FollowingLiveSort.popular]);

    await bloc.close();
  });

  test('tab selection reloads data instead of using cached tab data', () async {
    final followingRepository = _FakeFollowingRepository(
      livePage: FollowingLivePage(items: [_liveChannel('live')]),
    );
    final bloc = _createBloc(followingRepository: followingRepository)
      ..add(const FollowingEvent.started(isSignedIn: true));
    await pumpEventQueue();
    bloc.add(const FollowingEvent.tabSelected(FollowingTab.live));
    await pumpEventQueue();

    expect(followingRepository.liveSortTypes, [
      FollowingLiveSort.popular,
      FollowingLiveSort.popular,
    ]);

    await bloc.close();
  });

  test('live sort reloads with approved sort type', () async {
    final followingRepository = _FakeFollowingRepository(
      livePage: FollowingLivePage(items: [_liveChannel('live')]),
    );
    final bloc = _createBloc(followingRepository: followingRepository)
      ..add(const FollowingEvent.started(isSignedIn: true));
    await pumpEventQueue();
    bloc.add(
      const FollowingEvent.liveSortSelected(FollowingLiveSortOption.latest),
    );
    await pumpEventQueue();

    expect(followingRepository.liveSortTypes, [
      FollowingLiveSort.popular,
      FollowingLiveSort.latest,
    ]);
    expect(bloc.state.liveSortOption, FollowingLiveSortOption.latest);

    await bloc.close();
  });

  test('ignores stale live completion after tab changes', () async {
    final liveCompleter = Completer<FollowingLivePage>();
    final followingRepository = _FakeFollowingRepository(
      liveResult: liveCompleter.future,
      channelPage: FollowingChannelPage(
        items: [_channel('channel', openLive: false, viewerCount: 0)],
      ),
    );
    final bloc = _createBloc(followingRepository: followingRepository)
      ..add(const FollowingEvent.started(isSignedIn: true));
    await pumpEventQueue();

    bloc.add(const FollowingEvent.tabSelected(FollowingTab.channel));
    await pumpEventQueue();

    expect(bloc.state.selectedTab, FollowingTab.channel);
    expect(bloc.state.channel.status, FollowingLoadStatus.ready);
    expect(bloc.state.channel.items.single.channelId, 'channel');

    liveCompleter.complete(FollowingLivePage(items: [_liveChannel('late')]));
    await pumpEventQueue();

    expect(bloc.state.selectedTab, FollowingTab.channel);
    expect(bloc.state.channel.items.single.channelId, 'channel');
    expect(bloc.state.live.items, isEmpty);
  });

  test('channel tab sorts live channels first then viewer count', () async {
    final followingRepository = _FakeFollowingRepository(
      channelPage: FollowingChannelPage(
        items: [
          _channel('offline-high', openLive: false, viewerCount: 999),
          _channel('live-low', openLive: true, viewerCount: 10),
          _channel('live-high', openLive: true, viewerCount: 100),
        ],
      ),
    );
    final bloc = _createBloc(followingRepository: followingRepository)
      ..add(const FollowingEvent.started(isSignedIn: true));
    await pumpEventQueue();
    bloc.add(const FollowingEvent.tabSelected(FollowingTab.channel));
    await pumpEventQueue();

    expect(
      [for (final item in bloc.state.channel.items) item.channelId],
      ['live-high', 'live-low', 'offline-high'],
    );

    await bloc.close();
  });

  test('unfollow keeps channel and emits success feedback', () async {
    final channelRepository = _FakeChannelRepository();
    final followingRepository = _FakeFollowingRepository(
      channelPage: FollowingChannelPage(
        items: [_channel('target', openLive: true, viewerCount: 10)],
      ),
    );
    final bloc = _createBloc(
      followingRepository: followingRepository,
      channelRepository: channelRepository,
    )..add(const FollowingEvent.started(isSignedIn: true));
    await pumpEventQueue();
    bloc.add(const FollowingEvent.tabSelected(FollowingTab.channel));
    await pumpEventQueue();
    bloc.add(
      FollowingEvent.channelUnfollowRequested(bloc.state.channel.items.single),
    );
    await pumpEventQueue();

    expect(channelRepository.unfollowedChannelIds, ['target']);
    expect(bloc.state.channel.items.single.channelId, 'target');
    expect(bloc.state.channel.items.single.personalData?.following, false);
    expect(bloc.state.feedbackType, FollowingFeedbackType.unfollowSuccess);

    await bloc.close();
  });

  test('unfollow closes active modal before request completes', () async {
    final unfollowCompleter = Completer<void>();
    final channelRepository = _FakeChannelRepository(
      unfollowResult: unfollowCompleter.future,
    );
    final followingRepository = _FakeFollowingRepository(
      channelPage: FollowingChannelPage(
        items: [_channel('target', openLive: true, viewerCount: 10)],
      ),
    );
    final bloc = _createBloc(
      followingRepository: followingRepository,
      channelRepository: channelRepository,
    )..add(const FollowingEvent.started(isSignedIn: true));
    await pumpEventQueue();
    bloc.add(const FollowingEvent.tabSelected(FollowingTab.channel));
    await pumpEventQueue();
    final channel = bloc.state.channel.items.single;
    bloc.add(FollowingEvent.channelModalOpened(channel: channel, index: 0));
    await pumpEventQueue();

    bloc.add(FollowingEvent.channelUnfollowRequested(channel));
    await pumpEventQueue();

    expect(bloc.state.activeChannelModal, isNull);
    expect(bloc.state.channel.items.single.personalData?.following, true);
    expect(channelRepository.unfollowedChannelIds, ['target']);

    unfollowCompleter.complete();
    await pumpEventQueue();

    expect(bloc.state.channel.items.single.personalData?.following, false);
    expect(bloc.state.feedbackType, FollowingFeedbackType.unfollowSuccess);

    await bloc.close();
  });

  test(
    'follow marks kept channel as following and emits success feedback',
    () async {
      final channelRepository = _FakeChannelRepository();
      final followingRepository = _FakeFollowingRepository(
        channelPage: FollowingChannelPage(
          items: [
            _channel(
              'target',
              openLive: false,
              viewerCount: 0,
              following: false,
            ),
          ],
        ),
      );
      final bloc = _createBloc(
        followingRepository: followingRepository,
        channelRepository: channelRepository,
      )..add(const FollowingEvent.started(isSignedIn: true));
      await pumpEventQueue();
      bloc.add(const FollowingEvent.tabSelected(FollowingTab.channel));
      await pumpEventQueue();
      bloc.add(
        FollowingEvent.channelFollowRequested(bloc.state.channel.items.single),
      );
      await pumpEventQueue();

      expect(channelRepository.followedChannelIds, ['target']);
      expect(bloc.state.channel.items.single.channelId, 'target');
      expect(bloc.state.channel.items.single.personalData?.following, true);
      expect(bloc.state.feedbackType, FollowingFeedbackType.followSuccess);

      await bloc.close();
    },
  );

  test('group list request keeps modal open and loads groups', () async {
    const channel = FollowingChannel(
      channelId: 'target',
      channelName: 'Target',
      verifiedMark: false,
      openLive: false,
    );
    final groupRepository = _FakeGroupRepository(
      collection: const GroupCollection(
        groups: [
          GroupItem(id: 'group-a', groupName: 'Group A'),
          GroupItem(id: 'group-b', groupName: 'Group B'),
        ],
      ),
    );
    final bloc = _createBloc(groupRepository: groupRepository)
      ..add(const FollowingEvent.channelModalOpened(channel: channel, index: 0))
      ..add(const FollowingEvent.channelGroupListRequested(channel));
    await pumpEventQueue();

    final modal = bloc.state.activeChannelModal;
    expect(groupRepository.addMemberCalls, isEmpty);
    expect(modal?.view, FollowingChannelModalView.groupList);
    expect(
      [for (final group in modal!.groups) group.id],
      [
        'group-a',
        'group-b',
      ],
    );

    await bloc.close();
  });

  test('add to group uses selected group and emits success feedback', () async {
    const channel = FollowingChannel(
      channelId: 'target',
      channelName: 'Target',
      verifiedMark: false,
      openLive: false,
    );
    final groupRepository = _FakeGroupRepository();
    const group = GroupItem(id: 'selected', groupName: 'Selected');
    final bloc = _createBloc(groupRepository: groupRepository)
      ..add(const FollowingEvent.channelModalOpened(channel: channel, index: 0))
      ..add(
        const FollowingEvent.channelAddToGroupRequested(
          channel: channel,
          group: group,
        ),
      );
    await pumpEventQueue();

    expect(groupRepository.addMemberCalls, [
      (groupId: 'selected', channelId: 'target'),
    ]);
    expect(bloc.state.activeChannelModal, isNull);
    expect(bloc.state.feedbackType, FollowingFeedbackType.addToGroupSuccess);

    await bloc.close();
  });
}

FollowingBloc _createBloc({
  _FakeFollowingRepository? followingRepository,
  _FakeVodRepository? vodRepository,
  _FakeCategoryRepository? categoryRepository,
  _FakeChannelRepository? channelRepository,
  _FakeGroupRepository? groupRepository,
  bool initialIsSignedIn = false,
}) {
  return FollowingBloc(
    followingRepository: followingRepository ?? _FakeFollowingRepository(),
    vodRepository: vodRepository ?? _FakeVodRepository(),
    categoryRepository: categoryRepository ?? _FakeCategoryRepository(),
    channelRepository: channelRepository ?? _FakeChannelRepository(),
    groupRepository: groupRepository ?? _FakeGroupRepository(),
    initialIsSignedIn: initialIsSignedIn,
  );
}

FollowingChannel _liveChannel(String id) {
  return _channel(id, openLive: true, viewerCount: 42).copyWith(
    liveInfo: FollowingLiveInfo(
      liveId: id.hashCode,
      title: 'Live title $id',
      concurrentUserCount: 42,
      adult: false,
    ),
  );
}

FollowingChannel _channel(
  String id, {
  required bool openLive,
  required int viewerCount,
  bool following = true,
}) {
  return FollowingChannel(
    channelId: id,
    channelName: 'Channel $id',
    verifiedMark: false,
    openLive: openLive,
    liveInfo: openLive
        ? FollowingLiveInfo(
            liveId: id.hashCode,
            title: 'Live title $id',
            concurrentUserCount: viewerCount,
            adult: false,
          )
        : null,
    personalData: FollowingPersonalData(
      following: following,
      notification: false,
      privateUserBlock: false,
    ),
  );
}

final class _FakeFollowingRepository implements FollowingRepository {
  _FakeFollowingRepository({
    this.channelPage = const FollowingChannelPage(),
    this.livePage = const FollowingLivePage(),
    this.liveResult,
  });

  final FollowingChannelPage channelPage;
  final FollowingLivePage livePage;
  final Future<FollowingLivePage>? liveResult;
  final liveSortTypes = <FollowingLiveSort?>[];

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
    liveSortTypes.add(sortType);
    final result = liveResult;
    if (result != null) {
      return result;
    }

    return livePage;
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

final class _FakeChannelRepository implements ChannelRepository {
  _FakeChannelRepository({
    this._unfollowResult,
  });

  final Future<void>? _unfollowResult;
  final followedChannelIds = <String>[];
  final unfollowedChannelIds = <String>[];

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getChannel');
  }

  @override
  Future<Never> getMyInfo({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getMyInfo');
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
    followedChannelIds.add(channelId);
  }

  @override
  Future<void> unfollowChannel({required String channelId}) async {
    unfollowedChannelIds.add(channelId);
    final result = _unfollowResult;
    if (result != null) {
      await result;
    }
  }

  @override
  Future<void> enableChannelNotification({required String channelId}) async {}

  @override
  Future<void> disableChannelNotification({required String channelId}) async {}
}

final class _FakeGroupRepository implements GroupRepository {
  _FakeGroupRepository({
    this.collection = const GroupCollection(),
  });

  final GroupCollection collection;
  final addMemberCalls = <({String groupId, String channelId})>[];

  @override
  Future<GroupCollection> read() async {
    return collection;
  }

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
    addMemberCalls.add((groupId: groupId, channelId: channelId));
    return GroupAddMemberResult.added;
  }
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
