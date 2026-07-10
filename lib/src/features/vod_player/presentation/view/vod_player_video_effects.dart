part of 'vod_player_video_surface.dart';

void _useVodPlayerTimerDisposal({
  required PeriodicCallbackTimer watchEventSyncTimer,
  required PeriodicCallbackTimer chatSyncTimer,
}) {
  useEffect(() {
    return () {
      watchEventSyncTimer.dispose();
      chatSyncTimer.dispose();
    };
  }, [watchEventSyncTimer, chatSyncTimer]);
}

void _syncVodPlayerVideoRefs({
  required ObjectRef<bool> playbackPausedRef,
  required ObjectRef<bool> appPlaybackSuspendedRef,
  required ObjectRef<VodPlayerWatchEventReporter?> reporterRef,
  required ObjectRef<VodPlayerChatReplayController?> chatReplayControllerRef,
  required ObjectRef<VoidCallback> onReadyRef,
  required ObjectRef<VoidCallback> onFailureRef,
  required ObjectRef<void Function(Duration position, Duration duration)>
  onPositionChangedRef,
  required ObjectRef<void Function(Duration position, Duration duration)>
  onEndedRef,
  required bool playbackPaused,
  required bool appPlaybackSuspended,
  required VodPlayerWatchEventReporter? reporter,
  required VodPlayerChatReplayController? chatReplayController,
  required VoidCallback onReady,
  required VoidCallback onFailure,
  required void Function(Duration position, Duration duration)
  onPositionChanged,
  required void Function(Duration position, Duration duration) onEnded,
}) {
  playbackPausedRef.value = playbackPaused;
  appPlaybackSuspendedRef.value = appPlaybackSuspended;
  reporterRef.value = reporter;
  chatReplayControllerRef.value = chatReplayController;
  onReadyRef.value = onReady;
  onFailureRef.value = onFailure;
  onPositionChangedRef.value = onPositionChanged;
  onEndedRef.value = onEnded;
}

void _useVodPlayerReporterReplacement({
  required VideoPlayerController controller,
  required VodPlayerWatchEventReporter? reporter,
  required ObjectRef<VodPlayerWatchEventReporter?> previousReporterRef,
  required ObjectRef<VodPlayerWatchEventReporter?> reporterRef,
  required int Function() currentPositionSeconds,
}) {
  useEffect(() {
    final previousReporter = previousReporterRef.value;
    if (previousReporter != null && previousReporter != reporter) {
      previousReporter.end(
        positionSeconds: currentPositionSeconds(),
        reportPauseIfActive: false,
      );
      unawaited(previousReporter.flush());
    }

    previousReporterRef.value = reporter;
    reporterRef.value = reporter;
    return null;
  }, [controller, reporter]);
}

void _useVodPlayerWakelock({
  required SerializedWakelockController wakelockController,
  required bool playbackShouldRun,
}) {
  useEffect(() {
    wakelockController.setEnabled(enabled: playbackShouldRun);
    return null;
  }, [wakelockController, playbackShouldRun]);

  useEffect(() {
    return wakelockController.dispose;
  }, [wakelockController]);
}

void _useVodPlayerVolume({
  required VideoPlayerController controller,
  required bool muted,
}) {
  useEffect(() {
    unawaited(controller.setVolume(muted ? 0 : 1));
    return null;
  }, [controller, muted]);
}

void _useVodPlayerPlaybackSpeed({
  required VideoPlayerController controller,
  required ValueNotifier<bool> initialized,
  required ValueNotifier<bool> failed,
  required double playbackSpeed,
}) {
  useEffect(() {
    if (!initialized.value || failed.value) {
      return null;
    }

    unawaited(controller.setPlaybackSpeed(playbackSpeed));
    return null;
  }, [controller, initialized.value, failed.value, playbackSpeed]);
}

void _useVodPlayerPlaybackRun({
  required VideoPlayerController controller,
  required ValueNotifier<bool> initialized,
  required ValueNotifier<bool> failed,
  required bool playbackShouldRun,
  required VodPlayerWatchEventSeekHold watchEventSeekHold,
  required VodPlayerWatchEventReporter? reporter,
  required VodPlayerChatReplayController? chatReplayController,
  required ObjectRef<VodPlayerWatchEventReporter?> reporterRef,
  required ObjectRef<VodPlayerChatReplayController?> chatReplayControllerRef,
  required int Function() currentPositionSeconds,
  required VoidCallback syncChatReplay,
}) {
  useEffect(
    () {
      if (!initialized.value || failed.value) {
        return null;
      }

      final reporter = reporterRef.value;
      final chatController = chatReplayControllerRef.value;
      if (!playbackShouldRun) {
        reporter?.pause(positionSeconds: currentPositionSeconds());
        chatController?.pauseReplayClock();
        unawaited(controller.pause());
      } else {
        if (!watchEventSeekHold.isHeld) {
          reporter?.start(positionSeconds: currentPositionSeconds());
        }
        unawaited(controller.play());
        syncChatReplay();
      }
      return null;
    },
    [
      controller,
      initialized.value,
      failed.value,
      playbackShouldRun,
      reporter,
      chatReplayController,
    ],
  );
}

void _useVodPlayerSeekRequest({
  required VideoPlayerController controller,
  required ValueNotifier<bool> initialized,
  required ValueNotifier<bool> failed,
  required ValueNotifier<bool> ended,
  required VodPlayerSeekRequest? seekRequest,
  required ObjectRef<int?> handledSeekSerial,
  required ObjectRef<int?> pendingWatchEventSeekPositionSeconds,
  required VodPlayerWatchEventSeekHold watchEventSeekHold,
  required ObjectRef<VodPlayerChatReplayController?> chatReplayControllerRef,
  required VoidCallback reportPosition,
  required VoidCallback syncChatReplay,
}) {
  useEffect(
    () {
      final request = seekRequest;
      if (!initialized.value ||
          failed.value ||
          ended.value ||
          request == null ||
          handledSeekSerial.value == request.serial) {
        return null;
      }

      var cancelled = false;
      handledSeekSerial.value = request.serial;
      final previousPosition = controller.value.position;
      watchEventSeekHold.hold();
      unawaited(
        controller
            .seekTo(request.position)
            .then((_) {
              if (cancelled) {
                return;
              }

              watchEventSeekHold.hold();
              pendingWatchEventSeekPositionSeconds.value =
                  request.position.inSeconds;
              final chatController = chatReplayControllerRef.value;
              if (chatController != null) {
                unawaited(
                  chatController.seekCommitted(
                    request.position,
                    previousPosition: previousPosition,
                  ),
                );
              }
              reportPosition();
              syncChatReplay();
            })
            .catchError((Object _) {}),
      );
      return () {
        cancelled = true;
      };
    },
    [
      controller,
      initialized.value,
      failed.value,
      ended.value,
      seekRequest,
    ],
  );
}
