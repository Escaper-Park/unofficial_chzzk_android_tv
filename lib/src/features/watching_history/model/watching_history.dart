import 'package:freezed_annotation/freezed_annotation.dart';

import '../../vod/model/vod.dart';

part 'watching_history.g.dart';
part 'watching_history.freezed.dart';

@freezed
@JsonSerializable()
class WatchingHistory with _$WatchingHistory {
  final String historyNo;
  final String channelId;
  final int videoNo;
  final String contentType;
  final int timeline;
  final String date;
  final Vod videoResponse;

  WatchingHistory({
    required this.historyNo,
    required this.channelId,
    required this.videoNo,
    required this.contentType,
    required this.timeline,
    required this.date,
    required this.videoResponse,
  });

  factory WatchingHistory.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryFromJson(json);

  Map<String, Object?> toJson() => _$WatchingHistoryToJson(this);
}
