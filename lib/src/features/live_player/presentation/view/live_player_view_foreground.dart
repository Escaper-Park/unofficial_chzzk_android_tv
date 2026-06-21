part of 'live_player_view.dart';

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
