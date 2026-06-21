part of 'live_player_view.dart';

Widget? _livePlayerStatusSurfaceFor(
  LivePlayerSlotState slot, {
  required bool active,
  required bool isMultiview,
}) {
  return switch (slot.status) {
    LivePlayerSlotStatus.empty => const LivePlayerStatusSurface(
      message: LivePlayerScreenString.noLiveSelected,
    ),
    LivePlayerSlotStatus.loadingSource =>
      const LivePlayerStatusSurface.loading(),
    LivePlayerSlotStatus.ready => const LivePlayerStatusSurface.loading(),
    LivePlayerSlotStatus.ended => const LivePlayerStatusSurface(
      message: LivePlayerScreenString.liveEnded,
    ),
    LivePlayerSlotStatus.failure =>
      isMultiview && !active
          ? const LivePlayerStatusSurface.inactiveFailure()
          : LivePlayerStatusSurface(
              message: LivePlayerScreenString.failureMessage(
                slot.failureReason,
              ),
              showRetryHint: slot.channelId != null,
            ),
    LivePlayerSlotStatus.playing => null,
  };
}

IconData _livePlayerFeedbackIcon(LivePlayerFeedbackType feedbackType) {
  return switch (feedbackType) {
    LivePlayerFeedbackType.followSuccess ||
    LivePlayerFeedbackType.unfollowSuccess ||
    LivePlayerFeedbackType.groupAddSuccess ||
    LivePlayerFeedbackType.groupAddAlreadyExists => Icons.check_circle_outline,
    LivePlayerFeedbackType.multiviewLiveAlreadyAdded => Icons.info_outline,
    LivePlayerFeedbackType.followFailure ||
    LivePlayerFeedbackType.unfollowFailure ||
    LivePlayerFeedbackType.groupAddFailure => Icons.error_outline,
  };
}
