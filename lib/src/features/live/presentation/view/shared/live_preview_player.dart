import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../../../../settings/domain/entities/settings_preferences.dart';

class LivePreviewPlayer extends HookWidget {
  const LivePreviewPlayer({
    super.key,
    required this.playbackUri,
    required this.videoViewType,
    required this.muted,
    this.onFailure,
  });

  final Uri playbackUri;
  final PlayerVideoViewType videoViewType;
  final bool muted;
  final VoidCallback? onFailure;

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
      () => VideoPlayerController.networkUrl(
        playbackUri,
        viewType: _videoViewTypeFor(videoViewType),
      ),
      [playbackUri, videoViewType],
    );
    final frameValueListenable = useMemoized(
      () => _LivePreviewVideoFrameValueListenable(controller),
      [controller],
    );
    final initialized = useState(false);
    final failed = useState(false);

    useEffect(() {
      var disposed = false;
      initialized.value = false;
      failed.value = false;

      void reportFailure() {
        if (disposed || failed.value) {
          return;
        }

        failed.value = true;
        onFailure?.call();
      }

      void handleControllerChange() {
        if (controller.value.hasError) {
          reportFailure();
        }
      }

      controller.addListener(handleControllerChange);
      unawaited(
        controller
            .initialize()
            .then((_) async {
              if (disposed) {
                return;
              }

              initialized.value = true;
              await controller.setVolume(muted ? 0 : 1);
              if (disposed) {
                return;
              }
              await controller.play();
              if (disposed) {
                return;
              }
            })
            .catchError((Object _) {
              reportFailure();
            }),
      );

      return () {
        disposed = true;
        controller.removeListener(handleControllerChange);
        frameValueListenable.dispose();
        unawaited(controller.dispose());
      };
    }, [controller, frameValueListenable]);

    useEffect(() {
      if (!initialized.value || failed.value) {
        return null;
      }

      unawaited(controller.setVolume(muted ? 0 : 1));
      return null;
    }, [controller, initialized.value, failed.value, muted]);

    if (!initialized.value || failed.value) {
      return const SizedBox.shrink();
    }

    return ColoredBox(
      color: Colors.black,
      child: ClipRect(
        child: ValueListenableBuilder<_LivePreviewVideoFrameValue>(
          valueListenable: frameValueListenable,
          child: VideoPlayer(controller),
          builder: (context, frameValue, child) {
            return FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _videoWidth(frameValue),
                height: _videoHeight(frameValue),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}

final class _LivePreviewVideoFrameValueListenable
    extends ValueNotifier<_LivePreviewVideoFrameValue> {
  _LivePreviewVideoFrameValueListenable(this._controller)
    : super(_LivePreviewVideoFrameValue.from(_controller.value)) {
    _controller.addListener(_sync);
  }

  final VideoPlayerController _controller;

  void _sync() {
    final next = _LivePreviewVideoFrameValue.from(_controller.value);
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
final class _LivePreviewVideoFrameValue {
  const _LivePreviewVideoFrameValue({
    required this.width,
    required this.height,
    required this.aspectRatio,
  });

  factory _LivePreviewVideoFrameValue.from(VideoPlayerValue value) {
    return _LivePreviewVideoFrameValue(
      width: value.size.width,
      height: value.size.height,
      aspectRatio: value.aspectRatio,
    );
  }

  final double width;
  final double height;
  final double aspectRatio;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePreviewVideoFrameValue &&
            _sameVideoDouble(other.width, width) &&
            _sameVideoDouble(other.height, height) &&
            _sameVideoDouble(other.aspectRatio, aspectRatio);
  }

  @override
  int get hashCode => Object.hash(width, height, aspectRatio);
}

double _videoWidth(_LivePreviewVideoFrameValue value) {
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

double _videoHeight(_LivePreviewVideoFrameValue value) {
  final height = value.height;
  if (height.isFinite && height > 0) {
    return height;
  }

  return _fallbackVideoHeight;
}

bool _sameVideoDouble(double previous, double current) {
  return previous == current || previous.isNaN && current.isNaN;
}

VideoViewType _videoViewTypeFor(PlayerVideoViewType videoViewType) {
  return switch (videoViewType) {
    PlayerVideoViewType.textureView => VideoViewType.textureView,
    PlayerVideoViewType.platformView => VideoViewType.platformView,
  };
}

const _fallbackVideoWidth = 160.0;
const _fallbackVideoHeight = 90.0;
