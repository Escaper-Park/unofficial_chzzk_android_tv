import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/bloc/channel_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  test('started loads profile, live detail, and latest 10 VODs', () async {
    final channelRepository = _FakeChannelRepository(
      detail: _channelDetail(openLive: true),
      pages: [
        ChannelVideoPage(items: [_channelVideo(1)]),
      ],
    );
    final liveRepository = _FakeLiveRepository(
      detail: _liveDetail(11),
    );
    final bloc = _createBloc(
      channelRepository: channelRepository,
      liveRepository: liveRepository,
    )..add(const ChannelEvent.started());
    await pumpEventQueue();

    expect(bloc.state.profileStatus, ChannelLoadStatus.ready);
    expect(bloc.state.homeStatus, ChannelLoadStatus.ready);
    expect(bloc.state.live?.liveId, 11);
    expect(bloc.state.latestVods.single.title, 'Video 1');
    expect(bloc.state.latestVods.single.channel?.channelName, 'Streamer');
    expect(channelRepository.videoCalls.single.sortType, VodSort.latest);
    expect(channelRepository.videoCalls.single.size, 10);
    expect(liveRepository.detailCalls.single, 'channel');

    await bloc.close();
  });

  test('VOD tab loads with selected LATEST and POPULAR sort options', () async {
    final channelRepository = _FakeChannelRepository(
      pages: [
        const ChannelVideoPage(),
        ChannelVideoPage(items: [_channelVideo(1)]),
        ChannelVideoPage(items: [_channelVideo(2)]),
      ],
    );
    final bloc = _createBloc(channelRepository: channelRepository)
      ..add(const ChannelEvent.started());
    await pumpEventQueue();

    bloc.add(const ChannelEvent.tabSelected(ChannelTab.vod));
    await pumpEventQueue();

    bloc.add(
      const ChannelEvent.vodSortSelected(ChannelVodSortOption.popular),
    );
    await pumpEventQueue();

    expect(bloc.state.selectedTab, ChannelTab.vod);
    expect(bloc.state.vodSortOption, ChannelVodSortOption.popular);
    expect(
      [for (final call in channelRepository.videoCalls) call.sortType],
      [VodSort.latest, VodSort.latest, VodSort.popular],
    );
    expect(channelRepository.videoCalls[1].size, 18);
    expect(channelRepository.videoCalls[2].size, 18);

    await bloc.close();
  });

  test(
    'load more appends VODs and emits no-more feedback at the end',
    () async {
      final channelRepository = _FakeChannelRepository(
        pages: [
          const ChannelVideoPage(),
          ChannelVideoPage(
            items: [_channelVideo(1)],
            page: 0,
            totalPages: 2,
          ),
          ChannelVideoPage(
            items: [_channelVideo(2)],
            page: 1,
            totalPages: 2,
          ),
        ],
      );
      final bloc = _createBloc(channelRepository: channelRepository)
        ..add(const ChannelEvent.started());
      await pumpEventQueue();

      bloc.add(const ChannelEvent.tabSelected(ChannelTab.vod));
      await pumpEventQueue();

      bloc.add(const ChannelEvent.loadMoreRequested());
      await pumpEventQueue();

      expect(
        [for (final item in bloc.state.vod.items) item.title],
        ['Video 1', 'Video 2'],
      );
      expect(channelRepository.videoCalls.last.page, 1);
      expect(
        bloc.state.vod.paginationStatus,
        ChannelPaginationStatus.exhausted,
      );
      expect(bloc.state.feedbackType, ChannelFeedbackType.noMoreData);

      await bloc.close();
    },
  );

  test('follow and group add actions emit feedback', () async {
    const group = GroupItem(id: 'group', groupName: 'Group');
    final channelRepository = _FakeChannelRepository(
      detail: _channelDetail(following: false),
      myInfo: _channelMyInfo(following: false),
    );
    final groupRepository = _FakeGroupRepository(
      collection: const GroupCollection(groups: [group]),
    );
    final bloc = _createBloc(
      channelRepository: channelRepository,
      groupRepository: groupRepository,
      initialIsSignedIn: true,
    )..add(const ChannelEvent.started());
    await pumpEventQueue();

    bloc.add(const ChannelEvent.followRequested());
    await pumpEventQueue();

    bloc.add(const ChannelEvent.groupPanelRequested());
    await pumpEventQueue();

    bloc.add(const ChannelEvent.groupAddRequested(group));
    await pumpEventQueue();

    expect(bloc.state.isFollowing, true);
    expect(channelRepository.followCalls, ['channel']);
    expect(channelRepository.myInfoCalls, ['channel', 'channel']);
    expect(groupRepository.addCalls.single.channelId, 'channel');
    expect(bloc.state.feedbackType, ChannelFeedbackType.addToGroupSuccess);

    await bloc.close();
  });

  test('signed-out state does not expose personal following state', () async {
    final channelRepository = _FakeChannelRepository(
      detail: _channelDetail(following: true),
      myInfo: _channelMyInfo(following: true),
    );
    final bloc = _createBloc(channelRepository: channelRepository)
      ..add(const ChannelEvent.started());
    await pumpEventQueue();

    expect(bloc.state.isFollowing, false);
    expect(channelRepository.myInfoCalls, isEmpty);

    await bloc.close();
  });

  test('signed-in state uses my-info following state', () async {
    final channelRepository = _FakeChannelRepository(
      detail: _channelDetail(following: false),
      myInfo: _channelMyInfo(following: true),
    );
    final bloc = _createBloc(
      channelRepository: channelRepository,
      initialIsSignedIn: true,
    )..add(const ChannelEvent.started());
    await pumpEventQueue();

    expect(bloc.state.isFollowing, true);
    expect(channelRepository.myInfoCalls, ['channel']);

    await bloc.close();
  });
}

