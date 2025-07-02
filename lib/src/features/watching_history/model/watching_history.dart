import 'package:freezed_annotation/freezed_annotation.dart';

import '../../vod/model/vod.dart';

part 'watching_history.g.dart';
part 'watching_history.freezed.dart';

@freezed
class WatchingHistory with _$WatchingHistory {
  const factory WatchingHistory({
    required String historyNo,
    required String channelId,
    required int videoNo,
    required String contentType,
    required int timeline,
    required String date,
    required Vod videoResponse,
  }) = _WatchingHistory;

  factory WatchingHistory.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryFromJson(json);
}