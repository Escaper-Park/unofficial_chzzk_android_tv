part of 'tv_vod_overlay_playback_info.dart';

final class _TvVodSeekPreviewHideController {
  _TvVodSeekPreviewHideController({
    required this.duration,
  });

  final Duration duration;
  Timer? _timer;

  void schedule({
    required bool Function() shouldHide,
    required VoidCallback hide,
  }) {
    cancel();
    if (!shouldHide()) {
      return;
    }

    _timer = Timer(duration, () {
      _timer = null;
      if (shouldHide()) {
        hide();
      }
    });
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    cancel();
  }
}
