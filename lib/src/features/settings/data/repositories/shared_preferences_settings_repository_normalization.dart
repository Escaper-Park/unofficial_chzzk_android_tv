part of 'shared_preferences_settings_repository.dart';

SettingsPreferences _normalizePreferences(SettingsPreferences preferences) {
  return preferences.copyWith(
    generalSetting: _normalizeGeneralSetting(preferences.generalSetting),
    liveSettings: _normalizeLiveSettings(preferences.liveSettings),
    vodSettings: _normalizeVodSettings(preferences.vodSettings),
    chatSettings: _normalizeChatSettings(preferences.chatSettings),
  );
}

GeneralSetting _normalizeGeneralSetting(GeneralSetting settings) {
  return settings.copyWith(
    showImmersive: settingsToggleOptionSet.normalize(settings.showImmersive),
    showFollowingLive: settingsToggleOptionSet.normalize(
      settings.showFollowingLive,
    ),
    showPopularLive: settingsToggleOptionSet.normalize(
      settings.showPopularLive,
    ),
    showWatchingHistory: settingsToggleOptionSet.normalize(
      settings.showWatchingHistory,
    ),
    showPopularVod: settingsToggleOptionSet.normalize(settings.showPopularVod),
    showFollowingCategory: settingsToggleOptionSet.normalize(
      settings.showFollowingCategory,
    ),
    showTrendingCategory: settingsToggleOptionSet.normalize(
      settings.showTrendingCategory,
    ),
    streamingPreview: settingsToggleOptionSet.normalize(
      settings.streamingPreview,
    ),
    streamingPreviewAudioEnabled: settingsToggleOptionSet.normalize(
      settings.streamingPreviewAudioEnabled,
    ),
    streamingPreviewSeconds: settingsStreamingPreviewSecondsOptionSet.normalize(
      settings.streamingPreviewSeconds,
    ),
    streamingPreviewDurationIndex: settingsStreamingPreviewDurationOptionSet
        .normalize(
          settings.streamingPreviewDurationIndex,
        ),
    streamingPreviewResolutionIndex: settingsResolutionOptionSet.normalize(
      settings.streamingPreviewResolutionIndex,
    ),
    liveCardPreviewResolutionIndex: settingsResolutionOptionSet.normalize(
      settings.liveCardPreviewResolutionIndex,
    ),
    overlayControlsDisplayTime: settingsOverlayControlsDisplayTimeOptionSet
        .normalize(
          settings.overlayControlsDisplayTime,
        ),
    videoViewTypeIndex: settingsVideoViewTypeOptionSet.normalize(
      settings.videoViewTypeIndex,
    ),
  );
}

LiveSettings _normalizeLiveSettings(LiveSettings settings) {
  return settings.copyWith(
    latencyIndex: settingsLatencyOptionSet.normalize(settings.latencyIndex),
    showGroupInVideoPlayer: settingsToggleOptionSet.normalize(
      settings.showGroupInVideoPlayer,
    ),
    resolutionIndex: settingsResolutionOptionSet.normalize(
      settings.resolutionIndex,
    ),
    chatWindowIndex: settingsChatWindowOptionSet.normalize(
      settings.chatWindowIndex,
    ),
    multiviewMaxCount: settingsMultiviewMaxCountOptionSet.normalize(
      settings.multiviewMaxCount,
    ),
    multiviewResolutionIndex: settingsResolutionOptionSet.normalize(
      settings.multiviewResolutionIndex,
    ),
    multiviewScreenModeIndex: settingsMultiviewScreenModeOptionSet.normalize(
      settings.multiviewScreenModeIndex,
    ),
    multiviewChatWindowIndex: settingsMultiviewChatWindowOptionSet.normalize(
      settings.multiviewChatWindowIndex,
    ),
    multiviewChatPositionX: settingsPositionOptionSet.normalize(
      settings.multiviewChatPositionX,
    ),
    multiviewChatPositionY: settingsPositionOptionSet.normalize(
      settings.multiviewChatPositionY,
    ),
    multiviewPipLayoutIndex: settingsMultiviewPipLayoutOptionSet.normalize(
      settings.multiviewPipLayoutIndex,
    ),
    multiviewPipPositionX: settingsPositionOptionSet.normalize(
      settings.multiviewPipPositionX,
    ),
    multiviewPipPositionY: settingsPositionOptionSet.normalize(
      settings.multiviewPipPositionY,
    ),
    multiviewPipSize: settingsMultiviewPipSizeOptionSet.normalize(
      settings.multiviewPipSize,
    ),
  );
}

