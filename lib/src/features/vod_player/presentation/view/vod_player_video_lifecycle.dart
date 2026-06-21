part of 'vod_player_video_surface.dart';

AppLifecycleState _useVodPlayerAppLifecycleState() {
  final appLifecycleState = useState(
    WidgetsBinding.instance.lifecycleState ?? AppLifecycleState.resumed,
  );

  useEffect(() {
    final observer = _VodPlayerAppLifecycleObserver(
      onChanged: (state) {
        appLifecycleState.value = state;
      },
    );
    WidgetsBinding.instance.addObserver(observer);

    return () {
      WidgetsBinding.instance.removeObserver(observer);
    };
  }, const []);

  return appLifecycleState.value;
}

void _useVodPlayerControllerLifecycle({
  required VideoPlayerController controller,
  required ValueNotifier<bool> initialized,
  required ValueNotifier<bool> failed,
  required ValueNotifier<bool> ended,
  required ObjectRef<int?> handledSeekSerial,
  required ObjectRef<int?> pendingWatchEventSeekPositionSeconds,
  required VodPlayerWatchEventSeekHold watchEventSeekHold,
  required PeriodicCallbackTimer watchEventSyncTimer,
  required PeriodicCallbackTimer chatSyncTimer,
  required SerializedWakelockController wakelockController,
  required ObjectRef<VodPlayerWatchEventReporter?> reporterRef,
  required ObjectRef<VodPlayerChatReplayController?> chatReplayControllerRef,
  required ObjectRef<VoidCallback> onReadyRef,
  required Duration initialPosition,
  required double playbackSpeed,
  required bool muted,
  required bool Function() playbackSuspended,
  required int Function() currentPositionSeconds,
  required VoidCallback reportPlaybackFailure,
  required VoidCallback reportPosition,
  required VoidCallback syncWatchEvent,
  required VoidCallback syncChatReplay,
}) {
  useEffect(() {
    var disposed = false;
    final reporterForController = reporterRef.value;
    initialized.value = false;
    failed.value = false;
    ended.value = false;
    handledSeekSerial.value = null;
    pendingWatchEventSeekPositionSeconds.value = null;
    watchEventSeekHold.clear();

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

            if (initialPosition > Duration.zero) {
              await controller.seekTo(initialPosition);
              if (disposed) {
                return;
              }
            }
            await controller.setPlaybackSpeed(playbackSpeed);
            if (disposed) {
              return;
            }
            await controller.setVolume(muted ? 0 : 1);
            if (disposed) {
              return;
            }
            if (!playbackSuspended()) {
              await controller.play();
              if (disposed) {
                return;
              }
            }

            initialized.value = true;
            onReadyRef.value();
            reportPosition();
            watchEventSyncTimer.start(
              interval: const Duration(seconds: 1),
              onTick: syncWatchEvent,
            );
            chatSyncTimer.start(
              interval: VodPlayerChatReplayController.syncTickInterval,
              onTick: syncChatReplay,
            );
            syncChatReplay();
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
      watchEventSyncTimer.stop();
      chatSyncTimer.stop();
      chatReplayControllerRef.value?.pauseReplayClock();
      reporterForController?.suspend(
        positionSeconds: currentPositionSeconds(),
      );
      controller.removeListener(handleControllerChange);
      wakelockController.setEnabled(enabled: false);
      unawaited(controller.dispose());
    };
  }, [controller, wakelockController, watchEventSyncTimer, chatSyncTimer]);
}

final class _VodPlayerAppLifecycleObserver extends WidgetsBindingObserver {
  _VodPlayerAppLifecycleObserver({
    required this.onChanged,
  });

  final ValueChanged<AppLifecycleState> onChanged;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    onChanged(state);
  }
}
