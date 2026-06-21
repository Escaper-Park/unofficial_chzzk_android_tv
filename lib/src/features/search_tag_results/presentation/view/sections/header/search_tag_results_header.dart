import 'package:flutter/material.dart';

import '../../../search_tag_results_screen_design.dart';
import '../../../search_tag_results_screen_string.dart';

class SearchTagResultsHeader extends StatelessWidget {
  const SearchTagResultsHeader({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SearchTagResultsScreenDesign.headerHeight,
      child: Padding(
        padding: SearchTagResultsScreenDesign.headerPadding,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            SearchTagResultsScreenString.headerTitle(tag),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: SearchTagResultsScreenDesign.headerTitleStyle(context),
          ),
        ),
      ),
    );
  }
}
