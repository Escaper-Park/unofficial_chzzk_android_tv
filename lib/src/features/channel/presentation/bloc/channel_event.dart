part of 'channel_bloc.dart';

@freezed
sealed class ChannelEvent with _$ChannelEvent {
  const factory ChannelEvent.started() = _Started;

  const factory ChannelEvent.authStateChanged({
    required bool isSignedIn,
  }) = _AuthStateChanged;

  const factory ChannelEvent.tabSelected(ChannelTab tab) = _TabSelected;

  const factory ChannelEvent.vodSortSelected(
    ChannelVodSortOption option,
  ) = _VodSortSelected;

  const factory ChannelEvent.retryRequested() = _RetryRequested;

  const factory ChannelEvent.loadMoreRequested() = _LoadMoreRequested;

  const factory ChannelEvent.followRequested() = _FollowRequested;

  const factory ChannelEvent.unfollowRequested() = _UnfollowRequested;

  const factory ChannelEvent.groupPanelRequested() = _GroupPanelRequested;

  const factory ChannelEvent.groupPanelDismissed() = _GroupPanelDismissed;

  const factory ChannelEvent.groupAddRequested(GroupItem group) =
      _GroupAddRequested;
}
