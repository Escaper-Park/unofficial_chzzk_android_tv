part of 'live_player_video_surface.dart';

class _LivePlayerVideoContent extends StatelessWidget {
  const _LivePlayerVideoContent({
    required this.controller,
    required this.playbackValue,
  });

  final VideoPlayerController controller;
  final VideoPlayerValue playbackValue;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LivePlayerScreenDesign.backgroundColor,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: playbackValue.aspectRatio,
              child: VideoPlayer(controller),
            ),
            if (playbackValue.isBuffering) const LivePlayerLoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
