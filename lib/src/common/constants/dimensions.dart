abstract class Dimensions {
  const Dimensions._();

  /* Common */
  static const double focusedBorderWidth = 1.5;
  static const double _focusedBorderWidthTimes2 = focusedBorderWidth * 2;

  static const double defaultExceptionFallbackWidth = 350.0;
  static const double defaultExceptionFallbackHeight = 50.0;

  static const double videoThumbnailWidth = 256.0;
  static const double videoThumbnailHeight = 144.0;
  static const double videoInfoCardHeight = 96.0;

  static const double videoContainerWidth =
      videoThumbnailWidth + _focusedBorderWidthTimes2; // +3.0 = borderWidth * 2
  static const double videoContainerHeight =
      videoThumbnailHeight + videoInfoCardHeight + _focusedBorderWidthTimes2;

  static const double infoCardProfileImageRadius = 15.0;

  /* Dashboard */
  static const double collapsedSidebarWidth = 60.0;
  static const double expandedSidebarWidth = 200.0;

  /* Auth */
  static const double naverLoginWebviewWidth = 320.0;

  /* Home */
  // original poster size w:h => 3:4
  static const double homeCategoryPosterWidth = 120.0;
  static const double homeCategoryPosterHeight = 160.0;

  static const double homeCategoryContainerWidth =
      homeCategoryPosterWidth + _focusedBorderWidthTimes2;
  static const double homeCategoryContainerHeight =
      homeCategoryPosterHeight + _focusedBorderWidthTimes2;

  /* Following */
  static const double followingListWidth = 200.0;
  static const double followingListChannelProfileImageRadius = 15.0;

  static const double followingButtonWidth = 100.0;
  static const double followingButtonHeight = 40.0;

  /* Channel */
  static const double channelProfileImageRadius = 45.0;

  /* Category */
  static const double categoryInfoCardHeight = 86.0;

  /* Category Detail */
  static const double categoryDetailPosterWidth = 90.0;
  static const double categoryDetailPosterHeight = 120.0;
  static const double categoryDetailInfoCardHeight = 100.0;

  /* Clip */
  // container size w:h => 9:16
  static const double clipContainerWidth = 144.0 + _focusedBorderWidthTimes2;
  static const double clipContainerHeight =
      256.0 + _focusedBorderWidthTimes2; // width / 9 * 16 + (border * 2);
  static const double clipInfoCardHeight = 90.0;
  static const double clipFilterListHeight = 36.0;

  /* Settings */
  static const double settingMenuWidth = 200.0;
  static const double licenseListWidth = 140.0;
  static const double licenseHeaderHegith = 40.0;

  static const double settingHeaderWidth = 120.0;
  static const double settingDisplayValueWidth = 100.0;

  /* Search */
  static const double autoCompleteWidth = 320.0;
  static const double searchResultChannelCardWidth = 200.0;
  static const double searchResultChannelCardHeight = 80.0;

  /* Group */
  static const double groupListWidth = 300.0;
  static const double groupGenerateButtonWidth = 120.0;
  static const double groupGenerateButtonHeight = 40.0;

  static const double groupChannelItemWidth = 40.0;
  static const double groupChannelItemHeight = 100.0;

  static const double popupGroupListHeight = 80.0;
  static const double popupGroupListWidth = 400.0;

  /* Stream */
  static const double streamInfoContainerHeight = 105.0;
  static const double streamInfoProfileImageRadius = 22.5;

  static const double streamNavigatorControlsHeight = 170.0;
  static const double streamNavigatorHeaderHeight = 30.0;

  static const double streamThumbnailWidth = 224.0;
  static const double streamThumbnailHeight = 126.0;

  static const double streamNavigatorContentsWidth =
      streamThumbnailWidth + _focusedBorderWidthTimes2;
  static const double streamNavigatorContentsHeight =
      130.0 + _focusedBorderWidthTimes2;
  static const double streamControlIconWidth = 60.0;
  static const double streamChatSettingControlIconWidth = 80.0;
  static const double streamResolutionControlIconWidth = 80.0;
  static const double streamControlsHeight = 100.0;

  /* vod stream */
  static const double vodStreamMainControlsHeight = 140.0;
  static const double vodPlaybackTimeIndicatorWidth = 140.0;
  static const double vodStreamChannelContentsTitleHeight = 30.0;

  /* live stream */
  static const double liveStreamMainControlsHeight = 100.0;
  static const double liveStreamChannelContentsTitleHeight = 45.0;
  static const double groupContainerWidth = 120.0;
  static const double multiviewIndicatorWidth = 120.0;
  static const double multiviewIndicatorheight = 45.0;
  static const double multiviewInfoHeight = 45.0;
}
