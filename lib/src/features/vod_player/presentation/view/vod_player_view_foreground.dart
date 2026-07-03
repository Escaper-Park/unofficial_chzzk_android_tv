part of 'vod_player_view.dart';

final class _VodPlayerForegroundLayer extends StatelessWidget {
  const _VodPlayerForegroundLayer({
    required this.seekFeedbackController,
    required this.exitNoticeController,
  });

  final VodPlayerSeekFeedbackController seekFeedbackController;
  final TvPlayerExitNoticeController exitNoticeController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        seekFeedbackController,
        exitNoticeController,
      ]),
      builder: (context, _) {
        return BlocBuilder<VodPlayerBloc, VodPlayerState>(
          buildWhen: _vodPlayerForegroundBuildWhen,
          builder: (context, state) {
            return _VodPlayerForeground(
              slot: state.activeSlot,
              seekFeedback: seekFeedbackController.feedback,
              feedbackType: state.feedbackType,
              showExitNotice: exitNoticeController.isShowing,
            );
          },
        );
      },
    );
  }
}

bool _vodPlayerForegroundBuildWhen(
  VodPlayerState previous,
  VodPlayerState current,
) {
  if (previous.feedbackType != current.feedbackType) {
    return true;
  }

  return !_sameVodForegroundSlotInput(previous.activeSlot, current.activeSlot);
}

bool _sameVodForegroundSlotInput(
  VodPlayerSlotState previous,
  VodPlayerSlotState current,
) {
  return previous.slotId == current.slotId &&
      previous.status == current.status &&
      previous.videoNo == current.videoNo &&
      previous.failureReason == current.failureReason;
}

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
