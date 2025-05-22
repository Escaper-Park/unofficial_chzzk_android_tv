import 'package:freezed_annotation/freezed_annotation.dart';

import 'live_info.dart';

part 'live_response.g.dart';
part 'live_response.freezed.dart';

@freezed
@JsonSerializable()
class LiveResponse with _$LiveResponse {
  final int size;
  final LivePage? page;
  final List<LiveInfo> data;

  LiveResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory LiveResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveResponseFromJson(json);
}

@freezed
@JsonSerializable()
class LivePage with _$LivePage {
  final LiveNext? next;

  LivePage({this.next});

  factory LivePage.fromJson(Map<String, dynamic> json) =>
      _$LivePageFromJson(json);
}

@freezed
@JsonSerializable()
class LiveNext with _$LiveNext {
  final int concurrentUserCount;
  final int liveId;

  LiveNext({
    required this.concurrentUserCount,
    required this.liveId,
  });

  factory LiveNext.fromJson(Map<String, dynamic> json) =>
      _$LiveNextFromJson(json);
}
