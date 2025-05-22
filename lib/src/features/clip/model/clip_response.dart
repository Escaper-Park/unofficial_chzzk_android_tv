import 'package:freezed_annotation/freezed_annotation.dart';

import 'clip.dart';

part 'clip_response.freezed.dart';
part 'clip_response.g.dart';

/* Popular clips */
@freezed
@JsonSerializable()
class PopularClipResponse with _$PopularClipResponse {
  final int size;
  final PopularClipPage? page;
  final List<NaverClip> data;

  PopularClipResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory PopularClipResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularClipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularClipResponseToJson(this);
}

@freezed
@JsonSerializable()
class PopularClipPage with _$PopularClipPage {
  final PopularClipNext? next;

  PopularClipPage({this.next});

  factory PopularClipPage.fromJson(Map<String, dynamic> json) =>
      _$PopularClipPageFromJson(json);

  Map<String, dynamic> toJson() => _$PopularClipPageToJson(this);
}

@freezed
@JsonSerializable()
class PopularClipNext with _$PopularClipNext {
  final String? next;

  PopularClipNext({this.next});

  factory PopularClipNext.fromJson(Map<String, dynamic> json) =>
      _$PopularClipNextFromJson(json);

  Map<String, dynamic> toJson() => _$PopularClipNextToJson(this);
}

/* Category clips */

@freezed
@JsonSerializable()
class CategoryClipResponse with _$CategoryClipResponse {
  final int size;
  final CategoryClipPage? page;
  final List<NaverClip> data;

  CategoryClipResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory CategoryClipResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryClipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryClipResponseToJson(this);
}

@freezed
@JsonSerializable()
class CategoryClipPage with _$CategoryClipPage {
  final CategoryClipNext? next;

  CategoryClipPage({this.next});

  factory CategoryClipPage.fromJson(Map<String, dynamic> json) =>
      _$CategoryClipPageFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryClipPageToJson(this);
}

@freezed
@JsonSerializable()
class CategoryClipNext with _$CategoryClipNext {
  final String? clipUID;
  final int? readCount;

  CategoryClipNext({
    this.clipUID,
    this.readCount,
  });

  factory CategoryClipNext.fromJson(Map<String, dynamic> json) =>
      _$CategoryClipNextFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryClipNextToJson(this);
}

/* Channel Clips */
@freezed
@JsonSerializable()
class ChannelClipResponse with _$ChannelClipResponse {
  final int size;
  final ChannelClipPage? page;
  final List<NaverClip> data;
  final bool? hasStreamerClips;

  ChannelClipResponse( {
    required this.size,
    this.page,
    required this.data,
    this.hasStreamerClips,
  });

  factory ChannelClipResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelClipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelClipResponseToJson(this);
}

@freezed
@JsonSerializable()
class ChannelClipPage with _$ChannelClipPage {
  final ChannelClipNext? next;

  ChannelClipPage({this.next});

  factory ChannelClipPage.fromJson(Map<String, dynamic> json) =>
      _$ChannelClipPageFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelClipPageToJson(this);
}

@freezed
@JsonSerializable()
class ChannelClipNext with _$ChannelClipNext {
  final String? clipUID;
  final int? readCount;

  ChannelClipNext({
    this.clipUID,
    this.readCount,
  });

  factory ChannelClipNext.fromJson(Map<String, dynamic> json) =>
      _$ChannelClipNextFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelClipNextToJson(this);
}
