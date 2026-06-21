part of 'live_player_bloc.dart';

const _liveClosedStatus = 'CLOSED';
const _membershipBenefitType = 'MEMBER_ONLY';

extension _LivePlayerBlocEntryHelpers on LivePlayerBloc {
  Future<_LivePlayerEntrySettings> _readEntrySettings() async {
    try {
      final preferences = await settingsPreferencesRepository.read();
      return _LivePlayerEntrySettings(
        preferences: preferences,
        liveSettings: preferences.liveSettings,
        videoViewType: preferences.generalSetting.videoViewType,
      );
    } on Object {
      return const _LivePlayerEntrySettings(
        preferences: defaultSettingsPreferences,
        liveSettings: defaultLiveSettings,
        videoViewType: PlayerVideoViewType.textureView,
      );
    }
  }
}

SettingsPreferences _preferencesForPersistentSave(
  SettingsPreferences preferences, {
  required SettingsPreferences persisted,
}) {
  return preferences.copyWith(
    liveSettings: preferences.liveSettings.copyWith(
      resolutionIndex: persisted.liveSettings.resolutionIndex,
      multiviewResolutionIndex: persisted.liveSettings.multiviewResolutionIndex,
    ),
  );
}

bool _shouldRefreshSinglePlaybackSource(
  SettingsPreferences previous,
  SettingsPreferences next,
) {
  return previous.liveSettings.latencyIndex != next.liveSettings.latencyIndex ||
      previous.liveSettings.resolutionIndex !=
          next.liveSettings.resolutionIndex ||
      previous.generalSetting.videoViewTypeIndex !=
          next.generalSetting.videoViewTypeIndex;
}

bool _shouldRefreshMultiviewPlaybackSources(
  SettingsPreferences previous,
  SettingsPreferences next,
) {
  return previous.liveSettings.latencyIndex != next.liveSettings.latencyIndex ||
      previous.liveSettings.multiviewResolutionIndex !=
          next.liveSettings.multiviewResolutionIndex ||
      previous.generalSetting.videoViewTypeIndex !=
          next.generalSetting.videoViewTypeIndex;
}

bool _isLiveClosedStatus(String? status) {
  return status?.trim().toUpperCase() == _liveClosedStatus;
}

bool _isBlockedLiveEntry(LivePlayerEntryBlockReason? reason) {
  return reason != null && reason != LivePlayerEntryBlockReason.closed;
}

LiveStatus _liveStatusFromDetail(
  LiveDetail detail, {
  required String fallbackChannelId,
}) {
  return LiveStatus(
    title: detail.title,
    status: detail.status,
    concurrentUserCount: detail.concurrentUserCount,
    adult: detail.adult,
    openDate: detail.openDate,
    chatChannelId: detail.chatChannelId,
    tags: detail.tags,
    categoryValue: detail.categoryValue,
    categoryType: detail.categoryType,
    categoryId: detail.categoryId,
    userAdultStatus: detail.userAdultStatus,
    blindType: detail.blindType,
    watchPartyTag: detail.watchPartyTag,
    watchPartyType: detail.watchPartyType,
    channelId: detail.channel?.channelId ?? fallbackChannelId,
    timeMachineActive: detail.timeMachineActive,
    membershipBenefitType: detail.membershipBenefitType,
  );
}

bool _isMemberOnly(String? value) {
  return playerEntryTextOrNull(value)?.toUpperCase() == _membershipBenefitType;
}

final class _LivePlayerEntrySettings {
  const _LivePlayerEntrySettings({
    required this.preferences,
    required this.liveSettings,
    required this.videoViewType,
  });

  final SettingsPreferences preferences;
  final LiveSettings liveSettings;
  final PlayerVideoViewType videoViewType;
}
