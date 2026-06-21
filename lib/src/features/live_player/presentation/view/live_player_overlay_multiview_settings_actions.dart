import 'package:flutter/material.dart';

import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../live_player_screen_string.dart';
import 'live_player_overlay_links.dart';

List<Widget> liveOverlayMultiviewSettingsActions({
  required LiveOverlayMultiviewSettingsLinks links,
  required VoidCallback onDefaultSettingsPressed,
  required VoidCallback onBroadcastPressed,
  required VoidCallback onResolutionPressed,
  required VoidCallback onSoundPressed,
  required VoidCallback onInfoPressed,
}) {
  return [
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-multiview-defaults-action'),
      label: LivePlayerScreenString.overlayMultiviewDefaultSettings,
      icon: Icons.tune,
      anchorLink: links.defaults,
      autofocus: true,
      onPressed: onDefaultSettingsPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-multiview-broadcast-action'),
      label: LivePlayerScreenString.overlayBroadcastSettings,
      icon: Icons.live_tv_outlined,
      anchorLink: links.broadcast,
      onPressed: onBroadcastPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-multiview-resolution-action'),
      label: LivePlayerScreenString.overlayMultiviewResolutionSettings,
      icon: Icons.high_quality,
      anchorLink: links.resolution,
      onPressed: onResolutionPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-multiview-sound-action'),
      label: LivePlayerScreenString.overlayMultiviewSoundSettings,
      icon: Icons.volume_up_outlined,
      anchorLink: links.sound,
      onPressed: onSoundPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-multiview-info-action'),
      label: LivePlayerScreenString.overlayMultiviewInfo,
      icon: Icons.info_outline,
      anchorLink: links.info,
      onPressed: onInfoPressed,
    ),
  ];
}
