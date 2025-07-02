import 'package:freezed_annotation/freezed_annotation.dart';

import 'live_info.dart';

part 'live_response.g.dart';
part 'live_response.freezed.dart';

@freezed
class LiveResponse with _$LiveResponse {
  const factory LiveResponse({
    required int size,
    LivePage? page,
    required List<LiveInfo> data,
  }) = _LiveResponse;

  factory LiveResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveResponseFromJson(json);
}

@freezed
class LivePage with _$LivePage {
  const factory LivePage({LiveNext? next}) = _LivePage;

  factory LivePage.fromJson(Map<String, dynamic> json) =>
      _$LivePageFromJson(json);
}

@freezed
class LiveNext with _$LiveNext {
  const factory LiveNext({
    required int concurrentUserCount,
    required int liveId,
  }) = _LiveNext;

  factory LiveNext.fromJson(Map<String, dynamic> json) =>
      _$LiveNextFromJson(json);
}
