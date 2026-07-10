part of 'live_player_bloc.dart';

extension _LivePlayerBlocSlotResolutionHelpers on LivePlayerBloc {
  int _resolutionIndexForSlot({
    required String slotId,
    required SettingsPreferences preferences,
  }) {
    return _resolutionIndexForSlotInState(
      sourceState: state,
      slotId: slotId,
      preferences: preferences,
    );
  }

  int _resolutionIndexForSlotInState({
    required LivePlayerState sourceState,
    required String slotId,
    required SettingsPreferences preferences,
    int? pipMainResolutionIndex,
    int? pipOverlayResolutionIndex,
  }) {
    if (!sourceState.isMultiview) {
      return preferences.liveSettings.resolutionIndex;
    }

    if (_usesPipRoleResolutionInState(sourceState)) {
      return slotId == sourceState.activeSlotId
          ? pipMainResolutionIndex ??
                _pipMainResolutionIndex ??
                preferences.liveSettings.resolutionIndex
          : pipOverlayResolutionIndex ??
                _pipOverlayResolutionIndex ??
                preferences.liveSettings.multiviewResolutionIndex;
    }

    final slotResolutionIndex = sourceState
        .slotById(slotId)
        ?.playbackResolutionIndex;
    if (slotResolutionIndex != null) {
      return slotResolutionIndex;
    }

    return preferences.liveSettings.multiviewResolutionIndex;
  }

  bool get _usesPipRoleResolution {
    return _usesPipRoleResolutionInState(state);
  }

  bool _usesPipRoleResolutionInState(LivePlayerState sourceState) {
    return sourceState.isMultiview &&
        sourceState.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip;
  }
}
