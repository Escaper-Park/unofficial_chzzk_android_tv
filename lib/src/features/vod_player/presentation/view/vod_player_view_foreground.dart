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
    return BlocSelector<
      VodPlayerBloc,
      VodPlayerState,
      _VodPlayerForegroundSnapshot
    >(
      selector: _VodPlayerForegroundSnapshot.new,
      builder: (context, snapshot) {
        return _VodPlayerForegroundControllerBoundary(
          snapshot: snapshot,
          seekFeedbackController: seekFeedbackController,
          exitNoticeController: exitNoticeController,
        );
      },
    );
  }
}

final class _VodPlayerForegroundControllerBoundary extends StatelessWidget {
  const _VodPlayerForegroundControllerBoundary({
    required this.snapshot,
    required this.seekFeedbackController,
    required this.exitNoticeController,
  });

  final _VodPlayerForegroundSnapshot snapshot;
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
        return _VodPlayerForeground(
          slot: snapshot.state.activeSlot,
          seekFeedback: seekFeedbackController.feedback,
          feedbackType: snapshot.state.feedbackType,
          showExitNotice: exitNoticeController.isShowing,
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

@immutable
final class _VodPlayerForegroundSnapshot {
  const _VodPlayerForegroundSnapshot(this.state);

  final VodPlayerState state;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _VodPlayerForegroundSnapshot &&
            !_vodPlayerForegroundBuildWhen(other.state, state);
  }

  @override
  int get hashCode => Object.hash(
    state.feedbackType,
    _vodForegroundSlotInputHash(state.activeSlot),
  );
}

int _vodForegroundSlotInputHash(VodPlayerSlotState slot) {
  return Object.hash(
    slot.slotId,
    slot.status,
    slot.videoNo,
    slot.failureReason,
  );
}
