import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayMultiviewLayoutMenu extends StatelessWidget {
  const LiveOverlayMultiviewLayoutMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.onInteraction,
    required this.onDismiss,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onInteraction;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayScreenMode,
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 2,
            actionCount: 5,
          ),
      itemCount: LivePlayerMultiviewLayoutMode.values.length,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          for (final mode in LivePlayerMultiviewLayoutMode.values)
            LiveOverlayOptionItem(
              title: _multiviewLayoutModeLabel(mode),
              icon: _multiviewLayoutModeIcon(mode),
              selected: state.multiviewLayoutMode == mode,
              autofocus: state.multiviewLayoutMode == mode,
              onPressed: () {
                onInteraction();
                context.read<LivePlayerBloc>().add(
                  LivePlayerEvent.multiviewLayoutModeSelected(
                    layoutMode: mode,
                  ),
                );
                onDismiss();
              },
            ),
        ],
      ),
    );
  }
}

class LiveOverlayViewModeMenu extends StatelessWidget {
  const LiveOverlayViewModeMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.onInteraction,
    required this.onDismiss,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onInteraction;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayViewMode,
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 4,
            actionCount: 5,
          ),
      itemCount: 2,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          LiveOverlayOptionItem(
            title: LivePlayerScreenString.overlaySingleView,
            icon: Icons.crop_16_9,
            selected: state.viewMode == LivePlayerViewMode.single,
            autofocus: state.viewMode == LivePlayerViewMode.single,
            onPressed: () {
              onInteraction();
              context.read<LivePlayerBloc>().add(
                const LivePlayerEvent.viewModeSelected(
                  viewMode: LivePlayerViewMode.single,
                ),
              );
              onDismiss();
            },
          ),
          LiveOverlayOptionItem(
            title: LivePlayerScreenString.overlayMultiView,
            icon: Icons.grid_view,
            selected: state.viewMode == LivePlayerViewMode.multiview,
            autofocus: state.viewMode == LivePlayerViewMode.multiview,
            onPressed: () {
              onInteraction();
              context.read<LivePlayerBloc>().add(
                const LivePlayerEvent.viewModeSelected(
                  viewMode: LivePlayerViewMode.multiview,
                ),
              );
              onDismiss();
            },
          ),
        ],
      ),
    );
  }
}

String _multiviewLayoutModeLabel(LivePlayerMultiviewLayoutMode mode) {
  return LivePlayerScreenString.multiviewLayoutModeLabel(mode);
}

IconData _multiviewLayoutModeIcon(LivePlayerMultiviewLayoutMode mode) {
  return switch (mode) {
    LivePlayerMultiviewLayoutMode.pbp => Icons.grid_view_outlined,
    LivePlayerMultiviewLayoutMode.pip => Icons.picture_in_picture_alt_outlined,
    LivePlayerMultiviewLayoutMode.focus => Icons.center_focus_strong_outlined,
  };
}
