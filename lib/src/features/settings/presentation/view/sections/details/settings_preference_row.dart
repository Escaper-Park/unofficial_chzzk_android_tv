import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/settings_preferences.dart';
import '../../../bloc/settings_bloc.dart';
import '../../../models/settings_preference_models.dart';

class SettingsPreferenceRow extends StatelessWidget {
  const SettingsPreferenceRow({
    super.key,
    required this.ref,
    required this.item,
    required this.focusNode,
    required this.autofocus,
  });

  final SettingsPreferenceRef ref;
  final SettingsPreferenceItem item;
  final FocusNode focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final controlType = item.optionSet.controlType;

    return BlocSelector<SettingsBloc, SettingsState, int>(
      selector: (state) => item.read(state.preferences),
      builder: (context, value) {
        return TvListItem(
          key: ValueKey(
            'settings-preference-${ref.category.name}-${ref.index}',
          ),
          title: item.title,
          subtitle: item.description,
          action: controlType == SettingsPreferenceControlType.toggle
              ? null
              : item.label(value),
          trailing: controlType == SettingsPreferenceControlType.toggle
              ? TvSwitch(selected: value == 1)
              : null,
          focusNode: focusNode,
          autofocus: autofocus,
          onPressed: () {
            final bloc = context.read<SettingsBloc>();
            if (controlType == SettingsPreferenceControlType.toggle) {
              bloc.add(SettingsEvent.toggleRequested(ref));
              return;
            }

            bloc.add(SettingsEvent.editorOpened(ref));
          },
        );
      },
    );
  }
}
