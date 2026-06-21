import 'package:flutter/material.dart';

import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../live_player_screen_string.dart';
import 'live_player_overlay_links.dart';

List<Widget> liveOverlaySettingsActions({
  required LiveOverlaySettingsLinks settingsLinks,
  required FocusNode firstFocusNode,
  required bool muted,
  required VoidCallback onChatSettingsPressed,
  required VoidCallback onResolutionPressed,
  required VoidCallback onSoundPressed,
  required VoidCallback onGroupPressed,
}) {
  return [
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-chat-settings-action'),
      label: LivePlayerScreenString.overlayChatSettings,
      icon: Icons.chat_bubble_outline,
      anchorLink: settingsLinks.chat,
      focusNode: firstFocusNode,
      autofocus: true,
      onPressed: onChatSettingsPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-resolution-action'),
      label: LivePlayerScreenString.overlayResolutionSettings,
      icon: Icons.high_quality,
      anchorLink: settingsLinks.resolution,
      onPressed: onResolutionPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-sound-action'),
      label: LivePlayerScreenString.overlaySoundSettings,
      icon: muted ? Icons.volume_off : Icons.volume_up,
      anchorLink: settingsLinks.sound,
      onPressed: onSoundPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-group-action'),
      label: LivePlayerScreenString.overlayGroupSettings,
      icon: Icons.folder_outlined,
      anchorLink: settingsLinks.group,
      onPressed: onGroupPressed,
    ),
  ];
}
