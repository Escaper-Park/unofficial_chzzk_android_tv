import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../common/widgets/center_widgets.dart';
import 'controller/live_player_controller.dart';

class SingleLivePlayer extends ConsumerWidget {
  const SingleLivePlayer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncController =
        ref.watch(singleLivePlayerControllerProvider(index: index));

    return asyncController.when(
      data: (controller) {
        return Center(
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(
              controller,
            ),
          ),
        );
      },
      error: (error, stackTrace) => CenteredText(text: error.toString()),
      loading: () => const CenteredText(text: '라이브 로딩중...'),
    );
  }
}
