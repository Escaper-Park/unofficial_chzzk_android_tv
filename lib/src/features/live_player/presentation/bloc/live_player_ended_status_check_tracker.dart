part of 'live_player_bloc.dart';

const _liveEndedStatusCheckMaxAttempts = 2;

enum LivePlayerEndedStatusCheckAction {
  none,
  markEnded,
  reloadTarget,
  keepWaiting,
}

final class LivePlayerEndedStatusCheckResult {
  const LivePlayerEndedStatusCheckResult({
    required this.action,
    this.liveStatus,
  });

  const LivePlayerEndedStatusCheckResult.none()
    : action = LivePlayerEndedStatusCheckAction.none,
      liveStatus = null;

  final LivePlayerEndedStatusCheckAction action;
  final LiveStatus? liveStatus;

  bool get handled => action != LivePlayerEndedStatusCheckAction.none;
}

final class LivePlayerEndedStatusCheckTracker {
  final _checks = <String, ({Uri playbackUri, int attempts})>{};

  void start({
    required String slotId,
    required Uri playbackUri,
  }) {
    _checks[slotId] = (playbackUri: playbackUri, attempts: 0);
  }

  void clear(String slotId) {
    _checks.remove(slotId);
  }

  void retainSlotIds(Set<String> slotIds) {
    _checks.removeWhere((slotId, _) => !slotIds.contains(slotId));
  }

  LivePlayerEndedStatusCheckResult evaluate({
    required String slotId,
    required Uri? playbackUri,
    required LiveStatus? liveStatus,
  }) {
    final check = _checks[slotId];
    if (check == null) {
      return const LivePlayerEndedStatusCheckResult.none();
    }

    if (playbackUri == null || check.playbackUri != playbackUri) {
      clear(slotId);
      return const LivePlayerEndedStatusCheckResult.none();
    }

    if (_isLiveClosedStatus(liveStatus?.status)) {
      clear(slotId);
      return LivePlayerEndedStatusCheckResult(
        action: LivePlayerEndedStatusCheckAction.markEnded,
        liveStatus: liveStatus,
      );
    }

    final attempts = check.attempts + 1;
    if (attempts >= _liveEndedStatusCheckMaxAttempts) {
      clear(slotId);
      return const LivePlayerEndedStatusCheckResult(
        action: LivePlayerEndedStatusCheckAction.reloadTarget,
      );
    }

    _checks[slotId] = (
      playbackUri: check.playbackUri,
      attempts: attempts,
    );
    return LivePlayerEndedStatusCheckResult(
      action: LivePlayerEndedStatusCheckAction.keepWaiting,
      liveStatus: liveStatus,
    );
  }
}
