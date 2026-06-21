import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../vod/presentation/view/shared/vod_card.dart';
import '../../../../domain/entities/search_results.dart';
import '../../../search_results_screen_design.dart';
import '../../../search_results_screen_string.dart';
import '../shared/search_results_card_mapper.dart';
import '../shared/search_results_titled_rail.dart';

class SearchResultsVodRail extends StatelessWidget {
  const SearchResultsVodRail({
    super.key,
    required this.items,
    required this.node,
    required this.onPressed,
    this.up,
    this.autofocusFirstItem = false,
  });

  final List<SearchVideoResult> items;
  final FocusScopeNode node;
  final FocusScopeNode? up;
  final ValueChanged<SearchVideoResult> onPressed;
  final bool autofocusFirstItem;

  @override
  Widget build(BuildContext context) {
    return SearchResultsTitledRail(
      title: SearchResultsScreenString.vodRailTitle,
      height: SearchResultsScreenDesign.mediaRailHeight,
      child: TvRail(
        node: node,
        up: up,
        itemCount: items.length,
        itemExtent: SearchResultsScreenDesign.mediaCardWidth,
        hasMore: false,
        itemBuilder: (context, index) {
          final item = items[index];
          return VodCard(
            item: searchResultVideoCardItem(item),
            autofocus: autofocusFirstItem && index == 0,
            onPressed: () => onPressed(item),
          );
        },
      ),
    );
  }
}
