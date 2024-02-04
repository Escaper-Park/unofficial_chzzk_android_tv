import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../../constants/dimensions.dart';
import '../../../../controller/live/live_controller.dart';

import '../../../common/header_text.dart';
import '../../../common/live_container.dart';

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
    final live = ref.watch(CurrentChannelLiveProvider(channelId: channelId));

    return live.when(
      data: (liveDetail) {
        return liveDetail == null
            ? const Center(child: Text('라이브 방송을 불러올 수 없습니다'))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderText(text: '라이브 방송'),
                  SizedBox(
                    height: Dimensions.liveContainerHeight,
                    child: LiveContainer(
                      focusNode: focusNode,
                      liveDetail: liveDetail,
                      onPressed: () async {
                        await ref
                            .read(liveControllerProvider.notifier)
                            .showSingleViewLive(
                                context: context, liveDetail: liveDetail);
                      },
                    ),
                  ),
                ],
              );
      },
      error: (error, stackTrace) => const Center(
        child: Text('라이브 방송을 불러올 수 없습니다'),
      ),
      loading: () => const SizedBox(
        height: 58.0 + Dimensions.liveContainerHeight,
      ),
    );
  }
}
