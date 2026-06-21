part of 'player_chat_settings_overlay.dart';

class _PlayerChatSliderSetting extends HookWidget {
  const _PlayerChatSliderSetting({
    required this.item,
    required this.value,
    required this.preferences,
    required this.onPreferencesChanged,
  });

  final SettingsPreferenceItem item;
  final int value;
  final SettingsPreferences preferences;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    final sliderNode = useFocusNode();
    final values = item.optionSet.values;

    return Padding(
      padding: SettingsScreenDesign.modalSliderPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: SettingsScreenDesign.rowGap,
        children: [
          Align(
            alignment: Alignment.center,
            child: _PlayerChatSettingValueLabel(
              item: item,
              value: value,
            ),
          ),
          TvSlider(
            value: value.toDouble(),
            min: values.first.toDouble(),
            max: values.last.toDouble(),
            divisions: values.length - 1,
            step: 1,
            wraps: item.wrapSlider,
            focusNode: sliderNode,
            autofocus: true,
            onChanged: (nextValue) => onPreferencesChanged(
              item.writeNormalized(preferences, nextValue.round()),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayerChatSettingValueLabel extends StatelessWidget {
  const _PlayerChatSettingValueLabel({
    required this.item,
    required this.value,
  });

  final SettingsPreferenceItem item;
  final int value;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      item.label(value),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleSmall,
    );
    final icon = _playerChatSettingValueIcon(
      item: item,
      value: value,
      size: 36,
    );
    if (icon == null) {
      return text;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 8),
        text,
      ],
    );
  }
}

Widget? _playerChatSettingValueIcon({
  required SettingsPreferenceItem item,
  required int value,
  required double size,
}) {
  final icon = item.icon?.call(value);
  if (icon == null) {
    return null;
  }

  return SettingsPositionIcon(
    icon: icon,
    alignment: item.iconAlignment?.call(value) ?? Alignment.center,
    size: size,
    iconSize: icon == Icons.circle ? size * 0.22 : size * 0.55,
  );
}
