part of 'live_player_video_surface.dart';

class _LivePlayerVideoContent extends StatelessWidget {
  const _LivePlayerVideoContent({
    required this.controller,
    required this.playbackValue,
    required this.videoViewType,
  });

  final VideoPlayerController controller;
  final VideoPlayerValue playbackValue;
  final PlayerVideoViewType videoViewType;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LivePlayerScreenDesign.backgroundColor,
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            _videoWidget(),
            if (playbackValue.isBuffering) const LivePlayerLoadingIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _videoWidget() {
    return switch (videoViewType) {
      PlayerVideoViewType.textureView => FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: _videoWidth(playbackValue),
          height: _videoHeight(playbackValue),
          child: VideoPlayer(controller),
        ),
      ),
      PlayerVideoViewType.platformView => Center(
        child: AspectRatio(
          aspectRatio: playbackValue.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
    };
  }
}

double _videoWidth(VideoPlayerValue value) {
  final width = value.size.width;
  if (width.isFinite && width > 0) {
    return width;
  }

  final aspectRatio = value.aspectRatio;
  if (aspectRatio.isFinite && aspectRatio > 0) {
    return aspectRatio * _fallbackVideoHeight;
  }

  return _fallbackVideoWidth;
}

double _videoHeight(VideoPlayerValue value) {
  final height = value.size.height;
  if (height.isFinite && height > 0) {
    return height;
  }

  return _fallbackVideoHeight;
}

const _fallbackVideoWidth = 160.0;
const _fallbackVideoHeight = 90.0;
