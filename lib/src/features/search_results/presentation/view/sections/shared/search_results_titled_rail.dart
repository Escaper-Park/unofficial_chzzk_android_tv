import 'package:flutter/material.dart';

import '../../../search_results_screen_design.dart';

class SearchResultsTitledRail extends StatelessWidget {
  const SearchResultsTitledRail({
    super.key,
    required this.title,
    required this.height,
    required this.child,
  });

  final String title;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SearchResultsScreenDesign.railTitleHorizontalPadding,
          ),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: SearchResultsScreenDesign.railTitleStyle(context),
          ),
        ),
        const SizedBox(height: SearchResultsScreenDesign.railTitleBottomGap),
        SizedBox(
          height: height,
          child: child,
        ),
      ],
    );
  }
}
