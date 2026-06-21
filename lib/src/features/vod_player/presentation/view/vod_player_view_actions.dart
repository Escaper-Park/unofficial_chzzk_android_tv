part of 'vod_player_view.dart';

void _handleVodPlayerSelect(
  BuildContext context,
  VodPlayerSlotState slot, {
  required VoidCallback onControlsOpened,
}) {
  if (slot.status == VodPlayerSlotStatus.failure) {
    if (slot.videoNo == null) {
      return;
    }

    context.read<VodPlayerBloc>().add(
      const VodPlayerEvent.retryRequested(),
    );
    return;
  }

  if (slot.videoNo == null) {
    return;
  }

  context.read<VodPlayerBloc>().add(
    const VodPlayerEvent.controlsRequested(),
  );
  onControlsOpened();
}

void _handleVodPlayerUp(
  BuildContext context,
  VodPlayerSlotState slot, {
  required VoidCallback onBrowseOpened,
}) {
  if (slot.channelId == null) {
    return;
  }

  context.read<VodPlayerBloc>().add(
    const VodPlayerEvent.browseRequested(),
  );
  onBrowseOpened();
}

void _handleVodPlayerDown(
  VodPlayerState state,
  ObjectRef<int> lastVisibleChatWindowIndex, {
  required ValueChanged<int> onChatWindowIndexSelected,
}) {
  if (!canUseVodChatShortcut(state)) {
    return;
  }

  final current = state.settingsPreferences.vodSettings.chatWindowIndex;
  if (current != vodChatWindowHiddenIndex) {
    lastVisibleChatWindowIndex.value = current;
    onChatWindowIndexSelected(vodChatWindowHiddenIndex);
    return;
  }

  onChatWindowIndexSelected(
    visibleVodChatWindowIndex(lastVisibleChatWindowIndex.value),
  );
}
