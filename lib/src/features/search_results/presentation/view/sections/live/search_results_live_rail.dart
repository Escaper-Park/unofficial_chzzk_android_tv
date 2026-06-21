import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../live/presentation/view/shared/live_card.dart';
import '../../../../domain/entities/search_results.dart';
import '../../../search_results_screen_design.dart';
import '../../../search_results_screen_string.dart';
import '../shared/search_results_card_mapper.dart';
import '../shared/search_results_titled_rail.dart';

class SearchResultsLiveRail extends StatelessWidget {
  const SearchResultsLiveRail({
    super.key,
    required this.items,
    required this.node,
    required this.onPressed,
    this.up,
    this.down,
    this.autofocusFirstItem = false,
  });

  final List<SearchLiveResult> items;
  final FocusScopeNode node;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final ValueChanged<SearchLiveResult> onPressed;
  final bool autofocusFirstItem;

  @override
  Widget build(BuildContext context) {
    return SearchResultsTitledRail(
      title: SearchResultsScreenString.liveRailTitle,
      height: SearchResultsScreenDesign.mediaRailHeight,
      child: TvRail(
        node: node,
        up: up,
        down: down,
        itemCount: items.length,
        itemExtent: SearchResultsScreenDesign.mediaCardWidth,
        hasMore: false,
        itemBuilder: (context, index) {
          final item = items[index];
          return LiveCard(
            item: searchResultLiveCardItem(item),
            autofocus: autofocusFirstItem && index == 0,
            onPressed: () => onPressed(item),
          );
        },
      ),
    );
  }
}
