import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/center_widgets.dart';
import '../../../channel/channel_screen.dart';
import '../../controller/search_controller.dart';

class SearchChannelScreen extends ConsumerWidget {
  const SearchChannelScreen({
    super.key,
    required this.channelDataFSN,
    required this.channelListFSN,
  });

  final FocusScopeNode channelDataFSN;
  final FocusScopeNode channelListFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchChannel = ref.watch(searchChannelControllerProvider);

    return searchChannel == null
        ? const CenteredText(text: '채널을 선택해주세요')
        : ChannelScreen(
            channel: searchChannel,
            channelListFSN: channelListFSN,
            channelDataFSN: channelDataFSN,
          );
  }
}
