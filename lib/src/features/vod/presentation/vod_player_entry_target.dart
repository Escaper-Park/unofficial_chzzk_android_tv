import '../../vod_player/presentation/vod_player_route_target.dart';
import '../domain/entities/vod_detail.dart';
import '../domain/entities/vod_feed.dart';

VodPlayerInitialTarget vodPlayerEntryTargetFromCard({
  required Vod item,
  required VodDetail? detail,
  required int startPositionSeconds,
}) {
  return VodPlayerInitialTarget(
    videoNo: item.videoNo,
    videoId: item.videoId ?? detail?.videoId,
    title: item.title,
    thumbnailImageUrl: item.thumbnailImageUrl,
    channelId: item.channel?.channelId ?? detail?.channel?.channelId,
    channelName: item.channel?.channelName ?? detail?.channel?.channelName,
    channelVerified:
        item.channel?.verifiedMark ?? detail?.channel?.verifiedMark ?? false,
    startPositionSeconds: startPositionSeconds,
    detail: detail,
  );
}
