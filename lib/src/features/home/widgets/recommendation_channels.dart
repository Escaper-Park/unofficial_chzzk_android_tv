import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../client/repository/client_repository.dart';
import '../../live/model/live.dart';
import 'live_channels_grid_view.dart';

part 'recommendation_channels.g.dart';

@riverpod
Future<List<LiveDetail>?> recommenedLives(RecommenedLivesRef ref) async {
  return await ref
      .read(clientRepositoryProvider.notifier)
      .getRecommendedLiveDetails();
}

class RecommendationChannels extends ConsumerWidget {
  const RecommendationChannels({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecommendedLivesProvider = ref.watch(recommenedLivesProvider);

    return asyncRecommendedLivesProvider.when(
      data: (lives) {
        return (lives == null || lives.isEmpty)
            ? const Center(
                child: Text('추천 채널이 없습니다.'),
              )
            : SizedBox(
                height: 320.0,
                child: LiveChannelsGridView(
                  lives: lives,
                  onPressed: (liveDetail) async {},
                ),
              );
      },
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () => const SizedBox(
        height: 320.0,
        child: Center(child: Text('로딩중...')),
      ),
    );
  }
}
