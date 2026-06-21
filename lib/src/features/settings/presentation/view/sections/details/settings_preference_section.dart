import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/settings_bloc.dart';
import '../../../models/settings_preference_groups.dart';
import '../../../settings_screen_design.dart';
import '../../../settings_screen_string.dart';
import '../../shared/settings_focus_registry.dart';
import 'settings_preference_row.dart';

class SettingsPreferenceSection extends StatelessWidget {
  const SettingsPreferenceSection({
    super.key,
    required this.state,
    required this.firstFocusNode,
    required this.focusRegistry,
  });

  final SettingsState state;
  final FocusNode firstFocusNode;
  final SettingsFocusRegistry focusRegistry;

  @override
  Widget build(BuildContext context) {
    final category = state.selectedCategory;
    final preferences = settingsPreferencesFor(category);

    return Column(
      spacing: SettingsScreenDesign.rowGap,
      children: [
        for (var index = 0; index < preferences.length; index += 1)
          SettingsPreferenceRow(
            ref: SettingsPreferenceRef(category: category, index: index),
            item: preferences[index],
            focusNode: index == 0
                ? firstFocusNode
                : focusRegistry.nodeFor(
                    SettingsPreferenceRef(category: category, index: index),
                  ),
            autofocus: index == 0,
          ),
        TvListItem(
          key: ValueKey('settings-reset-${category.name}'),
          title: SettingsScreenString.reset,
          subtitle: SettingsScreenString.categoryTitle(category),
          icon: Icons.restart_alt,
          onPressed: () {
            context.read<SettingsBloc>().add(
              const SettingsEvent.resetRequested(),
            );
          },
        ),
      ],
    );
  }
}
