import 'package:freezed_annotation/freezed_annotation.dart';

part 'watching_history.freezed.dart';

@freezed
abstract class WatchingHistoryPage with _$WatchingHistoryPage {
  const factory WatchingHistoryPage({
    @Default(<WatchingHistoryItem>[]) List<WatchingHistoryItem> items,
    WatchingHistoryCursor? cursor,
    @Default(0) int size,
  }) = _WatchingHistoryPage;
}

@freezed
abstract class WatchingHistoryCursor with _$WatchingHistoryCursor {
  const factory WatchingHistoryCursor({
    int? lastTime,
  }) = _WatchingHistoryCursor;
}

@freezed
abstract class WatchingHistoryItem with _$WatchingHistoryItem {
  const factory WatchingHistoryItem({
    required String historyNo,
    required String channelId,
    required int videoNo,
    required int timeline,
    required String contentType,
    String? date,
    WatchingHistoryVideo? video,
  }) = _WatchingHistoryItem;
}

@freezed
abstract class WatchingHistoryVideo with _$WatchingHistoryVideo {
  const factory WatchingHistoryVideo({
    required int videoNo,
    String? videoId,
    required String title,
    required String videoType,
    required String publishDate,
    String? thumbnailImageUrl,
    required int duration,
    required int readCount,
    required int publishDateAt,
    String? categoryValue,
    required bool adult,
    required int livePv,
    @Default(<String>[]) List<String> tags,
    WatchingHistoryChannel? channel,
    String? blindType,
    int? watchTimeline,
  }) = _WatchingHistoryVideo;
}

@freezed
abstract class WatchingHistoryChannel with _$WatchingHistoryChannel {
  const factory WatchingHistoryChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    WatchingHistoryPersonalData? personalData,
  }) = _WatchingHistoryChannel;
}

@freezed
abstract class WatchingHistoryPersonalData with _$WatchingHistoryPersonalData {
  const factory WatchingHistoryPersonalData({
    required bool following,
    required bool notification,
    String? followDate,
    required bool privateUserBlock,
  }) = _WatchingHistoryPersonalData;
}
