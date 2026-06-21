import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/group_collection.dart';
import '../../domain/repositories/group_repository.dart';
import 'group_storage_keys.dart';

part 'shared_preferences_group_repository_codec.dart';
part 'shared_preferences_group_repository_mutations.dart';
part 'shared_preferences_group_repository_storage.dart';

final class SharedPreferencesGroupRepository implements GroupRepository {
  SharedPreferencesGroupRepository({
    required this.preferences,
    this.uuid = const Uuid(),
  });

  final SharedPreferences preferences;
  final Uuid uuid;
  Future<void> _operationQueue = Future<void>.value();

  @override
  Future<GroupCollection> read() async {
    await _operationQueue;
    return _readNow();
  }

  @override
  Future<void> save(GroupCollection collection) async {
    await _runExclusive(() => _writeNow(collection));
  }

  @override
  Future<GroupCreateResult> createGroup({required String groupName}) async {
    return _runExclusive(() async {
      final trimmedName = groupName.trim();
      if (trimmedName.isEmpty) {
        return GroupCreateResult.emptyName;
      }

      final collection = await _readNow();
      if (_hasGroupNamed(collection.groups, trimmedName)) {
        return GroupCreateResult.duplicateName;
      }

      await _writeNow(
        collection.copyWith(
          groups: [
            ...collection.groups,
            GroupItem(
              id: uuid.v4(),
              groupName: trimmedName,
            ),
          ],
          activatedGroupId: collection.effectiveActivatedGroupId,
        ),
      );
      return GroupCreateResult.success;
    });
  }

  @override
  Future<GroupMutationResult> deleteGroup({required String groupId}) async {
    return _runExclusive(() async {
      final trimmedId = groupId.trim();
      if (trimmedId.isEmpty) {
        return GroupMutationResult.notFound;
      }

      final collection = await _readNow();
      if (!_hasGroupId(collection.groups, trimmedId)) {
        return GroupMutationResult.notFound;
      }

      final groups = [
        for (final group in collection.groups)
          if (group.id != trimmedId) group,
      ];
      final activeGroupId = collection.effectiveActivatedGroupId == trimmedId
          ? null
          : collection.effectiveActivatedGroupId;
      await _writeNow(
        collection.copyWith(
          groups: groups,
          activatedGroupId: activeGroupId,
          lastActivatedGroupIndex: _indexOfGroupId(
            groups: groups,
            groupId: activeGroupId,
          ),
        ),
      );
      return GroupMutationResult.success;
    });
  }

  @override
  Future<GroupActivationResult> activateGroup({
    required String groupId,
  }) async {
    return _runExclusive(() async {
      final trimmedId = groupId.trim();
      if (trimmedId.isEmpty) {
        return GroupActivationResult.notFound;
      }

      final collection = await _readNow();
      final groupIndex = collection.groups.indexWhere(
        (group) => group.id == trimmedId,
      );
      if (groupIndex == -1) {
        return GroupActivationResult.notFound;
      }

      await _writeNow(
        collection.copyWith(
          activatedGroupId: trimmedId,
          lastActivatedGroupIndex: groupIndex,
        ),
      );
      return GroupActivationResult.activated;
    });
  }

  @override
  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  }) async {
    return _runExclusive(() async {
      final trimmedGroupId = groupId.trim();
      final trimmedChannelId = channelId.trim();
      if (trimmedGroupId.isEmpty || trimmedChannelId.isEmpty) {
        return GroupMutationResult.notFound;
      }

      final collection = await _readNow();
      var found = false;
      final groups = [
        for (final group in collection.groups)
          if (group.id == trimmedGroupId)
            _withoutMember(group, trimmedChannelId, onFound: () => found = true)
          else
            group,
      ];
      if (!found) {
        return GroupMutationResult.notFound;
      }

      await _writeNow(collection.copyWith(groups: groups));
      return GroupMutationResult.success;
    });
  }

  @override
  Future<GroupAddMemberResult> addMember({
    required String groupId,
    required String channelId,
  }) async {
    return _runExclusive(() async {
      final trimmedGroupId = groupId.trim();
      final trimmedChannelId = channelId.trim();
      if (trimmedChannelId.isEmpty) {
        return GroupAddMemberResult.emptyChannelId;
      }

      final collection = await _readNow();
      var groupFound = false;
      var alreadyExists = false;
      final groups = [
        for (final group in collection.groups)
          if (group.id == trimmedGroupId)
            _withMember(
              group,
              trimmedChannelId,
              onGroupFound: () => groupFound = true,
              onAlreadyExists: () => alreadyExists = true,
            )
          else
            group,
      ];

      if (!groupFound) {
        return GroupAddMemberResult.groupNotFound;
      }
      if (alreadyExists) {
        return GroupAddMemberResult.alreadyExists;
      }

      await _writeNow(collection.copyWith(groups: groups));
      return GroupAddMemberResult.added;
    });
  }
}
