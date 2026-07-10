part of 'vod_player_controls_overlay.dart';

class _VodPlayerControlsOverlayMenuHost extends StatelessWidget {
  const _VodPlayerControlsOverlayMenuHost({
    required this.state,
    required this.slot,
    required this.playbackSnapshot,
    required this.activeMenu,
    required this.activeChatSettingIndex,
    required this.primaryLinks,
    required this.settingsLinks,
    required this.chatSettingLinks,
    required this.muted,
    required this.onMutedChanged,
    required this.onSeek,
    required this.onInteraction,
    required this.onCloseMenu,
    required this.onOpenMenu,
    required this.onPreferencesChanged,
  });

  final VodPlayerState state;
  final VodPlayerSlotState slot;
  final VodPlayerPlaybackSnapshotListenable playbackSnapshot;
  final _VodOverlayMenu activeMenu;
  final int? activeChatSettingIndex;
  final VodOverlayPrimaryLinks primaryLinks;
  final VodOverlaySettingsLinks settingsLinks;
  final List<LayerLink> chatSettingLinks;
  final bool muted;
  final ValueChanged<bool> onMutedChanged;
  final ValueChanged<Duration> onSeek;
  final VoidCallback onInteraction;
  final VoidCallback onCloseMenu;
  final void Function(_VodOverlayMenu menu, {int? chatSettingIndex}) onOpenMenu;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    if (activeMenu != _VodOverlayMenu.chapters) {
      return _activeMenuPanel(
            context: context,
            state: state,
            slot: slot,
            currentPosition: Duration.zero,
            activeMenu: activeMenu,
            activeChatSettingIndex: activeChatSettingIndex,
            primaryLinks: primaryLinks,
            settingsLinks: settingsLinks,
            chatSettingLinks: chatSettingLinks,
            muted: muted,
            onMutedChanged: (value) {
              onInteraction();
              onMutedChanged(value);
            },
            onSeek: (position) {
              onInteraction();
              onSeek(position);
              onCloseMenu();
            },
            onInteraction: onInteraction,
            onCloseMenu: onCloseMenu,
            onOpenMenu: onOpenMenu,
            onPreferencesChanged: onPreferencesChanged,
          ) ??
          const SizedBox.shrink();
    }

    return ValueListenableBuilder<VodPlayerPlaybackSnapshot>(
      valueListenable: playbackSnapshot,
      builder: (context, snapshot, _) {
        return _activeMenuPanel(
              context: context,
              state: state,
              slot: slot,
              currentPosition: snapshot.position,
              activeMenu: activeMenu,
              activeChatSettingIndex: activeChatSettingIndex,
              primaryLinks: primaryLinks,
              settingsLinks: settingsLinks,
              chatSettingLinks: chatSettingLinks,
              muted: muted,
              onMutedChanged: (value) {
                onInteraction();
                onMutedChanged(value);
              },
              onSeek: (position) {
                onInteraction();
                onSeek(position);
                onCloseMenu();
              },
              onInteraction: onInteraction,
              onCloseMenu: onCloseMenu,
              onOpenMenu: onOpenMenu,
              onPreferencesChanged: onPreferencesChanged,
            ) ??
            const SizedBox.shrink();
      },
    );
  }
}
