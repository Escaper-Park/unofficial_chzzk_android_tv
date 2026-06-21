import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/presentation/bloc/group_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/presentation/models/group_screen_models.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  test('loads groups and resolves selected group members', () async {
    final bloc = GroupBloc(
      groupRepository: _MemoryGroupRepository(
        collection: const GroupCollection(
          groups: [
            GroupItem(
              id: 'group-1',
              groupName: 'Group',
              memberChannelIds: ['channel-1'],
            ),
          ],
          activatedGroupId: 'group-1',
        ),
      ),
      channelRepository: const _FakeChannelRepository(
        channels: {
          'channel-1': ChannelDetail(
            channelId: 'channel-1',
            channelName: 'Channel',
            verifiedMark: true,
            followerCount: 0,
            description: '',
            openLive: true,
          ),
        },
      ),
    );
    addTearDown(bloc.close);

    bloc.add(const GroupEvent.started());

    await expectLater(
      bloc.stream,
      emitsThrough(
        isA<GroupState>()
            .having(
              (state) => state.loadStatus,
              'loadStatus',
              GroupLoadStatus.ready,
            )
            .having((state) => state.groups, 'groups', hasLength(1))
            .having(
              (state) => state.selectedGroupMembers.single.channelName,
              'member channelName',
              'Channel',
            )
            .having(
              (state) => state.selectedGroupMembers.single.openLive,
              'member openLive',
              true,
            ),
      ),
    );
  });

  test('creates group through repository and returns to group tab', () async {
    final bloc = GroupBloc(
      groupRepository: _MemoryGroupRepository(),
      channelRepository: const _FakeChannelRepository(),
    );
    addTearDown(bloc.close);

    bloc
      ..add(const GroupEvent.tabSelected(GroupTab.create))
      ..add(const GroupEvent.createInputChanged('New Group'))
      ..add(const GroupEvent.createSubmitted('New Group'));

    await expectLater(
      bloc.stream,
      emitsThrough(
        isA<GroupState>()
            .having((state) => state.selectedTab, 'selectedTab', GroupTab.group)
            .having(
              (state) => state.groups.single.groupName,
              'groupName',
              'New Group',
            )
            .having(
              (state) => state.feedbackType,
              'feedbackType',
              GroupFeedbackType.createSuccess,
            ),
      ),
    );
  });

  test('ignores stale member load after selecting another group', () async {
    final slowMember = Completer<ChannelDetail>();
    final bloc = GroupBloc(
      groupRepository: _MemoryGroupRepository(
        collection: const GroupCollection(
          groups: [
            GroupItem(id: 'group-a', groupName: 'Group A'),
            GroupItem(
              id: 'group-b',
              groupName: 'Group B',
              memberChannelIds: ['channel-b'],
            ),
            GroupItem(
              id: 'group-c',
              groupName: 'Group C',
              memberChannelIds: ['channel-c'],
            ),
          ],
        ),
      ),
      channelRepository: _FakeChannelRepository(
        channels: const {
          'channel-c': ChannelDetail(
            channelId: 'channel-c',
            channelName: 'Channel C',
            verifiedMark: false,
            followerCount: 0,
            description: '',
            openLive: false,
          ),
        },
        pendingChannels: {'channel-b': slowMember.future},
      ),
    );
    addTearDown(bloc.close);

    bloc.add(const GroupEvent.started());
    await bloc.stream.firstWhere(
      (state) => state.loadStatus == GroupLoadStatus.ready,
    );

    bloc.add(const GroupEvent.groupSelected('group-b'));
    await pumpEventQueue();
    bloc.add(const GroupEvent.groupSelected('group-c'));
    await pumpEventQueue();

    expect(bloc.state.selectedGroupId, 'group-c');
    expect(bloc.state.selectedGroupMembers.single.channelId, 'channel-c');

    slowMember.complete(
      const ChannelDetail(
        channelId: 'channel-b',
        channelName: 'Channel B',
        verifiedMark: false,
        followerCount: 0,
        description: '',
        openLive: false,
      ),
    );
    await pumpEventQueue();

    expect(bloc.state.selectedGroupId, 'group-c');
    expect(bloc.state.selectedGroupMembers.single.channelId, 'channel-c');
  });
}

final class _MemoryGroupRepository implements GroupRepository {
  _MemoryGroupRepository({
    this.collection = defaultGroupCollection,
  });

  GroupCollection collection;

  @override
  Future<GroupCollection> read() async => collection;

  @override
  Future<void> save(GroupCollection collection) async {
    this.collection = collection;
  }

  @override
  Future<GroupCreateResult> createGroup({required String groupName}) async {
    final name = groupName.trim();
    if (name.isEmpty) {
      return GroupCreateResult.emptyName;
    }
    for (final group in collection.groups) {
      if (group.groupName == name) {
        return GroupCreateResult.duplicateName;
      }
    }

    collection = collection.copyWith(
      groups: [
        ...collection.groups,
        GroupItem(id: 'group-${collection.groups.length + 1}', groupName: name),
      ],
    );
    return GroupCreateResult.success;
  }

  @override
  Future<GroupMutationResult> deleteGroup({required String groupId}) async {
    collection = collection.copyWith(
      groups: [
        for (final group in collection.groups)
          if (group.id != groupId) group,
      ],
    );
    return GroupMutationResult.success;
  }

  @override
  Future<GroupActivationResult> activateGroup({
    required String groupId,
  }) async {
    collection = collection.copyWith(activatedGroupId: groupId);
    return GroupActivationResult.activated;
  }

  @override
  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  }) async {
    return GroupMutationResult.success;
  }

  @override
  Future<GroupAddMemberResult> addMember({
    required String groupId,
    required String channelId,
  }) async {
    return GroupAddMemberResult.added;
  }
}

final class _FakeChannelRepository implements ChannelRepository {
  const _FakeChannelRepository({
    this.channels = const {},
    this.pendingChannels = const {},
  });

  final Map<String, ChannelDetail> channels;
  final Map<String, Future<ChannelDetail>> pendingChannels;

  @override
  Future<ChannelDetail> getChannel({required String channelId}) async {
    final pending = pendingChannels[channelId];
    if (pending != null) {
      return pending;
    }

    final channel = channels[channelId];
    if (channel == null) {
      throw StateError('Missing channel $channelId');
    }

    return channel;
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
  Future<void> followChannel({required String channelId}) async {}

  @override
  Future<void> unfollowChannel({required String channelId}) async {}

  @override
  Future<void> enableChannelNotification({required String channelId}) async {}

  @override
  Future<void> disableChannelNotification({required String channelId}) async {}
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
