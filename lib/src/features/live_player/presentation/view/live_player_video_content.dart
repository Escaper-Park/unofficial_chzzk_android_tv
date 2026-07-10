part of 'live_player_video_surface.dart';

class _LivePlayerVideoContent extends StatelessWidget {
  const _LivePlayerVideoContent({
    required this.frameValueListenable,
    required this.playbackSuspended,
    required this.expectedVideoAspectRatio,
    required this.video,
  });

  final ValueListenable<_LivePlayerVideoFrameValue> frameValueListenable;
  final bool playbackSuspended;
  final double? expectedVideoAspectRatio;
  final Widget video;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LivePlayerScreenDesign.backgroundColor,
      child: ValueListenableBuilder<_LivePlayerVideoFrameValue>(
        valueListenable: frameValueListenable,
        child: video,
        builder: (context, frameValue, child) {
          return _LivePlayerVideoFrame(
            frameValue: frameValue,
            playbackSuspended: playbackSuspended,
            expectedVideoAspectRatio: expectedVideoAspectRatio,
            video: child!,
          );
        },
      ),
    );
  }
}

class _LivePlayerVideoFrame extends HookWidget {
  const _LivePlayerVideoFrame({
    required this.frameValue,
    required this.playbackSuspended,
    required this.expectedVideoAspectRatio,
    required this.video,
  });

  final _LivePlayerVideoFrameValue frameValue;
  final bool playbackSuspended;
  final double? expectedVideoAspectRatio;
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
          _videoAspectRatio(
            frameValue,
            expectedVideoAspectRatio: expectedVideoAspectRatio,
          ),
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
    final controllerValue = _controller.value;
    final current = value;
    if (current.hasError == controllerValue.hasError &&
        current.isBuffering == controllerValue.isBuffering &&
        current.isCompleted == controllerValue.isCompleted &&
        current.rotationCorrection == controllerValue.rotationCorrection &&
        _sameVideoSize(current.size, controllerValue.size)) {
      return;
    }

    value = _LivePlayerVideoFrameValue.from(controllerValue);
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
    required this.isCompleted,
    required this.size,
    required this.rotationCorrection,
  });

  factory _LivePlayerVideoFrameValue.from(VideoPlayerValue value) {
    return _LivePlayerVideoFrameValue(
      hasError: value.hasError,
      isBuffering: value.isBuffering,
      isCompleted: value.isCompleted,
      size: value.size,
      rotationCorrection: value.rotationCorrection,
    );
  }

  final bool hasError;
  final bool isBuffering;
  final bool isCompleted;
  final Size size;
  final int rotationCorrection;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerVideoFrameValue &&
            other.hasError == hasError &&
            other.isBuffering == isBuffering &&
            other.isCompleted == isCompleted &&
            other.rotationCorrection == rotationCorrection &&
            _sameVideoSize(other.size, size);
  }

  @override
  int get hashCode => Object.hash(
    hasError,
    isBuffering,
    isCompleted,
    size,
    rotationCorrection,
  );
}

bool _sameVideoDouble(double previous, double current) {
  return previous == current || previous.isNaN && current.isNaN;
}

bool _sameVideoSize(Size previous, Size current) {
  return _sameVideoDouble(previous.width, current.width) &&
      _sameVideoDouble(previous.height, current.height);
}

double _videoAspectRatio(
  _LivePlayerVideoFrameValue value, {
  required double? expectedVideoAspectRatio,
}) {
  final width = value.size.width;
  final height = value.size.height;
  final expectedAspectRatio =
      expectedVideoAspectRatio != null &&
          expectedVideoAspectRatio.isFinite &&
          expectedVideoAspectRatio > 0
      ? expectedVideoAspectRatio
      : null;
  final normalizedRotation = value.rotationCorrection.abs() % 360;
  final expectedLayoutAspectRatio =
      expectedAspectRatio != null &&
          (normalizedRotation == 90 || normalizedRotation == 270)
      ? 1 / expectedAspectRatio
      : expectedAspectRatio;
  if (expectedAspectRatio != null &&
      normalizedRotation != 90 &&
      normalizedRotation != 270) {
    // HLS RESOLUTION describes the selected variant's display geometry. Some
    // TV decoders report codec-aligned dimensions such as 640x368 or
    // 1920x1088; using those padded sizes makes PIP appear resolution-dependent.
    return expectedAspectRatio;
  }
  if (width.isFinite && height.isFinite && width > 0 && height > 0) {
    // video_player_android reports VideoSize after applying encoded rotation.
    // rotationCorrection is only for the pixel transform in VideoPlayer and
    // must not be applied to layout geometry a second time.
    final rawAspectRatio = width / height;
    if (width <= _minimumCredibleVideoDimension ||
        height <= _minimumCredibleVideoDimension) {
      return expectedLayoutAspectRatio ?? _fallbackVideoAspectRatio;
    }
    if (expectedAspectRatio == null &&
        (rawAspectRatio - _fallbackVideoAspectRatio).abs() /
                _fallbackVideoAspectRatio <=
            _maximumPaddedVideoAspectRatioError) {
      return _fallbackVideoAspectRatio;
    }
    return rawAspectRatio;
  }

  return expectedLayoutAspectRatio ?? _fallbackVideoAspectRatio;
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
const _minimumCredibleVideoDimension = 16;
const _maximumPaddedVideoAspectRatioError = 0.03;
