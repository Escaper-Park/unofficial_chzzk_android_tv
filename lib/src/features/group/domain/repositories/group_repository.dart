import '../entities/group_collection.dart';

abstract interface class GroupRepository {
  Future<GroupCollection> read();

  Future<void> save(GroupCollection collection);

  Future<GroupCreateResult> createGroup({required String groupName});

  Future<GroupMutationResult> deleteGroup({required String groupId});

  Future<GroupActivationResult> activateGroup({required String groupId});

  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  });

  Future<GroupAddMemberResult> addMember({
    required String groupId,
    required String channelId,
  });
}

enum GroupCreateResult {
  success,
  emptyName,
  duplicateName,
}

enum GroupMutationResult {
  success,
  notFound,
}

enum GroupActivationResult {
  activated,
  notFound,
}

enum GroupAddMemberResult {
  added,
  alreadyExists,
  groupNotFound,
  emptyChannelId,
}
