import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controller/following/following_controller.dart';
import '../../../../model/following/following.dart';
import './following_channel_info_card.dart';

class FollowingList extends ConsumerWidget {
  const FollowingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingChannels = ref.watch(followingControllerProvider);

    return asyncFollowingChannels.when(
      data: (followings) {
        return followings == null
            ? const Center(
                child: Text('팔로우 채널이 없습니다'),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(right: 12.0),
                itemCount: followings.length,
                itemBuilder: (context, index) {
                  final Following following = followings[index];

                  return FollowingChannelInfoCard(
                    autofocus: index == 0 ? true : false,
                    following: following,
                    onPressed: () {
                      ref
                          .read(currentFollowingChannelControllerProvider
                              .notifier)
                          .setCurrentFollowingChannel(following);
                    },
                  );
                },
              );
      },
      error: (error, stackTrace) => const Center(
        child: Text('팔로우 목록을 불러오지 못했습니다.'),
      ),
      loading: () => const Center(
        child: Text('팔로우 채널 불러오는 중...'),
      ),
    );
  }
}
