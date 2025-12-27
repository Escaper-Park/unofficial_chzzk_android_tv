import 'package:freezed_annotation/freezed_annotation.dart';

import 'watching_history.dart';

part 'watching_history_response.g.dart';
part 'watching_history_response.freezed.dart';

@freezed
class WatchingHistoryResponse with _$WatchingHistoryResponse {
  const factory WatchingHistoryResponse({
    required int size,
    WatchingHistoryPage? page,
    required List<WatchingHistory> data,
  }) = _WatchingHistoryResponse;

  factory WatchingHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryResponseFromJson(json);
}

@freezed
class WatchingHistoryPage with _$WatchingHistoryPage {
  const factory WatchingHistoryPage({WatchingHistoryNext? next}) =
      _WatchingHistoryPage;

  factory WatchingHistoryPage.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryPageFromJson(json);
}

@freezed
class WatchingHistoryNext with _$WatchingHistoryNext {
  const factory WatchingHistoryNext({int? lastTime}) = _WatchingHistoryNext;

  factory WatchingHistoryNext.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryNextFromJson(json);
}
