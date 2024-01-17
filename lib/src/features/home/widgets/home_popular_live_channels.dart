import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/widgets/live_channels_grid_view.dart';

import '../../client/repository/client_repository.dart';
import '../../live/model/live.dart';
import '../controller/home_controller.dart';

part 'home_popular_live_channels.g.dart';

@riverpod
Future<List<LiveDetail>?> popularLiveDetails(PopularLiveDetailsRef ref) async {
  return await ref
      .watch(clientRepositoryProvider.notifier)
      .getPopularChannelsLiveDetails();
}

class HomePopularLiveChannels extends ConsumerWidget {
  const HomePopularLiveChannels({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPopularLiveDetailsProvider =
        ref.watch(popularLiveDetailsProvider);

    return asyncPopularLiveDetailsProvider.when(
      data: (lives) {
        return (lives == null || lives.isEmpty)
            ? const Center(
                child: Text('인기 채널을 불러올 수 없습니다.'),
              )
            : SizedBox(
                height: 320.0,
                child: LiveChannelsGridView(
                  lives: lives,
                  onPressed: (liveDetail) async {
                    await ref.read(homeControllerProvider.notifier).showLive(
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
