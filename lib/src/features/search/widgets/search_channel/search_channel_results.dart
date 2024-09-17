import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/center_widgets.dart';
import '../../../../common/widgets/dpad_widgets.dart';
import '../../../../common/widgets/header_text.dart';
import '../../controller/search_controller.dart';
import 'search_channel_result_info_card.dart';

class SearchChannelResults extends ConsumerWidget {
  const SearchChannelResults({
    super.key,
    required this.keyword,
    required this.channelListFSN,
    required this.channelDataFSN,
  });

  final String keyword;
  final FocusScopeNode channelListFSN;
  final FocusScopeNode channelDataFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSearchResult =
        ref.watch(searchChannelControllerProvider(keyword: keyword));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(text: "'$keyword' 검색 결과"),
        const SizedBox(height: 10.0),
        Expanded(
          child: switch (asyncSearchResult) {
            AsyncData(:final value) => (value == null || value.isEmpty)
                ? const CenteredText(text: '검색 결과가 없습니다')
                : DpadFocusScopeNavigator(
                    node: channelListFSN,
                    dpadKeyFocusScopeNodeMap: {
                      DpadAction.arrowRight: channelDataFSN
                    },
                    child: ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        final channel = value[index];

                        return SearchChannelResultInfoCard(
                          autofocus: index == 0 ? true : false,
                          channel: channel,
                          onPressed: () {
                            ref
                                .read(currentSearchChannelControllerProvider
                                    .notifier)
                                .setCurrentChannel(channel);
                          },
                        );
                      },
                    ),
                  ),
            AsyncError() => const CenteredText(text: '검색 결과를 불러올 수 없습니다'),
            _ => const SizedBox.shrink(),
          },
        ),
      ],
    );
  }
}
