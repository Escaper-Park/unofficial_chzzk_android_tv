part of 'live_player_bloc.dart';

extension _LivePlayerBlocSlotResolutionHelpers on LivePlayerBloc {
  int _resolutionIndexForSlot({
    required String slotId,
    required SettingsPreferences preferences,
  }) {
    if (!state.isMultiview) {
      return preferences.liveSettings.resolutionIndex;
    }

    final slotResolutionIndex = state.slotById(slotId)?.playbackResolutionIndex;
    if (slotResolutionIndex != null) {
      return slotResolutionIndex;
    }

    return preferences.liveSettings.multiviewResolutionIndex;
  }
}
