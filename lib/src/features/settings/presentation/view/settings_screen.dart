import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../app/shell/shell.dart';
import '../../../../core/tv/back/back.dart';
import '../../domain/repositories/settings_preferences_repository.dart';
import '../../domain/repositories/settings_update_repository.dart';
import '../bloc/settings_bloc.dart';
import 'layout/settings_layout.dart';
import 'shared/settings_focus_registry.dart';

part 'settings_screen_content.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        preferencesRepository: context.read<SettingsPreferencesRepository>(),
        updateRepository: context.read<SettingsUpdateRepository>(),
      )..add(const SettingsEvent.started()),
      child: const _SettingsScreenView(),
    );
  }
}

class _SettingsScreenView extends HookWidget {
  const _SettingsScreenView();

  @override
  Widget build(BuildContext context) {
    final menuNode = useFocusScopeNode(debugLabel: 'settings menu');
    final detailsNode = useFocusScopeNode(debugLabel: 'settings details');
    final panelNode = useFocusScopeNode(debugLabel: 'settings editor panel');
    final menuFirstNode = useFocusNode(debugLabel: 'settings menu first item');
    final detailsFirstNode = useFocusNode(
      debugLabel: 'settings details first item',
    );
    final focusRegistry = useMemoized(SettingsFocusRegistry.new);

    useEffect(() => focusRegistry.dispose, [focusRegistry]);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: _shouldRebuildSettingsScaffold,
      builder: (context, state) {
        final openerNode = focusRegistry.openerNodeFor(
          activeRef: state.activeEditor,
          detailsFirstNode: detailsFirstNode,
        );

        return AppShellContentBackScope(
          controller: TvBackController(
            onBack: () {
              _handleBack(
                context: context,
                state: state,
                menuNode: menuNode,
                detailsNode: detailsNode,
                menuFirstNode: menuFirstNode,
                openerNode: openerNode,
              );
            },
          ),
          child: _settingsScreenContent(
            context: context,
            state: state,
            menuNode: menuNode,
            detailsNode: detailsNode,
            panelNode: panelNode,
            menuFirstNode: menuFirstNode,
            detailsFirstNode: detailsFirstNode,
            focusRegistry: focusRegistry,
            openerNode: openerNode,
          ),
        );
      },
    );
  }

  void _handleBack({
    required BuildContext context,
    required SettingsState state,
    required FocusScopeNode menuNode,
    required FocusScopeNode detailsNode,
    required FocusNode menuFirstNode,
    required FocusNode? openerNode,
  }) {
    final navigationNode = AppShellFocusScope.maybeNavigationOf(context);
    if (navigationNode?.hasFocus ?? false) {
      return;
    }

    if (state.activeEditor != null) {
      context.read<SettingsBloc>().add(const SettingsEvent.editorClosed());
      openerNode?.requestFocus();
      return;
    }

    if (detailsNode.hasFocus) {
      menuNode.requestFocus();
      return;
    }

    if (menuNode.hasFocus) {
      navigationNode?.requestFocus();
      return;
    }

    menuFirstNode.requestFocus();
  }
}

bool _shouldRebuildSettingsScaffold(
  SettingsState previous,
  SettingsState current,
) {
  return previous.loadStatus != current.loadStatus ||
      previous.saveStatus != current.saveStatus ||
      previous.updateStatus != current.updateStatus ||
      previous.selectedCategory != current.selectedCategory ||
      previous.activeEditor != current.activeEditor ||
      previous.latestRelease != current.latestRelease;
}
