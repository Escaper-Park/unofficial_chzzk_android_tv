part of 'vod_player_view.dart';

Widget? _vodPlayerStatusSurfaceFor(
  BuildContext context,
  VodPlayerSlotState slot,
) {
  return switch (slot.status) {
    VodPlayerSlotStatus.empty => const VodPlayerStatusSurface(
      message: VodPlayerScreenString.noVodSelected,
    ),
    VodPlayerSlotStatus.loadingSource => const VodPlayerStatusSurface.loading(),
    VodPlayerSlotStatus.ready => const VodPlayerStatusSurface.loading(),
    VodPlayerSlotStatus.failure => VodPlayerStatusSurface(
      message: VodPlayerScreenString.failureMessage(slot.failureReason),
      onRetry: slot.videoNo == null
          ? null
          : () {
              context.read<VodPlayerBloc>().add(
                const VodPlayerEvent.retryRequested(),
              );
            },
    ),
    VodPlayerSlotStatus.playing => null,
    VodPlayerSlotStatus.ended => const VodPlayerStatusSurface(
      message: VodPlayerScreenString.playbackEnded,
    ),
  };
}

IconData _vodPlayerFeedbackIcon(VodPlayerFeedbackType feedbackType) {
  return switch (feedbackType) {
    VodPlayerFeedbackType.followSuccess ||
    VodPlayerFeedbackType.unfollowSuccess ||
    VodPlayerFeedbackType.groupAddSuccess ||
    VodPlayerFeedbackType.groupAddAlreadyExists => Icons.check_circle_outline,
    VodPlayerFeedbackType.followFailure ||
    VodPlayerFeedbackType.unfollowFailure ||
    VodPlayerFeedbackType.groupAddFailure ||
    VodPlayerFeedbackType.browseLoadMoreFailure => Icons.error_outline,
  };
}
