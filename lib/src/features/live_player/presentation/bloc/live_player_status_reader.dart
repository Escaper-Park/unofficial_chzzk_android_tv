part of 'live_player_bloc.dart';

final class LivePlayerStatusReader {
  const LivePlayerStatusReader({
    required this.liveRepository,
    required this.channelRepository,
  });

  final LiveRepository liveRepository;
  final ChannelRepository channelRepository;

  Future<LiveStatus> readStatus(String channelId) {
    return liveRepository.getLiveStatus(
      channelId: channelId,
      includePlayerRecommendContent: false,
    );
  }

  Future<LivePlayerEntryBlockReason?> blockReasonForStatus(
    LiveStatus status, {
    required String fallbackChannelId,
  }) async {
    final benefits = await _viewerBenefitsForStatus(
      status,
      fallbackChannelId: fallbackChannelId,
    );
    return checkLivePlayerEntry(
      status: status,
      hasCheatKey: benefits.cheatKey,
      hasNaverMembership: benefits.naverMembership,
    ).blockReason;
  }

  Future<PlayerEntryViewerBenefits> _viewerBenefitsForStatus(
    LiveStatus status, {
    required String fallbackChannelId,
  }) async {
    if (!_isMemberOnly(status.membershipBenefitType)) {
      return noPlayerEntryViewerBenefits;
    }

    final channelId =
        playerEntryTextOrNull(status.channelId) ??
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
