part of 'vod_player_bloc.dart';

extension _VodPlayerBlocSocialHelpers on VodPlayerBloc {
  Future<void> _onFollowingToggled(
    _FollowingToggled event,
    Emitter<VodPlayerState> emit,
  ) async {
    final slot = state.activeSlot;
    final channelId = slot.channelId;
    if (channelId == null || !slot.canToggleFollowing) {
      return;
    }

    final following = slot.isFollowing;

    try {
      if (following) {
        await channelRepository.unfollowChannel(channelId: channelId);
      } else {
        await channelRepository.followChannel(channelId: channelId);
      }
      final myInfo = await channelRepository.getMyInfo(channelId: channelId);

      final currentSlot = state.slotById(slot.slotId);
      if (currentSlot == null ||
          currentSlot.channelId != channelId ||
          myInfo.channelId != channelId) {
        return;
      }

      emit(
        state.copyWith(
          slots: _slotsWith(currentSlot.copyWith(channelMyInfo: myInfo)),
          feedbackType: following
              ? VodPlayerFeedbackType.unfollowSuccess
              : VodPlayerFeedbackType.followSuccess,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    } on Object {
      _emitFeedback(
        emit,
        following
            ? VodPlayerFeedbackType.unfollowFailure
            : VodPlayerFeedbackType.followFailure,
      );
    }
  }

  Future<void> _onGroupAddRequested(
    _GroupAddRequested event,
    Emitter<VodPlayerState> emit,
  ) async {
    final channelId = state.activeSlot.channelId;
    if (channelId == null) {
      return;
    }

    try {
      final result = await groupRepository.addMember(
        groupId: event.groupId,
        channelId: channelId,
      );
      switch (result) {
        case GroupAddMemberResult.added:
          final collection = await groupRepository.read();
          emit(
            state.copyWith(
              groupCollection: collection,
              feedbackType: VodPlayerFeedbackType.groupAddSuccess,
              feedbackSerial: state.feedbackSerial + 1,
            ),
          );
        case GroupAddMemberResult.alreadyExists:
          _emitFeedback(emit, VodPlayerFeedbackType.groupAddAlreadyExists);
        case GroupAddMemberResult.groupNotFound ||
            GroupAddMemberResult.emptyChannelId:
          _emitFeedback(emit, VodPlayerFeedbackType.groupAddFailure);
      }
    } on Object {
      _emitFeedback(emit, VodPlayerFeedbackType.groupAddFailure);
    }
  }
}
