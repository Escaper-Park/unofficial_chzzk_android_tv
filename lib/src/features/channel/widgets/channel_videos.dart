import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/router/app_router.dart';
import '../../client/repository/client_repository.dart';
import '../../video/model/video.dart';
import '../../video/widgets/video_container.dart';

part 'channel_videos.g.dart';

@riverpod
Future<List<BaseVideo>?> channelVideoList(
  ChannelVideoListRef ref, {
  required String channelId,
}) async {
  return await ref
      .read(clientRepositoryProvider.notifier)
      .getChannelVideoList(channelId);
}

class ChannelVideos extends ConsumerWidget {
  const ChannelVideos(this.channelId, {super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVideos =
        ref.watch(ChannelVideoListProvider(channelId: channelId));

    return asyncVideos.when(
      data: (videos) {
        return (videos == null || videos.isEmpty)
            ? const Center(
                child: Text('동영상이 없습니다.'),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisExtent: 190.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final BaseVideo video = videos[index];

                  return MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      final vodPath = await ref
                          .read(clientRepositoryProvider.notifier)
                          .getVodPath(video.videoNo);

                      if (vodPath != null && context.mounted) {
                        context.pushNamed(
                          AppRoute.vod.routeName,
                          queryParameters: {'vodPath': vodPath},
                        );
                      }
                    },
                    child: VideoContainer(
                      video: video,
                    ),
                  );
                },
              );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const SizedBox.shrink(),
    );
  }
}
