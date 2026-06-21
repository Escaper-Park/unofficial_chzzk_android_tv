part of 'vod_player_view.dart';

final class _VodPlayerForeground extends StatelessWidget {
  const _VodPlayerForeground({
    required this.slot,
    required this.seekFeedback,
    required this.feedbackType,
    required this.showExitNotice,
  });

  final VodPlayerSlotState slot;
  final VodPlayerSeekFeedback? seekFeedback;
  final VodPlayerFeedbackType? feedbackType;
  final bool showExitNotice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ?_vodPlayerStatusSurfaceFor(context, slot),
        if (seekFeedback case final seekFeedback?)
          VodPlayerSeekFeedbackOverlay(feedback: seekFeedback),
        if (feedbackType case final feedbackType?)
          TvSnackbar(
            message: VodPlayerScreenString.feedbackMessage(feedbackType),
            icon: _vodPlayerFeedbackIcon(feedbackType),
            maxLines: 2,
          ),
        if (showExitNotice)
          const TvSnackbar(
            message: VodPlayerScreenString.exitNotice,
            icon: Icons.exit_to_app,
          ),
      ],
    );
  }
}
