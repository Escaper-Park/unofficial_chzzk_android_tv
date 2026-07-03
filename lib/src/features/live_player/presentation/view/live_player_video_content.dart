part of 'live_player_video_surface.dart';

class _LivePlayerVideoContent extends StatelessWidget {
  const _LivePlayerVideoContent({
    required this.controller,
    required this.videoViewType,
    required this.playbackSuspended,
  });

  final VideoPlayerController controller;
  final PlayerVideoViewType videoViewType;
  final bool playbackSuspended;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LivePlayerScreenDesign.backgroundColor,
      child: ClipRect(
        child: ValueListenableBuilder<VideoPlayerValue>(
          valueListenable: controller,
          child: VideoPlayer(controller),
          builder: (context, playbackValue, child) {
            return _LivePlayerVideoFrame(
              playbackValue: playbackValue,
              videoViewType: videoViewType,
              playbackSuspended: playbackSuspended,
              video: child!,
            );
          },
        ),
      ),
    );
  }
}

class _LivePlayerVideoFrame extends HookWidget {
  const _LivePlayerVideoFrame({
    required this.playbackValue,
    required this.videoViewType,
    required this.playbackSuspended,
    required this.video,
  });

  final VideoPlayerValue playbackValue;
  final PlayerVideoViewType videoViewType;
  final bool playbackSuspended;
  final Widget video;

  @override
  Widget build(BuildContext context) {
    final bufferingIndicatorVisible = useState(false);

    useEffect(
      () {
        final shouldDelayBufferingIndicator =
            !playbackValue.hasError &&
            playbackValue.isBuffering &&
            !playbackSuspended;
        if (!shouldDelayBufferingIndicator) {
          bufferingIndicatorVisible.value = false;
          return null;
        }

        final timer = Timer(_liveBufferingIndicatorDelay, () {
          if (!playbackValue.hasError &&
              playbackValue.isBuffering &&
              !playbackSuspended) {
            bufferingIndicatorVisible.value = true;
          }
        });

        return timer.cancel;
      },
      [
        playbackValue.hasError,
        playbackValue.isBuffering,
        playbackSuspended,
      ],
    );

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        _videoWidget(),
        if (bufferingIndicatorVisible.value && playbackValue.isBuffering)
          const LivePlayerLoadingIndicator(),
      ],
    );
  }

  Widget _videoWidget() {
    return switch (videoViewType) {
      PlayerVideoViewType.textureView => FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: _videoWidth(playbackValue),
          height: _videoHeight(playbackValue),
          child: video,
        ),
      ),
      PlayerVideoViewType.platformView => Center(
        child: AspectRatio(
          aspectRatio: playbackValue.aspectRatio,
          child: video,
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
