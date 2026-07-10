part of 'live_player_bloc.dart';

extension _LivePlayerBlocControlsHelpers on LivePlayerBloc {
  Future<void> _onControlsRequested(
    _ControlsRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    ++_browseRequestSerial;
    ++_browseSessionSerial;
    emit(state.copyWith(overlayMode: LivePlayerOverlayMode.controls));

    final slot = state.activeSlot;
    final channelId = slot.channelId;
    if (channelId == null) {
      return;
    }

    final slotId = slot.slotId;
    final requestSerial = ++_statusRefreshSerial;

    try {
      final preferences = await settingsPreferencesRepository.read();
      if (requestSerial != _statusRefreshSerial) {
        return;
      }

      _persistedSettingsPreferences = preferences;
      emit(state.copyWith(settingsPreferences: preferences));
    } on Object {
      // Keep the existing preferences if reading them fails.
    }

    try {
      final groupCollection = await groupRepository.read();
      if (requestSerial != _statusRefreshSerial) {
        return;
      }

      emit(state.copyWith(groupCollection: groupCollection));
    } on Object {
      // Keep the existing group state if reading it fails.
    }

    try {
      final myInfo = await channelRepository.getMyInfo(channelId: channelId);
      if (requestSerial != _statusRefreshSerial) {
        return;
      }

      if (!_isActiveSlotChannel(slotId, channelId)) {
        return;
      }

      emit(state.copyWith(channelMyInfo: myInfo));
    } on Object {
      if (requestSerial != _statusRefreshSerial) {
        return;
      }

      if (!_isActiveSlotChannel(slotId, channelId)) {
        return;
      }

      emit(state.copyWith(channelMyInfo: null));
    }
  }

  void _onControlsClosed(
    _ControlsClosed event,
    Emitter<LivePlayerState> emit,
  ) {
    emit(state.copyWith(overlayMode: LivePlayerOverlayMode.none));
  }
}
