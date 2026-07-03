part of 'vod_player_view.dart';

final class _VodPlayerPlaybackLayer extends StatelessWidget {
  const _VodPlayerPlaybackLayer({
    required this.playbackPaused,
    required this.muted,
    required this.seekRequest,
    required this.playbackSnapshot,
  });

  final ValueListenable<bool> playbackPaused;
  final ValueListenable<bool> muted;
  final ValueListenable<VodPlayerSeekRequest?> seekRequest;
  final ValueNotifier<VodPlayerPlaybackSnapshot> playbackSnapshot;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: playbackPaused,
      builder: (context, playbackPaused, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: muted,
          builder: (context, muted, _) {
            return ValueListenableBuilder<VodPlayerSeekRequest?>(
              valueListenable: seekRequest,
              builder: (context, seekRequest, _) {
                return BlocBuilder<VodPlayerBloc, VodPlayerState>(
                  buildWhen: _vodPlayerPlaybackBuildWhen,
                  builder: (context, state) {
                    return VodPlayerSurface(
                      slot: state.activeSlot,
                      playbackPaused: playbackPaused,
                      muted: muted,
                      playbackSpeed: state.playbackSpeed,
                      seekRequest: seekRequest,
                      playbackSnapshot: playbackSnapshot,
                      chatPresentationModeIndex:
                          state.settingsPreferences.vodSettings.chatWindowIndex,
                      chatSettings: state.settingsPreferences.chatSettings,
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

bool _vodPlayerPlaybackBuildWhen(
  VodPlayerState previous,
  VodPlayerState current,
) {
  if (previous.activeSlotId != current.activeSlotId ||
      previous.primarySlotId != current.primarySlotId ||
      previous.playbackSpeed != current.playbackSpeed) {
    return true;
  }

  if (_vodPlayerPlaybackPreferencesChanged(
    previous.settingsPreferences,
    current.settingsPreferences,
  )) {
    return true;
  }

  return !_sameVodPlaybackSlotInput(previous.activeSlot, current.activeSlot);
}

bool _vodPlayerPlaybackPreferencesChanged(
  SettingsPreferences previous,
  SettingsPreferences current,
) {
  return previous.chatSettings != current.chatSettings ||
      previous.vodSettings.chatWindowIndex !=
          current.vodSettings.chatWindowIndex;
}

bool _sameVodPlaybackSlotInput(
  VodPlayerSlotState previous,
  VodPlayerSlotState current,
) {
  return previous.slotId == current.slotId &&
      previous.status == current.status &&
      previous.videoNo == current.videoNo &&
      previous.videoId == current.videoId &&
      previous.detail == current.detail &&
      previous.playbackUri == current.playbackUri &&
      previous.videoViewType == current.videoViewType &&
      previous.startPosition == current.startPosition;
}

void _updateVodPlayerPreferences(
  BuildContext context,
  SettingsPreferences preferences,
) {
  context.read<VodPlayerBloc>().add(
    VodPlayerEvent.preferencesChanged(
      preferences: preferences,
    ),
  );
}
