import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/header_text.dart';
import '../controller/multi_view_controller.dart';
import 'multi_view_selected_channel_card.dart';
import 'multi_view_start_button.dart';

class MultiViewSelectedChannels extends ConsumerWidget {
  const MultiViewSelectedChannels({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChannel = ref.watch(multiViewControllerProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(
            text: '멀티뷰 채널',
            fontSize: 20.0,
          ),
          const SizedBox(height: 10.0),
          selectedChannel.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text('멀티뷰 채널을 선택해주세요\n(최대 4개)'),
                  ),
                )
              : Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: selectedChannel.length,
                          itemBuilder: (context, index) {
                            return MultiViewSelectedChannelCard(
                              liveDetail: selectedChannel[index],
                              index: index,
                            );
                          },
                        ),
                      ),
                      const MultiViewStartButton(),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
