part of 'live_player_bloc.dart';

extension _LivePlayerBlocStatusHelpers on LivePlayerBloc {
  Future<void> _onLiveStatusRefreshRequested(
    _LiveStatusRefreshRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    final slot = state.slotById(event.slotId);
    if (slot == null || slot.channelId != event.channelId) {
      return;
    }

    final activeRequestSerial = _slotStatusRefreshSerials[event.slotId] ?? 0;
    final inFlightRefresh = _slotStatusRefreshesInFlight[event.slotId];
    if (inFlightRefresh != null &&
        inFlightRefresh.channelId == event.channelId &&
        inFlightRefresh.requestSerial == activeRequestSerial) {
      return;
    }

    final requestSerial = _nextSlotStatusRefreshSerial(event.slotId);
    _slotStatusRefreshesInFlight[event.slotId] = (
      channelId: event.channelId,
      requestSerial: requestSerial,
    );

    try {
      final liveStatus = await _statusReader.readStatus(event.channelId);
      if (_slotStatusRefreshSerials[event.slotId] != requestSerial) {
        return;
      }

      final currentSlot = state.slotById(event.slotId);
      if (currentSlot == null || currentSlot.channelId != event.channelId) {
        return;
      }

      if (await _handleEndedStatusCheck(
        emit,
        slot: currentSlot,
        liveStatus: liveStatus,
      )) {
        return;
      }

      if (_isLiveClosedStatus(liveStatus.status)) {
        _emitEndedSlot(emit, currentSlot, liveStatus: liveStatus);
        return;
      }

      final blockReason = await _statusReader.blockReasonForStatus(
        liveStatus,
        fallbackChannelId: event.channelId,
      );
      if (_slotStatusRefreshSerials[event.slotId] != requestSerial) {
        return;
      }

      if (_isBlockedLiveEntry(blockReason)) {
        _emitSlot(
          emit,
          currentSlot.copyWith(
            status: LivePlayerSlotStatus.failure,
            liveStatus: liveStatus,
            playbackUri: null,
            expectedVideoWidth: null,
            expectedVideoHeight: null,
            playbackMetadataResolutionAttempts: 0,
            failureReason: LivePlayerFailureReason.entryBlocked,
          ),
        );
        return;
      }

      _emitSlot(emit, currentSlot.copyWith(liveStatus: liveStatus));
    } on Object {
      if (_slotStatusRefreshSerials[event.slotId] != requestSerial) {
        return;
      }

      final currentSlot = state.slotById(event.slotId);
      if (currentSlot != null && currentSlot.channelId == event.channelId) {
        await _handleEndedStatusCheck(emit, slot: currentSlot);
      }

      // Keep playback stable when a periodic status refresh fails.
    } finally {
      final inFlightRefresh = _slotStatusRefreshesInFlight[event.slotId];
      if (inFlightRefresh?.channelId == event.channelId &&
          inFlightRefresh?.requestSerial == requestSerial) {
        _slotStatusRefreshesInFlight.remove(event.slotId);
      }
    }
  }
}
