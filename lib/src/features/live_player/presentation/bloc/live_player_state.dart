part of 'live_player_bloc.dart';

@freezed
abstract class LivePlayerState with _$LivePlayerState {
  const LivePlayerState._();

  const factory LivePlayerState({
    required LivePlayerViewMode viewMode,
    @Default(LivePlayerMultiviewLayoutMode.pbp)
    LivePlayerMultiviewLayoutMode multiviewLayoutMode,
    @Default(LivePlayerOverlayMode.none) LivePlayerOverlayMode overlayMode,
    required String activeSlotId,
    required String primarySlotId,
    required List<LivePlayerSlotState> slots,
    @Default(<String>{}) Set<String> audibleSlotIds,
    @Default(0) int activeSlotHighlightSerial,
    @Default(defaultSettingsPreferences)
    SettingsPreferences settingsPreferences,
    @Default(defaultGroupCollection) GroupCollection groupCollection,
    ChannelMyInfo? channelMyInfo,
    @Default(false) bool isSignedIn,
    @Default(LivePlayerBrowseSection.popular)
    LivePlayerBrowseSection browseSection,
    @Default(LivePlayerBrowseLoadStatus.initial)
    LivePlayerBrowseLoadStatus browseStatus,
    @Default(<Live>[]) List<Live> browseItems,
    LiveCursor? browseLiveCursor,
    CategoryLiveCursor? browseCategoryCursor,
    @Default(false) bool browseHasMore,
    @Default(false) bool browseLoadingMore,
    @Default(LivePlayerBrowseFallbackAction.none)
    LivePlayerBrowseFallbackAction browseFallbackAction,
    Live? pendingReplacementLive,
    LivePlayerFeedbackType? feedbackType,
    @Default(0) int feedbackSerial,
  }) = _LivePlayerState;

  factory LivePlayerState.initial({LivePlayerInitialTarget? initialTarget}) {
    final slot = initialTarget == null
        ? const LivePlayerSlotState(slotId: _primarySlotId)
        : LivePlayerSlotState(
            slotId: _primarySlotId,
            status: LivePlayerSlotStatus.loadingSource,
            channelId: initialTarget.channelId,
            liveId: initialTarget.liveId,
            fallbackTitle: initialTarget.title,
            fallbackThumbnailImageUrl: initialTarget.thumbnailImageUrl,
          );

    return LivePlayerState(
      viewMode: LivePlayerViewMode.single,
      activeSlotId: _primarySlotId,
      primarySlotId: _primarySlotId,
      slots: [
        slot,
      ],
    );
  }

  LivePlayerSlotState get activeSlot {
    return slotById(activeSlotId) ?? slots.first;
  }

  int get activeSlotIndex {
    final index = slots.indexWhere((slot) => slot.slotId == activeSlotId);
    return index == -1 ? 0 : index;
  }

  bool get isMultiview {
    return viewMode == LivePlayerViewMode.multiview;
  }

  bool get canAddMultiviewSlot {
    return slots.length <
        settingsPreferences.liveSettings.multiviewMaxCount.clamp(
          2,
          livePlayerMaxMultiviewSlotCount,
        );
  }

  Set<String> get effectiveAudibleSlotIds {
    if (!isMultiview) {
      return {activeSlotId};
    }

    final audible = <String>{};
    for (final slotId in audibleSlotIds) {
      if (_hasSlotId(slotId)) {
        audible.add(slotId);
      }
    }
    return audible.isEmpty ? {activeSlotId} : audible;
  }

  bool isSlotAudible(String slotId) {
    if (!isMultiview) {
      return slotId == activeSlotId;
    }

    var hasKnownAudibleSlot = false;
    for (final audibleSlotId in audibleSlotIds) {
      if (!_hasSlotId(audibleSlotId)) {
        continue;
      }

      if (audibleSlotId == slotId) {
        return true;
      }
      hasKnownAudibleSlot = true;
    }

    return !hasKnownAudibleSlot && slotId == activeSlotId;
  }

  LivePlayerSlotState? slotById(String slotId) {
    for (final slot in slots) {
      if (slot.slotId == slotId) {
        return slot;
      }
    }

    return null;
  }

  bool _hasSlotId(String slotId) {
    for (final slot in slots) {
      if (slot.slotId == slotId) {
        return true;
      }
    }

    return false;
  }

  bool get isFollowingActiveChannel {
    return _hasMyInfoForActiveChannel
        ? channelMyInfo?.following?.following ?? false
        : false;
  }

  bool get canToggleActiveChannelFollowing {
    return _hasMyInfoForActiveChannel && channelMyInfo?.following != null;
  }

  bool get _hasMyInfoForActiveChannel {
    final channelId = activeSlot.channelId;
    return channelId != null && channelMyInfo?.channelId == channelId;
  }

  bool get groupBrowseEnabled {
    return settingsPreferences.liveSettings.showGroupInVideoPlayer == 1;
  }

  List<LivePlayerBrowseSection> get availableBrowseSections {
    return [
      if (isSignedIn) LivePlayerBrowseSection.following,
      LivePlayerBrowseSection.popular,
      LivePlayerBrowseSection.category,
      LivePlayerBrowseSection.recent,
      if (groupBrowseEnabled) LivePlayerBrowseSection.group,
    ];
  }

  LivePlayerBrowseSection get initialBrowseSection {
    return isSignedIn
        ? LivePlayerBrowseSection.following
        : LivePlayerBrowseSection.popular;
  }

  LivePlayerBrowseSection effectiveBrowseSection(
    LivePlayerBrowseSection section,
  ) {
    final sections = availableBrowseSections;
    if (sections.contains(section)) {
      return section;
    }

    return sections.first;
  }

  LivePlayerBrowseSection get nextBrowseSection {
    return _browseSectionOffset(1);
  }

  LivePlayerBrowseSection get previousBrowseSection {
    return _browseSectionOffset(-1);
  }

  LivePlayerBrowseSection _browseSectionOffset(int offset) {
    final sections = availableBrowseSections;
    final currentIndex = sections.indexOf(browseSection);
    if (currentIndex == -1) {
      return sections.first;
    }

    final nextIndex = (currentIndex + offset) % sections.length;
    return sections[nextIndex < 0 ? nextIndex + sections.length : nextIndex];
  }

  GroupItem? get activeGroup {
    final activeGroupId = groupCollection.effectiveActivatedGroupId;
    if (activeGroupId == null) {
      return null;
    }

    for (final group in groupCollection.groups) {
      if (group.id == activeGroupId) {
        return group;
      }
    }

    return null;
  }

  bool get watchEventReportingEnabled {
    return viewMode == LivePlayerViewMode.single;
  }

  bool canReportWatchEventForSlot({
    required String slotId,
    required String channelId,
    required int liveId,
  }) {
    if (!watchEventReportingEnabled) {
      return false;
    }

    final slot = slotById(slotId);
    return slot?.channelId == channelId && slot?.liveId == liveId;
  }
}

const _primarySlotId = 'primary';
const livePlayerMaxMultiviewSlotCount = 4;
