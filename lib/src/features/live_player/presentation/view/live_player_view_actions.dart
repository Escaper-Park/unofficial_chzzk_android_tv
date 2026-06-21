part of 'live_player_view.dart';

void _handleLivePlayerSelect(
  BuildContext context,
  LivePlayerSlotState slot, {
  required VoidCallback onControlsOpened,
}) {
  if (slot.status == LivePlayerSlotStatus.failure) {
    if (slot.channelId == null) {
      return;
    }

    context.read<LivePlayerBloc>().add(
      const LivePlayerEvent.retryRequested(),
    );
    return;
  }

  if (slot.channelId == null) {
    return;
  }

  context.read<LivePlayerBloc>().add(
    const LivePlayerEvent.controlsRequested(),
  );
  onControlsOpened();
}

void _handleLivePlayerUp(
  BuildContext context,
  LivePlayerSlotState slot, {
  required bool isSignedIn,
  required VoidCallback onBrowseOpened,
}) {
  if (slot.channelId == null) {
    return;
  }

  context.read<LivePlayerBloc>().add(
    LivePlayerEvent.browseRequested(isSignedIn: isSignedIn),
  );
  onBrowseOpened();
}

void _handleLivePlayerDown(
  BuildContext context,
  LivePlayerState state,
  ObjectRef<int> lastVisibleChatWindowIndex, {
  required ValueChanged<int> onChatWindowIndexSelected,
}) {
  if (state.isMultiview) {
    if (state.overlayMode != LivePlayerOverlayMode.none) {
      return;
    }

    context.read<LivePlayerBloc>().add(
      LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: _nextMultiviewLayoutMode(state.multiviewLayoutMode),
      ),
    );
    return;
  }

  if (!canUseSingleViewLiveChatShortcut(state)) {
    return;
  }

  final current = state.settingsPreferences.liveSettings.chatWindowIndex;
  if (current != liveChatWindowHiddenIndex) {
    lastVisibleChatWindowIndex.value = current;
    onChatWindowIndexSelected(liveChatWindowHiddenIndex);
    return;
  }

  onChatWindowIndexSelected(
    visibleLiveChatWindowIndex(lastVisibleChatWindowIndex.value),
  );
}

LivePlayerMultiviewLayoutMode _nextMultiviewLayoutMode(
  LivePlayerMultiviewLayoutMode current,
) {
  const values = LivePlayerMultiviewLayoutMode.values;
  final nextIndex = (values.indexOf(current) + 1) % values.length;
  return values[nextIndex];
}

void _handleLivePlayerHorizontalChatShortcut(
  BuildContext context,
  LivePlayerState state, {
  required bool forward,
  required ValueChanged<SettingsPreferences> onPreferencesChanged,
}) {
  if (state.isMultiview) {
    if (state.overlayMode != LivePlayerOverlayMode.none) {
      return;
    }

    context.read<LivePlayerBloc>().add(
      LivePlayerEvent.activeSlotShiftRequested(delta: forward ? 1 : -1),
    );
    return;
  }

  if (!canUseSingleViewLiveChatShortcut(state)) {
    return;
  }

  final preferences = state.settingsPreferences;
  final chatWindowIndex = preferences.liveSettings.chatWindowIndex;
  switch (chatWindowIndex) {
    case liveChatWindowOverlayIndex:
      final chatSettings = cycledLiveOverlayChatPosition(
        preferences.chatSettings,
        forward: forward,
      );
      if (chatSettings != preferences.chatSettings) {
        onPreferencesChanged(
          preferences.copyWith(chatSettings: chatSettings),
        );
      }
    case liveChatWindowSidePanelIndex:
      final positionX = forward
          ? liveSideChatRightPositionX
          : liveSideChatLeftPositionX;
      final positionIndex = forward
          ? liveSideChatRightPositionIndex
          : liveSideChatLeftPositionIndex;
      final chatSettings = preferences.chatSettings;
      if (chatSettings.chatSidePanelPositionX != positionX ||
          chatSettings.sideChatPositionIndex != positionIndex) {
        onPreferencesChanged(
          preferences.copyWith(
            chatSettings: chatSettings.copyWith(
              sideChatPositionIndex: positionIndex,
              chatSidePanelPositionX: positionX,
            ),
          ),
        );
      }
    default:
      return;
  }
}
