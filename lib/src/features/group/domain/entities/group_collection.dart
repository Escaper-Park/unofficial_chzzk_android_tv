import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_collection.freezed.dart';
part 'group_collection.g.dart';

@freezed
abstract class GroupCollection with _$GroupCollection {
  const GroupCollection._();

  const factory GroupCollection({
    @Default(<GroupItem>[]) List<GroupItem> groups,
    String? activatedGroupId,
    @Default(0) int lastActivatedGroupIndex,
  }) = _GroupCollection;

  factory GroupCollection.fromJson(Map<String, dynamic> json) =>
      _$GroupCollectionFromJson(json);

  String? get effectiveActivatedGroupId {
    return validGroupId(groups: groups, groupId: activatedGroupId);
  }

  int get effectiveLastActivatedGroupIndex {
    final activeGroupId = effectiveActivatedGroupId;
    if (activeGroupId == null) {
      return 0;
    }

    final index = groups.indexWhere((group) => group.id == activeGroupId);
    return validGroupIndex(groups: groups, index: index);
  }
}

@freezed
abstract class GroupItem with _$GroupItem {
  const factory GroupItem({
    required String id,
    required String groupName,
    @Default(<String>[]) List<String> memberChannelIds,
  }) = _GroupItem;

  factory GroupItem.fromJson(Map<String, dynamic> json) =>
      _$GroupItemFromJson(json);
}

@freezed
abstract class GroupMemberItem with _$GroupMemberItem {
  const factory GroupMemberItem({
    required String channelId,
    required String channelName,
    String? profileImageUrl,
    @Default(false) bool verifiedMark,
    @Default(false) bool openLive,
    int? liveId,
  }) = _GroupMemberItem;
}

const defaultGroupCollection = GroupCollection();

String? validGroupId({
  required List<GroupItem> groups,
  required String? groupId,
}) {
  if (groupId == null) {
    return null;
  }

  for (final group in groups) {
    if (group.id == groupId) {
      return groupId;
    }
  }

  return null;
}

int validGroupIndex({
  required List<GroupItem> groups,
  required int index,
}) {
  if (groups.isEmpty || index < 0 || index >= groups.length) {
    return 0;
  }

  return index;
}
