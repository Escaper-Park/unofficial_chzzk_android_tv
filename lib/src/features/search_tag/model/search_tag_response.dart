import 'package:freezed_annotation/freezed_annotation.dart';

import '../../live/model/live_info.dart';
import '../../vod/model/vod.dart';

part 'search_tag_response.g.dart';
part 'search_tag_response.freezed.dart';

/* LIVE */
@freezed
@JsonSerializable()
class SearchTagLiveResponse with _$SearchTagLiveResponse {
  final int size;
  final SearchTagLivePage? page;
  final List<LiveInfo> data;

  SearchTagLiveResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory SearchTagLiveResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLiveResponseFromJson(json);
}

@freezed
@JsonSerializable()
class SearchTagLivePage with _$SearchTagLivePage {
  final SearchTagLiveNext? next;

  SearchTagLivePage({required this.next});

  factory SearchTagLivePage.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLivePageFromJson(json);
}

@freezed
@JsonSerializable()
class SearchTagLiveNext with _$SearchTagLiveNext {
  final int concurrentUserCount;
  final int liveId;

  SearchTagLiveNext({
    required this.concurrentUserCount,
    required this.liveId,
  });

  factory SearchTagLiveNext.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLiveNextFromJson(json);
}

/* VOD */
@freezed
@JsonSerializable()
class SearchTagVodResponse with _$SearchTagVodResponse {
  final int size;
  final SearchTagVodPage? page;
  final List<Vod> data;

  SearchTagVodResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory SearchTagVodResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVodResponseFromJson(json);
}

@freezed
@JsonSerializable()
class SearchTagVodPage with _$SearchTagVodPage {
  final SearchTagVodNext? next;

  SearchTagVodPage({required this.next});

  factory SearchTagVodPage.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVodPageFromJson(json);
}

@freezed
@JsonSerializable()
class SearchTagVodNext with _$SearchTagVodNext {
  final int start;

  SearchTagVodNext({required this.start});

  factory SearchTagVodNext.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVodNextFromJson(json);
}
