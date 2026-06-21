part of 'live_player_bloc.dart';

extension _LivePlayerBlocSocialHelpers on LivePlayerBloc {
  Future<void> _onFollowingToggled(
    _FollowingToggled event,
    Emitter<LivePlayerState> emit,
  ) async {
    final channelId = state.activeSlot.channelId;
    if (channelId == null) {
      return;
    }
    final myInfo = state.channelMyInfo;
    if (myInfo?.channelId != channelId || myInfo?.following == null) {
      return;
    }

    final following = myInfo!.following!.following;

    try {
      final updatedMyInfo = await _socialCommands.toggleFollowing(
        channelId: channelId,
        currentlyFollowing: following,
      );

      if (state.activeSlot.channelId != channelId ||
          updatedMyInfo.channelId != channelId) {
        return;
      }

      emit(
        state.copyWith(
          channelMyInfo: updatedMyInfo,
          feedbackType: following
              ? LivePlayerFeedbackType.unfollowSuccess
              : LivePlayerFeedbackType.followSuccess,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    } on Object {
      _emitFeedback(
        emit,
        following
            ? LivePlayerFeedbackType.unfollowFailure
            : LivePlayerFeedbackType.followFailure,
      );
    }
  }

  Future<void> _onGroupAddRequested(
    _GroupAddRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    final channelId = state.activeSlot.channelId;
    if (channelId == null) {
      return;
    }

    try {
      final addResult = await _socialCommands.addChannelToGroup(
        groupId: event.groupId,
        channelId: channelId,
      );
      switch (addResult.result) {
        case GroupAddMemberResult.added:
          emit(
            state.copyWith(
              groupCollection: addResult.collection!,
              feedbackType: LivePlayerFeedbackType.groupAddSuccess,
              feedbackSerial: state.feedbackSerial + 1,
            ),
          );
        case GroupAddMemberResult.alreadyExists:
          _emitFeedback(emit, LivePlayerFeedbackType.groupAddAlreadyExists);
        case GroupAddMemberResult.groupNotFound ||
            GroupAddMemberResult.emptyChannelId:
          _emitFeedback(emit, LivePlayerFeedbackType.groupAddFailure);
      }
    } on Object {
      _emitFeedback(emit, LivePlayerFeedbackType.groupAddFailure);
    }
  }

  Future<void> _onGroupActivated(
    _GroupActivated event,
    Emitter<LivePlayerState> emit,
  ) async {
    try {
      final collection = await _socialCommands.activateGroup(
        groupId: event.groupId,
      );
      emit(state.copyWith(groupCollection: collection));
    } on Object {
      // Keep the current group state if the mutation fails.
    }
  }
}
