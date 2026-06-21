import 'bloc/channel_bloc.dart';
import 'channel_screen_string.dart';

String channelHomeStateMessage(ChannelLoadStatus status) {
  return switch (status) {
    ChannelLoadStatus.initial ||
    ChannelLoadStatus.loading => ChannelScreenString.homeLoading,
    ChannelLoadStatus.ready => ChannelScreenString.homeEmpty,
    ChannelLoadStatus.failure => ChannelScreenString.homeError,
  };
}

String channelVodStateMessage(ChannelLoadStatus status) {
  return switch (status) {
    ChannelLoadStatus.initial ||
    ChannelLoadStatus.loading => ChannelScreenString.vodLoading,
    ChannelLoadStatus.ready => ChannelScreenString.vodEmpty,
    ChannelLoadStatus.failure => ChannelScreenString.vodError,
  };
}

String channelFeedbackMessage(ChannelFeedbackType type) {
  return switch (type) {
    ChannelFeedbackType.noMoreData => ChannelScreenString.noMoreData,
    ChannelFeedbackType.followSuccess => ChannelScreenString.followSuccess,
    ChannelFeedbackType.followFailure => ChannelScreenString.followFailure,
    ChannelFeedbackType.unfollowSuccess => ChannelScreenString.unfollowSuccess,
    ChannelFeedbackType.unfollowFailure => ChannelScreenString.unfollowFailure,
    ChannelFeedbackType.addToGroupSuccess =>
      ChannelScreenString.addToGroupSuccess,
    ChannelFeedbackType.addToGroupAlreadyExists =>
      ChannelScreenString.addToGroupAlreadyExists,
    ChannelFeedbackType.addToGroupFailure =>
      ChannelScreenString.addToGroupFailure,
  };
}
