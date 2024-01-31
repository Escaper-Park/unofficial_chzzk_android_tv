import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controller/multi_view/multi_view_controller.dart';
import '../../../model/live/live.dart';
import '../../../utils/video_player/multi_view_network_videos.dart';

class MultiViewLiveScreen extends ConsumerWidget {
  const MultiViewLiveScreen({super.key, required this.liveDetails});

  final List<LiveDetail> liveDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> livePaths =
        liveDetails.map((detail) => detail.livePath!).toList();

    final List<String?> profileImageUrls =
        liveDetails.map((detail) => detail.channel.channelImageUrl).toList();

    final initialVolumeSettings = ref.watch(multiViewVolumeControlsProvider);

    // Null Check
    return Scaffold(
      body: MultiViewNetworkVideos(
        videoPaths: livePaths,
        initialVolumeSettings: initialVolumeSettings,
        profileImageUrls: profileImageUrls,
      ),
    );
  }
}