VodSettings _normalizeVodSettings(VodSettings settings) {
  return settings.copyWith(
    resolutionIndex: settingsResolutionOptionSet.normalize(
      settings.resolutionIndex,
    ),
    chatWindowIndex: settingsChatWindowOptionSet.normalize(
      settings.chatWindowIndex,
    ),
    playbackIntervalIndex: settingsVodPlaybackIntervalOptionSet.normalize(
      settings.playbackIntervalIndex,
    ),
  );
}

ChatSettings _normalizeChatSettings(ChatSettings settings) {
  return settings.copyWith(
    overlayChatQuickPositionIndex: settingsOverlayChatQuickPositionOptionSet
        .normalize(
          settings.overlayChatQuickPositionIndex,
        ),
    overlayChatPositionX: settingsPositionOptionSet.normalize(
      settings.overlayChatPositionX,
    ),
    overlayChatPositionY: settingsPositionOptionSet.normalize(
      settings.overlayChatPositionY,
    ),
    overlayChatPanelHeight: settingsOverlayChatPanelHeightOptionSet.normalize(
      settings.overlayChatPanelHeight,
    ),
    overlayChatPanelWidth: settingsOverlayChatPanelWidthOptionSet.normalize(
      settings.overlayChatPanelWidth,
    ),
    sideChatPositionIndex: settingsSideChatPositionOptionSet.normalize(
      settings.sideChatPositionIndex,
    ),
    chatSidePanelWidth: settingsChatSidePanelWidthOptionSet.normalize(
      settings.chatSidePanelWidth,
    ),
    chatSidePanelPositionX: settingsPositionOptionSet.normalize(
      settings.chatSidePanelPositionX,
    ),
    chatMessageFontSize: settingsChatMessageFontSizeOptionSet.normalize(
      settings.chatMessageFontSize,
    ),
    chatPanelTransparency: settingsTransparencyOptionSet.normalize(
      settings.chatPanelTransparency,
    ),
    useChatPanelContainer: settingsToggleOptionSet.normalize(
      settings.useChatPanelContainer,
    ),
    chatBubbleTransparency: settingsTransparencyOptionSet.normalize(
      settings.chatBubbleTransparency,
    ),
    chatContainerHorizontalMargin: settingsMarginOptionSet.normalize(
      settings.chatContainerHorizontalMargin,
    ),
    chatContainerVerticalMargin: settingsMarginOptionSet.normalize(
      settings.chatContainerVerticalMargin,
    ),
    chatBubbleVerticalGap: settingsMarginOptionSet.normalize(
      settings.chatBubbleVerticalGap,
    ),
    showChatTime: settingsToggleOptionSet.normalize(settings.showChatTime),
    showNickname: settingsToggleOptionSet.normalize(settings.showNickname),
    showDonation: settingsToggleOptionSet.normalize(settings.showDonation),
    showUserBadges: settingsToggleOptionSet.normalize(settings.showUserBadges),
    badgeCollectorPanelHeight: settingsBadgeCollectorPanelHeightOptionSet
        .normalize(
          settings.badgeCollectorPanelHeight,
        ),
    overlayBadgeCollectorPositionX: settingsPositionOptionSet.normalize(
      settings.overlayBadgeCollectorPositionX,
    ),
    overlayBadgeCollectorPositionY: settingsPositionOptionSet.normalize(
      settings.overlayBadgeCollectorPositionY,
    ),
    useBadgeCollector: settingsBadgeCollectorDisplayOptionSet.normalize(
      settings.useBadgeCollector,
    ),
  );
}
