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
    final playbackValue = useListenable(controller).value;
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
        unawaited(controller.dispose());
      };
    }, [controller]);

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
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _videoWidth(playbackValue),
            height: _videoHeight(playbackValue),
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
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

VideoViewType _videoViewTypeFor(PlayerVideoViewType videoViewType) {
  return switch (videoViewType) {
    PlayerVideoViewType.textureView => VideoViewType.textureView,
    PlayerVideoViewType.platformView => VideoViewType.platformView,
  };
}

const _fallbackVideoWidth = 160.0;
const _fallbackVideoHeight = 90.0;
