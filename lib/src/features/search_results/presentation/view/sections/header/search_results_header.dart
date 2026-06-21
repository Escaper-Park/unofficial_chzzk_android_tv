import 'package:flutter/material.dart';

import '../../../search_results_screen_design.dart';
import '../../../search_results_screen_string.dart';

class SearchResultsHeader extends StatelessWidget {
  const SearchResultsHeader({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SearchResultsScreenDesign.headerHeight,
      child: Padding(
        padding: SearchResultsScreenDesign.headerPadding,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            SearchResultsScreenString.headerTitle(query),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: SearchResultsScreenDesign.headerTitleStyle(context),
          ),
        ),
      ),
    );
  }
}
