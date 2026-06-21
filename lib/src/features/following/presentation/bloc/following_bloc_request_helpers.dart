part of 'following_bloc.dart';

extension _FollowingBlocRequestHelpers on FollowingBloc {
  FollowingState _stateWithFeedback(FollowingFeedbackType type) {
    return state.copyWith(
      feedbackType: type,
      feedbackSerial: state.feedbackSerial + 1,
    );
  }

  void _invalidateTabRequests() {
    _liveRequestSerial += 1;
    _vodRequestSerial += 1;
    _channelRequestSerial += 1;
    _categoryRequestSerial += 1;
    _groupListRequestSerial += 1;
  }

  bool _isCurrentTabRequest(
    Emitter<FollowingState> emit, {
    required FollowingTab tab,
    required int requestSerial,
    FollowingLiveSortOption? liveSortOption,
  }) {
    if (emit.isDone || !state.isSignedIn || state.selectedTab != tab) {
      return false;
    }

    if (liveSortOption != null && state.liveSortOption != liveSortOption) {
      return false;
    }

    return switch (tab) {
      FollowingTab.live => _liveRequestSerial == requestSerial,
      FollowingTab.vod => _vodRequestSerial == requestSerial,
      FollowingTab.channel => _channelRequestSerial == requestSerial,
      FollowingTab.category => _categoryRequestSerial == requestSerial,
    };
  }

  bool _isCurrentGroupListRequest(
    int requestSerial, {
    required String channelId,
  }) {
    final activeModal = state.activeChannelModal;
    return _groupListRequestSerial == requestSerial &&
        activeModal != null &&
        activeModal.channel.channelId == channelId;
  }
}
