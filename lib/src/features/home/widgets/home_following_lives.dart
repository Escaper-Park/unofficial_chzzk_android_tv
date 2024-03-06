import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_text.dart';
import '../../../common/widgets/header_text.dart';
import '../../live/controller/live_controller.dart';
import '../../live/widgets/live_container.dart';
import './home_base_container.dart';

class HomeFollowingLives extends ConsumerWidget {
  const HomeFollowingLives({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingLives = ref.watch(followingLiveControllerProvider);

    return switch (asyncFollowingLives) {
      AsyncData(:final value) => value == null
          ? const SizedBox.shrink()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderText(
                  text: '팔로잉 라이브 채널',
                  useShowMoreButton: false,
                ),
                HomeBaseContainer(
                  child: value.isEmpty
                      ? const CenterText(text: '아무도 방송을 키지 않았어요')
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            final liveDetail = value[index];

                            return LiveContainer(
                              key: Key(
                                  '${liveDetail.channel.channelId}_following'),
                              autofocus: index == 0 ? true : false,
                              liveDetail: liveDetail,
                            );
                          },
                        ),
                ),
              ],
            ),
      AsyncError() => const CenterText(text: '팔로잉 채널을 불러오는데 실패했습니다'),
      _ => Column(
          children: [
            HeaderText(
              text: '팔로잉 라이브 채널',
              useShowMoreButton: true,
              onPressed: () {},
            ),
            const HomeBaseContainer(
              child: CenterText(text: '팔로잉 채널 불러오는 중...'),
            ),
          ],
        ),
    };
  }
}
