part of 'vod_player_video_surface.dart';

class _VodPlayerVideoContent extends StatelessWidget {
  const _VodPlayerVideoContent({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: VodPlayerScreenDesign.backgroundColor,
      child: Center(
        child: ValueListenableBuilder<VideoPlayerValue>(
          valueListenable: controller,
          builder: (context, playbackValue, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: playbackValue.aspectRatio,
                  child: child,
                ),
                if (playbackValue.isBuffering)
                  const VodPlayerLoadingIndicator(),
              ],
            );
          },
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
