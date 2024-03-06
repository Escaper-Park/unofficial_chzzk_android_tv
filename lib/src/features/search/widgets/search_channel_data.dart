import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_text.dart';
import '../../channel/channel_screen.dart';
import '../controller/search_controller.dart';

class SearchChannelData extends ConsumerWidget {
  const SearchChannelData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchChannel = ref.watch(searchControllerProvider);

    return searchChannel == null
        ? const CenterText(text: '채널을 선택해주세요')
        : ChannelScreen(channel: searchChannel);
  }
}
