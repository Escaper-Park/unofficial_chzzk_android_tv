part of 'vod_player_controls_overlay.dart';

Widget _vodPlayerControlsMainSurface({
  required VodPlayerState state,
  required VodPlayerSlotState slot,
  required _VodOverlayActionMode actionMode,
  required List<LayerLink> chatSettingLinks,
  required void Function(
    _VodOverlayMenu menu, {
    int? chatSettingIndex,
  })
  onOpenMenu,
  required ValueChanged<_VodOverlayActionMode> onActionModeChanged,
  required FocusScopeNode actionsSectionNode,
  required FocusScopeNode seekSectionNode,
  required VodOverlaySettingsLinks settingsLinks,
  required FocusNode settingsFirstFocusNode,
  required bool muted,
  required VodOverlayPrimaryLinks primaryLinks,
  required bool playbackPaused,
  required ValueChanged<bool> onPlaybackPausedChanged,
  required VodPlayerPlaybackSnapshotListenable playbackSnapshot,
  required Duration duration,
  required List<TvVodOverlaySeekChapter> seekChapters,
  required TvVodOverlaySeekThumbnail? seekThumbnail,
  required ValueChanged<Duration> onSeek,
  required TvVodOverlaySeekFeedbackCallback? onSeekFeedback,
  required VoidCallback onInteraction,
}) {
  if (actionMode == _VodOverlayActionMode.chatSettings) {
    return PlayerChatSettingsPanel(
      links: chatSettingLinks,
      onPressed: (index) => onOpenMenu(
        _VodOverlayMenu.chatSetting,
        chatSettingIndex: index,
      ),
    );
  }

  return TvPlayerOverlayControls(
    channelName: slot.channelName ?? '',
    channelVerified: slot.channelVerified,
    title: slot.title ?? '',
    actionsSectionNode: actionsSectionNode,
    actionsSectionDown: seekSectionNode,
    playbackInfoSectionNode: seekSectionNode,
    playbackInfoSectionUp: actionsSectionNode,
    actions: actionMode == _VodOverlayActionMode.settings
        ? vodOverlaySettingsActions(
            settingsLinks: settingsLinks,
            firstFocusNode: settingsFirstFocusNode,
            muted: muted,
            onChatSettingsPressed: () => onActionModeChanged(
              _VodOverlayActionMode.chatSettings,
            ),
            onResolutionPressed: () => onOpenMenu(_VodOverlayMenu.resolution),
            onSoundPressed: () => onOpenMenu(_VodOverlayMenu.sound),
            onSpeedPressed: () => onOpenMenu(_VodOverlayMenu.speed),
          )
        : vodOverlayPrimaryActions(
            slot: slot,
            primaryLinks: primaryLinks,
            playbackPaused: playbackPaused,
            settingsFocusNode: settingsFirstFocusNode,
            onPlayPressed: () {
              onInteraction();
              onPlaybackPausedChanged(!playbackPaused);
            },
            onChatModePressed: () => onOpenMenu(_VodOverlayMenu.chatMode),
            onChaptersPressed: () => onOpenMenu(_VodOverlayMenu.chapters),
            onFavoritePressed: () => onOpenMenu(_VodOverlayMenu.favorite),
            onSettingsPressed: () => onActionModeChanged(
              _VodOverlayActionMode.settings,
            ),
          ),
    playbackInfo: _vodPlayerControlsPlaybackInfo(
      state: state,
      slot: slot,
      playbackSnapshot: playbackSnapshot,
      duration: duration,
      chapters: seekChapters,
      seekThumbnail: seekThumbnail,
      onSeek: (position) {
        onInteraction();
        onSeek(position);
      },
      onSeekFeedback: onSeekFeedback,
      onInteraction: onInteraction,
    ),
  );
}
