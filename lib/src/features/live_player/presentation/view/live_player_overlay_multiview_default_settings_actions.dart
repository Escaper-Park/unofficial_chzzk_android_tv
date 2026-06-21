import 'package:flutter/material.dart';

import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import 'live_player_overlay_links.dart';
import 'live_player_overlay_multiview_default_settings_items.dart';

List<Widget> liveOverlayMultiviewDefaultSettingsActions({
  required LiveOverlayMultiviewDefaultSettingsLinks links,
  required ValueChanged<int> onPressed,
}) {
  final items = liveOverlayMultiviewDefaultSettingItems;
  final actionLinks = links.all;

  return [
    for (var index = 0; index < items.length; index += 1)
      TvPlayerOverlayAction(
        key: ValueKey('live-player-overlay-multiview-default-$index-action'),
        label: items[index].title,
        icon: liveOverlayMultiviewDefaultSettingIcon(items[index]),
        anchorLink: actionLinks[index],
        autofocus: index == 0,
        onPressed: () => onPressed(index),
      ),
  ];
}