ChannelBloc _createBloc({
  _FakeChannelRepository? channelRepository,
  _FakeLiveRepository? liveRepository,
  _FakeGroupRepository? groupRepository,
  bool initialIsSignedIn = false,
}) {
  return ChannelBloc(
    channelId: 'channel',
    channelRepository: channelRepository ?? _FakeChannelRepository(),
    liveRepository: liveRepository ?? _FakeLiveRepository(),
    groupRepository: groupRepository ?? _FakeGroupRepository(),
    initialIsSignedIn: initialIsSignedIn,
  );
}

ChannelDetail _channelDetail({
  bool openLive = false,
  bool following = true,
}) {
  return ChannelDetail(
    channelId: 'channel',
    channelName: 'Streamer',
    verifiedMark: true,
    followerCount: 12000,
    description: 'Hello',
    openLive: openLive,
    personalData: ChannelPersonalData(
      following: ChannelPersonalFollowing(
        following: following,
        notification: false,
      ),
      privateUserBlock: false,
    ),
  );
}

ChannelMyInfo _channelMyInfo({
  required bool following,
  bool notification = false,
}) {
  return ChannelMyInfo(
    channelId: 'channel',
    following: ChannelPersonalFollowing(
      following: following,
      notification: notification,
    ),
    cheatKey: false,
    naverMembership: false,
  );
}

ChannelVideo _channelVideo(int id) {
  return ChannelVideo(
    videoNo: id,
    title: 'Video $id',
    videoType: 'REPLAY',
    publishDate: '2026-06-13',
    duration: 60,
    readCount: id,
    publishDateAt: id,
    adult: false,
    livePv: 0,
  );
}

LiveDetail _liveDetail(int id) {
  return LiveDetail(
    liveId: id,
    title: 'Live $id',
    status: 'OPEN',
    concurrentUserCount: 10,
    adult: false,
  );
}

final class _FakeChannelRepository implements ChannelRepository {
  _FakeChannelRepository({
    ChannelDetail? detail,
    ChannelMyInfo? myInfo,
    this.pages = const [ChannelVideoPage()],
  }) : detail = detail ?? _channelDetail(),
       myInfo = myInfo ?? _channelMyInfo(following: false);

  final ChannelDetail detail;
  ChannelMyInfo myInfo;
  final List<ChannelVideoPage> pages;
  final videoCalls = <_ChannelVideoCall>[];
  final myInfoCalls = <String>[];
  final followCalls = <String>[];
  final unfollowCalls = <String>[];
  int _pageIndex = 0;

  @override
  Future<ChannelDetail> getChannel({required String channelId}) async {
    return detail;
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) async {
    myInfoCalls.add(channelId);
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
  }) async {
    videoCalls.add(
      _ChannelVideoCall(sortType: sortType, page: page, size: size),
    );
    return pages[_pageIndex++ % pages.length];
  }

  @override
  Future<void> followChannel({required String channelId}) async {
    followCalls.add(channelId);
    myInfo = _channelMyInfo(following: true);
  }

  @override
  Future<void> unfollowChannel({required String channelId}) async {
    unfollowCalls.add(channelId);
    myInfo = _channelMyInfo(following: false);
  }

  @override
  Future<void> enableChannelNotification({required String channelId}) async {}

  @override
  Future<void> disableChannelNotification({required String channelId}) async {}
}

final class _FakeLiveRepository implements LiveRepository {
  _FakeLiveRepository({
    LiveDetail? detail,
  }) : detail = detail ?? _liveDetail(1);

  final LiveDetail detail;
  final detailCalls = <String>[];

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) async {
    detailCalls.add(channelId);
    return detail;
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
  }) async {}
}

final class _FakeGroupRepository implements GroupRepository {
  _FakeGroupRepository({
    this.collection = const GroupCollection(),
  });

  final GroupCollection collection;
  final addCalls = <_GroupAddCall>[];

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
    addCalls.add(_GroupAddCall(groupId: groupId, channelId: channelId));
    return GroupAddMemberResult.added;
  }
}

final class _ChannelVideoCall {
  const _ChannelVideoCall({
    required this.sortType,
    required this.page,
    required this.size,
  });

  final VodSort? sortType;
  final int? page;
  final int? size;
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}

final class _GroupAddCall {
  const _GroupAddCall({
    required this.groupId,
    required this.channelId,
  });

  final String groupId;
  final String channelId;
}
