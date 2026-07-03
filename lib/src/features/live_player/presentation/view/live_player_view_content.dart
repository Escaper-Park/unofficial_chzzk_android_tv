part of 'live_player_view.dart';

final class _LivePlayerPlaybackLayer extends StatelessWidget {
  const _LivePlayerPlaybackLayer({
    required this.playbackPaused,
    required this.muted,
    required this.appPlaybackSuspended,
    required this.connectLiveChat,
    required this.playbackSessionController,
  });

  final ValueListenable<bool> playbackPaused;
  final ValueListenable<bool> muted;
  final bool appPlaybackSuspended;
  final ConnectLiveChat connectLiveChat;
  final LivePlayerPlaybackSessionController playbackSessionController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: playbackPaused,
      builder: (context, playbackPaused, _) {
        final effectivePlaybackPaused = playbackPaused || appPlaybackSuspended;

        return ValueListenableBuilder<bool>(
          valueListenable: muted,
          builder: (context, muted, _) {
            return BlocBuilder<LivePlayerBloc, LivePlayerState>(
              buildWhen: _livePlayerPlaybackBuildWhen,
              builder: (context, state) {
                final slot = state.activeSlot;
                final chatLayer = _livePlayerChatLayerFor(
                  state: state,
                  slot: slot,
                  playbackPaused: effectivePlaybackPaused,
                  appPlaybackSuspended: appPlaybackSuspended,
                  connectLiveChat: connectLiveChat,
                );

                return _LivePlayerSessionLifecycle(
                  state: state,
                  playbackPaused: effectivePlaybackPaused,
                  child: LivePlayerPlaybackLayout(
                    state: state,
                    playbackPaused: effectivePlaybackPaused,
                    singleMuted: muted,
                    chat: chatLayer,
                    playbackSessionController: playbackSessionController,
                    statusSurfaceFor: _livePlayerStatusSurfaceFor,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

void _updateLivePlayerPreferences(
  BuildContext context,
  SettingsPreferences preferences,
) {
  context.read<LivePlayerBloc>().add(
    LivePlayerEvent.preferencesChanged(
      preferences: preferences,
    ),
  );
}
