part of 'vod_player_bloc.dart';

extension _VodPlayerBlocEntryHelpers on VodPlayerBloc {
  Future<_VodPlayerEntrySettings> _readEntrySettings() async {
    try {
      final preferences = await settingsPreferencesRepository.read();
      return _VodPlayerEntrySettings(
        preferences: preferences,
        videoViewType: preferences.generalSetting.videoViewType,
      );
    } on Object {
      return const _VodPlayerEntrySettings(
        preferences: defaultSettingsPreferences,
        videoViewType: PlayerVideoViewType.textureView,
      );
    }
  }

  Future<VodPlayerEntryBlockReason?> _vodDetailBlockReason(
    VodDetail detail, {
    required String? fallbackVideoId,
    required String? fallbackChannelId,
  }) async {
    final benefits = await _viewerBenefitsForVodDetail(
      detail,
      fallbackChannelId: fallbackChannelId,
    );
    return checkVodDetailPlayerEntry(
      vod: detail,
      isSignedIn: true,
      hasCheatKey: benefits.cheatKey,
      hasNaverMembership: benefits.naverMembership,
      fallbackVideoId: fallbackVideoId,
    ).blockReason;
  }

  Future<PlayerEntryViewerBenefits> _viewerBenefitsForVodDetail(
    VodDetail detail, {
    required String? fallbackChannelId,
  }) async {
    if (!requiresVodDetailMembershipBenefit(detail)) {
      return noPlayerEntryViewerBenefits;
    }

    final channelId =
        playerEntryTextOrNull(detail.channel?.channelId) ??
        playerEntryTextOrNull(fallbackChannelId);
    if (channelId == null) {
      return noPlayerEntryViewerBenefits;
    }

    return loadPlayerEntryViewerBenefits(
      channelRepository,
      channelId: channelId,
    );
  }
}

SettingsPreferences _preferencesForPersistentSave(
  SettingsPreferences preferences, {
  required SettingsPreferences persisted,
}) {
  return preferences.copyWith(
    vodSettings: preferences.vodSettings.copyWith(
      resolutionIndex: persisted.vodSettings.resolutionIndex,
    ),
  );
}

bool _shouldRefreshPlaybackSource(
  SettingsPreferences previous,
  SettingsPreferences next,
) {
  return previous.vodSettings.resolutionIndex !=
      next.vodSettings.resolutionIndex;
}

Uri? _absoluteUri(String? value) {
  final uri = value == null ? null : Uri.tryParse(value);
  return uri == null || !uri.hasScheme ? null : uri;
}

String? _nonBlank(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}

VodPlayerFailureReason _vodEntryFailureReason(
  VodPlayerEntryBlockReason reason,
) {
  return switch (reason) {
    VodPlayerEntryBlockReason.missingVideoId =>
      VodPlayerFailureReason.playbackSourceMissing,
    VodPlayerEntryBlockReason.abroad ||
    VodPlayerEntryBlockReason.restricted ||
    VodPlayerEntryBlockReason.adult ||
    VodPlayerEntryBlockReason.membership => VodPlayerFailureReason.entryBlocked,
  };
}

final class _VodPlayerEntrySettings {
  const _VodPlayerEntrySettings({
    required this.preferences,
    required this.videoViewType,
  });

  final SettingsPreferences preferences;
  final PlayerVideoViewType videoViewType;
}
