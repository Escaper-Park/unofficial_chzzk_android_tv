import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_text.dart';
import '../../../common/widgets/header_text.dart';
import '../../channel/controller/channel_controller.dart';
import '../controller/following_controller.dart';
import 'following_channel_info_card.dart';

class FollowingList extends ConsumerWidget {
  const FollowingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingList = ref.watch(followingControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(text: '팔로잉 채널'),
        Expanded(
          child: switch (asyncFollowingList) {
            AsyncData(:final value) => value == null
                ? const CenterText(text: '팔로잉 채널이 없습니다')
                : ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final following = value[index];

                      return FollowingChannelInfoCard(
                        autofocus: index == 0 ? true : false,
                        following: following,
                        onPressed: () {
                          ref
                              .read(channelControllerProvider.notifier)
                              .selectChannel(following.channel.channelId);
                        },
                      );
                    },
                  ),
            AsyncError() => const CenterText(text: '팔로잉 목록을 불러오는데 실패했습니다'),
            _ => const CenterText(text: '팔로잉 채널 불러오는 중...')
          },
        ),
      ],
    );
  }
}
