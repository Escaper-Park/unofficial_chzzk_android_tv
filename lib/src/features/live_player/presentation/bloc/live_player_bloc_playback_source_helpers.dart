part of 'live_player_bloc.dart';

extension _LivePlayerBlocPlaybackSourceHelpers on LivePlayerBloc {
  Future<void> _onSlotResolutionSelected(
    _SlotResolutionSelected event,
    Emitter<LivePlayerState> emit,
  ) async {
    final before = state;
    if (!before.isMultiview) {
      return;
    }

    final slot = before.slotById(event.slotId);
    if (slot == null) {
      return;
    }

    final transitionSerial = _beginMultiviewPlaybackTransition();
    if (_usesPipRoleResolution) {
      final nextMainResolutionIndex = event.slotId == before.activeSlotId
          ? event.resolutionIndex
          : _pipMainResolutionIndex;
      final nextOverlayResolutionIndex = event.slotId == before.activeSlotId
          ? _pipOverlayResolutionIndex
          : event.resolutionIndex;
      final updates = await _resolveMultiviewPlaybackSourceBatch(
        projectedState: before,
        preferences: before.settingsPreferences,
        pipMainResolutionIndex: nextMainResolutionIndex,
        pipOverlayResolutionIndex: nextOverlayResolutionIndex,
      );
      if (updates == null ||
          emit.isDone ||
          !_multiviewPlaybackTransitionStillCurrent(
            before,
            transitionSerial,
          )) {
        return;
      }

      _pipMainResolutionIndex = nextMainResolutionIndex;
      _pipOverlayResolutionIndex = nextOverlayResolutionIndex;
      final latest = state;
      emit(
        latest.copyWith(
          slots: _applyPlaybackSourceBatch(latest.slots, updates),
        ),
      );
      return;
    }

    await _refreshSlotPlaybackSource(
      emit,
      slot: slot,
      preferences: state.settingsPreferences,
      resolutionIndex: event.resolutionIndex,
    );
  }

