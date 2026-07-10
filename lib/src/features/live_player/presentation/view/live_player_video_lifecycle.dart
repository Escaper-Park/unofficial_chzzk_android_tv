part of 'live_player_video_surface.dart';

void _useLivePlayerControllerLifecycle({
  required VideoPlayerController controller,
  required _LivePlayerVideoFrameValueListenable frameValueListenable,
  required ValueNotifier<bool> initialized,
  required ValueNotifier<bool> failed,
  required ValueNotifier<bool> ended,
  required ObjectRef<LivePlayerWatchEventReporter?> reporterRef,
  required LivePlayerPlaybackSessionController playbackSessionController,
  required _LivePlayerVideoSessionHandle playbackSessionHandle,
  required ObjectRef<double> volumeRef,
  required bool Function() playbackSuspended,
  required VoidCallback onReady,
  required VoidCallback reportPlaybackFailure,
  required VoidCallback syncWatchEvent,
}) {
  useEffect(
    () {
      var disposed = false;
      final reporter = reporterRef.value;
      playbackSessionController.register(playbackSessionHandle.sessionHandle);

      void handleControllerChange() {
        final value = frameValueListenable.value;
        if (value.hasError) {
          reportPlaybackFailure();
          return;
        }

        if (value.isCompleted) {
          syncWatchEvent();
        }
      }

      frameValueListenable.addListener(handleControllerChange);

      Future<void> initializeController() async {
        try {
          await playbackSessionController.waitForControllerDisposals();
          if (disposed) {
            return;
          }

          await controller.initialize();
          if (disposed) {
            return;
          }

          final volume = volumeRef.value;
          if (controller.value.volume != volume) {
            await controller.setVolume(volume);
            if (disposed) {
              return;
            }
          }

          await _syncLivePlayerControllerPlayback(
            controller: controller,
            playbackSuspended: playbackSuspended(),
          );
          if (disposed) {
            return;
          }

          initialized.value = true;
          onReady();
          if (disposed) {
            return;
          }

          syncWatchEvent();
        } on Object {
          if (!disposed) {
            reportPlaybackFailure();
          }
        }
      }

      // A keyed Hook effect is mounted before the previous effect is disposed.
      // Defer startup by one microtask so the previous native player can first
      // publish its disposal barrier for this slot.
      unawaited(Future<void>.microtask(initializeController));

      return () {
        disposed = true;
        reporter?.suspend();
        frameValueListenable.removeListener(handleControllerChange);
        playbackSessionController.unregister(
          playbackSessionHandle.sessionHandle,
        );
        playbackSessionHandle.suspend();
        unawaited(
          playbackSessionController.scheduleControllerDisposal(
            playbackSessionHandle.disposeController,
          ),
        );
      };
    },
    [
      controller,
      frameValueListenable,
      playbackSessionController,
      playbackSessionHandle,
    ],
  );
}

Future<void> _syncLivePlayerControllerPlayback({
  required VideoPlayerController controller,
  required bool playbackSuspended,
}) async {
  final value = controller.value;
  if (!value.isInitialized) {
    return;
  }

  if (playbackSuspended) {
    if (value.isPlaying) {
      await controller.pause();
    }
    return;
  }

  if (!value.isPlaying && !value.isCompleted) {
    await controller.play();
  }
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
    if (_suspended) {
      return;
    }

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

  Future<void> disposeController() {
    if (_disposed) {
      return Future<void>.value();
    }

    _disposed = true;
    try {
      return _controller.dispose().catchError((Object _) {});
    } on Object {
      // The widget is already leaving the tree; cleanup must not surface.
      return Future<void>.value();
    }
  }
}
