import 'bloc/following_bloc.dart';
import 'following_screen_string.dart';

String followingLoadingMessage(FollowingTab tab) {
  return switch (tab) {
    FollowingTab.live => FollowingScreenString.liveLoading,
    FollowingTab.vod => FollowingScreenString.vodLoading,
    FollowingTab.channel => FollowingScreenString.channelLoading,
    FollowingTab.category => FollowingScreenString.categoryLoading,
  };
}

String followingEmptyMessage(FollowingTab tab) {
  return switch (tab) {
    FollowingTab.live => FollowingScreenString.liveEmpty,
    FollowingTab.vod => FollowingScreenString.vodEmpty,
    FollowingTab.channel => FollowingScreenString.channelEmpty,
    FollowingTab.category => FollowingScreenString.categoryEmpty,
  };
}

String followingErrorMessage(FollowingTab tab) {
  return switch (tab) {
    FollowingTab.live => FollowingScreenString.liveError,
    FollowingTab.vod => FollowingScreenString.vodError,
    FollowingTab.channel => FollowingScreenString.channelError,
    FollowingTab.category => FollowingScreenString.categoryError,
  };
}

String followingFeedbackMessage(FollowingFeedbackType type) {
  return switch (type) {
    FollowingFeedbackType.noMoreData => FollowingScreenString.noMoreData,
    FollowingFeedbackType.followSuccess => FollowingScreenString.followSuccess,
    FollowingFeedbackType.followFailure => FollowingScreenString.followFailure,
    FollowingFeedbackType.unfollowSuccess =>
      FollowingScreenString.unfollowSuccess,
    FollowingFeedbackType.unfollowFailure =>
      FollowingScreenString.unfollowFailure,
    FollowingFeedbackType.addToGroupSuccess =>
      FollowingScreenString.addToGroupSuccess,
    FollowingFeedbackType.addToGroupAlreadyExists =>
      FollowingScreenString.addToGroupAlreadyExists,
    FollowingFeedbackType.addToGroupNoActiveGroup =>
      FollowingScreenString.addToGroupNoActiveGroup,
    FollowingFeedbackType.addToGroupFailure =>
      FollowingScreenString.addToGroupFailure,
  };
}
