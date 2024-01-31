import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../controller/search/search_controller.dart';
import '../../../../model/channel/channel.dart';
import '../../../../service/channel/channel_repository.dart';
import '../../channel/widgets/channel_data.dart';

part 'search_channel_data.g.dart';

@riverpod
Future<Channel?> selectedSearchChannel(SelectedSearchChannelRef ref) async {
  final searchChannel = ref.watch(currentSearchControllerProvider);

  return searchChannel == null
      ? null
      : await ref
          .watch(channelRepositoryProvider)
          .getChannel(searchChannel.channelId);
}

class SearchChannelData extends ConsumerWidget {
  const SearchChannelData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(selectedSearchChannelProvider);

    return searchProvider.when(
      data: (channel) {
        return channel == null
            ? const Center(
                child: Text('채널을 선택해주세요'),
              )
            : ChannelData(channel: channel);
      },
      error: (error, stackTrace) =>
          const Center(child: Text('채널을 불러오는데 실패했습니다')),
      loading: () => const SizedBox.shrink(),
    );
  }
}
