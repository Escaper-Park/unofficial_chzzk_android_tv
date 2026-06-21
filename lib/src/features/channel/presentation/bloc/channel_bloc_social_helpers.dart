part of 'channel_bloc.dart';

extension _ChannelBlocSocialHelpers on ChannelBloc {
  Future<void> _onFollowRequested(
    _FollowRequested event,
    Emitter<ChannelState> emit,
  ) async {
    final profile = state.profile;
    if (!state.isSignedIn || profile == null || state.isFollowing) {
      return;
    }

    try {
      await channelRepository.followChannel(channelId: channelId);
      final myInfo = await channelRepository.getMyInfo(channelId: channelId);
      if (myInfo.channelId != channelId) {
        throw StateError('Mismatched channel my-info.');
      }
      emit(
        state.copyWith(
          myInfo: myInfo,
          feedbackType: ChannelFeedbackType.followSuccess,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    } on Object {
      emit(_stateWithFeedback(ChannelFeedbackType.followFailure));
    }
  }

  Future<void> _onUnfollowRequested(
    _UnfollowRequested event,
    Emitter<ChannelState> emit,
  ) async {
    final profile = state.profile;
    if (!state.isSignedIn || profile == null || !state.isFollowing) {
      return;
    }

    try {
      await channelRepository.unfollowChannel(channelId: channelId);
      final myInfo = await channelRepository.getMyInfo(channelId: channelId);
      if (myInfo.channelId != channelId) {
        throw StateError('Mismatched channel my-info.');
      }
      emit(
        state.copyWith(
          myInfo: myInfo,
          feedbackType: ChannelFeedbackType.unfollowSuccess,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    } on Object {
      emit(_stateWithFeedback(ChannelFeedbackType.unfollowFailure));
    }
  }

  Future<void> _onGroupPanelRequested(
    _GroupPanelRequested event,
    Emitter<ChannelState> emit,
  ) async {
    emit(
      state.copyWith(
        groupPanel: const ChannelGroupPanelState(
          status: ChannelGroupPanelStatus.loading,
        ),
      ),
    );

    try {
      final collection = await groupRepository.read();
      emit(
        state.copyWith(
          groupPanel: ChannelGroupPanelState(
            status: ChannelGroupPanelStatus.ready,
            groups: collection.groups,
          ),
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          groupPanel: null,
          feedbackType: ChannelFeedbackType.addToGroupFailure,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    }
  }

  void _onGroupPanelDismissed(
    _GroupPanelDismissed event,
    Emitter<ChannelState> emit,
  ) {
    emit(state.copyWith(groupPanel: null));
  }

  Future<void> _onGroupAddRequested(
    _GroupAddRequested event,
    Emitter<ChannelState> emit,
  ) async {
    emit(state.copyWith(groupPanel: null));

    try {
      final result = await groupRepository.addMember(
        groupId: event.group.id,
        channelId: channelId,
      );
      emit(_stateWithFeedback(_feedbackTypeForAddMemberResult(result)));
    } on Object {
      emit(_stateWithFeedback(ChannelFeedbackType.addToGroupFailure));
    }
  }
}
