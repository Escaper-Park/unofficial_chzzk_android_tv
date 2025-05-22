import 'package:freezed_annotation/freezed_annotation.dart';

import 'vod.dart';

part 'vod_response.g.dart';
part 'vod_response.freezed.dart';

/* VOD Response */
@freezed
@JsonSerializable()
class VodResponse with _$VodResponse {
  final int size;
  final VodPage? page;
  final List<Vod> data;

  VodResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory VodResponse.fromJson(Map<String, dynamic> json) =>
      _$VodResponseFromJson(json);
}

@freezed
@JsonSerializable()
class VodPage with _$VodPage {
  final VodNext? next;

  VodPage({this.next});

  factory VodPage.fromJson(Map<String, dynamic> json) =>
      _$VodPageFromJson(json);
}

@freezed
@JsonSerializable()
class VodNext with _$VodNext {
  final int? publishDateAt;
  final int? readCount;

  VodNext({
    this.publishDateAt,
    this.readCount,
  });

  factory VodNext.fromJson(Map<String, dynamic> json) =>
      _$VodNextFromJson(json);
}

/* Channel VOD */
@freezed
@JsonSerializable()
class ChannelVodResponse with _$ChannelVodResponse {
  final int page;
  final int size;
  final int totalCount;
  final int totalPages;
  final List<Vod> data;

  ChannelVodResponse({
    required this.page,
    required this.size,
    required this.totalCount,
    required this.totalPages,
    required this.data,
  });

  factory ChannelVodResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelVodResponseFromJson(json);
}

/* Following VOD */
@freezed
@JsonSerializable()
class FollowingVodResponse with _$FollowingVodResponse {
  final int size;
  final FollowingVodPage? page;
  final List<Vod> data;

  FollowingVodResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory FollowingVodResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodResponseFromJson(json);
}

@freezed
@JsonSerializable()
class FollowingVodPage with _$FollowingVodPage {
  final FollowingVodNext? next;

  FollowingVodPage({this.next});

  factory FollowingVodPage.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodPageFromJson(json);
}

@freezed
@JsonSerializable()
class FollowingVodNext with _$FollowingVodNext {
  final String? nextNo;

  FollowingVodNext({this.nextNo});

  factory FollowingVodNext.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodNextFromJson(json);
}

/* Category VOD */
@freezed
@JsonSerializable()
class CategoryVodResponse with _$CategoryVodResponse {
  final int size;
  final CategoryVodPage? page;
  final List<Vod> data;

  CategoryVodResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory CategoryVodResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryVodResponseFromJson(json);
}

@freezed
@JsonSerializable()
class CategoryVodPage with _$CategoryVodPage {
  final CategoryVodNext? next;

  CategoryVodPage({this.next});

  factory CategoryVodPage.fromJson(Map<String, dynamic> json) =>
      _$CategoryVodPageFromJson(json);
}

@freezed
@JsonSerializable()
class CategoryVodNext with _$CategoryVodNext {
  final int? publishDateAt;
  final int? readCount;

  CategoryVodNext({
    this.publishDateAt,
    this.readCount,
  });

  factory CategoryVodNext.fromJson(Map<String, dynamic> json) =>
      _$CategoryVodNextFromJson(json);
}
