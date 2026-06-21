import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/following_bloc.dart';
import '../../../following_screen_string.dart';

class FollowingSortPanel extends StatelessWidget {
  const FollowingSortPanel({
    super.key,
    required this.node,
    required this.selectedOption,
    required this.onSelected,
    required this.onDismiss,
  });

  final FocusScopeNode node;
  final FollowingLiveSortOption selectedOption;
  final ValueChanged<FollowingLiveSortOption> onSelected;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return TvModalPanel(
      type: TvModalPanelType.large,
      header: FollowingScreenString.sortAction,
      position: TvModalPanelPosition.right,
      showScrim: true,
      focusNode: node,
      onDismiss: onDismiss,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: TvModalPanelDesign.largeItemGap,
        children: [
          for (final option in FollowingLiveSortOption.values)
            TvListItem(
              title: FollowingScreenString.liveSortLabel(option),
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