  Future<Map<String, LivePlayerSlotState>?>
  _resolveMultiviewPlaybackSourceBatch({
    required LivePlayerState projectedState,
    required SettingsPreferences preferences,
    int? pipMainResolutionIndex,
    int? pipOverlayResolutionIndex,
  }) async {
    final updates = <String, LivePlayerSlotState>{};
    final requests = <_LivePlayerPlaybackSourceBatchRequest>[];
    final viewTypeOnlySlotIds = <String>[];
    final latencyIndex = preferences.liveSettings.latencyIndex;
    final videoViewType = preferences.generalSetting.videoViewType;

    for (final projectedSlot in projectedState.slots) {
      final currentSlot = state.slotById(projectedSlot.slotId);
      if (currentSlot == null ||
          currentSlot.status != LivePlayerSlotStatus.ready &&
              currentSlot.status != LivePlayerSlotStatus.playing) {
        continue;
      }

      final detail = currentSlot.detail;
      if (detail == null) {
        continue;
      }

      final resolutionIndex = _resolutionIndexForSlotInState(
        sourceState: projectedState,
        slotId: currentSlot.slotId,
        preferences: preferences,
        pipMainResolutionIndex: pipMainResolutionIndex,
        pipOverlayResolutionIndex: pipOverlayResolutionIndex,
      );
      final playbackSourceUnchanged =
          currentSlot.playbackLatencyIndex == latencyIndex &&
          currentSlot.playbackResolutionIndex == resolutionIndex &&
          !currentSlot.shouldRetryPlaybackMetadata;
      if (playbackSourceUnchanged) {
        if (currentSlot.videoViewType != videoViewType) {
          viewTypeOnlySlotIds.add(currentSlot.slotId);
        }
        continue;
      }

      final requestSerial = _nextSlotTargetRequestSerial(currentSlot.slotId);
      requests.add(
        _LivePlayerPlaybackSourceBatchRequest(
          slotId: currentSlot.slotId,
          detailLiveId: detail.liveId,
          requestSerial: requestSerial,
          latencyIndex: latencyIndex,
          resolutionIndex: resolutionIndex,
          source: _playbackSourceLoader.resolve(
            livePlaybackJson: detail.livePlaybackJson,
            latencyIndex: latencyIndex,
            resolutionIndex: resolutionIndex,
          ),
        ),
      );
    }

    final sources = await Future.wait<LiveResolvedPlaybackSource?>([
      for (final request in requests) request.source,
    ]);
    for (var index = 0; index < requests.length; index += 1) {
      final request = requests[index];
      final source = sources[index];
      if (source == null ||
          !_isSlotTargetRequestCurrent(
            request.slotId,
            request.requestSerial,
          )) {
        return null;
      }

      final latestSlot = state.slotById(request.slotId);
      if (latestSlot == null ||
          latestSlot.detail?.liveId != request.detailLiveId ||
          latestSlot.status != LivePlayerSlotStatus.ready &&
              latestSlot.status != LivePlayerSlotStatus.playing) {
        return null;
      }

      final playbackUriChanged = latestSlot.playbackUri != source.playbackUri;
      final playbackSelectionUnchanged =
          latestSlot.playbackLatencyIndex == request.latencyIndex &&
          latestSlot.playbackResolutionIndex == request.resolutionIndex;
      updates[request.slotId] = latestSlot.copyWith(
        status: playbackUriChanged
            ? LivePlayerSlotStatus.ready
            : latestSlot.status,
        playbackUri: source.playbackUri,
        availableResolutionIndexes: source.availableResolutionIndexes,
        playbackLatencyIndex: request.latencyIndex,
        playbackResolutionIndex: request.resolutionIndex,
        expectedVideoWidth: source.expectedVideoWidth,
        expectedVideoHeight: source.expectedVideoHeight,
        playbackMetadataResolutionAttempts: playbackSelectionUnchanged
            ? latestSlot.playbackMetadataResolutionAttempts + 1
            : 1,
        videoViewType: videoViewType,
        failureReason: null,
      );
    }

    for (final slotId in viewTypeOnlySlotIds) {
      final latestSlot = state.slotById(slotId);
      if (latestSlot == null) {
        return null;
      }
      updates[slotId] = latestSlot.copyWith(videoViewType: videoViewType);
    }

    return updates;
  }

  List<LivePlayerSlotState> _applyPlaybackSourceBatch(
    List<LivePlayerSlotState> slots,
    Map<String, LivePlayerSlotState> updates,
  ) {
    return [
      for (final slot in slots) updates[slot.slotId] ?? slot,
    ];
  }

  int _beginMultiviewPlaybackTransition() {
    return ++_multiviewPlaybackTransitionSerial;
  }

  bool _multiviewPlaybackTransitionStillCurrent(
    LivePlayerState before,
    int transitionSerial,
  ) {
    if (transitionSerial != _multiviewPlaybackTransitionSerial) {
      return false;
    }

    final current = state;
    if (current.viewMode != before.viewMode ||
        current.multiviewLayoutMode != before.multiviewLayoutMode ||
        current.activeSlotId != before.activeSlotId ||
        current.slots.length != before.slots.length) {
      return false;
    }

    final currentLive = current.settingsPreferences.liveSettings;
    final beforeLive = before.settingsPreferences.liveSettings;
    if (current.settingsPreferences.generalSetting.videoViewType !=
            before.settingsPreferences.generalSetting.videoViewType ||
        currentLive.latencyIndex != beforeLive.latencyIndex ||
        currentLive.resolutionIndex != beforeLive.resolutionIndex ||
        currentLive.multiviewResolutionIndex !=
            beforeLive.multiviewResolutionIndex) {
      return false;
    }

    for (var index = 0; index < before.slots.length; index += 1) {
      final previousSlot = before.slots[index];
      final currentSlot = current.slots[index];
      if (currentSlot.slotId != previousSlot.slotId ||
          currentSlot.channelId != previousSlot.channelId ||
          currentSlot.liveId != previousSlot.liveId ||
          currentSlot.detail?.liveId != previousSlot.detail?.liveId ||
          currentSlot.playbackUri != previousSlot.playbackUri ||
          currentSlot.expectedVideoWidth != previousSlot.expectedVideoWidth ||
          currentSlot.expectedVideoHeight != previousSlot.expectedVideoHeight ||
          currentSlot.playbackMetadataResolutionAttempts !=
              previousSlot.playbackMetadataResolutionAttempts ||
          currentSlot.playbackLatencyIndex !=
              previousSlot.playbackLatencyIndex ||
          currentSlot.playbackResolutionIndex !=
              previousSlot.playbackResolutionIndex) {
        return false;
      }
    }

    return true;
  }

