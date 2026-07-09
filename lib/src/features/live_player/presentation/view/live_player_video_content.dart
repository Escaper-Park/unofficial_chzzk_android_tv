part of 'live_player_video_surface.dart';

class _LivePlayerVideoContent extends HookWidget {
  const _LivePlayerVideoContent({
    required this.controller,
    required this.playbackSuspended,
  });

  final VideoPlayerController controller;
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
    required this.playbackSuspended,
    required this.video,
  });

  final _LivePlayerVideoFrameValue frameValue;
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final videoSize = _containedVideoSize(
          constraints.biggest,
          _videoAspectRatio(frameValue),
        );

        return Center(
          child: SizedBox(
            width: videoSize.width,
            height: videoSize.height,
            child: video,
          ),
        );
      },
    );
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
    required this.aspectRatio,
  });

  factory _LivePlayerVideoFrameValue.from(VideoPlayerValue value) {
    return _LivePlayerVideoFrameValue(
      hasError: value.hasError,
      isBuffering: value.isBuffering,
      aspectRatio: value.aspectRatio,
    );
  }

  final bool hasError;
  final bool isBuffering;
  final double aspectRatio;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerVideoFrameValue &&
            other.hasError == hasError &&
            other.isBuffering == isBuffering &&
            _sameVideoDouble(other.aspectRatio, aspectRatio);
  }

  @override
  int get hashCode => Object.hash(hasError, isBuffering, aspectRatio);
}

bool _sameVideoDouble(double previous, double current) {
  return previous == current || previous.isNaN && current.isNaN;
}

double _videoAspectRatio(_LivePlayerVideoFrameValue value) {
  final aspectRatio = value.aspectRatio;
  if (aspectRatio.isFinite && aspectRatio > 0) {
    return aspectRatio;
  }

  return _fallbackVideoAspectRatio;
}

Size _containedVideoSize(Size bounds, double aspectRatio) {
  final width = bounds.width;
  final height = bounds.height;
  if (!width.isFinite || !height.isFinite || width <= 0 || height <= 0) {
    return Size.zero;
  }

  final boundsAspectRatio = width / height;
  if (boundsAspectRatio > aspectRatio) {
    return Size(height * aspectRatio, height);
  }

  return Size(width, width / aspectRatio);
}

const _fallbackVideoAspectRatio = 16 / 9;
