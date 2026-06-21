part of 'vod_player_view.dart';

final class _VodPlayerViewListeners extends StatelessWidget {
  const _VodPlayerViewListeners({
    required this.playbackSnapshot,
    required this.lastVisibleChatWindowIndex,
    required this.feedbackController,
    required this.child,
  });

  final ValueNotifier<VodPlayerPlaybackSnapshot> playbackSnapshot;
  final ObjectRef<int> lastVisibleChatWindowIndex;
  final TvSnackbarFeedbackController feedbackController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<VodPlayerBloc, VodPlayerState>(
          listenWhen: (previous, current) {
            final previousSlot = previous.activeSlot;
            final currentSlot = current.activeSlot;
            return previousSlot.videoNo != currentSlot.videoNo ||
                previousSlot.playbackUri != currentSlot.playbackUri ||
                previousSlot.startPosition != currentSlot.startPosition ||
                previousSlot.duration != currentSlot.duration;
          },
          listener: (_, state) {
            playbackSnapshot.value = vodPlayerPlaybackSnapshotForSlot(
              state.activeSlot,
            );
          },
        ),
        BlocListener<VodPlayerBloc, VodPlayerState>(
          listenWhen: (previous, current) {
            return previous.settingsPreferences.vodSettings.chatWindowIndex !=
                current.settingsPreferences.vodSettings.chatWindowIndex;
          },
          listener: (_, state) {
            final value = state.settingsPreferences.vodSettings.chatWindowIndex;
            if (value != vodChatWindowHiddenIndex) {
              lastVisibleChatWindowIndex.value = value;
            }
          },
        ),
        BlocListener<VodPlayerBloc, VodPlayerState>(
          listenWhen: (previous, current) {
            return previous.feedbackSerial != current.feedbackSerial;
          },
          listener: (context, state) {
            feedbackController.schedule(
              serial: state.feedbackSerial,
              visible: state.feedbackType != null,
              onElapsed: (serial) {
                context.read<VodPlayerBloc>().add(
                  VodPlayerEvent.feedbackCleared(serial: serial),
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
