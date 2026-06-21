part of 'live_player_view.dart';

Widget _livePlayerContentFor({
  required BuildContext context,
  required LivePlayerState state,
  required FocusScopeNode controllerNode,
  required FocusNode controllerFocusNode,
  required FocusScopeNode controlsNode,
  required FocusScopeNode browseNode,
  required ValueNotifier<bool> playbackPaused,
  required ValueNotifier<bool> muted,
  required bool appPlaybackSuspended,
  required bool effectivePlaybackPaused,
  required ConnectLiveChat connectLiveChat,
  required ObjectRef<int> lastVisibleChatWindowIndex,
  required LivePlayerPlaybackSessionController playbackSessionController,
  required TvPlayerOverlayAutoHideController overlayAutoHideController,
  required TvPlayerExitNoticeController exitNoticeController,
  required VoidCallback onControlsInteraction,
  required ValueChanged<bool> onControlsModalVisibilityChanged,
}) {
  void updatePreferences(SettingsPreferences preferences) {
    context.read<LivePlayerBloc>().add(
      LivePlayerEvent.preferencesChanged(
        preferences: preferences,
      ),
    );
  }

  void selectChatWindowIndex(int value) {
    if (value != liveChatWindowHiddenIndex) {
      lastVisibleChatWindowIndex.value = value;
    }

    updatePreferences(
      state.settingsPreferences.copyWith(
        liveSettings: state.settingsPreferences.liveSettings.copyWith(
          chatWindowIndex: value,
        ),
      ),
    );
  }

  final slot = state.activeSlot;
  final chatLayer = _livePlayerChatLayerFor(
    state: state,
    slot: slot,
    playbackPaused: effectivePlaybackPaused,
    appPlaybackSuspended: appPlaybackSuspended,
    connectLiveChat: connectLiveChat,
  );

  return _LivePlayerSessionLifecycle(
    state: state,
    playbackPaused: effectivePlaybackPaused,
    child: PlayerContentLayout(
      player: LivePlayerPlaybackLayout(
        state: state,
        playbackPaused: effectivePlaybackPaused,
        singleMuted: muted.value,
        chat: chatLayer,
        playbackSessionController: playbackSessionController,
        statusSurfaceFor: _livePlayerStatusSurfaceFor,
      ),
      controllerNode: controllerNode,
      controllerFocusNode: controllerFocusNode,
      onSelect: () => _handleLivePlayerSelect(
        context,
        slot,
        onControlsOpened: onControlsInteraction,
      ),
      onUp: () => _handleLivePlayerUp(
        context,
        slot,
        isSignedIn: context.read<AuthSessionBloc>().hasRequiredCookies,
        onBrowseOpened: overlayAutoHideController.dismissModal,
      ),
      onDown: () => _handleLivePlayerDown(
        context,
        state,
        lastVisibleChatWindowIndex,
        onChatWindowIndexSelected: selectChatWindowIndex,
      ),
      onLeft: () => _handleLivePlayerHorizontalChatShortcut(
        context,
        state,
        forward: false,
        onPreferencesChanged: updatePreferences,
      ),
      onRight: () => _handleLivePlayerHorizontalChatShortcut(
        context,
        state,
        forward: true,
        onPreferencesChanged: updatePreferences,
      ),
      controlsOverlay: _livePlayerOverlayFor(
        context: context,
        state: state,
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
        onControlsInteraction: onControlsInteraction,
        modalDismissSerial: overlayAutoHideController.modalDismissSerial,
        onModalVisibilityChanged: onControlsModalVisibilityChanged,
        onBrowseInteraction: exitNoticeController.hide,
      ),
      foreground: _LivePlayerForeground(
        feedbackType: state.feedbackType,
        showExitNotice: exitNoticeController.isShowing,
      ),
    ),
  );
}
