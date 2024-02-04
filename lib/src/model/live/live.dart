import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../channel/channel.dart';

part 'live.freezed.dart';
part 'live.g.dart';

@freezed
class LiveDetail with _$LiveDetail {
  factory LiveDetail({
    required int liveId,
    required String liveTitle,
    required String? status,
    required String? liveImageUrl,
    required String? defaultThumbnailImageUrl,
    required int concurrentUserCount,
    required String? openDate,
    required bool adult,
    required String? chatChannelId,
    required String? liveCategoryValue,
    @LivePlaybackConverter()
    @JsonKey(name: 'livePlaybackJson')
    required String? livePath,
    required String? userAdultStatus,
    required Channel channel,
  }) = _LiveDetail;

  factory LiveDetail.fromJson(Map<String, dynamic> json) =>
      _$LiveDetailFromJson(json);
}

class LivePlaybackConverter implements JsonConverter<String, String> {
  const LivePlaybackConverter();

  @override
  String fromJson(String jsonString) {
    final json = jsonDecode(jsonString);

    final List<dynamic> mediaList = json['media'];

    final hls = mediaList.firstWhere((media) => media['mediaId'] == 'HLS');

    return hls['path'];
  }

  @override
  String toJson(String object) => throw UnimplementedError();
}
