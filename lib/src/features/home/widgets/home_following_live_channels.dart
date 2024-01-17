import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../client/repository/client_repository.dart';
import '../../live/model/live.dart';
import '../controller/home_controller.dart';
import 'live_channels_grid_view.dart';

part 'home_following_live_channels.g.dart';

@riverpod
Future<List<LiveDetail>?> followingLiveDetails(
  FollowingLiveDetailsRef ref,
) async {
  return await ref
      .read(clientRepositoryProvider.notifier)
      .getFollowingLiveChannels();
}

class HomeFollowingLiveChannels extends ConsumerWidget {
  const HomeFollowingLiveChannels({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingLiveDetailsProvider =
        ref.watch(followingLiveDetailsProvider);

    final auth = ref.watch(clientRepositoryProvider).value;

    return auth == null
        ? const SizedBox(
            height: 50.0,
            child: Center(
              child: Text('아직 로그인을 하지 않았습니다'),
            ),
          )
        : asyncFollowingLiveDetailsProvider.when(
            data: (lives) {
              return (lives == null || lives.isEmpty)
                  ? const Center(
                      child: Text('팔로우 채널이 없습니다'),
                    )
                  : SizedBox(
                      height: 320.0,
                      child: LiveChannelsGridView(
                        lives: lives,
                        onPressed: (liveDetail) async {
                          await ref
                              .read(homeControllerProvider.notifier)
                              .showLive(
                                context: context,
                                liveDetail: liveDetail,
                              );
                        },
                      ),
                    );
            },
            error: (error, stackTrace) => const Center(child: Text('Error')),
            loading: () => const SizedBox(
              height: 320.0,
              child: Center(child: Text('로딩중...')),
            ),
          );
  }
}
