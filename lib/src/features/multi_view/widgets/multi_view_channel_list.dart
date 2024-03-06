import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_text.dart';
import '../../live/controller/live_controller.dart';
import '../controller/multi_view_controller.dart';
import 'multi_view_live_info.dart';

class MultiViewChannelList extends ConsumerWidget {
  const MultiViewChannelList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingLives = ref.watch(followingLiveControllerProvider);

    return switch (asyncFollowingLives) {
      AsyncData(:final value) => (value == null || value.isEmpty)
          ? const Expanded(
              child: CenterText(text: '아직 팔로우하지 않았습니다'),
            )
          : Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.0,
                  mainAxisExtent: 135.0,
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final liveDetail = value[index];

                  return MultiViewLiveInfo(
                    autofocus: index == 0 ? true : false,
                    liveDetail: liveDetail,
                    onPressed: () {
                      ref
                          .read(multiViewControllerProvider.notifier)
                          .addChannel(liveDetail);
                    },
                  );
                },
              ),
            ),
      AsyncError() => const Expanded(
          child: CenterText(text: '팔로우 목록을 불러오지 못했습니다'),
        ),
      _ => const Expanded(
          child: CenterText(text: '팔로우 목록 불러오는 중...'),
        )
    };
  }
}
