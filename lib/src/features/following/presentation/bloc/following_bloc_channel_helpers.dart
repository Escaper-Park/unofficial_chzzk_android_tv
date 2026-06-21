part of 'following_bloc.dart';

extension _FollowingBlocChannelHelpers on FollowingBloc {
  void _onChannelModalOpened(
    _ChannelModalOpened event,
    Emitter<FollowingState> emit,
  ) {
    emit(
      state.copyWith(
        activeChannelModal: FollowingChannelModalState(
          channel: event.channel,
          index: event.index,
        ),
      ),
    );
  }

  void _onChannelModalClosed(
    _ChannelModalClosed event,
    Emitter<FollowingState> emit,
  ) {
    emit(state.copyWith(activeChannelModal: null));
  }

  Future<void> _onChannelUnfollowRequested(
    _ChannelUnfollowRequested event,
    Emitter<FollowingState> emit,
  ) async {
    emit(state.copyWith(activeChannelModal: null));

    try {
      await channelRepository.unfollowChannel(
        channelId: event.channel.channelId,
      );
      emit(
        state.copyWith(
          channel: state.channel.copyWith(
            items: _channelsWithFollowingStatus(
              items: state.channel.items,
              channelId: event.channel.channelId,
              following: false,
            ),
          ),
          feedbackType: FollowingFeedbackType.unfollowSuccess,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          feedbackType: FollowingFeedbackType.unfollowFailure,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    }
  }

  Future<void> _onChannelFollowRequested(
    _ChannelFollowRequested event,
    Emitter<FollowingState> emit,
  ) async {
    emit(state.copyWith(activeChannelModal: null));

    try {
      await channelRepository.followChannel(channelId: event.channel.channelId);
      emit(
        state.copyWith(
          channel: state.channel.copyWith(
            items: _channelsWithFollowingStatus(
              items: state.channel.items,
              channelId: event.channel.channelId,
              following: true,
            ),
          ),
          feedbackType: FollowingFeedbackType.followSuccess,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          feedbackType: FollowingFeedbackType.followFailure,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    }
  }

  Future<void> _onChannelGroupListRequested(
    _ChannelGroupListRequested event,
    Emitter<FollowingState> emit,
  ) async {
    final activeModal = state.activeChannelModal;
    if (activeModal == null ||
        activeModal.channel.channelId != event.channel.channelId) {
      return;
    }

    final requestSerial = ++_groupListRequestSerial;
    try {
      final collection = await groupRepository.read();
      if (!_isCurrentGroupListRequest(
        requestSerial,
        channelId: event.channel.channelId,
      )) {
        return;
      }

      emit(
        state.copyWith(
          activeChannelModal: activeModal.copyWith(
            view: FollowingChannelModalView.groupList,
            groups: collection.groups,
          ),
        ),
      );
    } on Object {
      if (!_isCurrentGroupListRequest(
        requestSerial,
        channelId: event.channel.channelId,
      )) {
        return;
      }

      emit(_stateWithFeedback(FollowingFeedbackType.addToGroupFailure));
    }
  }

  Future<void> _onChannelAddToGroupRequested(
    _ChannelAddToGroupRequested event,
    Emitter<FollowingState> emit,
  ) async {
    emit(state.copyWith(activeChannelModal: null));

    try {
      final result = await groupRepository.addMember(
        groupId: event.group.id,
        channelId: event.channel.channelId,
      );

      emit(_stateWithFeedback(_feedbackTypeForAddMemberResult(result)));
    } on Object {
      emit(_stateWithFeedback(FollowingFeedbackType.addToGroupFailure));
    }
  }
}
