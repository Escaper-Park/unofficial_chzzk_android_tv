part of 'following_bloc.dart';

@freezed
sealed class FollowingEvent with _$FollowingEvent {
  const factory FollowingEvent.started({
    required bool isSignedIn,
  }) = _Started;

  const factory FollowingEvent.authStateChanged({
    required bool isSignedIn,
  }) = _AuthStateChanged;

  const factory FollowingEvent.tabSelected(FollowingTab tab) = _TabSelected;

  const factory FollowingEvent.retryRequested() = _RetryRequested;

  const factory FollowingEvent.liveSortSelected(
    FollowingLiveSortOption option,
  ) = _LiveSortSelected;

  const factory FollowingEvent.loadMoreRequested() = _LoadMoreRequested;

  const factory FollowingEvent.channelModalOpened({
    required FollowingChannel channel,
    required int index,
  }) = _ChannelModalOpened;

  const factory FollowingEvent.channelModalClosed() = _ChannelModalClosed;

  const factory FollowingEvent.channelUnfollowRequested(
    FollowingChannel channel,
  ) = _ChannelUnfollowRequested;

  const factory FollowingEvent.channelFollowRequested(
    FollowingChannel channel,
  ) = _ChannelFollowRequested;

  const factory FollowingEvent.channelGroupListRequested(
    FollowingChannel channel,
  ) = _ChannelGroupListRequested;

  const factory FollowingEvent.channelAddToGroupRequested({
    required FollowingChannel channel,
    required GroupItem group,
  }) = _ChannelAddToGroupRequested;
}
