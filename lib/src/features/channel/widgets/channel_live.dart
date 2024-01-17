import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/repository/live_repository.dart';

import '../../../utils/router/app_router.dart';
import '../../client/repository/client_repository.dart';
import '../../home/widgets/home_live_container.dart';
import '../../live/model/live.dart';

part 'channel_live.g.dart';

@riverpod
Future<LiveDetail?> currentChannelLiveDetail(
  CurrentChannelLiveDetailRef ref, {
  required String channelId,
}) async {
  final liveDetail = await ref
      .watch(clientRepositoryProvider.notifier)
      .getLiveDetailFromChannelId(
        channelId,
      );

  return liveDetail;
}

class ChannelLive extends ConsumerWidget {
  const ChannelLive(this.channelId, {super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLiveDetail = ref.watch(
      CurrentChannelLiveDetailProvider(channelId: channelId),
    );

    return asyncLiveDetail.when(
      data: (liveDetail) {
        return liveDetail == null
            ? const Text('현재 라이브를 진행하고 있지 않습니다.')
            : MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  final videoPath =
                      ref.watch(liveRepositoryProvider).getLivePath(liveDetail);

                  if (videoPath != null && context.mounted) {
                    context.pushNamed(
                      AppRoute.singleView.routeName,
                      queryParameters: {
                        'videoPath': videoPath,
                      },
                    );
                  }
                },
                child: SizedBox(
                  height: 200.0,
                  width: 250.0,
                  child: LiveContainer(liveDetail: liveDetail),
                ),
              );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const SizedBox(height: 200.0, width: 250.0),
    );
  }
}
