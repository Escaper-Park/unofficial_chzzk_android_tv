part of 'shared_preferences_group_repository.dart';

GroupItem _withoutMember(
  GroupItem group,
  String channelId, {
  required VoidCallback onFound,
}) {
  if (!group.memberChannelIds.contains(channelId)) {
    return group;
  }

  onFound();
  return group.copyWith(
    memberChannelIds: [
      for (final memberChannelId in group.memberChannelIds)
        if (memberChannelId != channelId) memberChannelId,
    ],
  );
}

GroupItem _withMember(
  GroupItem group,
  String channelId, {
  required VoidCallback onGroupFound,
  required VoidCallback onAlreadyExists,
}) {
  onGroupFound();
  if (group.memberChannelIds.contains(channelId)) {
    onAlreadyExists();
    return group;
  }

  return group.copyWith(
    memberChannelIds: [...group.memberChannelIds, channelId],
  );
}

bool _hasGroupNamed(List<GroupItem> groups, String groupName) {
  for (final group in groups) {
    if (group.groupName.trim() == groupName) {
      return true;
    }
  }

  return false;
}

bool _hasGroupId(List<GroupItem> groups, String groupId) {
  for (final group in groups) {
    if (group.id == groupId) {
      return true;
    }
  }

  return false;
}

int _indexOfGroupId({
  required List<GroupItem> groups,
  required String? groupId,
}) {
  if (groupId == null) {
    return 0;
  }

  final index = groups.indexWhere((group) => group.id == groupId);
  return index == -1 ? 0 : index;
}

typedef VoidCallback = void Function();
