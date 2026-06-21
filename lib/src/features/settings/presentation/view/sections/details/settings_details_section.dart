import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/settings_preferences.dart';
import '../../../bloc/settings_bloc.dart';
import '../../../models/settings_preference_groups.dart';
import '../../../settings_screen_design.dart';
import '../../../settings_screen_string.dart';
import '../../shared/settings_focus_registry.dart';
import '../shared/settings_pane.dart';
import 'settings_info_items.dart';
import 'settings_info_section.dart';
import 'settings_preference_section.dart';
import 'settings_update_section.dart';

class SettingsDetailsSection extends StatelessWidget {
  const SettingsDetailsSection({
    super.key,
    required this.state,
    required this.firstFocusNode,
    required this.focusRegistry,
    required this.panePadding,
  });

  final SettingsState state;
  final FocusNode firstFocusNode;
  final SettingsFocusRegistry focusRegistry;
  final EdgeInsets panePadding;

  @override
  Widget build(BuildContext context) {
    final category = state.selectedCategory;
    final preferences = settingsPreferencesFor(category);
    final infoItems = settingsInfoItemsFor(category);

    return SettingsPane(
      header: _SettingsDetailsHeader(category: category),
      panePadding: panePadding,
      sectionHeader: state.saveStatus == SettingsSaveStatus.failure
          ? const TvListSectionHeader(text: SettingsScreenString.saveFailed)
          : null,
      content: Column(
        spacing: SettingsScreenDesign.rowGap,
        children: [
          if (preferences.isNotEmpty)
            SettingsPreferenceSection(
              state: state,
              firstFocusNode: firstFocusNode,
              focusRegistry: focusRegistry,
            )
          else if (category == SettingsCategoryId.updates)
            SettingsUpdateSection(
              state: state,
              firstFocusNode: firstFocusNode,
            )
          else
            SettingsInfoSection(
              items: infoItems,
              firstFocusNode: firstFocusNode,
            ),
        ],
      ),
    );
  }
}

class _SettingsDetailsHeader extends StatelessWidget {
  const _SettingsDetailsHeader({
    required this.category,
  });

  final SettingsCategoryId category;

  @override
  Widget build(BuildContext context) {
    return TvListHeader(
      text: SettingsScreenString.categoryTitle(category),
    );
  }
}
