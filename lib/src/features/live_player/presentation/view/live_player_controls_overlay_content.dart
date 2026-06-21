part of 'live_player_controls_overlay.dart';

Widget _livePlayerControlsMainSurface({
  required LivePlayerState state,
  required LivePlayerSlotState slot,
  required _LiveOverlayActionMode actionMode,
  required bool showingMultiviewInfo,
  required List<LayerLink> chatSettingLinks,
  required void Function(
    _LiveOverlayMenu menu, {
    int? chatSettingIndex,
    int? multiviewDefaultSettingIndex,
  })
  onOpenMenu,
  required ValueChanged<_LiveOverlayActionMode> onActionModeChanged,
  required LiveOverlaySettingsLinks settingsLinks,
  required FocusNode settingsFirstFocusNode,
  required bool muted,
  required LiveOverlayMultiviewSettingsLinks multiviewSettingsLinks,
  required LiveOverlayMultiviewDefaultSettingsLinks
  multiviewDefaultSettingLinks,
  required LiveOverlayPrimaryLinks primaryLinks,
  required bool playbackPaused,
}) {
  if (showingMultiviewInfo) {
    return LivePlayerMultiviewInfoPanel(state: state);
  }

  if (actionMode == _LiveOverlayActionMode.chatSettings) {
    return PlayerChatSettingsPanel(
      links: chatSettingLinks,
      onPressed: (index) => onOpenMenu(
        _LiveOverlayMenu.chatSetting,
        chatSettingIndex: index,
      ),
    );
  }

  return TvPlayerOverlayControls(
    channelName: slot.channelName ?? slot.channelId ?? '',
    channelVerified: slot.channelVerified,
    title: slot.title ?? '',
    actions: switch (actionMode) {
      _LiveOverlayActionMode.settings => liveOverlaySettingsActions(
        settingsLinks: settingsLinks,
        firstFocusNode: settingsFirstFocusNode,
        muted: muted,
        onChatSettingsPressed: () => onActionModeChanged(
          _LiveOverlayActionMode.chatSettings,
        ),
        onResolutionPressed: () => onOpenMenu(_LiveOverlayMenu.resolution),
        onSoundPressed: () => onOpenMenu(_LiveOverlayMenu.sound),
        onGroupPressed: () => onOpenMenu(_LiveOverlayMenu.group),
      ),
      _LiveOverlayActionMode.multiviewSettings =>
        liveOverlayMultiviewSettingsActions(
          links: multiviewSettingsLinks,
          onDefaultSettingsPressed: () => onActionModeChanged(
            _LiveOverlayActionMode.multiviewDefaultSettings,
          ),
          onBroadcastPressed: () => onOpenMenu(
            _LiveOverlayMenu.multiviewBroadcast,
          ),
          onResolutionPressed: () => onOpenMenu(
            _LiveOverlayMenu.multiviewResolution,
          ),
          onSoundPressed: () => onOpenMenu(_LiveOverlayMenu.multiviewSound),
          onInfoPressed: () => onOpenMenu(_LiveOverlayMenu.multiviewInfo),
        ),
      _LiveOverlayActionMode.multiviewDefaultSettings =>
        liveOverlayMultiviewDefaultSettingsActions(
          links: multiviewDefaultSettingLinks,
          onPressed: (index) => onOpenMenu(
            _LiveOverlayMenu.multiviewDefaultSetting,
            multiviewDefaultSettingIndex: index,
          ),
        ),
      _ => liveOverlayPrimaryActions(
        state: state,
        primaryLinks: primaryLinks,
        settingsFocusNode: settingsFirstFocusNode,
        playbackPaused: playbackPaused,
        onPlayPressed: () => onOpenMenu(_LiveOverlayMenu.play),
        onMultiviewSettingsPressed: () => onActionModeChanged(
          _LiveOverlayActionMode.multiviewSettings,
        ),
        onChatModePressed: () => onOpenMenu(_LiveOverlayMenu.chatMode),
        onScreenModePressed: () => onOpenMenu(_LiveOverlayMenu.multiviewLayout),
        onViewModePressed: () => onOpenMenu(_LiveOverlayMenu.viewMode),
        onFavoritePressed: () => onOpenMenu(_LiveOverlayMenu.favorite),
        onSettingsPressed: () => onActionModeChanged(
          _LiveOverlayActionMode.settings,
        ),
      ),
    },
    playbackInfo: LiveOverlayRealtimeInfo(slot: slot),
  );
}
