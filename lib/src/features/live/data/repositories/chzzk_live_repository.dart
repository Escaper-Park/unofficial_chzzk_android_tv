import '../../../../core/network/network.dart';
import '../../domain/entities/live_detail.dart';
import '../../domain/entities/live_feed.dart';
import '../../domain/entities/live_sort.dart';
import '../../domain/entities/live_status.dart';
import '../../domain/failures/live_failure.dart';
import '../../domain/repositories/live_repository.dart';
import '../data_sources/live_api.dart';
import '../data_sources/live_api_contract.dart';
import '../data_sources/live_detail_dt.dart';
import '../mappers/live_mapper.dart';

final class ChzzkLiveRepository implements LiveRepository {
  const ChzzkLiveRepository({
    required this.api,
    this.liveDetailDtFactory = createLiveDetailDt,
  });

  final LiveApi api;
  final LiveDetailDtFactory liveDetailDtFactory;

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) async {
    try {
      final response = await api.getLives(
        size: size ?? LiveApiDefaults.browsePageSize,
        sortType: _liveSortType(sortType ?? LiveSort.popular),
        concurrentUserCount: cursor?.concurrentUserCount,
        liveId: cursor?.liveId,
      );
      final content = response.requireContent();

      return livePageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const LiveLoadFailure(), stackTrace);
    }
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) async {
    try {
      final response = await api.getLiveStatus(
        channelId: channelId,
        includePlayerRecommendContent:
            includePlayerRecommendContent ??
            LiveApiDefaults.includePlayerRecommendContent,
      );
      final content = response.requireContent();

      return liveStatusFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const LiveLoadFailure(), stackTrace);
    }
  }

  @override
  Future<LiveDetail> getLiveDetail({
    required String channelId,
  }) async {
    try {
      final response = await api.getLiveDetail(
        channelId: channelId,
        dt: liveDetailDtFactory(),
      );
      final content = response.requireContent();

      return liveDetailFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const LiveLoadFailure(), stackTrace);
    }
  }

  @override
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
  }) async {
    try {
      await api.postWatchEvent(
        request: _liveWatchEventRequest(
          channelId: channelId,
          liveId: liveId,
          watchEventType: watchEventType,
          sessionId: sessionId,
          eventDurationSeconds: eventDurationSeconds,
          positionSeconds: positionSeconds,
          awtSeconds: awtSeconds,
          liveTokens: liveTokens,
          autoPlay: autoPlay,
          radioMode: radioMode,
        ),
      );
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const LiveWatchEventFailure(), stackTrace);
    }
  }
}

String _liveSortType(LiveSort sort) {
  return switch (sort) {
    LiveSort.popular => LiveApiDefaults.sortTypePopular,
    LiveSort.latest => LiveApiDefaults.sortTypeLatest,
  };
}

Map<String, dynamic> _liveWatchEventRequest({
  required String channelId,
  required int liveId,
  required String watchEventType,
  required String sessionId,
  required int eventDurationSeconds,
  required int positionSeconds,
  required int? awtSeconds,
  required List<String> liveTokens,
  required bool autoPlay,
  required bool radioMode,
}) {
  return {
    LiveWatchEventRequestKeys.channelId: channelId,
    LiveWatchEventRequestKeys.liveId: liveId,
    LiveWatchEventRequestKeys.payload: {
      LiveWatchEventRequestKeys.watchEventType: watchEventType,
      LiveWatchEventRequestKeys.sessionId: sessionId,
      LiveWatchEventRequestKeys.duration: eventDurationSeconds,
      LiveWatchEventRequestKeys.positionAt: positionSeconds,
      // ignore: use_null_aware_elements
      if (awtSeconds != null) LiveWatchEventRequestKeys.awt: awtSeconds,
    },
    LiveWatchEventRequestKeys.liveTokens: liveTokens,
    LiveWatchEventRequestKeys.autoPlay: autoPlay,
    LiveWatchEventRequestKeys.radioMode: radioMode,
  };
}