  Future<void> _refreshSlotPlaybackSource(
    Emitter<LivePlayerState> emit, {
    required LivePlayerSlotState slot,
    required SettingsPreferences preferences,
    required int resolutionIndex,
  }) async {
    final currentSlot = state.slotById(slot.slotId);
    if (currentSlot == null ||
        currentSlot.status != LivePlayerSlotStatus.ready &&
            currentSlot.status != LivePlayerSlotStatus.playing) {
      return;
    }

    final detail = currentSlot.detail;
    if (detail == null) {
      return;
    }

    final latencyIndex = preferences.liveSettings.latencyIndex;
    final videoViewType = preferences.generalSetting.videoViewType;
    final playbackSourceUnchanged =
        currentSlot.playbackLatencyIndex == latencyIndex &&
        currentSlot.playbackResolutionIndex == resolutionIndex &&
        !currentSlot.shouldRetryPlaybackMetadata;
    if (playbackSourceUnchanged) {
      if (currentSlot.videoViewType != videoViewType) {
        _emitSlot(
          emit,
          currentSlot.copyWith(videoViewType: videoViewType),
        );
      }
      return;
    }

    final requestSerial = _nextSlotTargetRequestSerial(slot.slotId);
    final playbackSource = await _playbackSourceLoader.resolve(
      livePlaybackJson: detail.livePlaybackJson,
      latencyIndex: latencyIndex,
      resolutionIndex: resolutionIndex,
    );
    if (!_isSlotTargetRequestCurrent(slot.slotId, requestSerial) ||
        playbackSource == null) {
      return;
    }

    final latestSlot = state.slotById(slot.slotId);
    if (latestSlot == null || latestSlot.detail?.liveId != detail.liveId) {
      return;
    }

    final playbackUriChanged =
        latestSlot.playbackUri != playbackSource.playbackUri;
    final playbackSelectionUnchanged =
        latestSlot.playbackLatencyIndex == latencyIndex &&
        latestSlot.playbackResolutionIndex == resolutionIndex;
    _emitSlot(
      emit,
      latestSlot.copyWith(
        status: playbackUriChanged
            ? LivePlayerSlotStatus.ready
            : latestSlot.status,
        playbackUri: playbackSource.playbackUri,
        availableResolutionIndexes: playbackSource.availableResolutionIndexes,
        playbackLatencyIndex: latencyIndex,
        playbackResolutionIndex: resolutionIndex,
        expectedVideoWidth: playbackSource.expectedVideoWidth,
        expectedVideoHeight: playbackSource.expectedVideoHeight,
        playbackMetadataResolutionAttempts: playbackSelectionUnchanged
            ? latestSlot.playbackMetadataResolutionAttempts + 1
            : 1,
        videoViewType: videoViewType,
        failureReason: null,
      ),
    );
  }
}

final class _LivePlayerPlaybackSourceBatchRequest {
  const _LivePlayerPlaybackSourceBatchRequest({
    required this.slotId,
    required this.detailLiveId,
    required this.requestSerial,
    required this.latencyIndex,
    required this.resolutionIndex,
    required this.source,
  });

  final String slotId;
  final int detailLiveId;
  final int requestSerial;
  final int latencyIndex;
  final int resolutionIndex;
  final Future<LiveResolvedPlaybackSource?> source;
}
