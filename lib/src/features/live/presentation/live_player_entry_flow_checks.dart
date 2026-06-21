part of 'live_player_entry_flow.dart';

Future<LiveStatus?> _allowedLiveStatusForChannel(
  BuildContext context,
  String channelId,
) async {
  final liveRepository = context.read<LiveRepository>();
  final channelRepository = context.read<ChannelRepository>();

  late final LiveStatus status;
  late final PlayerEntryViewerBenefits viewerBenefits;
  try {
    final results = await Future.wait<Object>([
      liveRepository.getLiveStatus(channelId: channelId),
      loadPlayerEntryViewerBenefits(
        channelRepository,
        channelId: channelId,
      ),
    ]);
    status = results[0] as LiveStatus;
    viewerBenefits = results[1] as PlayerEntryViewerBenefits;
  } catch (_) {
    if (!context.mounted) {
      return null;
    }

    await _showBlockedDialog(
      context,
      LivePlayerEntryBlockReason.restricted,
    );
    return null;
  }

  if (!context.mounted) {
    return null;
  }

  final decision = checkLivePlayerEntry(
    status: status,
    hasCheatKey: viewerBenefits.cheatKey,
    hasNaverMembership: viewerBenefits.naverMembership,
  );
  final blockReason = decision.blockReason;
  if (blockReason != null) {
    await _showBlockedDialog(context, blockReason);
    return null;
  }

  return status;
}
