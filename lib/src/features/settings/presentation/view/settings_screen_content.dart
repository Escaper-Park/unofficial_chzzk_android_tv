part of 'settings_screen.dart';

Widget _settingsScreenContent({
  required BuildContext context,
  required SettingsState state,
  required FocusScopeNode menuNode,
  required FocusScopeNode detailsNode,
  required FocusScopeNode panelNode,
  required FocusNode menuFirstNode,
  required FocusNode detailsFirstNode,
  required SettingsFocusRegistry focusRegistry,
  required FocusNode? openerNode,
}) {
  return SettingsLayout(
    state: state,
    menuNode: menuNode,
    detailsNode: detailsNode,
    panelNode: panelNode,
    menuFirstNode: menuFirstNode,
    detailsFirstNode: detailsFirstNode,
    focusRegistry: focusRegistry,
    openerNode: openerNode,
    onMenuSelected: (category) {
      context.read<SettingsBloc>().add(
        SettingsEvent.menuSelected(category),
      );
      detailsFirstNode.requestFocus();
    },
  );
}
