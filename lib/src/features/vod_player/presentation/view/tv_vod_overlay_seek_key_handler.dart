part of 'tv_vod_overlay_playback_info.dart';

KeyEventResult _handleVodSeekBarKeyEvent({
  required KeyEvent event,
  required ValueChanged<Duration>? onSeek,
  required TvVodOverlaySeekFeedbackCallback? onSeekFeedback,
  required Duration duration,
  required Duration position,
  required Duration seekStep,
  required ValueNotifier<Duration?> previewPosition,
  required ObjectRef<LogicalKeyboardKey?> activeSeekKey,
  required ObjectRef<int> seekRepeatCount,
  required VoidCallback cancelPreviewHideTimer,
  required VoidCallback schedulePreviewHide,
  required VoidCallback resetSeekAcceleration,
}) {
  final isLeft = event.logicalKey == LogicalKeyboardKey.arrowLeft;
  final isRight = event.logicalKey == LogicalKeyboardKey.arrowRight;
  if (!isLeft && !isRight) {
    return KeyEventResult.ignored;
  }

  if (event is KeyUpEvent) {
    if (activeSeekKey.value == event.logicalKey) {
      resetSeekAcceleration();
    }
    schedulePreviewHide();
    return KeyEventResult.handled;
  }

  if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
    return KeyEventResult.ignored;
  }

  final callback = onSeek;
  if (callback == null || duration <= Duration.zero) {
    return KeyEventResult.ignored;
  }

  cancelPreviewHideTimer();
  if (activeSeekKey.value != event.logicalKey || event is KeyDownEvent) {
    activeSeekKey.value = event.logicalKey;
    seekRepeatCount.value = 0;
  } else {
    seekRepeatCount.value += 1;
  }

  final currentPosition = previewPosition.value ?? position;
  final step = _acceleratedSeekStep(
    baseStep: seekStep,
    repeatCount: seekRepeatCount.value,
    duration: duration,
  );
  final target = _clampDuration(
    currentPosition + (isRight ? step : -step),
    duration,
  );
  previewPosition.value = target;
  callback(target);
  onSeekFeedback?.call(forward: isRight, position: target);
  return KeyEventResult.handled;
}
