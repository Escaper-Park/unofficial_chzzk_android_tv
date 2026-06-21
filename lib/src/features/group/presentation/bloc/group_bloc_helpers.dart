part of 'group_bloc.dart';

extension _GroupBlocHelpers on GroupBloc {
  Future<GroupState> _stateFromCollection(
    GroupCollection collection, {
    String? selectedGroupId,
  }) async {
    final selectedGroup = _selectedGroup(
      groups: collection.groups,
      selectedGroupId: selectedGroupId ?? state.selectedGroupId,
    );

    return state.copyWith(
      loadStatus: GroupLoadStatus.ready,
      groups: collection.groups,
      activatedGroupId: collection.effectiveActivatedGroupId,
      selectedGroupId: selectedGroup?.id,
      selectedGroupMembers: await _loadMembers(
        selectedGroup?.memberChannelIds ?? const [],
      ),
    );
  }

  Future<List<GroupMemberItem>> _loadMembers(List<String> channelIds) async {
    final seen = <String>{};
    final uniqueMembers = await Future.wait([
      for (final channelId in channelIds)
        if (seen.add(channelId)) _loadMember(channelId),
    ]);
    final membersByChannelId = {
      for (final member in uniqueMembers) member.channelId: member,
    };

    return [
      for (final channelId in channelIds) ?membersByChannelId[channelId],
    ];
  }

  Future<GroupMemberItem> _loadMember(String channelId) async {
    try {
      return _memberFromChannel(
        await channelRepository.getChannel(
          channelId: channelId,
        ),
      );
    } on Object {
      return GroupMemberItem(
        channelId: channelId,
        channelName: channelId,
      );
    }
  }

  void _emitFeedback(
    Emitter<GroupState> emit,
    GroupFeedbackType feedbackType,
  ) {
    emit(
      state.copyWith(
        feedbackType: feedbackType,
        feedbackSerial: state.feedbackSerial + 1,
      ),
    );
  }

  bool _isCurrentCollectionRequest(
    Emitter<GroupState> emit,
    int collectionRequestSerial,
    int memberRequestSerial,
  ) {
    return !emit.isDone &&
        _collectionRequestSerial == collectionRequestSerial &&
        _memberRequestSerial == memberRequestSerial;
  }

  bool _isCurrentMemberRequest(
    Emitter<GroupState> emit,
    int requestSerial,
  ) {
    return !emit.isDone && _memberRequestSerial == requestSerial;
  }
}

GroupMemberItem _memberFromChannel(ChannelDetail channel) {
  return GroupMemberItem(
    channelId: channel.channelId,
    channelName: channel.channelName,
    profileImageUrl: channel.channelImageUrl,
    verifiedMark: channel.verifiedMark,
    openLive: channel.openLive,
  );
}

GroupItem? _selectedGroup({
  required List<GroupItem> groups,
  required String? selectedGroupId,
}) {
  if (groups.isEmpty) {
    return null;
  }

  return _groupById(groups, selectedGroupId) ?? groups.first;
}

GroupItem? _groupById(List<GroupItem> groups, String? groupId) {
  for (final group in groups) {
    if (group.id == groupId) {
      return group;
    }
  }

  return null;
}

GroupItem? _groupByName(List<GroupItem> groups, String groupName) {
  for (final group in groups) {
    if (group.groupName == groupName) {
      return group;
    }
  }

  return null;
}
