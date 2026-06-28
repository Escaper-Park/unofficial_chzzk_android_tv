part of 'live_player_bloc.dart';

extension _LivePlayerBlocSlotResolutionHelpers on LivePlayerBloc {
  int _resolutionIndexForSlot({
    required String slotId,
    required SettingsPreferences preferences,
  }) {
    if (!state.isMultiview) {
      return preferences.liveSettings.resolutionIndex;
    }

    if (_usesPipRoleResolution) {
      return slotId == state.activeSlotId
          ? _pipMainResolutionIndex ?? preferences.liveSettings.resolutionIndex
          : _pipOverlayResolutionIndex ??
                preferences.liveSettings.multiviewResolutionIndex;
    }

    final slotResolutionIndex = state.slotById(slotId)?.playbackResolutionIndex;
    if (slotResolutionIndex != null) {
      return slotResolutionIndex;
    }

    return preferences.liveSettings.multiviewResolutionIndex;
  }

  bool get _usesPipRoleResolution {
    return state.isMultiview &&
        state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip;
  }

  void _rememberPipRoleResolutionForSlot({
    required String slotId,
    required int resolutionIndex,
  }) {
    if (!_usesPipRoleResolution) {
      return;
    }

    if (slotId == state.activeSlotId) {
      _pipMainResolutionIndex = resolutionIndex;
      return;
    }

    _pipOverlayResolutionIndex = resolutionIndex;
  }
}
