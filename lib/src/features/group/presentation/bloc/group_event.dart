part of 'group_bloc.dart';

@freezed
sealed class GroupEvent with _$GroupEvent {
  const factory GroupEvent.started() = _Started;

  const factory GroupEvent.retryRequested() = _RetryRequested;

  const factory GroupEvent.tabSelected(GroupTab tab) = _TabSelected;

  const factory GroupEvent.groupSelected(String groupId) = _GroupSelected;

  const factory GroupEvent.createInputSelected() = _CreateInputSelected;

  const factory GroupEvent.createInputChanged(String value) =
      _CreateInputChanged;

  const factory GroupEvent.createSubmitted(String value) = _CreateSubmitted;

  const factory GroupEvent.keyboardClosed() = _KeyboardClosed;

  const factory GroupEvent.groupActivationRequested(String groupId) =
      _GroupActivationRequested;

  const factory GroupEvent.groupDeleteRequested(String groupId) =
      _GroupDeleteRequested;

  const factory GroupEvent.channelModalOpened({
    required String groupId,
    required GroupMemberItem channel,
  }) = _ChannelModalOpened;

  const factory GroupEvent.channelModalClosed() = _ChannelModalClosed;

  const factory GroupEvent.memberRemoveRequested({
    required String groupId,
    required String channelId,
  }) = _MemberRemoveRequested;
}
