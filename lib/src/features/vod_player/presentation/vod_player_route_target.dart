import '../../vod/domain/entities/vod_detail.dart';

final class VodPlayerInitialTarget {
  const VodPlayerInitialTarget({
    required this.videoNo,
    this.videoId,
    this.title,
    this.thumbnailImageUrl,
    this.channelId,
    this.channelName,
    this.channelVerified = false,
    this.startPositionSeconds = 0,
    this.detail,
  });

  final int videoNo;
  final String? videoId;
  final String? title;
  final String? thumbnailImageUrl;
  final String? channelId;
  final String? channelName;
  final bool channelVerified;
  final int startPositionSeconds;
  final VodDetail? detail;
}
