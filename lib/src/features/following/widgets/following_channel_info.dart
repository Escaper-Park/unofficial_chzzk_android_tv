import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../channel/widgets/channel_detail.dart';
import '../controller/following_controller.dart';

class FollowingChannelInfo extends ConsumerWidget {
  const FollowingChannelInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingChannel = ref.watch(followingControllerProvider);

    return asyncFollowingChannel.when(
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
