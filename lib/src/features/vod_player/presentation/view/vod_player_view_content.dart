part of 'vod_player_view.dart';

Widget _vodPlayerContentFor({
  required BuildContext context,
  required VodPlayerState state,
  required FocusScopeNode controllerNode,
  required FocusNode controllerFocusNode,
  required FocusScopeNode controlsNode,
  required FocusScopeNode browseNode,
  required ValueNotifier<bool> playbackPaused,
  required ValueNotifier<bool> muted,
  required ValueNotifier<int> seekSerial,
  required ValueNotifier<VodPlayerSeekRequest?> seekRequest,
  required ValueNotifier<VodPlayerPlaybackSnapshot> playbackSnapshot,
  required ObjectRef<int> lastVisibleChatWindowIndex,
  required VodPlayerSeekFeedbackController seekFeedbackController,
  required TvPlayerOverlayAutoHideController overlayAutoHideController,
  required TvPlayerExitNoticeController exitNoticeController,
  required VoidCallback onControlsInteraction,
  required ValueChanged<bool> onControlsModalVisibilityChanged,
}) {
  void updatePreferences(SettingsPreferences preferences) {
    context.read<VodPlayerBloc>().add(
      VodPlayerEvent.preferencesChanged(
        preferences: preferences,
      ),
    );
  }

  void selectChatWindowIndex(int value) {
    if (value != vodChatWindowHiddenIndex) {
      lastVisibleChatWindowIndex.value = value;
    }

    updatePreferences(
      state.settingsPreferences.copyWith(
        vodSettings: state.settingsPreferences.vodSettings.copyWith(
          chatWindowIndex: value,
        ),
      ),
    );
  }

  final slot = state.activeSlot;

  return PlayerContentLayout(
    player: VodPlayerSurface(
      slot: slot,
      playbackPaused: playbackPaused.value,
      muted: muted.value,
      playbackSpeed: state.playbackSpeed,
      seekRequest: seekRequest.value,
      playbackSnapshot: playbackSnapshot,
      chatPresentationModeIndex:
          state.settingsPreferences.vodSettings.chatWindowIndex,
      chatSettings: state.settingsPreferences.chatSettings,
    ),
    controllerNode: controllerNode,
    controllerFocusNode: controllerFocusNode,
    onSelect: () => _handleVodPlayerSelect(
      context,
      slot,
      onControlsOpened: onControlsInteraction,
    ),
    onUp: () => _handleVodPlayerUp(
      context,
      slot,
      onBrowseOpened: overlayAutoHideController.dismissModal,
    ),
    onDown: () => _handleVodPlayerDown(
      state,
      lastVisibleChatWindowIndex,
      onChatWindowIndexSelected: selectChatWindowIndex,
    ),
    onLeft: () => _seekVodPlayerRelative(
      context: context,
      seekSerial: seekSerial,
      seekRequest: seekRequest,
      playbackSnapshot: playbackSnapshot,
      seekFeedbackController: seekFeedbackController,
      forward: false,
      slot: slot,
      state: state,
    ),
    onRight: () => _seekVodPlayerRelative(
      context: context,
      seekSerial: seekSerial,
      seekRequest: seekRequest,
      playbackSnapshot: playbackSnapshot,
      seekFeedbackController: seekFeedbackController,
      forward: true,
      slot: slot,
      state: state,
    ),
    controlsOverlay: _vodPlayerOverlayFor(
      context: context,
      state: state,
      slot: slot,
      controllerNode: controllerNode,
      controlsNode: controlsNode,
      browseNode: browseNode,
      playbackPaused: playbackPaused.value,
      muted: muted.value,
      onPlaybackPausedChanged: (value) {
        playbackPaused.value = value;
      },
      onMutedChanged: (value) {
        muted.value = value;
      },
      onSeek: (position) {
        _seekVodPlayerTo(
          context: context,
          seekSerial: seekSerial,
          seekRequest: seekRequest,
          playbackSnapshot: playbackSnapshot,
          position: position,
          slot: slot,
        );
      },
      onSeekFeedback: seekFeedbackController.show,
      playbackSnapshot: playbackSnapshot,
      onControlsInteraction: onControlsInteraction,
      modalDismissSerial: overlayAutoHideController.modalDismissSerial,
      onModalVisibilityChanged: onControlsModalVisibilityChanged,
      onBrowseInteraction: exitNoticeController.hide,
    ),
    foreground: _VodPlayerForeground(
      slot: slot,
      seekFeedback: seekFeedbackController.feedback,
      feedbackType: state.feedbackType,
      showExitNotice: exitNoticeController.isShowing,
    ),
  );
}
