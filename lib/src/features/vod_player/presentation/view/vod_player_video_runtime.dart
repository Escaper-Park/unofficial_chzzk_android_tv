part of 'vod_player_video_surface.dart';

final class _VodPlayerVideoRuntime {
  const _VodPlayerVideoRuntime({
    required this.controller,
    required this.initialized,
    required this.failed,
    required this.ended,
    required this.controllerDisposalCoordinator,
    required this.handledSeekSerial,
    required this.pendingWatchEventSeekPositionSeconds,
    required this.watchEventSeekHold,
    required this.watchEventSyncTimer,
    required this.chatSyncTimer,
    required this.wakelockController,
    required this.playbackPausedRef,
    required this.appPlaybackSuspendedRef,
    required this.reporterRef,
    required this.previousReporterRef,
    required this.chatReplayControllerRef,
    required this.onReadyRef,
    required this.onFailureRef,
    required this.onPositionChangedRef,
    required this.onEndedRef,
    required this.playbackPaused,
    required this.appLifecycleState,
  });

  final VideoPlayerController controller;
  final ValueNotifier<bool> initialized;
  final ValueNotifier<bool> failed;
  final ValueNotifier<bool> ended;
  final ControllerDisposalCoordinator controllerDisposalCoordinator;
  final ObjectRef<int?> handledSeekSerial;
  final ObjectRef<int?> pendingWatchEventSeekPositionSeconds;
  final VodPlayerWatchEventSeekHold watchEventSeekHold;
  final PeriodicCallbackTimer watchEventSyncTimer;
  final PeriodicCallbackTimer chatSyncTimer;
  final SerializedWakelockController wakelockController;
  final ObjectRef<bool> playbackPausedRef;
  final ObjectRef<bool> appPlaybackSuspendedRef;
  final ObjectRef<VodPlayerWatchEventReporter?> reporterRef;
  final ObjectRef<VodPlayerWatchEventReporter?> previousReporterRef;
  final ObjectRef<VodPlayerChatReplayController?> chatReplayControllerRef;
  final ObjectRef<VoidCallback> onReadyRef;
  final ObjectRef<VoidCallback> onFailureRef;
  final ObjectRef<void Function(Duration position, Duration duration)>
  onPositionChangedRef;
  final ObjectRef<void Function(Duration position, Duration duration)>
  onEndedRef;
  final bool playbackPaused;
  final AppLifecycleState appLifecycleState;

  bool get appPlaybackSuspended {
    return appLifecycleState != AppLifecycleState.resumed;
  }

  bool get playbackShouldRun {
    return initialized.value &&
        !failed.value &&
        !ended.value &&
        !playbackPaused &&
        !appPlaybackSuspended;
  }

  bool playbackSuspended() {
    return playbackPausedRef.value ||
        appPlaybackSuspendedRef.value ||
        ended.value;
  }

  void reportPosition() {
    if (!controller.value.isInitialized) {
      return;
    }

    onPositionChangedRef.value(
      controller.value.position,
      controller.value.duration,
    );
  }

  int currentPositionSeconds() {
    return safeVodPlayerPositionSeconds(controller.value);
  }

  void reportPlaybackFailure() {
    if (failed.value) {
      return;
    }

    failed.value = true;
    reporterRef.value?.pause(
      positionSeconds: currentPositionSeconds(),
    );
    onFailureRef.value();
  }

  void syncWatchEvent() {
    if (!controller.value.isInitialized || failed.value) {
      return;
    }

    final value = controller.value;
    reportPosition();

    if (value.hasError) {
      reportPlaybackFailure();
      return;
    }

    if (value.isCompleted) {
      if (!ended.value) {
        ended.value = true;
        reporterRef.value?.end(
          positionSeconds: currentPositionSeconds(),
        );
        onEndedRef.value(value.position, value.duration);
      }
      return;
    }

    if (watchEventSeekHold.isHeld) {
      return;
    }

    final reporter = reporterRef.value;
    if (!value.isPlaying || playbackSuspended()) {
      reporter?.pause(positionSeconds: currentPositionSeconds());
      return;
    }

    final positionSeconds = currentPositionSeconds();
    final seekPositionSeconds = pendingWatchEventSeekPositionSeconds.value;
    if (seekPositionSeconds != null) {
      reporter?.seekCommitted(positionSeconds: seekPositionSeconds);
      pendingWatchEventSeekPositionSeconds.value = null;
    }
    reporter?.start(positionSeconds: positionSeconds);
    reporter?.tick(positionSeconds: positionSeconds);
  }

  void syncChatReplay() {
    final chatController = chatReplayControllerRef.value;
    if (chatController == null) {
      return;
    }

    if (!controller.value.isInitialized ||
        failed.value ||
        playbackSuspended() ||
        !controller.value.isPlaying) {
      chatController.pauseReplayClock();
      return;
    }

    unawaited(chatController.syncToPosition(controller.value.position));
  }
}
