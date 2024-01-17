import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/model/auth.dart';
import '../../client/repository/client_repository.dart';
import '../controller/following_controller.dart';
import '../model/following.dart';
import 'following_info_card.dart';

part 'all_following_channels.g.dart';

@riverpod
Future<List<Following>?> allFollowingChannels(
    AllFollowingChannelsRef ref) async {
  return await ref
      .read(clientRepositoryProvider.notifier)
      .getFollowingChannels();
}

class AllFollowingChannels extends ConsumerWidget {
  const AllFollowingChannels(this.auth, {super.key});

  final Auth? auth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingProvider = ref.watch(allFollowingChannelsProvider);

    return auth == null
        ? const SizedBox.shrink()
        : asyncFollowingProvider.when(
            data: (follows) {
              if ((follows == null || follows.isEmpty)) {
                return const Center(
                  child: Text('팔로우 채널이 없습니다'),
                );
              } else {
                follows.shuffle();

                return ListView.builder(
                  itemCount: follows.length,
                  itemBuilder: (context, index) => FollowingInfoCard(
                    following: follows[index],
                    callback: () async {
                      await ref
                          .read(followingControllerProvider.notifier)
                          .setCurrentChannel(follows[index]);
                    },
                  ),
                );
              }
            },
            error: (error, stackTrace) => const Center(child: Text('Error')),
            loading: () => const Center(child: Text('로딩중...')),
          );
  }
}
