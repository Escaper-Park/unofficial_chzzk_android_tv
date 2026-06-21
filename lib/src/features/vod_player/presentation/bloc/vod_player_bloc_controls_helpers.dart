part of 'vod_player_bloc.dart';

extension _VodPlayerBlocControlsHelpers on VodPlayerBloc {
  Future<void> _onControlsRequested(
    _ControlsRequested event,
    Emitter<VodPlayerState> emit,
  ) async {
    ++_browseRequestSerial;
    emit(state.copyWith(overlayMode: VodPlayerOverlayMode.controls));

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
      // Keep the current preferences when reading fails.
    }

    try {
      final groupCollection = await groupRepository.read();
      if (requestSerial != _statusRefreshSerial) {
        return;
      }

      emit(state.copyWith(groupCollection: groupCollection));
    } on Object {
      // Keep the current group state if reading it fails.
    }

    try {
      final myInfo = await channelRepository.getMyInfo(channelId: channelId);
      if (requestSerial != _statusRefreshSerial) {
        return;
      }

      final currentSlot = state.slotById(slotId);
      if (currentSlot == null || currentSlot.channelId != channelId) {
        return;
      }

      _emitSlot(emit, currentSlot.copyWith(channelMyInfo: myInfo));
    } on Object {
      // Favorites remain disabled when my-info cannot be loaded.
    }
  }

  void _onControlsClosed(
    _ControlsClosed event,
    Emitter<VodPlayerState> emit,
  ) {
    emit(state.copyWith(overlayMode: VodPlayerOverlayMode.none));
  }
}
