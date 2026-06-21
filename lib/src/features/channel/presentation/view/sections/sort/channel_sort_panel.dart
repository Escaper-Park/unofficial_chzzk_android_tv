import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/channel_bloc.dart';
import '../../../channel_screen_string.dart';

class ChannelSortPanel extends StatelessWidget {
  const ChannelSortPanel({
    super.key,
    required this.node,
    required this.selectedOption,
    required this.onSelected,
    required this.onDismiss,
  });

  final FocusScopeNode node;
  final ChannelVodSortOption selectedOption;
  final ValueChanged<ChannelVodSortOption> onSelected;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return TvModalPanel(
      type: TvModalPanelType.large,
      header: ChannelScreenString.sortAction,
      position: TvModalPanelPosition.right,
      showScrim: true,
      focusNode: node,
      onDismiss: onDismiss,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: TvModalPanelDesign.largeItemGap,
        children: [
          for (final option in ChannelVodSortOption.values)
            TvListItem(
              title: ChannelScreenString.vodSortLabel(option),
              selected: selectedOption == option,
              autofocus: selectedOption == option,
              trailing: selectedOption == option
                  ? const Icon(Icons.check_rounded)
                  : null,
              onPressed: () => onSelected(option),
            ),
        ],
      ),
    );
  }
}
