import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/dimensions.dart';
import '../../../../controller/video/video_controller.dart';
import '../../../common/header_with_show_more_button.dart';
import 'video_container.dart';

class ChannelVideos extends ConsumerWidget {
  const ChannelVideos({super.key, required this.channelId});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videosProvider =
        ref.watch(VideoControllerProvider(channelId: channelId));

    return videosProvider.when(
      data: (videos) {
        return videos == null
            ? const SizedBox(
                height: 50.0,
                child: Center(
                  child: Text('동영상이 없습니다'),
                ),
              )
            : _baseContainerWithHeader(
                showMoreCallback: () {},
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];

                    return VideoContainer(
                      key: Key('${videos[index].videoNo}_video'),
                      video: video,
                      onPressed: () async {
                        await ref
                            .read(VideoControllerProvider(channelId: channelId)
                                .notifier)
                            .showSingleViewVod(
                              context: context,
                              videoNo: video.videoNo,
                            );
                      },
                    );
                  },
                ),
              );
      },
      error: (error, stackTrace) => const SizedBox(
        height: 50.0,
        child: Center(
          child: Text('동영상을 불러오는데 실패했습니다'),
        ),
      ),
      loading: () => _baseContainerWithHeader(
        showMoreCallback: null,
        child: const Center(
          child: Text('동영상 불러오는 중...'),
        ),
      ),
    );
  }

  Widget _baseContainerWithHeader({
    required VoidCallback? showMoreCallback,
    required Widget child,
  }) {
    return Column(
      children: [
        HeaderWithShowMoreButton(
          headerText: '동영상',
          onPressed: showMoreCallback,
        ),
        SizedBox(
          height: Dimensions.liveContainerHeight - 25.0,
          child: child,
        ),
      ],
    );
  }
}
