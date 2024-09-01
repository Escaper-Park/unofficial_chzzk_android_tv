import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clip.freezed.dart';
part 'clip.g.dart';

@freezed
class NaverClip with _$NaverClip {
  const factory NaverClip({
    required String clipUID,
    required String? videoId,
    required String clipTitle,
    required String ownerChannelId,
    required String? thumbnailImageUrl,
    required String? categoryType,
    required String? clipCategory,
    required int duration,
    required bool adult,
    required String createdDate,
    required String recId,
    // required Object? blindType,
    required bool? privateUserBlock,
  }) = _NaverClip;

  factory NaverClip.fromJson(Map<String, dynamic> json) =>
      _$NaverClipFromJson(json);
}

@freezed
class ClipResponse with _$ClipResponse {
  const factory ClipResponse({
    required int? size,
    @JsonKey(name: 'page', fromJson: _clipPageFromJson) required ClipPage? next,
    required List<NaverClip> data,
  }) = _ClipResponse;

  factory ClipResponse.fromJson(Map<String, dynamic> json) =>
      _$ClipResponseFromJson(json);
}

@freezed
class ClipPage with _$ClipPage {
  const factory ClipPage({
    required String? clipUID,
    required int? readCount,
  }) = _ClipPage;

  factory ClipPage.fromJson(Map<String, dynamic> json) =>
      _$ClipPageFromJson(json);
}

ClipPage _clipPageFromJson(Map<String, dynamic> json) =>
    ClipPage.fromJson(json['next']);

@freezed
class PopularClipResponse with _$PopularClipResponse {
  const factory PopularClipResponse({
    required int size,
    @JsonKey(name: 'page', fromJson: _popularClipPageFromJson)
    required PopularClipPage? next,
    required List<NaverClip> data,
  }) = _PopularClipResponse;

  factory PopularClipResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularClipResponseFromJson(json);
}

@freezed
class PopularClipPage with _$PopularClipPage {
  const factory PopularClipPage({
    required String? next,
  }) = _PopularClipPage;

  factory PopularClipPage.fromJson(Map<String, dynamic> json) =>
      _$PopularClipPageFromJson(json);
}

PopularClipPage _popularClipPageFromJson(Map<String, dynamic> json) =>
    PopularClipPage.fromJson(json['next']);
