import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../../common/widgets/screen/screen_widgets.dart' show PopScopeScreen;
import '../../common/widgets/ui/ui_widgets.dart' show CenteredText;
import '../channel/channel_screen.dart' show ChannelScreen;

import 'search_result_channel_event.dart';
import 'search_result_channel_state.dart';

class SearchResultChannelScreen extends HookConsumerWidget
    with SearchResultChannelEvent, SearchResultChannelState {
  const SearchResultChannelScreen({super.key, required this.channelId});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelFSN = useFocusScopeNode();

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setCurrentSelectedChannel(ref, channelId);
        });
        return null;
      },
      [channelId],
    );

    final asyncChannel = getAsyncChannel(ref);

    return PopScopeScreen(
      onPopInvoked: (onPopInvokedHandler) {
        onPopInvokedHandler.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: switch (asyncChannel) {
          AsyncData(:final value) => value == null
              ? CenteredText(text: '로딩중 ...')
              : ChannelScreen(
                  baseRoute: AppRoute.searchResult,
                  channel: value,
                  channelFSN: channelFSN,
                  leftFSN: null,
                ),
          AsyncError() => CenteredText(text: '채널 정보를 불러올 수 없습니다'),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}
