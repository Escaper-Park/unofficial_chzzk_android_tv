part of 'live_player_view.dart';

final class _LivePlayerViewListeners extends StatelessWidget {
  const _LivePlayerViewListeners({
    required this.lastVisibleChatWindowIndex,
    required this.feedbackController,
    required this.child,
  });

  final ObjectRef<int> lastVisibleChatWindowIndex;
  final TvSnackbarFeedbackController feedbackController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LivePlayerBloc, LivePlayerState>(
          listenWhen: (previous, current) {
            return previous.settingsPreferences.liveSettings.chatWindowIndex !=
                current.settingsPreferences.liveSettings.chatWindowIndex;
          },
          listener: (_, state) {
            final value =
                state.settingsPreferences.liveSettings.chatWindowIndex;
            if (value != liveChatWindowHiddenIndex) {
              lastVisibleChatWindowIndex.value = value;
            }
          },
        ),
        BlocListener<LivePlayerBloc, LivePlayerState>(
          listenWhen: (previous, current) {
            return previous.feedbackSerial != current.feedbackSerial;
          },
          listener: (context, state) {
            feedbackController.schedule(
              serial: state.feedbackSerial,
              visible: state.feedbackType != null,
              onElapsed: (serial) {
                context.read<LivePlayerBloc>().add(
                  LivePlayerEvent.feedbackCleared(serial: serial),
                );
              },
            );
          },
        ),
      ],
      child: child,
    );
  }
}
