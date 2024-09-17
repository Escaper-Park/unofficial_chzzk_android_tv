import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/search_channel/search_results_widgets.dart';

class SearchChannelResultScreen extends HookWidget {
  const SearchChannelResultScreen({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) {
    final channelListFSN = useFocusScopeNode();
    final channelDataFSN = useFocusScopeNode();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SearchChannelResults(
                keyword: keyword,
                channelListFSN: channelListFSN,
                channelDataFSN: channelDataFSN,
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              flex: 3,
              child: SearchChannelScreen(
                channelDataFSN: channelDataFSN,
                channelListFSN: channelListFSN,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
