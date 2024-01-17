import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/search_controller.dart';
import 'search_result_card.dart';

class SearchResults extends ConsumerWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResultsProvider = ref.watch(searchResultsControllerProvider);

    return searchResultsProvider.when(
      data: (results) {
        return (results == null || results.isEmpty)
            ? const Center(
                child: Text('검색 결과가 없습니다.'),
              )
            : ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final channel = results[index];

                  return SearchResultCard(
                    channel: channel,
                    callback: () async {
                      await ref
                          .read(searchControllerProvider.notifier)
                          .setCurrentChannel(channel);
                    },
                  );
                },
              );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(
        child: Text('검색중...'),
      ),
    );
  }
}
