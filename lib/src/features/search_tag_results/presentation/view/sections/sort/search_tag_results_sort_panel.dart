import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/search_tag_results_bloc.dart';
import '../../../search_tag_results_screen_string.dart';

class SearchTagResultsSortPanel extends StatelessWidget {
  const SearchTagResultsSortPanel({
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
  final SearchTagResultsTab selectedTab;
  final SearchTagResultsLiveSortOption selectedLiveOption;
  final SearchTagResultsVodSortOption selectedVodOption;
  final ValueChanged<SearchTagResultsLiveSortOption> onLiveSelected;
  final ValueChanged<SearchTagResultsVodSortOption> onVodSelected;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return TvModalPanel(
      type: TvModalPanelType.large,
      header: SearchTagResultsScreenString.sortAction,
      position: TvModalPanelPosition.right,
      showScrim: true,
      focusNode: node,
      onDismiss: onDismiss,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: TvModalPanelDesign.largeItemGap,
        children: switch (selectedTab) {
          SearchTagResultsTab.live => [
            for (final option in SearchTagResultsLiveSortOption.values)
              TvListItem(
                title: SearchTagResultsScreenString.liveSortLabel(option),
                selected: selectedLiveOption == option,
                autofocus: selectedLiveOption == option,
                trailing: selectedLiveOption == option
                    ? const Icon(Icons.check_rounded)
                    : null,
                onPressed: () => onLiveSelected(option),
              ),
          ],
          SearchTagResultsTab.vod => [
            for (final option in SearchTagResultsVodSortOption.values)
              TvListItem(
                title: SearchTagResultsScreenString.vodSortLabel(option),
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
