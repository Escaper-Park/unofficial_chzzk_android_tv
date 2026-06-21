part of 'channel_bloc.dart';

extension _ChannelBlocHelpers on ChannelBloc {
  Future<ChannelMyInfo?> _myInfoForSignedIn() async {
    if (!state.isSignedIn) {
      return null;
    }

    try {
      return await channelRepository.getMyInfo(channelId: channelId);
    } on Object {
      return null;
    }
  }

  Future<ChannelDetail> _profileForMapping(Emitter<ChannelState> emit) async {
    final profile = state.profile;
    if (profile != null) {
      return profile;
    }

    final loaded = await channelRepository.getChannel(channelId: channelId);
    emit(
      state.copyWith(
        profileStatus: ChannelLoadStatus.ready,
        profile: loaded,
      ),
    );
    return loaded;
  }

  Future<Live?> _liveFor(ChannelDetail profile) async {
    if (!profile.openLive) {
      return null;
    }

    try {
      final detail = await liveRepository.getLiveDetail(channelId: channelId);
      return _liveFromDetail(detail, profile);
    } on Object {
      return null;
    }
  }

  ChannelState _stateWithFeedback(ChannelFeedbackType type) {
    return state.copyWith(
      feedbackType: type,
      feedbackSerial: state.feedbackSerial + 1,
    );
  }
}

ChannelFeedbackType _feedbackTypeForAddMemberResult(
  GroupAddMemberResult result,
) {
  return switch (result) {
    GroupAddMemberResult.added => ChannelFeedbackType.addToGroupSuccess,
    GroupAddMemberResult.alreadyExists =>
      ChannelFeedbackType.addToGroupAlreadyExists,
    GroupAddMemberResult.groupNotFound || GroupAddMemberResult.emptyChannelId =>
      ChannelFeedbackType.addToGroupFailure,
  };
}

Live? _liveFromDetail(LiveDetail detail, ChannelDetail profile) {
  if (detail.liveId <= 0 || detail.title.isEmpty) {
    return null;
  }

  return Live(
    liveId: detail.liveId,
    title: detail.title,
    thumbnailImageUrl: detail.thumbnailImageUrl,
    defaultThumbnailImageUrl: detail.defaultThumbnailImageUrl,
    concurrentUserCount: detail.concurrentUserCount,
    openDate: detail.openDate,
    adult: detail.adult,
    tags: detail.tags,
    categoryValue: detail.categoryValue,
    channel:
        detail.channel ??
        LiveChannel(
          channelId: profile.channelId,
          channelName: profile.channelName,
          channelImageUrl: profile.channelImageUrl,
          verifiedMark: profile.verifiedMark,
        ),
    blindType: detail.blindType,
    watchPartyTag: detail.watchPartyTag,
    watchPartyType: detail.watchPartyType,
    membershipBenefitType: detail.membershipBenefitType,
  );
}

int? _nextPageFor(ChannelVideoPage page) {
  final nextPage = page.page + 1;
  if (page.totalPages <= 0 || nextPage >= page.totalPages) {
    return null;
  }

  return nextPage;
}
