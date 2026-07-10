part of 'live_player_view.dart';

AppLifecycleState _useLivePlayerAppLifecycleState() {
  final appLifecycleState = useState(
    WidgetsBinding.instance.lifecycleState ?? AppLifecycleState.resumed,
  );

  useEffect(() {
    final observer = _LivePlayerAppLifecycleObserver(
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

void _useLivePlayerOverlayDisplayDuration({
  required BuildContext context,
  required TvPlayerOverlayAutoHideController overlayAutoHideController,
}) {
  useEffect(() {
    var disposed = false;
    unawaited(
      context
          .read<SettingsPreferencesRepository>()
          .read()
          .then((preferences) {
            if (disposed) {
              return;
            }

            overlayAutoHideController.updateDisplayDuration(
              Duration(
                seconds: preferences.generalSetting.overlayControlsDisplayTime,
              ),
            );
          })
          .catchError((Object _) {}),
    );

    return () {
      disposed = true;
    };
  }, const []);
}

void _useLivePlayerViewControllerDisposal({
  required TvBackController doubleBackExitController,
  required TvPlayerExitNoticeController exitNoticeController,
  required TvPlayerOverlayAutoHideController overlayAutoHideController,
  required TvSnackbarFeedbackController feedbackController,
  required LivePlayerPlaybackSessionController playbackSessionController,
  required ValueNotifier<bool> playbackPaused,
  required ValueNotifier<bool> muted,
}) {
  useEffect(() {
    return () {
      playbackSessionController.dispose();
      doubleBackExitController.dispose();
      exitNoticeController.dispose();
      overlayAutoHideController.dispose();
      feedbackController.dispose();
      playbackPaused.dispose();
      muted.dispose();
    };
  }, const []);
}

class _LivePlayerSessionLifecycle extends HookWidget {
  const _LivePlayerSessionLifecycle({
    required this.state,
    required this.playbackPaused,
    required this.appPlaybackSuspended,
    required this.child,
  });

  final LivePlayerState state;
  final ValueListenable<bool> playbackPaused;
  final bool appPlaybackSuspended;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    useListenable(playbackPaused);
    final keepAwake =
        !playbackPaused.value &&
        !appPlaybackSuspended &&
        _hasPlayableLiveSlot(state);
    final wakelockController = useMemoized(
      SerializedWakelockController.new,
      const [],
    );

    useEffect(() {
      wakelockController.setEnabled(enabled: keepAwake);
      return null;
    }, [wakelockController, keepAwake]);

    useEffect(() {
      return wakelockController.dispose;
    }, [wakelockController]);

    return child;
  }
}

final class _LivePlayerAppLifecycleObserver extends WidgetsBindingObserver {
  _LivePlayerAppLifecycleObserver({
    required this.onChanged,
  });

  final ValueChanged<AppLifecycleState> onChanged;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    onChanged(state);
  }
}

bool _hasPlayableLiveSlot(LivePlayerState state) {
  return state.slots.any(
    (slot) =>
        slot.status == LivePlayerSlotStatus.playing && slot.playbackUri != null,
  );
}
