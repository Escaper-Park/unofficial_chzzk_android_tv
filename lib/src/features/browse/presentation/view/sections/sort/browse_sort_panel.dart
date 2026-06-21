import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/browse_bloc.dart';
import '../../../browse_screen_string.dart';

class BrowseSortPanel extends StatelessWidget {
  const BrowseSortPanel({
    super.key,
    required this.node,
    required this.selectedTab,
    required this.selectedLiveOption,
    required this.selectedVodOption,
    required this.onLiveSelected,
    required this.onVodSelected,
    required this.onDismiss,
  });

  final FocusScopeNode node;
  final BrowseTab selectedTab;
  final BrowseLiveSortOption selectedLiveOption;
  final BrowseVodSortOption selectedVodOption;
  final ValueChanged<BrowseLiveSortOption> onLiveSelected;
  final ValueChanged<BrowseVodSortOption> onVodSelected;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return TvModalPanel(
      type: TvModalPanelType.large,
      header: BrowseScreenString.sortAction,
      position: TvModalPanelPosition.right,
      showScrim: true,
      focusNode: node,
      onDismiss: onDismiss,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: TvModalPanelDesign.largeItemGap,
        children: switch (selectedTab) {
          BrowseTab.live => [
            for (final option in BrowseLiveSortOption.values)
              TvListItem(
                title: BrowseScreenString.liveSortLabel(option),
                selected: selectedLiveOption == option,
                autofocus: selectedLiveOption == option,
                trailing: selectedLiveOption == option
                    ? const Icon(Icons.check_rounded)
                    : null,
                onPressed: () => onLiveSelected(option),
              ),
          ],
          BrowseTab.vod => [
            for (final option in BrowseVodSortOption.values)
              TvListItem(
                title: BrowseScreenString.vodSortLabel(option),
                selected: selectedVodOption == option,
                autofocus: selectedVodOption == option,
                trailing: selectedVodOption == option
                    ? const Icon(Icons.check_rounded)
                    : null,
                onPressed: () => onVodSelected(option),
              ),
          ],
        },
      ),
    );
  }
}
