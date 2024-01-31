import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controller/following/following_controller.dart';
import '../../../../controller/multi_view/multi_view_controller.dart';
import '../../../common/header_text.dart';
import './multi_view_info.dart';

class MultiViewSelectionList extends ConsumerWidget {
  const MultiViewSelectionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLiveDetails = ref.watch(followingLivesControllerProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(
            text: '팔로우 채널',
            fontSize: 20.0,
          ),
          const SizedBox(height: 10.0),
          asyncLiveDetails.when(
            data: (liveDetails) {
              return (liveDetails == null || liveDetails.isEmpty)
                  ? const Expanded(
                      child: Center(
                        child: Text('아직 팔로우하지 않았습니다'),
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10.0,
                          mainAxisExtent: 135.0,
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.0,
                        ),
                        itemCount: liveDetails.length,
                        itemBuilder: (context, index) {
                          final liveDetail = liveDetails[index];
                          return MultiViewInfo(
                            autofocuse: index == 0 ? true : false,
                            liveDetail: liveDetail,
                            onPressed: () {
                              ref
                                  .read(multiViewControllerProvider.notifier)
                                  .addChannel(liveDetail);
                            },
                          );
                        },
                      ),
                    );
            },
            error: (error, stackTrace) =>
                const Center(child: Text('팔로우 목록을 불러오지 못했습니다')),
            loading: () =>
                const Expanded(child: Center(child: Text('팔로우 목록 불러오는 중...'))),
          ),
        ],
      ),
    );
  }
}
