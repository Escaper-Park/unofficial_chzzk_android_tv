import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';

part 'vod.freezed.dart';
part 'vod.g.dart';

@freezed
class Vod with _$Vod {
  factory Vod({
    required int videoNo,
    required String? videoId,
    required String videoTitle,
    required String videoType,
    required String publishDate,
    required String? thumbnailImageUrl,
    required String? trailerUrl,
    required int duration,
    required int readCount,
    required int publishDateAt,
    required String? categoryType,
    required String? videoCategory,
    required String? videoCategoryValue,
    required bool exposure,
    required bool adult,
    required bool clipActive,
    required Channel channel,
    required Object? blindType,
    // accumulated live count
    required int? livePv,
    // Last seen timeline
    required int? watchTimeline,
    // Detailed
    required bool? paidPromotion,
    required String? inKey,
    required String? liveOpenDate,
    required String? vodStatus,
    required String? userAdultStatus,
  }) = _Vod;

  factory Vod.fromJson(Map<String, dynamic> json) => _$VodFromJson(json);
}

/* Channel VOD */
@freezed
class ChannelVodResponse with _$ChannelVodResponse {
  const factory ChannelVodResponse({
    required int page,
    required int size,
    required int totalCount,
    required int totalPages,
    required List<Vod> data,
  }) = _ChannelVodResponse;

  factory ChannelVodResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelVodResponseFromJson(json);
}

/* Following VOD */
@freezed
class FollowingVod with _$FollowingVod {
  const factory FollowingVod({
    required String type,
    @JsonKey(name: 'content') required Vod vod,
  }) = _FollowingVod;

  factory FollowingVod.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodFromJson(json);
}

@freezed
class FollowingVodResponse with _$FollowingVodResponse {
  const factory FollowingVodResponse({
    required int size,
    @JsonKey(name: 'page', fromJson: _followingVodPageFromJson)
    required int next,
    required List<FollowingVod> data,
  }) = _FollowingVodResponse;

  factory FollowingVodResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodResponseFromJson(json);
}

int _followingVodPageFromJson(Map<String, dynamic> json) =>
    json['next']['nextNo'] as int;

/* Popular VOD */
@freezed
class PopularVodResponse with _$PopularVodResponse {
  const factory PopularVodResponse({
    required List<Vod> videos,
  }) = _PopularVodResponse;

  factory PopularVodResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularVodResponseFromJson(json);
}

/* Category Vod */
@freezed
class CategoryVodResponse with _$CategoryVodResponse {
  const factory CategoryVodResponse({
    required int size,
    @JsonKey(name: 'page', fromJson: _categoryVodPageFromJson)
    required CategoryVodPage? next,
    required List<Vod> data,
  }) = _CategoryVodResponse;

  factory CategoryVodResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryVodResponseFromJson(json);
}

@freezed
class CategoryVodPage with _$CategoryVodPage {
  const factory CategoryVodPage({
    required int publishDateAt,
    required int readCount,
  }) = _CategoryVodPage;

  factory CategoryVodPage.fromJson(Map<String, dynamic> json) =>
      _$CategoryVodPageFromJson(json);
}

CategoryVodPage _categoryVodPageFromJson(Map<String, dynamic> json) =>
    CategoryVodPage.fromJson(json['next']);
