import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../channel/widgets/channel_detail.dart';
import '../controller/search_controller.dart';

class SearchChannelInfo extends ConsumerWidget {
  const SearchChannelInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSearchChannel = ref.watch(searchControllerProvider);

    return asyncSearchChannel.when(
      data: (channel) {
        return channel == null
            ? const Center(
                child: Text('채널을 선택해주세요'),
              )
            : ChannelDetail(channel: channel);
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const SizedBox.shrink(),
    );
  }
}
