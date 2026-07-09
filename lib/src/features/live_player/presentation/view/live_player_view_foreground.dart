part of 'live_player_view.dart';

final class _LivePlayerForegroundLayer extends StatelessWidget {
  const _LivePlayerForegroundLayer({
    required this.exitNoticeController,
  });

  final TvPlayerExitNoticeController exitNoticeController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      LivePlayerBloc,
      LivePlayerState,
      LivePlayerFeedbackType?
    >(
      selector: (state) => state.feedbackType,
      builder: (context, feedbackType) {
        return _LivePlayerForegroundControllerBoundary(
          feedbackType: feedbackType,
          exitNoticeController: exitNoticeController,
        );
      },
    );
  }
}

final class _LivePlayerForegroundControllerBoundary extends StatelessWidget {
  const _LivePlayerForegroundControllerBoundary({
    required this.feedbackType,
    required this.exitNoticeController,
  });

  final LivePlayerFeedbackType? feedbackType;
  final TvPlayerExitNoticeController exitNoticeController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: exitNoticeController,
      builder: (context, _) {
        return _LivePlayerForeground(
          feedbackType: feedbackType,
          showExitNotice: exitNoticeController.isShowing,
        );
      },
    );
  }
}

final class _LivePlayerForeground extends StatelessWidget {
  const _LivePlayerForeground({
    required this.feedbackType,
    required this.showExitNotice,
  });

  final LivePlayerFeedbackType? feedbackType;
  final bool showExitNotice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (feedbackType case final feedbackType?)
          TvSnackbar(
            message: LivePlayerScreenString.feedbackMessage(feedbackType),
            icon: _livePlayerFeedbackIcon(feedbackType),
            maxLines: 2,
          ),
        if (showExitNotice)
          const TvSnackbar(
            message: LivePlayerScreenString.exitNotice,
            icon: Icons.exit_to_app,
          ),
      ],
    );
  }
}
