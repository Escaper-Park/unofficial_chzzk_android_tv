part of 'following_bloc.dart';

FollowingFeedbackType _feedbackTypeForAddMemberResult(
  GroupAddMemberResult result,
) {
  return switch (result) {
    GroupAddMemberResult.added => FollowingFeedbackType.addToGroupSuccess,
    GroupAddMemberResult.alreadyExists =>
      FollowingFeedbackType.addToGroupAlreadyExists,
    GroupAddMemberResult.groupNotFound || GroupAddMemberResult.emptyChannelId =>
      FollowingFeedbackType.addToGroupFailure,
  };
}

FollowingState _initialFollowingState({required bool isSignedIn}) {
  final initial = FollowingState.initial();
  if (!isSignedIn) {
    return initial;
  }

  return _stateWithLoadingTab(
    initial.selectedTab,
    initial.copyWith(isSignedIn: true),
  );
}

FollowingState _stateWithLoadingTab(
  FollowingTab tab,
  FollowingState state,
) {
  final base = state.copyWith(selectedTab: tab, activeChannelModal: null);

  return switch (tab) {
    FollowingTab.live => base.copyWith(live: followingSectionLoading<Live>()),
    FollowingTab.vod => base.copyWith(vod: followingVodSectionLoading()),
    FollowingTab.channel => base.copyWith(
      channel: followingSectionLoading<FollowingChannel>(),
    ),
    FollowingTab.category => base.copyWith(
      category: followingSectionLoading<CategoryItem>(),
    ),
  };
}

List<FollowingChannel> _sortedChannels(List<FollowingChannel> items) {
  return [...items]..sort((a, b) {
    final liveComparison = _liveScore(b).compareTo(_liveScore(a));
    if (liveComparison != 0) {
      return liveComparison;
    }

    return (b.liveInfo?.concurrentUserCount ?? 0).compareTo(
      a.liveInfo?.concurrentUserCount ?? 0,
    );
  });
}

int _liveScore(FollowingChannel item) {
  return item.openLive ? 1 : 0;
}

List<FollowingChannel> _channelsWithFollowingStatus({
  required List<FollowingChannel> items,
  required String channelId,
  required bool following,
}) {
  return [
    for (final item in items)
      if (item.channelId == channelId)
        _channelWithFollowingStatus(item, following)
      else
        item,
  ];
}

FollowingChannel _channelWithFollowingStatus(
  FollowingChannel channel,
  bool following,
) {
  final personalData = channel.personalData;

  return channel.copyWith(
    personalData: personalData == null
        ? FollowingPersonalData(
            following: following,
            notification: false,
            privateUserBlock: false,
          )
        : personalData.copyWith(following: following),
  );
}

Live? _liveFromFollowingChannel(FollowingChannel item) {
  final liveInfo = item.liveInfo;
  final liveId = liveInfo?.liveId;
  final title = liveInfo?.title;

  if (liveInfo == null || liveId == null || title == null || title.isEmpty) {
    return null;
  }

  return Live(
    liveId: liveId,
    title: title,
    thumbnailImageUrl: liveInfo.thumbnailImageUrl,
    defaultThumbnailImageUrl: liveInfo.defaultThumbnailImageUrl,
    concurrentUserCount: liveInfo.concurrentUserCount,
    adult: liveInfo.adult,
    tags: liveInfo.tags,
    categoryValue: liveInfo.categoryValue,
    channel: LiveChannel(
      channelId: item.channelId,
      channelName: item.channelName,
      channelImageUrl: item.channelImageUrl,
      verifiedMark: item.verifiedMark,
    ),
    blindType: liveInfo.blindType,
    watchPartyTag: liveInfo.watchPartyTag,
    watchPartyType: liveInfo.watchPartyType,
  );
}
