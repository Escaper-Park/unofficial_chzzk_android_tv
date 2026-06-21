import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/tv/focus/focus.dart';
import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/settings_preferences.dart';
import '../../bloc/settings_bloc.dart';
import '../../models/settings_preference_groups.dart';
import '../../settings_screen_design.dart';
import '../../settings_screen_string.dart';
import '../sections/details/settings_details_section.dart';
import '../sections/details/settings_editor_panel.dart';
import '../sections/menu/settings_menu_section.dart';
import '../shared/settings_focus_registry.dart';

class SettingsLayout extends StatelessWidget {
  const SettingsLayout({
    super.key,
    required this.state,
    required this.menuNode,
    required this.detailsNode,
    required this.panelNode,
    required this.menuFirstNode,
    required this.detailsFirstNode,
    required this.focusRegistry,
    required this.openerNode,
    required this.onMenuSelected,
  });

  final SettingsState state;
  final FocusScopeNode menuNode;
  final FocusScopeNode detailsNode;
  final FocusScopeNode panelNode;
  final FocusNode menuFirstNode;
  final FocusNode detailsFirstNode;
  final SettingsFocusRegistry focusRegistry;
  final FocusNode? openerNode;
  final ValueChanged<SettingsCategoryId> onMenuSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        switch (state.loadStatus) {
          SettingsLoadStatus.initial ||
          SettingsLoadStatus.loading => const ContentStateView.loading(
            message: SettingsScreenString.loading,
          ),
          SettingsLoadStatus.failure => ContentStateView.error(
            message: SettingsScreenString.loadFailed,
            action: TvButton.label(
              text: SettingsScreenString.retry,
              onPressed: () {
                context.read<SettingsBloc>().add(
                  const SettingsEvent.started(),
                );
              },
            ),
          ),
          SettingsLoadStatus.ready => LayoutBuilder(
            builder: (context, constraints) {
              final menuWidth = SettingsScreenDesign.menuPaneWidth(
                constraints.maxWidth,
              );
              final detailsWidth = SettingsScreenDesign.detailsPaneWidth(
                constraints.maxWidth,
              );
              final detailsPanePadding =
                  SettingsScreenDesign.detailsPanePadding(
                    constraints.maxWidth,
                  );

              return SplitListLayout(
                gap: SettingsScreenDesign.columnGap,
                leadingWidth: menuWidth,
                trailingWidth: detailsWidth,
                leading: TvFocusSection.list(
                  node: menuNode,
                  right: detailsNode,
                  child: SettingsMenuSection(
                    selectedCategory: state.selectedCategory,
                    firstFocusNode: menuFirstNode,
                    onSelected: onMenuSelected,
                  ),
                ),
                trailing: TvFocusSection.list(
                  node: detailsNode,
                  left: menuNode,
                  child: SettingsDetailsSection(
                    key: ValueKey(
                      'settings-details-${state.selectedCategory.name}',
                    ),
                    state: state,
                    firstFocusNode: detailsFirstNode,
                    focusRegistry: focusRegistry,
                    panePadding: detailsPanePadding,
                  ),
                ),
              );
            },
          ),
        },
        if (_activeItem != null && state.activeEditor != null)
          SettingsEditorPanel(
            ref: state.activeEditor!,
            item: _activeItem!,
            panelNode: panelNode,
            openerNode: openerNode,
          ),
      ],
    );
  }

  SettingsPreferenceItem? get _activeItem {
    final activeRef = state.activeEditor;
    return activeRef == null ? null : settingsPreferenceByRef(activeRef);
  }
}
