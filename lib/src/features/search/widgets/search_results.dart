import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_text.dart';
import '../../../common/widgets/header_text.dart';
import '../controller/search_controller.dart';
import 'search_result_info_card.dart';

class SearchResults extends ConsumerWidget {
  const SearchResults({
    super.key,
    required this.keyword,
  });

  final String keyword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSearchRestuls =
        ref.watch(searchResultsControllerProvider(keyword: keyword));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(text: "'$keyword' 검색 결과"),
        const SizedBox(height: 10.0),
        Expanded(
          child: switch (asyncSearchRestuls) {
            AsyncData(:final value) => (value == null || value.isEmpty)
                ? const CenterText(text: '검색 결과가 없습니다')
                : ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final channel = value[index];

                      return SearchResultInfoCard(
                        autofocus: index == 0 ? true : false,
                        channel: channel,
                        onPressed: () {
                          ref
                              .read(searchControllerProvider.notifier)
                              .setCurrentChannel(channel);
                        },
                      );
                    },
                  ),
            AsyncError() => const CenterText(text: '검색 결과를 불러올 수 없습니다'),
            _ => const CenterText(text: '')
          },
        ),
      ],
    );
  }
}
