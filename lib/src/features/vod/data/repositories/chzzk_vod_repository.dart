import '../../../../core/network/network.dart';
import '../../domain/entities/vod_detail.dart';
import '../../domain/entities/vod_feed.dart';
import '../../domain/entities/vod_playback.dart';
import '../../domain/entities/vod_sort.dart';
import '../../domain/failures/vod_failure.dart';
import '../../domain/repositories/vod_repository.dart';
import '../data_sources/vod_api.dart';
import '../data_sources/vod_api_contract.dart';
import '../mappers/vod_mapper.dart';

final class ChzzkVodRepository implements VodRepository {
  const ChzzkVodRepository({
    required this.api,
    required this.playbackApi,
  });

  final VodApi api;
  final VodPlaybackApi playbackApi;

  @override
  Future<VodPage> getVods({
    int? size,
    VodSort? sortType,
    VodCursor? cursor,
  }) async {
    try {
      final response = await api.getVods(
        size: size ?? VodApiDefaults.browsePageSize,
        sortType: _vodSortType(sortType ?? VodSort.popular),
        publishDateAt: cursor?.publishDateAt,
        readCount: cursor?.readCount,
      );
      final content = response.requireContent();

      return vodPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const VodLoadFailure(), stackTrace);
    }
  }

  @override
  Future<FollowingVodPage> getFollowingVods({
    int? size,
    FollowingVodCursor? cursor,
  }) async {
    try {
      final response = await api.getFollowingVods(
        size: size ?? VodApiDefaults.browsePageSize,
        nextNo: cursor?.nextNo,
      );
      final content = response.requireContent();

      return followingVodPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const VodLoadFailure(), stackTrace);
    }
  }

  @override
  Future<VodDetail> getVodDetail({
    required int videoNo,
  }) async {
    try {
      final response = await api.getVodDetail(videoNo: videoNo);
      final content = response.requireContent();

      return vodDetailFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const VodLoadFailure(), stackTrace);
    }
  }

  @override
  Future<VodPlayback> getPlayback({
    required String videoId,
    required String key,
  }) async {
    try {
      final response = await playbackApi.getPlayback(
        videoId: videoId,
        key: key,
      );

      return vodPlaybackFromDto(response);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const VodLoadFailure(), stackTrace);
    }
  }

  @override
  Future<void> postVideoWatchEvent({
    required String channelId,
    required int videoNo,
    required String watchEventType,
    required int? awtSeconds,
    required int positionSeconds,
    required String sessionId,
    required int eventDurationSeconds,
    required int totalLengthSeconds,
  }) async {
    try {
      await api.postWatchEvent(
        request: _videoWatchEventRequest(
          channelId: channelId,
          videoNo: videoNo,
          watchEventType: watchEventType,
          awtSeconds: awtSeconds,
          positionSeconds: positionSeconds,
          sessionId: sessionId,
          eventDurationSeconds: eventDurationSeconds,
          totalLengthSeconds: totalLengthSeconds,
        ),
      );
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const VodWatchEventFailure(), stackTrace);
    }
  }
}

String _vodSortType(VodSort sort) {
  return switch (sort) {
    VodSort.popular => VodApiDefaults.sortTypePopular,
    VodSort.latest => VodApiDefaults.sortTypeLatest,
  };
}

Map<String, dynamic> _videoWatchEventRequest({
  required String channelId,
  required int videoNo,
  required String watchEventType,
  required int? awtSeconds,
  required int positionSeconds,
  required String sessionId,
  required int eventDurationSeconds,
  required int totalLengthSeconds,
}) {
  return {
    VodWatchEventRequestKeys.channelId: channelId,
    VodWatchEventRequestKeys.videoNo: videoNo,
    VodWatchEventRequestKeys.payload: {
      VodWatchEventRequestKeys.watchEventType: watchEventType,
      VodWatchEventRequestKeys.sessionId: sessionId,
      VodWatchEventRequestKeys.duration: eventDurationSeconds,
      VodWatchEventRequestKeys.positionAt: positionSeconds,
      // ignore: use_null_aware_elements
      if (awtSeconds != null) VodWatchEventRequestKeys.awt: awtSeconds,
    },
    VodWatchEventRequestKeys.totalLength: totalLengthSeconds,
  };
}
