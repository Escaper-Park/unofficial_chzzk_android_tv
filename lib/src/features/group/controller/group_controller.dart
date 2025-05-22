import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/shared_preferences/shared_prefs.dart';
import '../../following/controller/following_controller.dart';
import '../../following/model/following.dart';
import '../model/group.dart';
import '../repository/group_repository.dart';

part 'group_controller.g.dart';

@riverpod
class GroupController extends _$GroupController {
  late GroupRepository _repository;

  @override
  Groups build() {
    final prefs = ref.watch(sharedPrefsProvider);
    _repository = GroupRepository(prefs: prefs);

    return init();
  }

  Groups init() {
    Groups groups = _repository.getValues();

    if (groups.groups.length <= groups.lastActivatedGroupIndex) {
      final fixedGroups = groups.copyWith(lastActivatedGroupIndex: 0);
      _repository.updateValue(groups);
      return fixedGroups;
    }

    return groups;
  }

  Group? getCurrentActivatedGroup() {
    return state.groups.isEmpty
        ? null
        : state.groups[state.lastActivatedGroupIndex];
  }

  /* Group*/
  Future<bool> addGroup({
    required String groupName,
  }) async {
    final existing = state.groups;
    if (existing.any(
      (group) => group.groupName == groupName,
    )) {
      return false;
    }

    final newGroup = Group(
      id: const Uuid().v4(),
      groupName: groupName,
      members: [],
    );
    final updated = state.copyWith(groups: [...existing, newGroup]);
    await _repository.updateValue(updated);
    state = updated;
    return true;
  }

  Future<bool> removeGroup({required String id}) async {
    final existing = state.groups;
    if (!existing.any(
      (group) => group.id == id,
    )) {
      return false;
    }

    final updated = state.copyWith(
      groups: existing
          .where(
            (group) => group.id != id,
          )
          .toList(),
    );

    await _repository.updateValue(updated);
    state = updated;
    return true;
  }

  /* Member */
  Future<bool> addMemberToGroup({
    required String id,
    required String member,
  }) async {
    final existing = state.groups;
    final existingIdx = existing.indexWhere(
      (group) => group.id == id,
    );

    if (existingIdx == -1) return false;

    final group = existing[existingIdx];
    if (group.members.contains(member)) return false;

    final updatedGroups = existing
        .map(
          (group) => group.id == id
              ? group.copyWith(members: [...group.members, member])
              : group,
        )
        .toList();

    final updated = state.copyWith(groups: updatedGroups);
    await _repository.updateValue(updated);
    state = updated;
    return true;
  }

  Future<bool> removeMemberFromGroup({
    required String id,
    required String member,
  }) async {
    final existing = state.groups;
    final idx = existing.indexWhere((group) => group.id == id);
    if (idx == -1) return false;
    final group = existing[idx];

    if (!group.members.contains(member)) return false;

    final updatedGroups = existing
        .map(
          (group) => group.id == id
              ? group.copyWith(
                  members: group.members.where((m) => m != member).toList(),
                )
              : group,
        )
        .toList();
    final updated = state.copyWith(groups: updatedGroups);
    await _repository.updateValue(updated);
    state = updated;
    return true;
  }

  Future<List<Following>?> getFollowingData(Group group) async {
    final List<Following>? followings =
        await ref.read(followingControllerProvider.future);

    if (followings == null || followings.isEmpty) return null;

    return followings
        .where((f) => group.members.contains(f.channelId))
        .toList();
  }

  Future<void> setActivatedGroup({required int index}) async {
    if (state.lastActivatedGroupIndex != index && state.groups.length > index) {
      final newState = state.copyWith(lastActivatedGroupIndex: index);
      state = newState;

      await _repository.updateValue(newState);
    }
  }
}
