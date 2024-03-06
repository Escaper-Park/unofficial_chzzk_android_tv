import 'package:flutter/material.dart';

import '../../common/widgets/base_scaffold.dart';
import './widgets/search_channel_data.dart';
import './widgets/search_results.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({
    super.key,
    required this.keyword,
  });

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      horizontalPadding: 20.0,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SearchResults(keyword: keyword),
          ),
          const SizedBox(width: 20.0),
          const Expanded(
            flex: 3,
            child: SearchChannelData(),
          ),
        ],
      ),
    );
  }
}
