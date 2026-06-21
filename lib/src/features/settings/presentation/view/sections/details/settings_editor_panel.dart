import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/settings_preferences.dart';
import '../../../bloc/settings_bloc.dart';
import '../../../models/settings_preference_models.dart';
import '../../../settings_screen_design.dart';
import '../../../widgets/settings_position_icon.dart';

part 'settings_select_editor.dart';
part 'settings_slider_editor.dart';

class SettingsEditorPanel extends HookWidget {
  const SettingsEditorPanel({
    super.key,
    required this.ref,
    required this.item,
    required this.panelNode,
    required this.openerNode,
  });

  final SettingsPreferenceRef ref;
  final SettingsPreferenceItem item;
  final FocusScopeNode panelNode;
  final FocusNode? openerNode;

  @override
  Widget build(BuildContext context) {
    return TvModalPanel(
      type: TvModalPanelType.standard,
      header: item.title,
      focusNode: panelNode,
      openerFocusNode: openerNode,
      onDismiss: () {
        context.read<SettingsBloc>().add(const SettingsEvent.editorClosed());
      },
      child: BlocSelector<SettingsBloc, SettingsState, int>(
        selector: (state) => item.read(state.preferences),
        builder: (context, value) {
          return switch (item.optionSet.controlType) {
            SettingsPreferenceControlType.toggle => const SizedBox.shrink(),
            SettingsPreferenceControlType.select => _SettingsSelectEditor(
              ref: ref,
              item: item,
              value: value,
              openerNode: openerNode,
            ),
            SettingsPreferenceControlType.slider => _SettingsSliderEditor(
              ref: ref,
              item: item,
              value: value,
            ),
          };
        },
      ),
    );
  }
}
