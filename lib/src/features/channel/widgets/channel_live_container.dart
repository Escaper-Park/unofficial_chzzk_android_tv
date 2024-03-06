import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/center_text.dart';
import '../../../common/widgets/header_text.dart';
import '../../live/widgets/live_container.dart';
import '../controller/channel_controller.dart';

class ChannelLiveContainer extends ConsumerWidget {
  const ChannelLiveContainer({
    super.key,
    required this.channelId,
    required this.focusNode,
  });

  final String channelId;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChannelLive =
        ref.watch(channelLiveControllerProvider(channelId: channelId));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(text: '라이브 방송'),
          SizedBox(
            height: Dimensions.homeBaseContainerHeight,
            child: switch (asyncChannelLive) {
              AsyncData(:final value) => value == null
                  ? const CenterText(text: '라이브 방송이 없습니다')
                  : LiveContainer(
                      focusNode: focusNode,
                      liveDetail: value,
                    ),
              AsyncError() => const CenterText(text: '라이브 방송을 불러올 수 없습니다'),
              _ => const SizedBox.shrink(),
            },
          ),
        ],
      ),
    );
  }
}
