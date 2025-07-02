import 'package:freezed_annotation/freezed_annotation.dart';

import 'clip.dart';

part 'clip_response.freezed.dart';
part 'clip_response.g.dart';

/* Popular clips */
@freezed
class PopularClipResponse with _$PopularClipResponse {
  const factory PopularClipResponse({
    required int size,
    PopularClipPage? page,
    required List<NaverClip> data,
  }) = _PopularClipResponse;

  factory PopularClipResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularClipResponseFromJson(json);
}

@freezed
class PopularClipPage with _$PopularClipPage {
  const factory PopularClipPage({PopularClipNext? next}) = _PopularClipPage;

  factory PopularClipPage.fromJson(Map<String, dynamic> json) =>
      _$PopularClipPageFromJson(json);
}

@freezed
class PopularClipNext with _$PopularClipNext {
  const factory PopularClipNext({String? next}) = _PopularClipNext;

  factory PopularClipNext.fromJson(Map<String, dynamic> json) =>
      _$PopularClipNextFromJson(json);
}

/* Category clips */

@freezed
class CategoryClipResponse with _$CategoryClipResponse {
  const factory CategoryClipResponse({
    required int size,
    CategoryClipPage? page,
    required List<NaverClip> data,
  }) = _CategoryClipResponse;

  factory CategoryClipResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryClipResponseFromJson(json);
}

@freezed
class CategoryClipPage with _$CategoryClipPage {
  const factory CategoryClipPage({CategoryClipNext? next}) =
      _CategoryClipPage;

  factory CategoryClipPage.fromJson(Map<String, dynamic> json) =>
      _$CategoryClipPageFromJson(json);
}

@freezed
class CategoryClipNext with _$CategoryClipNext {
  const factory CategoryClipNext({
    String? clipUID,
    int? readCount,
  }) = _CategoryClipNext;

  factory CategoryClipNext.fromJson(Map<String, dynamic> json) =>
      _$CategoryClipNextFromJson(json);
}

/* Channel Clips */
@freezed
class ChannelClipResponse with _$ChannelClipResponse {
  const factory ChannelClipResponse({
    required int size,
    ChannelClipPage? page,
    required List<NaverClip> data,
    bool? hasStreamerClips,
  }) = _ChannelClipResponse;

  factory ChannelClipResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelClipResponseFromJson(json);
}

@freezed
class ChannelClipPage with _$ChannelClipPage {
  const factory ChannelClipPage({ChannelClipNext? next}) = _ChannelClipPage;

  factory ChannelClipPage.fromJson(Map<String, dynamic> json) =>
      _$ChannelClipPageFromJson(json);
}

@freezed
class ChannelClipNext with _$ChannelClipNext {
  const factory ChannelClipNext({
    String? clipUID,
    int? readCount,
  }) = _ChannelClipNext;

  factory ChannelClipNext.fromJson(Map<String, dynamic> json) =>
      _$ChannelClipNextFromJson(json);
}
