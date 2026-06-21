part of 'live_player_bloc.dart';

const _recentLiveHistoryLimit = 10;

extension _LivePlayerBlocRecentLiveHelpers on LivePlayerBloc {
  void _rememberRecentLive(
    LiveDetail detail, {
    required String fallbackChannelId,
  }) {
    final channelId = (detail.channel?.channelId ?? fallbackChannelId).trim();
    if (channelId.isEmpty) {
      return;
    }

    _recentLiveChannelIds
      ..remove(channelId)
      ..insert(0, channelId);
    if (_recentLiveChannelIds.length > _recentLiveHistoryLimit) {
      _recentLiveChannelIds.removeRange(
        _recentLiveHistoryLimit,
        _recentLiveChannelIds.length,
      );
    }
  }
}
