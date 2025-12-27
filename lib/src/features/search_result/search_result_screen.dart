import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../../common/widgets/ui/ui_widgets.dart' show HeaderText;
import '../../utils/hooks/custom_hooks.dart';
import '../../common/constants/dimensions.dart';
import '../../common/widgets/dpad/dpad_widgets.dart';
import '../../common/widgets/screen/screen_widgets.dart' show PopScopeScreen;
import '../channel/model/channel.dart';
import '../live/model/live_info.dart';
import '../live/widgets/live_widgets.dart' show LiveContainer;
import '../vod/model/vod.dart';
import '../vod/widgets/vod_widgets.dart';
import 'search_result_event.dart';
import 'search_result_state.dart';
import 'widgets/search_result_channel_card.dart';

part 'widgets/screen/search_results_body.dart';
part 'widgets/screen/search_result_channel.dart';
part 'widgets/screen/search_result_live.dart';
part 'widgets/screen/search_result_vod.dart';

class SearchResultScreen extends HookConsumerWidget
    with SearchResultEvent, SearchResultState {
  const SearchResultScreen({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    final nodes = useFocusScopeNodes(3);

    final asyncChannel = getSearchChannelResponse(ref, keyword: keyword);
    final asyncLive = getSearchLiveResponse(ref, keyword: keyword);
    final asyncVod = getSearchVodResponse(ref, keyword: keyword);

    useVerticalFocusedAutoScroll(
      scrollController: scrollController,
      focusNodes: nodes,
      offsetBuilder: (maxScrollExtent) {
        return [0.0, Dimensions.videoContainerHeight - 100.0, maxScrollExtent];
      },
    );

    return PopScopeScreen(
      onPopInvoked: (onPopInvokedHandler) {
        onPopInvokedHandler.pop(context);
      },
      child: _SearchResultsBody(
        controller: scrollController,
        keywordHeader: HeaderText(text: "'$keyword' 검색 결과"),
        searchChannels: _SearchResultChannel(
          asyncChannelList: asyncChannel,
          itemNode: nodes[0],
          belowFSN: nodes[1],
          onPressedChannelCard: (channel) =>
              pushSearchResultChannel(context, channel: channel),
        ),
        searchLives: _SearchResultLive(
          asyncLive: asyncLive,
          aboveFSN: nodes[0],
          itemNode: nodes[1],
          belowFSN: nodes[2],
        ),
        searchVods: _SearchResultVod(
          asyncVod: asyncVod,
          aboveFSN: nodes[1],
          itemNode: nodes[2],
        ),
      ),
    );
  }
}
