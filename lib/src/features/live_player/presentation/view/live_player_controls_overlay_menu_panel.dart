part of 'live_player_controls_overlay.dart';

Widget? _activeMenuPanel({
  required BuildContext context,
  required LivePlayerState state,
  required LivePlayerSlotState slot,
  required _LiveOverlayMenu activeMenu,
  required int? activeChatSettingIndex,
  required int? activeMultiviewDefaultSettingIndex,
  required LiveOverlayPrimaryLinks primaryLinks,
  required LiveOverlaySettingsLinks settingsLinks,
  required LiveOverlayMultiviewSettingsLinks multiviewSettingsLinks,
  required LiveOverlayMultiviewDefaultSettingsLinks
  multiviewDefaultSettingLinks,
  required List<LayerLink> chatSettingLinks,
  required bool playbackPaused,
  required bool muted,
  required ValueChanged<bool> onPlaybackPausedChanged,
  required ValueChanged<bool> onMutedChanged,
  required VoidCallback onInteraction,
  required VoidCallback onCloseMenu,
  required void Function(
    _LiveOverlayMenu menu, {
    int? chatSettingIndex,
    int? multiviewDefaultSettingIndex,
  })
  onOpenMenu,
  required ValueChanged<SettingsPreferences> onPreferencesChanged,
  required void Function({
    required String slotId,
    required int resolutionIndex,
  })
  onSlotResolutionSelected,
}) {
  if (activeMenu == _LiveOverlayMenu.multiviewInfo) {
    return null;
  }

  return switch (activeMenu) {
    _LiveOverlayMenu.none => null,
    _LiveOverlayMenu.play => LiveOverlayPlaybackMenu(
      anchorLink: primaryLinks.play,
      playbackPaused: playbackPaused,
      onPlaybackPausedChanged: onPlaybackPausedChanged,
      onDismiss: onCloseMenu,
    ),
    _LiveOverlayMenu.chatMode => LiveOverlayChatModeMenu(
      state: state,
      anchorLink: primaryLinks.chatMode,
      onDismiss: onCloseMenu,
      onPreferencesChanged: onPreferencesChanged,
    ),
    _LiveOverlayMenu.multiviewLayout => LiveOverlayMultiviewLayoutMenu(
      state: state,
      anchorLink: primaryLinks.screenMode,
      onInteraction: onInteraction,
      onDismiss: onCloseMenu,
    ),
    _LiveOverlayMenu.viewMode => LiveOverlayViewModeMenu(
      state: state,
      anchorLink: primaryLinks.viewMode,
      onInteraction: onInteraction,
      onDismiss: onCloseMenu,
    ),
    _LiveOverlayMenu.favorite => LiveOverlayFavoriteMenu(
      state: state,
      anchorLink: primaryLinks.favorite,
      onInteraction: onInteraction,
      onOpenGroupPressed: () => onOpenMenu(_LiveOverlayMenu.favoriteGroup),
      onDismiss: onCloseMenu,
    ),
    _LiveOverlayMenu.favoriteGroup => LiveOverlayGroupAddMenu(
      state: state,
      anchorLink: primaryLinks.favorite,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 2,
            actionCount: 5,
          ),
      onInteraction: onInteraction,
      onDismiss: onCloseMenu,
    ),
    _LiveOverlayMenu.multiviewBroadcast => LiveOverlayMultiviewBroadcastMenu(
      state: state,
      anchorLink: multiviewSettingsLinks.broadcast,
      onInteraction: onInteraction,
      onDismiss: onCloseMenu,
    ),
    _LiveOverlayMenu.multiviewDefaultSetting =>
      LiveOverlayMultiviewDefaultSettingMenu(
        preferences: state.settingsPreferences,
        settingIndex: activeMultiviewDefaultSettingIndex,
        links: multiviewDefaultSettingLinks.all,
        onDismiss: onCloseMenu,
        onPreferencesChanged: onPreferencesChanged,
      ),
    _LiveOverlayMenu.multiviewResolution => LiveOverlayMultiviewResolutionMenu(
      state: state,
      anchorLink: multiviewSettingsLinks.resolution,
      onInteraction: onInteraction,
      onDismiss: onCloseMenu,
      onResolutionSelected: onSlotResolutionSelected,
    ),
    _LiveOverlayMenu.multiviewSound => LiveOverlayMultiviewSoundMenu(
      state: state,
      anchorLink: multiviewSettingsLinks.sound,
      onInteraction: onInteraction,
      onDismiss: onCloseMenu,
    ),
    _LiveOverlayMenu.multiviewInfo => LiveOverlayMultiviewInfoMenu(
      state: state,
      anchorLink: multiviewSettingsLinks.info,
      onDismiss: onCloseMenu,
    ),
    _LiveOverlayMenu.resolution => LiveOverlayResolutionMenu(
      state: state,
      slot: slot,
      anchorLink: settingsLinks.resolution,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 1,
            actionCount: 4,
          ),
      onDismiss: onCloseMenu,
      onPreferencesChanged: onPreferencesChanged,
    ),
    _LiveOverlayMenu.sound => LiveOverlaySoundMenu(
      slot: slot,
      anchorLink: settingsLinks.sound,
      muted: muted,
      onMutedChanged: onMutedChanged,
      onDismiss: onCloseMenu,
    ),
    _LiveOverlayMenu.group => LiveOverlayGroupSettingsMenu(
      state: state,
      anchorLink: settingsLinks.group,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 3,
            actionCount: 4,
          ),
      onInteraction: onInteraction,
      onDismiss: onCloseMenu,
      onPreferencesChanged: onPreferencesChanged,
    ),
    _LiveOverlayMenu.chatSetting => PlayerChatSettingMenu(
      preferences: state.settingsPreferences,
      chatSettingIndex: activeChatSettingIndex,
      chatSettingLinks: chatSettingLinks,
      onDismiss: onCloseMenu,
      onPreferencesChanged: onPreferencesChanged,
    ),
  };
}
