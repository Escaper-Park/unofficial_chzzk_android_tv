import '../entities/live_detail.dart';
import '../entities/live_feed.dart';
import '../entities/live_sort.dart';
import '../entities/live_status.dart';

abstract interface class LiveRepository {
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  });

  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  });

  Future<LiveDetail> getLiveDetail({
    required String channelId,
  });

  Future<void> postLiveWatchEvent({
    required String channelId,
    required int liveId,
    required String watchEventType,
    required String sessionId,
    required int eventDurationSeconds,
    required int positionSeconds,
    required int? awtSeconds,
    List<String> liveTokens = const <String>[],
    bool autoPlay = false,
    bool radioMode = false,
  });
}
