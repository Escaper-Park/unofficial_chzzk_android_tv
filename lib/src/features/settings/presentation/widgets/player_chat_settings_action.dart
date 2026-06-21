part of 'player_chat_settings_overlay.dart';

class _PlayerChatSettingAction extends StatelessWidget {
  const _PlayerChatSettingAction({
    required this.index,
    required this.link,
    required this.onPressed,
  });

  final int index;
  final LayerLink link;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    final item = chatSettingsPreferences[index];

    return TvPlayerOverlayAction(
      label: item.title,
      icon: item.actionIcon ?? Icons.tune,
      anchorLink: link,
      iconButtonSize: TvIconButtonSize.small,
      width: _PlayerChatSettingsOverlayDesign.actionWidth,
      height: _PlayerChatSettingsOverlayDesign.actionHeight,
      autofocus: index == 0,
      onPressed: () => onPressed(index),
    );
  }
}

abstract final class _PlayerChatSettingsOverlayDesign {
  static const gridRowCount = 2;
  static const gridColumnGap = 8.0;
  static const gridRowGap = 8.0;
  static const actionWidth = 52.0;
  static const actionHeight = 48.0;
}
