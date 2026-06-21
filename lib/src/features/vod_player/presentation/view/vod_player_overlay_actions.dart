import 'package:flutter/material.dart';

import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../bloc/vod_player_bloc.dart';
import '../vod_player_screen_string.dart';

List<Widget> vodOverlayPrimaryActions({
  required VodPlayerSlotState slot,
  required VodOverlayPrimaryLinks primaryLinks,
  required FocusNode settingsFocusNode,
  required bool playbackPaused,
  required VoidCallback onPlayPressed,
  required VoidCallback onChatModePressed,
  required VoidCallback onChaptersPressed,
  required VoidCallback onFavoritePressed,
  required VoidCallback onSettingsPressed,
}) {
  return [
    TvPlayerOverlayAction(
      key: const ValueKey('vod-player-overlay-play-action'),
      label: playbackPaused
          ? VodPlayerScreenString.play
          : VodPlayerScreenString.pause,
      icon: playbackPaused ? Icons.play_arrow : Icons.pause,
      anchorLink: primaryLinks.play,
      autofocus: true,
      onPressed: onPlayPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('vod-player-overlay-chat-mode-action'),
      label: VodPlayerScreenString.chatMode,
      icon: Icons.chat_bubble_outline,
      anchorLink: primaryLinks.chatMode,
      onPressed: onChatModePressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('vod-player-overlay-chapters-action'),
      label: VodPlayerScreenString.chapters,
      icon: Icons.format_list_bulleted,
      anchorLink: primaryLinks.chapters,
      enabled: slot.chapters.isNotEmpty,
      onPressed: onChaptersPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('vod-player-overlay-favorite-action'),
      label: VodPlayerScreenString.favorite,
      icon: Icons.bookmark_border,
      anchorLink: primaryLinks.favorite,
      onPressed: onFavoritePressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('vod-player-overlay-settings-action'),
      label: VodPlayerScreenString.settings,
      icon: Icons.settings,
      anchorLink: primaryLinks.settings,
      focusNode: settingsFocusNode,
      onPressed: onSettingsPressed,
    ),
  ];
}

List<Widget> vodOverlaySettingsActions({
  required VodOverlaySettingsLinks settingsLinks,
  required FocusNode firstFocusNode,
  required bool muted,
  required VoidCallback onChatSettingsPressed,
  required VoidCallback onResolutionPressed,
  required VoidCallback onSoundPressed,
  required VoidCallback onSpeedPressed,
}) {
  return [
    TvPlayerOverlayAction(
      key: const ValueKey('vod-player-overlay-chat-settings-action'),
      label: VodPlayerScreenString.chatSettings,
      icon: Icons.chat_bubble_outline,
      anchorLink: settingsLinks.chat,
      focusNode: firstFocusNode,
      autofocus: true,
      onPressed: onChatSettingsPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('vod-player-overlay-resolution-action'),
      label: VodPlayerScreenString.resolutionSettings,
      icon: Icons.high_quality,
      anchorLink: settingsLinks.resolution,
      onPressed: onResolutionPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('vod-player-overlay-sound-action'),
      label: VodPlayerScreenString.soundSettings,
      icon: muted ? Icons.volume_off : Icons.volume_up,
      anchorLink: settingsLinks.sound,
      onPressed: onSoundPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('vod-player-overlay-speed-action'),
      label: VodPlayerScreenString.speedSettings,
      icon: Icons.speed,
      anchorLink: settingsLinks.speed,
      onPressed: onSpeedPressed,
    ),
  ];
}

final class VodOverlayPrimaryLinks {
  VodOverlayPrimaryLinks();

  final play = LayerLink();
  final chatMode = LayerLink();
  final chapters = LayerLink();
  final favorite = LayerLink();
  final settings = LayerLink();
}

final class VodOverlaySettingsLinks {
  VodOverlaySettingsLinks();

  final chat = LayerLink();
  final resolution = LayerLink();
  final sound = LayerLink();
  final speed = LayerLink();
}
