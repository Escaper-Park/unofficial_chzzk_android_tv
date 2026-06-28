part of 'live_player_video_surface.dart';

void _useLivePlayerControllerLifecycle({
  required VideoPlayerController controller,
  required ValueNotifier<bool> initialized,
  required ValueNotifier<bool> failed,
  required ValueNotifier<bool> ended,
  required ObjectRef<LivePlayerWatchEventReporter?> reporterRef,
  required LivePlayerPlaybackSessionController playbackSessionController,
  required _LivePlayerVideoSessionHandle playbackSessionHandle,
  required double volume,
  required bool Function() playbackSuspended,
  required VoidCallback onReady,
  required VoidCallback reportPlaybackFailure,
  required VoidCallback syncWatchEvent,
}) {
  useEffect(
    () {
      var disposed = false;
      final reporter = reporterRef.value;
      initialized.value = false;
      failed.value = false;
      ended.value = false;
      playbackSessionController.register(playbackSessionHandle.sessionHandle);

      void handleControllerChange() {
        if (controller.value.hasError) {
          reportPlaybackFailure();
          return;
        }

        if (controller.value.isCompleted) {
          syncWatchEvent();
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
              await controller.setVolume(volume);
              if (disposed) {
                return;
              }
              onReady();
              if (disposed) {
                return;
              }
              if (!playbackSuspended()) {
                await controller.play();
                if (disposed) {
                  return;
                }
              }

              syncWatchEvent();
            })
            .catchError((Object _) {
              if (disposed) {
                return;
              }

              reportPlaybackFailure();
            }),
      );

      return () {
        disposed = true;
        reporter?.suspend();
        controller.removeListener(handleControllerChange);
        playbackSessionController.unregister(
          playbackSessionHandle.sessionHandle,
        );
        unawaited(playbackSessionHandle.disposeController());
      };
    },
    [
      controller,
      playbackSessionController,
      playbackSessionHandle,
    ],
  );
}

final class _LivePlayerVideoSessionHandle {
  _LivePlayerVideoSessionHandle(this._controller);

  final VideoPlayerController _controller;
  late final LivePlayerPlaybackSessionHandle sessionHandle =
      LivePlayerPlaybackSessionHandle(suspend);
  var _suspended = false;
  var _disposed = false;

  bool get suspended => _suspended;

  void suspend() {
    _suspended = true;
    if (_disposed || !_controller.value.isInitialized) {
      return;
    }

    try {
      unawaited(_controller.setVolume(0).catchError((Object _) {}));
    } on Object {
      // Best-effort suspend path.
    }

    try {
      unawaited(_controller.pause().catchError((Object _) {}));
    } on Object {
      // Best-effort suspend path.
    }
  }

  Future<void> disposeController() async {
    if (_disposed) {
      return;
    }

    _disposed = true;
    try {
      await _controller.dispose();
    } on Object {
      // The widget is already leaving the tree; cleanup must not surface.
    }
  }
}
