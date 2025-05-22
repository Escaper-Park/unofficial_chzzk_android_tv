import 'package:freezed_annotation/freezed_annotation.dart';

import 'watching_history.dart';

part 'watching_history_response.g.dart';
part 'watching_history_response.freezed.dart';

@freezed
@JsonSerializable()
class WatchingHistoryResponse with _$WatchingHistoryResponse {
  final int size;
  final WatchingHistoryPage? page;
  final List<WatchingHistory> data;

  WatchingHistoryResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory WatchingHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryResponseFromJson(json);

  Map<String, Object?> toJson() => _$WatchingHistoryResponseToJson(this);
}

@freezed
@JsonSerializable()
class WatchingHistoryPage with _$WatchingHistoryPage {
  final WatchingHistoryNext? next;

  WatchingHistoryPage({this.next});

  factory WatchingHistoryPage.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryPageFromJson(json);

  Map<String, Object?> toJson() => _$WatchingHistoryPageToJson(this);
}

@freezed
@JsonSerializable()
class WatchingHistoryNext with _$WatchingHistoryNext {
  final int? lastTime;

  WatchingHistoryNext({
    this.lastTime,
  });

  factory WatchingHistoryNext.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryNextFromJson(json);

  Map<String, Object?> toJson() => _$WatchingHistoryNextToJson(this);
}
