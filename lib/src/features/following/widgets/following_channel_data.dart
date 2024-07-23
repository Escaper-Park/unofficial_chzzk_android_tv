import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_widgets.dart';
import '../../channel/channel_screen.dart';
import '../../channel/controller/channel_controller.dart';

class FollowingChannelData extends ConsumerWidget {
  const FollowingChannelData({
    super.key,
    required this.channelListFSN,
    required this.channelDataFSN,
  });

  final FocusScopeNode channelListFSN;
  final FocusScopeNode channelDataFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChannel = ref.watch(channelControllerProvider);

    return switch (asyncChannel) {
      AsyncData(:final value) => value == null
          ? const CenteredText(text: '채널을 선택해주세요')
          : ChannelScreen(
              channel: value,
              channelListFSN: channelListFSN,
              channelDataFSN: channelDataFSN,
            ),
      AsyncError() => const CenteredText(text: '채널 정보를 불러올 수 없습니다'),
      _ => const SizedBox.shrink(),
    };
  }
}
