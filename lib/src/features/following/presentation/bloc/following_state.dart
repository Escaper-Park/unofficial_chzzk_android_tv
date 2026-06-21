part of 'following_bloc.dart';

enum FollowingTab {
  live,
  vod,
  channel,
  category,
}

enum FollowingLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

enum FollowingPaginationStatus {
  idle,
  loading,
  failure,
  exhausted,
}

enum FollowingFeedbackType {
  noMoreData,
  followSuccess,
  followFailure,
  unfollowSuccess,
  unfollowFailure,
  addToGroupSuccess,
  addToGroupAlreadyExists,
  addToGroupNoActiveGroup,
  addToGroupFailure,
}

enum FollowingLiveSortOption {
  popular(FollowingLiveSort.popular),
  latest(FollowingLiveSort.latest),
  recommend(FollowingLiveSort.recommend),
  oldest(FollowingLiveSort.oldest),
  unpopular(FollowingLiveSort.unpopular);

  const FollowingLiveSortOption(this.sort);

  final FollowingLiveSort sort;
}

enum FollowingChannelModalView {
  actions,
  groupList,
}

@freezed
abstract class FollowingState with _$FollowingState {
  const FollowingState._();

  const factory FollowingState({
    required bool isSignedIn,
    required FollowingTab selectedTab,
    required FollowingLiveSortOption liveSortOption,
    required FollowingSectionData<Live> live,
    required FollowingVodSectionData vod,
    required FollowingSectionData<FollowingChannel> channel,
    required FollowingSectionData<CategoryItem> category,
    FollowingChannelModalState? activeChannelModal,
    FollowingFeedbackType? feedbackType,
    @Default(0) int feedbackSerial,
  }) = _FollowingState;

  factory FollowingState.initial() {
    return FollowingState(
      isSignedIn: false,
      selectedTab: FollowingTab.live,
      liveSortOption: FollowingLiveSortOption.popular,
      live: followingSectionInitial<Live>(),
      vod: followingVodSectionInitial(),
      channel: followingSectionInitial<FollowingChannel>(),
      category: followingSectionInitial<CategoryItem>(),
    );
  }
}

@freezed
abstract class FollowingSectionData<T> with _$FollowingSectionData<T> {
  const FollowingSectionData._();

  const factory FollowingSectionData({
    required FollowingLoadStatus status,
    required List<T> items,
  }) = _FollowingSectionData<T>;

  bool get hasItems => items.isNotEmpty;
}

@freezed
abstract class FollowingVodSectionData with _$FollowingVodSectionData {
  const FollowingVodSectionData._();

  const factory FollowingVodSectionData({
    required FollowingLoadStatus status,
    required List<Vod> items,
    FollowingVodCursor? cursor,
    required FollowingPaginationStatus paginationStatus,
  }) = _FollowingVodSectionData;

  bool get hasItems => items.isNotEmpty;

  bool get canLoadMore {
    return cursor != null &&
        paginationStatus != FollowingPaginationStatus.loading &&
        paginationStatus != FollowingPaginationStatus.exhausted;
  }
}

@freezed
abstract class FollowingChannelModalState with _$FollowingChannelModalState {
  const factory FollowingChannelModalState({
    required FollowingChannel channel,
    required int index,
    @Default(FollowingChannelModalView.actions) FollowingChannelModalView view,
    @Default(<GroupItem>[]) List<GroupItem> groups,
  }) = _FollowingChannelModalState;
}

FollowingSectionData<T> followingSectionInitial<T>() {
  return FollowingSectionData<T>(
    status: FollowingLoadStatus.initial,
    items: <T>[],
  );
}

FollowingSectionData<T> followingSectionLoading<T>() {
  return FollowingSectionData<T>(
    status: FollowingLoadStatus.loading,
    items: <T>[],
  );
}

FollowingSectionData<T> followingSectionReady<T>(List<T> items) {
  return FollowingSectionData<T>(
    status: FollowingLoadStatus.ready,
    items: items,
  );
}

FollowingSectionData<T> followingSectionFailure<T>() {
  return FollowingSectionData<T>(
    status: FollowingLoadStatus.failure,
    items: <T>[],
  );
}

FollowingVodSectionData followingVodSectionInitial() {
  return const FollowingVodSectionData(
    status: FollowingLoadStatus.initial,
    items: <Vod>[],
    paginationStatus: FollowingPaginationStatus.idle,
  );
}

FollowingVodSectionData followingVodSectionLoading() {
  return const FollowingVodSectionData(
    status: FollowingLoadStatus.loading,
    items: <Vod>[],
    paginationStatus: FollowingPaginationStatus.idle,
  );
}

FollowingVodSectionData followingVodSectionFailure() {
  return const FollowingVodSectionData(
    status: FollowingLoadStatus.failure,
    items: <Vod>[],
    paginationStatus: FollowingPaginationStatus.idle,
  );
}
