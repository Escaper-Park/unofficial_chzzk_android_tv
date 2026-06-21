import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/data/repositories/group_storage_keys.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/data/repositories/shared_preferences_group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';

void main() {
  test('reads default collection when no group data is stored', () async {
    SharedPreferences.setMockInitialValues({});
    final repository = SharedPreferencesGroupRepository(
      preferences: await SharedPreferences.getInstance(),
    );

    final collection = await repository.read();

    expect(collection, defaultGroupCollection);
  });

  test('creates a group and rejects duplicate names', () async {
    SharedPreferences.setMockInitialValues({});
    final repository = SharedPreferencesGroupRepository(
      preferences: await SharedPreferences.getInstance(),
    );

    final created = await repository.createGroup(groupName: '  My Group  ');
    final duplicate = await repository.createGroup(groupName: 'My Group');
    final collection = await repository.read();

    expect(created, GroupCreateResult.success);
    expect(duplicate, GroupCreateResult.duplicateName);
    expect(collection.groups, hasLength(1));
    expect(collection.groups.single.groupName, 'My Group');
    expect(collection.groups.single.id, isNotEmpty);
  });

  test('restores legacy JSON shape from the old group key', () async {
    SharedPreferences.setMockInitialValues({
      GroupStorageKeys.groups: jsonEncode({
        'groups': [
          {
            'id': 'group-1',
            'groupName': 'Group',
            'memberChannelIds': ['channel-1'],
          },
        ],
        'activatedGroupId': 'group-1',
        'lastActivatedGroupIndex': 0,
      }),
    });
    final repository = SharedPreferencesGroupRepository(
      preferences: await SharedPreferences.getInstance(),
    );

    final collection = await repository.read();

    expect(collection.groups.single.id, 'group-1');
    expect(collection.groups.single.memberChannelIds, ['channel-1']);
    expect(collection.effectiveActivatedGroupId, 'group-1');
  });

  test('skips corrupted group items while preserving valid groups', () async {
    SharedPreferences.setMockInitialValues({
      GroupStorageKeys.groups: jsonEncode({
        'groups': [
          {
            'id': 'group-1',
            'groupName': 'Group',
            'memberChannelIds': ['channel-1', ''],
          },
          'corrupted',
          {
            'id': '',
            'groupName': 'Missing id',
          },
        ],
        'activatedGroupId': 'group-1',
      }),
    });
    final repository = SharedPreferencesGroupRepository(
      preferences: await SharedPreferences.getInstance(),
    );

    final collection = await repository.read();

    expect(collection.groups, hasLength(1));
    expect(collection.groups.single.id, 'group-1');
    expect(collection.groups.single.memberChannelIds, ['channel-1']);
    expect(collection.effectiveActivatedGroupId, 'group-1');
  });

  test('activates, removes member, and deletes group', () async {
    SharedPreferences.setMockInitialValues({});
    final repository = SharedPreferencesGroupRepository(
      preferences: await SharedPreferences.getInstance(),
    );
    const group = GroupItem(
      id: 'group-1',
      groupName: 'Group',
      memberChannelIds: ['channel-1', 'channel-2'],
    );
    await repository.save(const GroupCollection(groups: [group]));

    final activated = await repository.activateGroup(groupId: group.id);
    final removed = await repository.removeMember(
      groupId: group.id,
      channelId: 'channel-1',
    );
    final afterRemove = await repository.read();
    final deleted = await repository.deleteGroup(groupId: group.id);
    final afterDelete = await repository.read();

    expect(activated, GroupActivationResult.activated);
    expect(removed, GroupMutationResult.success);
    expect(afterRemove.effectiveActivatedGroupId, group.id);
    expect(afterRemove.groups.single.memberChannelIds, ['channel-2']);
    expect(deleted, GroupMutationResult.success);
    expect(afterDelete.groups, isEmpty);
    expect(afterDelete.effectiveActivatedGroupId, isNull);
  });

  test('serializes concurrent group member mutations', () async {
    SharedPreferences.setMockInitialValues({});
    final repository = SharedPreferencesGroupRepository(
      preferences: await SharedPreferences.getInstance(),
    );
    const group = GroupItem(id: 'group-1', groupName: 'Group');
    await repository.save(const GroupCollection(groups: [group]));

    final results = await Future.wait([
      repository.addMember(groupId: group.id, channelId: 'channel-1'),
      repository.addMember(groupId: group.id, channelId: 'channel-2'),
    ]);
    final collection = await repository.read();

    expect(results, [
      GroupAddMemberResult.added,
      GroupAddMemberResult.added,
    ]);
    expect(
      collection.groups.single.memberChannelIds,
      ['channel-1', 'channel-2'],
    );
  });
}
