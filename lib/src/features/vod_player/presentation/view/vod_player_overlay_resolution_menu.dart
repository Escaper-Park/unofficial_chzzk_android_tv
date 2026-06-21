import 'package:flutter/material.dart';

import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/presentation/settings_screen_string.dart';
import '../../domain/use_cases/resolve_vod_playback_uri.dart';
import '../bloc/vod_player_bloc.dart';
import '../vod_player_screen_string.dart';
import 'vod_player_overlay_menu_widgets.dart';

class VodOverlayResolutionMenu extends StatelessWidget {
  const VodOverlayResolutionMenu({
    super.key,
    required this.state,
    required this.slot,
    required this.anchorLink,
    required this.horizontalOffset,
    required this.onDismiss,
    required this.onPreferencesChanged,
  });

  final VodPlayerState state;
  final VodPlayerSlotState slot;
  final LayerLink anchorLink;
  final double horizontalOffset;
  final VoidCallback onDismiss;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    final values = VodPlaybackResolutionOptions.menuIndexes(
      slot.availableResolutionIndexes,
    );
    final selectedIndex = VodPlaybackResolutionOptions.effectiveSelectedIndex(
      preferredIndex: state.settingsPreferences.vodSettings.resolutionIndex,
      availableIndexes: slot.availableResolutionIndexes,
    );

    return VodOverlayStandardMenu(
      header: VodPlayerScreenString.resolutionSettings,
      anchorLink: anchorLink,
      horizontalOffset: horizontalOffset,
      itemCount: values.length,
      onDismiss: onDismiss,
      child: VodOverlayOptionList(
        children: [
          for (final value in values)
            VodOverlayOptionItem(
              title: SettingsScreenString.resolutionLabel(value),
              selected: selectedIndex == value,
              autofocus: selectedIndex == value,
              onPressed: () {
                onPreferencesChanged(
                  state.settingsPreferences.copyWith(
                    vodSettings: state.settingsPreferences.vodSettings.copyWith(
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
