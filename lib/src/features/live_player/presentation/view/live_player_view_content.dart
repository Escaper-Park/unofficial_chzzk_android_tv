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
    return BlocSelector<
      LivePlayerBloc,
      LivePlayerState,
      _LivePlayerPlaybackSnapshot
    >(
      selector: _LivePlayerPlaybackSnapshot.new,
      builder: (context, snapshot) {
        final state = snapshot.state;
        final chatLayer = _livePlayerHasChatLayer(state)
            ? _LivePlayerChatLayerSelector(
                playbackPaused: playbackPaused,
                appPlaybackSuspended: appPlaybackSuspended,
                connectLiveChat: connectLiveChat,
              )
            : null;

        return _LivePlayerSessionLifecycle(
          state: state,
          playbackPaused: playbackPaused,
          appPlaybackSuspended: appPlaybackSuspended,
          child: LivePlayerPlaybackLayout(
            state: state,
            playbackPaused: playbackPaused,
            singleMuted: muted,
            appPlaybackSuspended: appPlaybackSuspended,
            chat: chatLayer,
            playbackSessionController: playbackSessionController,
            statusSurfaceFor: _livePlayerStatusSurfaceFor,
          ),
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

@immutable
final class _LivePlayerPlaybackSnapshot {
  const _LivePlayerPlaybackSnapshot(this.state);

  final LivePlayerState state;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerPlaybackSnapshot &&
            !_livePlayerPlaybackBuildWhen(other.state, state);
  }

  @override
  int get hashCode => Object.hashAll([
    state.viewMode,
    state.multiviewLayoutMode,
    state.activeSlotId,
    state.primarySlotId,
    _unorderedStringSetHash(state.audibleSlotIds),
    _stringDoubleMapHash(state.slotVolumeById),
    state.activeSlotHighlightSerial,
    _livePlayerPlaybackPreferencesHash(state.settingsPreferences),
    _livePlayerHasChatLayer(state),
    _activeSlotPlaybackInputHash(state.activeSlot),
    _hasPlayableLiveSlot(state),
    Object.hashAll(state.slots.map((slot) => slot.slotId)),
  ]);
}

int _livePlayerPlaybackPreferencesHash(SettingsPreferences preferences) {
  final live = preferences.liveSettings;
  return Object.hashAll([
    preferences.chatSettings,
    live.chatWindowIndex,
    live.multiviewChatWindowIndex,
    live.multiviewChatPositionX,
    live.multiviewChatPositionY,
    live.multiviewPipLayoutIndex,
    live.multiviewPipPositionX,
    live.multiviewPipPositionY,
    live.multiviewPipSize,
  ]);
}

int _activeSlotPlaybackInputHash(LivePlayerSlotState slot) {
  return Object.hash(
    slot.slotId,
    slot.status,
    slot.channelId,
    slot.playbackUri,
    slot.expectedVideoWidth,
    slot.expectedVideoHeight,
  );
}

int _unorderedStringSetHash(Set<String> values) {
  final sortedValues = values.toList()..sort();
  return Object.hashAll(sortedValues);
}

int _stringDoubleMapHash(Map<String, double> values) {
  final entries = values.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));
  return Object.hashAll(
    entries.map((entry) => Object.hash(entry.key, entry.value)),
  );
}
