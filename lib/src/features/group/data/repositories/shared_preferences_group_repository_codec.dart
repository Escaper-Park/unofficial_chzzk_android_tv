part of 'shared_preferences_group_repository.dart';

GroupCollection _decodeCollection(Map<String, dynamic> json) {
  return GroupCollection(
    groups: _decodeGroups(json['groups']),
    activatedGroupId: _stringOrNull(json['activatedGroupId']),
    lastActivatedGroupIndex: _intOrDefault(json['lastActivatedGroupIndex']),
  );
}

List<GroupItem> _decodeGroups(Object? rawGroups) {
  if (rawGroups is! List) {
    return const [];
  }

  return [
    for (final rawGroup in rawGroups) ?_decodeGroup(rawGroup),
  ];
}

GroupItem? _decodeGroup(Object? rawGroup) {
  if (rawGroup is! Map) {
    return null;
  }

  try {
    final group = GroupItem.fromJson(_jsonObject(rawGroup));
    if (group.id.trim().isEmpty || group.groupName.trim().isEmpty) {
      return null;
    }

    return group.copyWith(
      memberChannelIds: [
        for (final channelId in group.memberChannelIds)
          if (channelId.trim().isNotEmpty) channelId,
      ],
    );
  } on Object {
    return null;
  }
}

GroupCollection _normalizedCollection(GroupCollection collection) {
  final activeGroupId = validGroupId(
    groups: collection.groups,
    groupId: collection.activatedGroupId,
  );

  return collection.copyWith(
    activatedGroupId: activeGroupId,
    lastActivatedGroupIndex: validGroupIndex(
      groups: collection.groups,
      index: collection.lastActivatedGroupIndex,
    ),
  );
}

Map<String, dynamic> _jsonObject(Map<dynamic, dynamic> json) {
  return json.map((key, value) => MapEntry(key.toString(), value));
}

String? _stringOrNull(Object? value) {
  return value is String ? value : null;
}

int _intOrDefault(Object? value) {
  return value is num ? value.toInt() : 0;
}
