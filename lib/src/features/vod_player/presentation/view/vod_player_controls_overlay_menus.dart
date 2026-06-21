part of 'vod_player_controls_overlay.dart';

Widget? _activeMenuPanel({
  required BuildContext context,
  required VodPlayerState state,
  required VodPlayerSlotState slot,
  required Duration currentPosition,
  required _VodOverlayMenu activeMenu,
  required int? activeChatSettingIndex,
  required VodOverlayPrimaryLinks primaryLinks,
  required VodOverlaySettingsLinks settingsLinks,
  required List<LayerLink> chatSettingLinks,
  required bool muted,
  required ValueChanged<bool> onMutedChanged,
  required ValueChanged<Duration> onSeek,
  required VoidCallback onInteraction,
  required VoidCallback onCloseMenu,
  required void Function(_VodOverlayMenu menu, {int? chatSettingIndex})
  onOpenMenu,
  required ValueChanged<SettingsPreferences> onPreferencesChanged,
}) {
  return switch (activeMenu) {
    _VodOverlayMenu.none => null,
    _VodOverlayMenu.chatMode => VodOverlayChatModeMenu(
      state: state,
      anchorLink: primaryLinks.chatMode,
      onDismiss: onCloseMenu,
      onPreferencesChanged: onPreferencesChanged,
    ),
    _VodOverlayMenu.chapters => VodPlayerChapterPanel(
      chapters: slot.chapters,
      currentPosition: currentPosition,
      onChapterSelected: (chapter) => onSeek(
        Duration(milliseconds: chapter.startTime),
      ),
      onDismiss: onCloseMenu,
    ),
    _VodOverlayMenu.favorite => VodOverlayFavoriteMenu(
      slot: slot,
      anchorLink: primaryLinks.favorite,
      onInteraction: onInteraction,
      onOpenGroupPressed: () => onOpenMenu(_VodOverlayMenu.favoriteGroup),
      onDismiss: onCloseMenu,
    ),
    _VodOverlayMenu.favoriteGroup => VodOverlayGroupAddMenu(
      state: state,
      anchorLink: primaryLinks.favorite,
      horizontalOffset:
          VodPlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 3,
            actionCount: 5,
          ),
      onInteraction: onInteraction,
      onDismiss: onCloseMenu,
    ),
    _VodOverlayMenu.resolution => VodOverlayResolutionMenu(
      state: state,
      slot: slot,
      anchorLink: settingsLinks.resolution,
      horizontalOffset:
          VodPlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 1,
            actionCount: 4,
          ),
      onDismiss: onCloseMenu,
      onPreferencesChanged: onPreferencesChanged,
    ),
    _VodOverlayMenu.sound => VodOverlaySoundMenu(
      slot: slot,
      anchorLink: settingsLinks.sound,
      muted: muted,
      onMutedChanged: onMutedChanged,
      onDismiss: onCloseMenu,
    ),
    _VodOverlayMenu.speed => VodOverlaySpeedMenu(
      state: state,
      anchorLink: settingsLinks.speed,
      onInteraction: onInteraction,
      onDismiss: onCloseMenu,
    ),
    _VodOverlayMenu.chatSetting => PlayerChatSettingMenu(
      preferences: state.settingsPreferences,
      chatSettingIndex: activeChatSettingIndex,
      chatSettingLinks: chatSettingLinks,
      onDismiss: onCloseMenu,
      onPreferencesChanged: onPreferencesChanged,
    ),
  };
}
