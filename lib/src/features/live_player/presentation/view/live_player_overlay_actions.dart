import 'package:flutter/material.dart';

import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_overlay_links.dart';

List<Widget> liveOverlayPrimaryActions({
  required LivePlayerState state,
  required LiveOverlayPrimaryLinks primaryLinks,
  required FocusNode settingsFocusNode,
  required bool playbackPaused,
  required VoidCallback onPlayPressed,
  required VoidCallback onMultiviewSettingsPressed,
  required VoidCallback onChatModePressed,
  required VoidCallback onScreenModePressed,
  required VoidCallback onViewModePressed,
  required VoidCallback onFavoritePressed,
  required VoidCallback onSettingsPressed,
}) {
  if (state.isMultiview) {
    return _liveOverlayMultiviewPrimaryActions(
      state: state,
      primaryLinks: primaryLinks,
      settingsFocusNode: settingsFocusNode,
      onMultiviewSettingsPressed: onMultiviewSettingsPressed,
      onChatModePressed: onChatModePressed,
      onScreenModePressed: onScreenModePressed,
      onSettingsPressed: onSettingsPressed,
      onViewModePressed: onViewModePressed,
    );
  }

  return [
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-play-action'),
      label: playbackPaused
          ? LivePlayerScreenString.overlayPlay
          : LivePlayerScreenString.overlayPause,
      icon: playbackPaused ? Icons.play_arrow : Icons.pause,
      anchorLink: primaryLinks.play,
      autofocus: true,
      onPressed: onPlayPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-chat-mode-action'),
      label: LivePlayerScreenString.overlayChatWindowMode,
      icon: Icons.chat_bubble_outline,
      anchorLink: primaryLinks.chatMode,
      onPressed: onChatModePressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-favorite-action'),
      label: LivePlayerScreenString.overlayFavorite,
      icon: Icons.bookmark_border,
      anchorLink: primaryLinks.favorite,
      onPressed: onFavoritePressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-settings-action'),
      label: LivePlayerScreenString.overlaySettings,
      icon: Icons.settings,
      anchorLink: primaryLinks.settings,
      focusNode: settingsFocusNode,
      onPressed: onSettingsPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-view-mode-action'),
      label: LivePlayerScreenString.overlayViewMode,
      icon: Icons.view_quilt_outlined,
      anchorLink: primaryLinks.viewMode,
      selected: state.viewMode == LivePlayerViewMode.multiview,
      onPressed: onViewModePressed,
    ),
  ];
}

List<Widget> _liveOverlayMultiviewPrimaryActions({
  required LivePlayerState state,
  required LiveOverlayPrimaryLinks primaryLinks,
  required FocusNode settingsFocusNode,
  required VoidCallback onMultiviewSettingsPressed,
  required VoidCallback onChatModePressed,
  required VoidCallback onScreenModePressed,
  required VoidCallback onSettingsPressed,
  required VoidCallback onViewModePressed,
}) {
  return [
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-multiview-settings-action'),
      label: LivePlayerScreenString.overlayMultiviewSettings,
      icon: Icons.dashboard_customize_outlined,
      anchorLink: primaryLinks.multiviewSettings,
      autofocus: true,
      onPressed: onMultiviewSettingsPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-chat-mode-action'),
      label: LivePlayerScreenString.overlayMultiviewChatMode,
      icon: Icons.chat_bubble_outline,
      anchorLink: primaryLinks.chatMode,
      onPressed: onChatModePressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-screen-mode-action'),
      label: LivePlayerScreenString.overlayScreenMode,
      icon: Icons.splitscreen_outlined,
      anchorLink: primaryLinks.screenMode,
      onPressed: onScreenModePressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-settings-action'),
      label: LivePlayerScreenString.overlaySettings,
      icon: Icons.settings,
      anchorLink: primaryLinks.settings,
      focusNode: settingsFocusNode,
      onPressed: onSettingsPressed,
    ),
    TvPlayerOverlayAction(
      key: const ValueKey('live-player-overlay-view-mode-action'),
      label: LivePlayerScreenString.overlayViewMode,
      icon: Icons.view_quilt_outlined,
      anchorLink: primaryLinks.viewMode,
      selected: state.viewMode == LivePlayerViewMode.multiview,
      onPressed: onViewModePressed,
    ),
  ];
}
