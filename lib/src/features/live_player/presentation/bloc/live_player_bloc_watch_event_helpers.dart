part of 'live_player_bloc.dart';

const _liveWatchEndedEventType = 'WATCH_ENDED';

extension LivePlayerBlocWatchEventHelpers on LivePlayerBloc {
  Future<void> postWatchEventForSlot({
    required String slotId,
    required String channelId,
    required int liveId,
    required String watchEventType,
    required String sessionId,
    required int eventDurationSeconds,
    required int positionSeconds,
    required int? awtSeconds,
    required List<String> liveTokens,
    required bool autoPlay,
    required bool radioMode,
    bool allowStaleSlotTarget = false,
  }) {
    if (state.slotById(slotId) == null) {
      return Future<void>.value();
    }

    final canReportForCurrentSlot = state.canReportWatchEventForSlot(
      slotId: slotId,
      channelId: channelId,
      liveId: liveId,
    );
    final canReportStaleEnded =
        allowStaleSlotTarget && watchEventType == _liveWatchEndedEventType;
    if (!canReportForCurrentSlot && !canReportStaleEnded) {
      return Future<void>.value();
    }

    return _liveRepository.postLiveWatchEvent(
      channelId: channelId,
      liveId: liveId,
      watchEventType: watchEventType,
      sessionId: sessionId,
      eventDurationSeconds: eventDurationSeconds,
      positionSeconds: positionSeconds,
      awtSeconds: awtSeconds,
      liveTokens: liveTokens,
      autoPlay: autoPlay,
      radioMode: radioMode,
    );
  }
}
