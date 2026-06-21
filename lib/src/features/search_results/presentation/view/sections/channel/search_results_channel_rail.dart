import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/search_results.dart';
import '../../../search_results_screen_design.dart';
import '../../../search_results_screen_string.dart';
import '../shared/search_results_titled_rail.dart';
import 'search_results_channel_card.dart';

class SearchResultsChannelRail extends StatelessWidget {
  const SearchResultsChannelRail({
    super.key,
    required this.items,
    required this.node,
    required this.onPressed,
    this.down,
    this.autofocusFirstItem = false,
  });

  final List<SearchChannelResult> items;
  final FocusScopeNode node;
  final FocusScopeNode? down;
  final ValueChanged<SearchChannelResult> onPressed;
  final bool autofocusFirstItem;

  @override
  Widget build(BuildContext context) {
    return SearchResultsTitledRail(
      title: SearchResultsScreenString.channelRailTitle,
      height: SearchResultsScreenDesign.channelCardHeight,
      child: TvRail(
        node: node,
        down: down,
        itemCount: items.length,
        itemExtent: SearchResultsScreenDesign.channelCardWidth.value,
        hasMore: false,
        itemBuilder: (context, index) {
          final item = items[index];
          return SearchResultsChannelCard(
            item: item,
            autofocus: autofocusFirstItem && index == 0,
            onPressed: () => onPressed(item),
          );
        },
      ),
    );
  }
}
