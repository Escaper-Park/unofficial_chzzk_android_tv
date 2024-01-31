import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/ui/common/dpad_widget.dart';

import '../../../../controller/search/search_controller.dart';
import '../../../../model/channel/channel.dart';

import './search_info_card.dart';

class SearchResults extends ConsumerWidget {
  const SearchResults({
    super.key,
    required this.searchFieldFocusNode,
    required this.resultsFocusNode,
  });

  final FocusNode resultsFocusNode;
  final FocusNode searchFieldFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultsProvider = ref.watch(searchResultsControllerProvider);

    return resultsProvider.when(
      data: (results) {
        return (results == null || results.isEmpty)
            ? const Center(
                child: Text('검색 결과가 없습니다'),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(right: 16.0),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final Channel channel = results[index];

                  return index == 0
                      ? DpadWidget(
                          useFocusedBorder: true,
                          focusNode: resultsFocusNode,
                          okCallback: () {
                            ref
                                .read(currentSearchControllerProvider.notifier)
                                .setCurrentChannel(channel);
                          },
                          upCallback: () async {
                            FocusScope.of(context).unfocus();
                            await Future.delayed(
                                    const Duration(milliseconds: 200))
                                .then((_) {
                              searchFieldFocusNode.requestFocus();
                            });
                          },
                          child: SearchInfoCard(
                            key: Key('${channel.channelId}_search'),
                            channel: channel,
                            onPressed: () {
                              // ref
                              //     .read(
                              //         currentSearchControllerProvider.notifier)
                              //     .setCurrentChannel(channel);
                            },
                          ),
                        )
                      : SearchInfoCard(
                          key: Key('${channel.channelId}_search'),
                          channel: channel,
                          onPressed: () {
                            ref
                                .read(currentSearchControllerProvider.notifier)
                                .setCurrentChannel(channel);
                          },
                        );
                },
              );
      },
      error: (error, stackTrace) => const Center(child: Text('검색 오류')),
      loading: () => const SizedBox.shrink(),
    );
  }
}
