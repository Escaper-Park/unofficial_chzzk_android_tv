import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../common/constants/enums.dart' show SettingItemType;
import '../../../channel/model/channel.dart';
import 'stream_control_icon_button.dart';

class StreamSettingsControlItem extends HookWidget {
  const StreamSettingsControlItem({
    super.key,
    required this.autofocus,
    this.itemType = SettingItemType.limited,
    required this.channel,
    required this.currentValue,
    required this.maxValue,
    required this.resetOverlayTimer,
    this.displayTextList,
    this.onUpdate,
    required this.onPressed,
  });

  final bool autofocus;
  final SettingItemType itemType;
  final Channel channel;
  final int currentValue;
  final int maxValue;
  final List<String>? displayTextList;
  final VoidCallback resetOverlayTimer;
  final void Function(int value)? onUpdate;
  final void Function(int value) onPressed;

  @override
  Widget build(BuildContext context) {
    final currentDisplayedValue = useState<int>(currentValue);

    useEffect(
      () {
        currentDisplayedValue.value = currentValue;
        return null;
      },
      [currentValue],
    );

    return StreamControlIconButtonWithDpad(
      autofocus: autofocus,
      itemType: itemType,
      headerText: channel.channelName,
      currentDisplayedValue: currentDisplayedValue.value,
      displayTextList: displayTextList,
      unitSuffix: itemType == SettingItemType.range ? '%' : null,
      minValue: 0,
      maxValue: maxValue,
      resetOverlayTimer: resetOverlayTimer,
      onUpdate: (updateValue) {
        currentDisplayedValue.value = updateValue;
        onUpdate?.call(updateValue);
      },
      onPressed: onPressed,
    );
  }
}
