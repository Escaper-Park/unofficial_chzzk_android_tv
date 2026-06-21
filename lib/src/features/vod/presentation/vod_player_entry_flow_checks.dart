part of 'vod_player_entry_flow.dart';

Future<VodPlayerEntryDecision?> _checkVodEntry({
  required BuildContext context,
  required Vod vod,
  required bool isSignedIn,
  required ChannelRepository channelRepository,
}) async {
  final viewerBenefits = await _viewerBenefitsForVod(
    context: context,
    isSignedIn: isSignedIn,
    requiresMembershipBenefit: requiresVodMembershipBenefit(vod),
    channelId: vod.channel?.channelId,
    channelRepository: channelRepository,
  );
  if (viewerBenefits == null) {
    return null;
  }

  return checkVodPlayerEntry(
    vod: vod,
    isSignedIn: isSignedIn,
    hasCheatKey: viewerBenefits.cheatKey,
    hasNaverMembership: viewerBenefits.naverMembership,
  );
}

Future<VodPlayerEntryDecision?> _checkVodDetailEntry({
  required BuildContext context,
  required VodDetail vod,
  required String? fallbackVideoId,
  required String? fallbackChannelId,
  required bool isSignedIn,
  required ChannelRepository channelRepository,
}) async {
  final viewerBenefits = await _viewerBenefitsForVod(
    context: context,
    isSignedIn: isSignedIn,
    requiresMembershipBenefit: requiresVodDetailMembershipBenefit(vod),
    channelId: vod.channel?.channelId ?? fallbackChannelId,
    channelRepository: channelRepository,
  );
  if (viewerBenefits == null) {
    return null;
  }

  return checkVodDetailPlayerEntry(
    vod: vod,
    isSignedIn: isSignedIn,
    hasCheatKey: viewerBenefits.cheatKey,
    hasNaverMembership: viewerBenefits.naverMembership,
    fallbackVideoId: fallbackVideoId,
  );
}

Future<PlayerEntryViewerBenefits?> _viewerBenefitsForVod({
  required BuildContext context,
  required bool isSignedIn,
  required bool requiresMembershipBenefit,
  required String? channelId,
  required ChannelRepository channelRepository,
}) async {
  if (!isSignedIn || !requiresMembershipBenefit) {
    return noPlayerEntryViewerBenefits;
  }

  final normalizedChannelId = playerEntryTextOrNull(channelId);
  if (normalizedChannelId == null) {
    return noPlayerEntryViewerBenefits;
  }

  final viewerBenefits = await loadPlayerEntryViewerBenefits(
    channelRepository,
    channelId: normalizedChannelId,
  );
  if (!context.mounted) {
    return null;
  }

  return viewerBenefits;
}

Future<VodDetail?> _loadVodDetail(
  VodRepository repository,
  int videoNo,
) async {
  try {
    return await repository.getVodDetail(videoNo: videoNo);
  } catch (_) {
    return null;
  }
}
