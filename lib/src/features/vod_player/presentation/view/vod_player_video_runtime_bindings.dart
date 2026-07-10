part of 'vod_player_video_surface.dart';

void _useVodPlayerVideoRuntimeBindings({
  required _VodPlayerVideoRuntime runtime,
  required Duration initialPosition,
  required double playbackSpeed,
  required bool muted,
  required VodPlayerWatchEventReporter? reporter,
  required VodPlayerChatReplayController? chatReplayController,
  required VoidCallback onReady,
  required VoidCallback onFailure,
  required void Function(Duration position, Duration duration)
  onPositionChanged,
  required void Function(Duration position, Duration duration) onEnded,
  required VodPlayerSeekRequest? seekRequest,
}) {
  _useVodPlayerControllerLifecycle(
    controller: runtime.controller,
    initialized: runtime.initialized,
    failed: runtime.failed,
    ended: runtime.ended,
    controllerDisposalCoordinator: runtime.controllerDisposalCoordinator,
    handledSeekSerial: runtime.handledSeekSerial,
    pendingWatchEventSeekPositionSeconds:
        runtime.pendingWatchEventSeekPositionSeconds,
    watchEventSeekHold: runtime.watchEventSeekHold,
    watchEventSyncTimer: runtime.watchEventSyncTimer,
    chatSyncTimer: runtime.chatSyncTimer,
    wakelockController: runtime.wakelockController,
    reporterRef: runtime.reporterRef,
    chatReplayControllerRef: runtime.chatReplayControllerRef,
    onReadyRef: runtime.onReadyRef,
    initialPosition: initialPosition,
    playbackSpeed: playbackSpeed,
    muted: muted,
    playbackSuspended: runtime.playbackSuspended,
    currentPositionSeconds: runtime.currentPositionSeconds,
    reportPlaybackFailure: runtime.reportPlaybackFailure,
    reportPosition: runtime.reportPosition,
    syncWatchEvent: runtime.syncWatchEvent,
    syncChatReplay: runtime.syncChatReplay,
  );

  _useVodPlayerTimerDisposal(
    watchEventSyncTimer: runtime.watchEventSyncTimer,
    chatSyncTimer: runtime.chatSyncTimer,
  );
  _syncVodPlayerVideoRefs(
    playbackPausedRef: runtime.playbackPausedRef,
    appPlaybackSuspendedRef: runtime.appPlaybackSuspendedRef,
    reporterRef: runtime.reporterRef,
    chatReplayControllerRef: runtime.chatReplayControllerRef,
    onReadyRef: runtime.onReadyRef,
    onFailureRef: runtime.onFailureRef,
    onPositionChangedRef: runtime.onPositionChangedRef,
    onEndedRef: runtime.onEndedRef,
    playbackPaused: runtime.playbackPaused,
    appPlaybackSuspended: runtime.appPlaybackSuspended,
    reporter: reporter,
    chatReplayController: chatReplayController,
    onReady: onReady,
    onFailure: onFailure,
    onPositionChanged: onPositionChanged,
    onEnded: onEnded,
  );
  _useVodPlayerReporterReplacement(
    controller: runtime.controller,
    reporter: reporter,
    previousReporterRef: runtime.previousReporterRef,
    reporterRef: runtime.reporterRef,
    currentPositionSeconds: runtime.currentPositionSeconds,
  );
  _useVodPlayerWakelock(
    wakelockController: runtime.wakelockController,
    playbackShouldRun: runtime.playbackShouldRun,
  );
  _useVodPlayerVolume(controller: runtime.controller, muted: muted);
  _useVodPlayerPlaybackSpeed(
    controller: runtime.controller,
    initialized: runtime.initialized,
    failed: runtime.failed,
    playbackSpeed: playbackSpeed,
  );
  _useVodPlayerPlaybackRun(
    controller: runtime.controller,
    initialized: runtime.initialized,
    failed: runtime.failed,
    playbackShouldRun: runtime.playbackShouldRun,
    watchEventSeekHold: runtime.watchEventSeekHold,
    reporter: reporter,
    chatReplayController: chatReplayController,
    reporterRef: runtime.reporterRef,
    chatReplayControllerRef: runtime.chatReplayControllerRef,
    currentPositionSeconds: runtime.currentPositionSeconds,
    syncChatReplay: runtime.syncChatReplay,
  );
  _useVodPlayerSeekRequest(
    controller: runtime.controller,
    initialized: runtime.initialized,
    failed: runtime.failed,
    ended: runtime.ended,
    seekRequest: seekRequest,
    handledSeekSerial: runtime.handledSeekSerial,
    pendingWatchEventSeekPositionSeconds:
        runtime.pendingWatchEventSeekPositionSeconds,
    watchEventSeekHold: runtime.watchEventSeekHold,
    chatReplayControllerRef: runtime.chatReplayControllerRef,
    reportPosition: runtime.reportPosition,
    syncChatReplay: runtime.syncChatReplay,
  );
}
