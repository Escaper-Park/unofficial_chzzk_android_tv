import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../common/widgets/ui/ui_widgets.dart';

class SingleVideoPlayer extends StatelessWidget {
  const SingleVideoPlayer({
    super.key,
    required this.asyncController,
    required this.loadingText,
    required this.errorText,
    required this.endText,
  });

  final AsyncValue<VideoPlayerController?> asyncController;
  final String loadingText;
  final String errorText;
  final String endText;

  @override
  Widget build(BuildContext context) {
    return asyncController.when(
      data: (controller) {
        if (controller == null || !controller.value.isInitialized) {
          return CenteredText(text: endText);
        }

        return Center(
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        );
      },
      error: (_, __) => CenteredText(text: errorText),
      loading: () => CenteredText(text: loadingText),
    );
  }
}
