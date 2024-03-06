import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/video_player/controller/multi_view_stream_controller.dart';
import '../../utils/video_player/multi_view_network_video.dart';
import '../live/model/live.dart';

class MultiViewStreamingScreen extends ConsumerWidget {
  const MultiViewStreamingScreen({super.key, required this.liveDetails});

  final List<LiveDetail> liveDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String?> profileImageUrls =
        liveDetails.map((detail) => detail.channel.channelImageUrl).toList();

    final initialVolumeSettings = ref.watch(multiViewVolumeControllerProvider);

    return Scaffold(
      body: MultiViewNetworkVideos(
        liveDetails: liveDetails,
        initialVolumeSettings: initialVolumeSettings,
        profileImageUrls: profileImageUrls,
      ),
    );
  }
}
