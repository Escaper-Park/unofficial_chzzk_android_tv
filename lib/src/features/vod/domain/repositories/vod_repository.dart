import '../entities/vod_detail.dart';
import '../entities/vod_feed.dart';
import '../entities/vod_playback.dart';
import '../entities/vod_sort.dart';

abstract interface class VodRepository {
  Future<VodPage> getVods({
    int? size,
    VodSort? sortType,
    VodCursor? cursor,
  });

  Future<FollowingVodPage> getFollowingVods({
    int? size,
    FollowingVodCursor? cursor,
  });

  Future<VodDetail> getVodDetail({
    required int videoNo,
  });

  Future<VodPlayback> getPlayback({
    required String videoId,
    required String key,
  });

  Future<void> postVideoWatchEvent({
    required String channelId,
    required int videoNo,
    required String watchEventType,
    required int? awtSeconds,
    required int positionSeconds,
    required String sessionId,
    required int eventDurationSeconds,
    required int totalLengthSeconds,
  });
}
