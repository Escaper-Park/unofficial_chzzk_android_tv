import '../../../chat/presentation/player_chat.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../bloc/live_player_bloc.dart';
import 'live_player_chat_shortcuts.dart';

int livePlayerEffectiveChatPresentationModeIndex(LivePlayerState state) {
  if (!state.isMultiview) {
    return state.settingsPreferences.liveSettings.chatWindowIndex;
  }

  final requestedMode =
      state.settingsPreferences.liveSettings.multiviewChatWindowIndex;
  if (requestedMode == liveChatWindowHiddenIndex) {
    return liveChatWindowHiddenIndex;
  }

  return switch (state.multiviewLayoutMode) {
    LivePlayerMultiviewLayoutMode.focus => liveChatWindowSidePanelIndex,
    LivePlayerMultiviewLayoutMode.pbp
        when state.slots.length == 2 &&
            requestedMode == liveChatWindowSidePanelIndex =>
      liveChatWindowSidePanelIndex,
    LivePlayerMultiviewLayoutMode.pbp ||
    LivePlayerMultiviewLayoutMode.pip => liveChatWindowOverlayIndex,
  };
}

PlayerChatPresentationMode livePlayerEffectiveChatPresentationMode(
  LivePlayerState state,
) {
  return PlayerChatPresentationMode.fromLiveSettingsIndex(
    livePlayerEffectiveChatPresentationModeIndex(state),
  );
}

bool livePlayerUsesPbpSideChat(LivePlayerState state) {
  return state.isMultiview &&
      state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pbp &&
      livePlayerEffectiveChatPresentationMode(state) ==
          PlayerChatPresentationMode.sidePanel;
}

bool livePlayerUsesFocusSideChat(LivePlayerState state) {
  return state.isMultiview &&
      state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.focus &&
      livePlayerEffectiveChatPresentationMode(state) ==
          PlayerChatPresentationMode.sidePanel;
}

ChatSettings livePlayerEffectiveChatSettings(LivePlayerState state) {
  final chatSettings = state.settingsPreferences.chatSettings;
  if (!state.isMultiview ||
      livePlayerEffectiveChatPresentationMode(state) !=
          PlayerChatPresentationMode.overlay) {
    return chatSettings;
  }

  final liveSettings = state.settingsPreferences.liveSettings;
  return chatSettings.copyWith(
    overlayChatPositionX: liveSettings.multiviewChatPositionX,
    overlayChatPositionY: liveSettings.multiviewChatPositionY,
  );
}
