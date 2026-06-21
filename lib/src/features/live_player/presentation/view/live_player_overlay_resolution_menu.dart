import 'package:flutter/material.dart';

import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/presentation/settings_screen_string.dart';
import '../../domain/use_cases/resolve_live_playback_uri.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayResolutionMenu extends StatelessWidget {
  const LiveOverlayResolutionMenu({
    super.key,
    required this.state,
    required this.slot,
    required this.anchorLink,
    required this.horizontalOffset,
    required this.onDismiss,
    required this.onPreferencesChanged,
  });

  final LivePlayerState state;
  final LivePlayerSlotState slot;
  final LayerLink anchorLink;
  final double horizontalOffset;
  final VoidCallback onDismiss;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    final values = LivePlaybackResolutionOptions.menuIndexes(
      slot.availableResolutionIndexes,
    );
    final preferredIndex =
        state.settingsPreferences.liveSettings.resolutionIndex;
    final selectedIndex = LivePlaybackResolutionOptions.effectiveSelectedIndex(
      preferredIndex: preferredIndex,
      availableIndexes: slot.availableResolutionIndexes,
    );

    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayResolutionSettings,
      anchorLink: anchorLink,
      horizontalOffset: horizontalOffset,
      itemCount: values.length,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          for (final value in values)
            LiveOverlayOptionItem(
              title: SettingsScreenString.resolutionLabel(value),
              selected: selectedIndex == value,
              autofocus: selectedIndex == value,
              onPressed: () {
                onPreferencesChanged(
                  state.settingsPreferences.copyWith(
                    liveSettings: state.settingsPreferences.liveSettings
                        .copyWith(
                          resolutionIndex: value,
                        ),
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
