part of 'settings_editor_panel.dart';

class _SettingsSliderEditor extends HookWidget {
  const _SettingsSliderEditor({
    required this.ref,
    required this.item,
    required this.value,
  });

  final SettingsPreferenceRef ref;
  final SettingsPreferenceItem item;
  final int value;

  @override
  Widget build(BuildContext context) {
    final sliderNode = useFocusNode(debugLabel: 'settings slider');
    final values = item.optionSet.values;
    final min = values.first.toDouble();
    final max = values.last.toDouble();

    return Padding(
      padding: SettingsScreenDesign.modalSliderPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: SettingsScreenDesign.rowGap,
        children: [
          Align(
            alignment: Alignment.center,
            child: _SettingsValueLabel(
              item: item,
              value: value,
            ),
          ),
          TvSlider(
            value: value.toDouble(),
            min: min,
            max: max,
            divisions: values.length - 1,
            step: 1,
            wraps: item.wrapSlider,
            focusNode: sliderNode,
            autofocus: true,
            onChanged: (nextValue) {
              context.read<SettingsBloc>().add(
                SettingsEvent.sliderChanged(
                  ref: ref,
                  value: nextValue.round(),
                ),
              );
            },
            onChangeEnd: (_) {
              context.read<SettingsBloc>().add(
                const SettingsEvent.sliderChangeCommitted(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SettingsValueLabel extends StatelessWidget {
  const _SettingsValueLabel({
    required this.item,
    required this.value,
  });

  final SettingsPreferenceItem item;
  final int value;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall;
    final icon = item.icon?.call(value);
    if (icon == null) {
      return Text(item.label(value), style: textStyle);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SettingsValueIcon(
          icon: icon,
          alignment: item.iconAlignment?.call(value) ?? Alignment.center,
        ),
        const SizedBox(width: 8),
        Text(item.label(value), style: textStyle),
      ],
    );
  }
}

class _SettingsValueIcon extends StatelessWidget {
  const _SettingsValueIcon({
    required this.icon,
    required this.alignment,
  });

  final IconData icon;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return SettingsPositionIcon(
      icon: icon,
      alignment: alignment,
      size: 40,
      iconSize: icon == Icons.circle ? 8 : 20,
    );
  }
}

Widget? _settingsPositionIcon({
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
