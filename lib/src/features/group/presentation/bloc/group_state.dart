part of 'group_bloc.dart';

enum GroupLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

enum GroupFeedbackType {
  emptyName,
  duplicateName,
  createSuccess,
  createFailure,
  deleteSuccess,
  deleteFailure,
  activateSuccess,
  activateFailure,
  memberRemoveSuccess,
  memberRemoveFailure,
}

@freezed
abstract class GroupChannelModalState with _$GroupChannelModalState {
  const factory GroupChannelModalState({
    required String groupId,
    required GroupMemberItem channel,
  }) = _GroupChannelModalState;
}

@freezed
abstract class GroupState with _$GroupState {
  const GroupState._();

  const factory GroupState({
    @Default(GroupLoadStatus.initial) GroupLoadStatus loadStatus,
    @Default(GroupTab.group) GroupTab selectedTab,
    @Default(<GroupItem>[]) List<GroupItem> groups,
    String? selectedGroupId,
    String? activatedGroupId,
    @Default(<GroupMemberItem>[]) List<GroupMemberItem> selectedGroupMembers,
    @Default('') String createInputValue,
    @Default(false) bool isKeyboardOpen,
    GroupChannelModalState? activeChannelModal,
    GroupFeedbackType? feedbackType,
    @Default(0) int feedbackSerial,
  }) = _GroupState;

  GroupItem? get selectedGroup {
    if (groups.isEmpty) {
      return null;
    }

    for (final group in groups) {
      if (group.id == selectedGroupId) {
        return group;
      }
    }

    return groups.first;
  }
}
