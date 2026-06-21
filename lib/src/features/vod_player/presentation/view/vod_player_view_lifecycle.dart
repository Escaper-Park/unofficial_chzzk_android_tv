part of 'vod_player_view.dart';

void _useVodPlayerOverlayDisplayDuration({
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

void _useVodPlayerViewControllerDisposal({
  required ValueNotifier<VodPlayerPlaybackSnapshot> playbackSnapshot,
  required TvBackController doubleBackExitController,
  required TvPlayerExitNoticeController exitNoticeController,
  required TvPlayerOverlayAutoHideController overlayAutoHideController,
  required TvSnackbarFeedbackController feedbackController,
  required VodPlayerSeekFeedbackController seekFeedbackController,
}) {
  useEffect(() {
    return () {
      playbackSnapshot.dispose();
      doubleBackExitController.dispose();
      exitNoticeController.dispose();
      overlayAutoHideController.dispose();
      feedbackController.dispose();
      seekFeedbackController.dispose();
    };
  }, const []);
}
