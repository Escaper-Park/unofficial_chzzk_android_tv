part of 'live_player_video_surface.dart';

class _LivePlayerVideoContent extends HookWidget {
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
    final frameValueListenable = useMemoized(
      () => _LivePlayerVideoFrameValueListenable(controller),
      [controller],
    );

    useEffect(() {
      return frameValueListenable.dispose;
    }, [frameValueListenable]);

    return ColoredBox(
      color: LivePlayerScreenDesign.backgroundColor,
      child: ClipRect(
        child: ValueListenableBuilder<_LivePlayerVideoFrameValue>(
          valueListenable: frameValueListenable,
          child: VideoPlayer(controller),
          builder: (context, frameValue, child) {
            return _LivePlayerVideoFrame(
              frameValue: frameValue,
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
    required this.frameValue,
    required this.videoViewType,
    required this.playbackSuspended,
    required this.video,
  });

  final _LivePlayerVideoFrameValue frameValue;
  final PlayerVideoViewType videoViewType;
  final bool playbackSuspended;
  final Widget video;

  @override
  Widget build(BuildContext context) {
    final bufferingIndicatorVisible = useState(false);

    useEffect(
      () {
        final shouldDelayBufferingIndicator =
            !frameValue.hasError &&
            frameValue.isBuffering &&
            !playbackSuspended;
        if (!shouldDelayBufferingIndicator) {
          bufferingIndicatorVisible.value = false;
          return null;
        }

        final timer = Timer(_liveBufferingIndicatorDelay, () {
          if (!frameValue.hasError &&
              frameValue.isBuffering &&
              !playbackSuspended) {
            bufferingIndicatorVisible.value = true;
          }
        });

        return timer.cancel;
      },
      [
        frameValue.hasError,
        frameValue.isBuffering,
        playbackSuspended,
      ],
    );

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        _videoWidget(),
        if (bufferingIndicatorVisible.value && frameValue.isBuffering)
          const LivePlayerLoadingIndicator(),
      ],
    );
  }

  Widget _videoWidget() {
    return switch (videoViewType) {
      PlayerVideoViewType.textureView => FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: _videoWidth(frameValue),
          height: _videoHeight(frameValue),
          child: video,
        ),
      ),
      PlayerVideoViewType.platformView => Center(
        child: AspectRatio(
          aspectRatio: frameValue.aspectRatio,
          child: video,
        ),
      ),
    };
  }
}

final class _LivePlayerVideoFrameValueListenable
    extends ValueNotifier<_LivePlayerVideoFrameValue> {
  _LivePlayerVideoFrameValueListenable(this._controller)
    : super(_LivePlayerVideoFrameValue.from(_controller.value)) {
    _controller.addListener(_sync);
  }

  final VideoPlayerController _controller;

  void _sync() {
    final next = _LivePlayerVideoFrameValue.from(_controller.value);
    if (next == value) {
      return;
    }

    value = next;
  }

  @override
  void dispose() {
    _controller.removeListener(_sync);
    super.dispose();
  }
}

@immutable
final class _LivePlayerVideoFrameValue {
  const _LivePlayerVideoFrameValue({
    required this.hasError,
    required this.isBuffering,
    required this.width,
    required this.height,
    required this.aspectRatio,
  });

  factory _LivePlayerVideoFrameValue.from(VideoPlayerValue value) {
    return _LivePlayerVideoFrameValue(
      hasError: value.hasError,
      isBuffering: value.isBuffering,
      width: value.size.width,
      height: value.size.height,
      aspectRatio: value.aspectRatio,
    );
  }

  final bool hasError;
  final bool isBuffering;
  final double width;
  final double height;
  final double aspectRatio;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerVideoFrameValue &&
            other.hasError == hasError &&
            other.isBuffering == isBuffering &&
            _sameVideoDouble(other.width, width) &&
            _sameVideoDouble(other.height, height) &&
            _sameVideoDouble(other.aspectRatio, aspectRatio);
  }

  @override
  int get hashCode => Object.hash(
    hasError,
    isBuffering,
    width,
    height,
    aspectRatio,
  );
}

bool _sameVideoDouble(double previous, double current) {
  return previous == current || previous.isNaN && current.isNaN;
}

double _videoWidth(_LivePlayerVideoFrameValue value) {
  final width = value.width;
  if (width.isFinite && width > 0) {
    return width;
  }

  final aspectRatio = value.aspectRatio;
  if (aspectRatio.isFinite && aspectRatio > 0) {
    return aspectRatio * _fallbackVideoHeight;
  }

  return _fallbackVideoWidth;
}

double _videoHeight(_LivePlayerVideoFrameValue value) {
  final height = value.height;
  if (height.isFinite && height > 0) {
    return height;
  }

  return _fallbackVideoHeight;
}

const _fallbackVideoWidth = 160.0;
const _fallbackVideoHeight = 90.0;
