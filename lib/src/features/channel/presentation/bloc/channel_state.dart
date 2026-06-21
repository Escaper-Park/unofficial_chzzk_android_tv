part of 'channel_bloc.dart';

enum ChannelTab {
  home,
  vod,
}

enum ChannelLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

enum ChannelPaginationStatus {
  idle,
  loading,
  failure,
  exhausted,
}

enum ChannelGroupPanelStatus {
  loading,
  ready,
}

enum ChannelFeedbackType {
  noMoreData,
  followSuccess,
  followFailure,
  unfollowSuccess,
  unfollowFailure,
  addToGroupSuccess,
  addToGroupAlreadyExists,
  addToGroupFailure,
}

enum ChannelVodSortOption {
  latest(VodSort.latest),
  popular(VodSort.popular);

  const ChannelVodSortOption(this.sort);

  final VodSort sort;
}

@freezed
abstract class ChannelState with _$ChannelState {
  const ChannelState._();

  const factory ChannelState({
    required String channelId,
    required bool isSignedIn,
    required ChannelTab selectedTab,
    required ChannelLoadStatus profileStatus,
    ChannelDetail? profile,
    ChannelMyInfo? myInfo,
    required ChannelLoadStatus homeStatus,
    Live? live,
    @Default(<Vod>[]) List<Vod> latestVods,
    required ChannelVodSortOption vodSortOption,
    required ChannelPageData<Vod> vod,
    ChannelGroupPanelState? groupPanel,
    ChannelFeedbackType? feedbackType,
    @Default(0) int feedbackSerial,
  }) = _ChannelState;

  factory ChannelState.initial({
    required String channelId,
    required bool isSignedIn,
  }) {
    return ChannelState(
      channelId: channelId,
      isSignedIn: isSignedIn,
      selectedTab: ChannelTab.home,
      profileStatus: ChannelLoadStatus.initial,
      homeStatus: ChannelLoadStatus.initial,
      vodSortOption: ChannelVodSortOption.latest,
      vod: channelPageInitial<Vod>(),
    );
  }

  bool get isFollowing {
    return isSignedIn && (myInfo?.following?.following ?? false);
  }

  bool get canUseFollowAction {
    return isSignedIn &&
        profileStatus == ChannelLoadStatus.ready &&
        profile != null &&
        myInfo != null;
  }

  bool get hasHomeContent {
    return live != null || latestVods.isNotEmpty;
  }
}

@freezed
abstract class ChannelPageData<T> with _$ChannelPageData<T> {
  const ChannelPageData._();

  const factory ChannelPageData({
    required ChannelLoadStatus status,
    required List<T> items,
    int? nextPage,
    required ChannelPaginationStatus paginationStatus,
  }) = _ChannelPageData<T>;

  bool get canLoadMore {
    return nextPage != null &&
        paginationStatus != ChannelPaginationStatus.loading &&
        paginationStatus != ChannelPaginationStatus.exhausted;
  }
}

@freezed
abstract class ChannelGroupPanelState with _$ChannelGroupPanelState {
  const factory ChannelGroupPanelState({
    required ChannelGroupPanelStatus status,
    @Default(<GroupItem>[]) List<GroupItem> groups,
  }) = _ChannelGroupPanelState;
}

ChannelPageData<T> channelPageInitial<T>() {
  return ChannelPageData<T>(
    status: ChannelLoadStatus.initial,
    items: <T>[],
    paginationStatus: ChannelPaginationStatus.idle,
  );
}

ChannelPageData<T> channelPageLoading<T>() {
  return ChannelPageData<T>(
    status: ChannelLoadStatus.loading,
    items: <T>[],
    paginationStatus: ChannelPaginationStatus.idle,
  );
}

ChannelPageData<T> channelPageReady<T>({
  required List<T> items,
  int? nextPage,
}) {
  return ChannelPageData<T>(
    status: ChannelLoadStatus.ready,
    items: items,
    nextPage: nextPage,
    paginationStatus: nextPage == null
        ? ChannelPaginationStatus.exhausted
        : ChannelPaginationStatus.idle,
  );
}

ChannelPageData<T> channelPageFailure<T>() {
  return ChannelPageData<T>(
    status: ChannelLoadStatus.failure,
    items: <T>[],
    paginationStatus: ChannelPaginationStatus.idle,
  );
}
