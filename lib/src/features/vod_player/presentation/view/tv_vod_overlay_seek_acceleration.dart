part of 'tv_vod_overlay_playback_info.dart';

Duration _acceleratedSeekStep({
  required Duration baseStep,
  required int repeatCount,
  required Duration duration,
}) {
  final safeBaseStep = baseStep <= Duration.zero
      ? const Duration(seconds: 10)
      : baseStep;
  final cap = _acceleratedSeekStepCap(duration);
  if (safeBaseStep >= cap) {
    return safeBaseStep;
  }

  final multiplier = _seekAccelerationMultiplier(repeatCount);
  final acceleratedMilliseconds = safeBaseStep.inMilliseconds * multiplier;
  final cappedMilliseconds = acceleratedMilliseconds
      .clamp(safeBaseStep.inMilliseconds, cap.inMilliseconds)
      .toInt();

  return Duration(milliseconds: cappedMilliseconds);
}

int _seekAccelerationMultiplier(int repeatCount) {
  if (repeatCount < 3) {
    return 1;
  }
  if (repeatCount < 7) {
    return 2;
  }
  if (repeatCount < 12) {
    return 4;
  }
  if (repeatCount < 20) {
    return 8;
  }

  return 12;
}

Duration _acceleratedSeekStepCap(Duration duration) {
  if (duration < const Duration(minutes: 20)) {
    return const Duration(seconds: 30);
  }
  if (duration < const Duration(minutes: 90)) {
    return const Duration(minutes: 1);
  }
  if (duration < const Duration(hours: 4)) {
    return const Duration(minutes: 2);
  }

  return const Duration(minutes: 5);
}
