import '../bloc/vod_player_bloc.dart';
import 'vod_player_playback_snapshot.dart';

VodPlayerPlaybackSnapshot vodPlayerPlaybackSnapshotForSlot(
  VodPlayerSlotState slot,
) {
  return VodPlayerPlaybackSnapshot(
    position: slot.position,
    duration: Duration(seconds: slot.durationSeconds),
  );
}

Duration vodPlayerSnapshotDurationForSlot(
  VodPlayerSlotState slot,
  VodPlayerPlaybackSnapshot snapshot,
) {
  if (snapshot.duration > Duration.zero) {
    return snapshot.duration;
  }

  return Duration(seconds: slot.durationSeconds);
}

bool isOnlyVodPlaybackPositionStateChange(
  VodPlayerState previous,
  VodPlayerState current,
) {
  if (previous.copyWith(slots: const []) != current.copyWith(slots: const [])) {
    return false;
  }

  if (previous.slots.length != current.slots.length) {
    return false;
  }

  var changed = false;
  for (var index = 0; index < previous.slots.length; index += 1) {
    final previousSlot = previous.slots[index];
    final currentSlot = current.slots[index];
    if (previousSlot == currentSlot) {
      continue;
    }

    if (previousSlot.copyWith(
          position: currentSlot.position,
          duration: currentSlot.duration,
        ) !=
        currentSlot) {
      return false;
    }

    changed = true;
  }

  return changed;
}

Duration clampVodPlaybackPosition(Duration value, Duration max) {
  if (value < Duration.zero) {
    return Duration.zero;
  }
  if (max > Duration.zero && value > max) {
    return max;
  }

  return value;
}
