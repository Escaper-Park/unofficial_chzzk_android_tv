part of 'vod_player_video_surface.dart';

class _VodPlayerVideoContent extends HookWidget {
  const _VodPlayerVideoContent({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    final frameValueListenable = useMemoized(
      () => _VodPlayerVideoFrameValueListenable(controller),
      [controller],
    );

    useEffect(() {
      return frameValueListenable.dispose;
    }, [frameValueListenable]);

    return ColoredBox(
      color: VodPlayerScreenDesign.backgroundColor,
      child: Center(
        child: ValueListenableBuilder<_VodPlayerVideoFrameValue>(
          valueListenable: frameValueListenable,
          child: VideoPlayer(controller),
          builder: (context, frameValue, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: frameValue.aspectRatio,
                  child: child!,
                ),
                if (frameValue.isBuffering) const VodPlayerLoadingIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}

final class _VodPlayerVideoFrameValueListenable
    extends ValueNotifier<_VodPlayerVideoFrameValue> {
  _VodPlayerVideoFrameValueListenable(this._controller)
    : super(_VodPlayerVideoFrameValue.from(_controller.value)) {
    _controller.addListener(_sync);
  }

  final VideoPlayerController _controller;

  void _sync() {
    final next = _VodPlayerVideoFrameValue.from(_controller.value);
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
final class _VodPlayerVideoFrameValue {
  const _VodPlayerVideoFrameValue({
    required this.isBuffering,
    required this.aspectRatio,
  });

  factory _VodPlayerVideoFrameValue.from(VideoPlayerValue value) {
    return _VodPlayerVideoFrameValue(
      isBuffering: value.isBuffering,
      aspectRatio: value.aspectRatio,
    );
  }

  final bool isBuffering;
  final double aspectRatio;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _VodPlayerVideoFrameValue &&
            other.isBuffering == isBuffering &&
            _sameVodVideoDouble(other.aspectRatio, aspectRatio);
  }

  @override
  int get hashCode => Object.hash(isBuffering, aspectRatio);
}

bool _sameVodVideoDouble(double previous, double current) {
  return previous == current || previous.isNaN && current.isNaN;
}
