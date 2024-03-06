import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';

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
    // Chat
    required String? chatChannelId,
    // Category
    required String? categoryType,
    required String? liveCategory,
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

    final hls = mediaList.firstWhere((media) => media['mediaId'] == 'LLHLS');

    return hls['path'];
  }

  @override
  String toJson(String object) => throw UnimplementedError();
}

@freezed
class LivePage with _$LivePage {
  const factory LivePage({
    required int concurrentUserCount,
    required int liveId,
  }) = _LivePage;

  factory LivePage.fromJson(Map<String, dynamic> json) =>
      _$LivePageFromJson(json);
}

@freezed
class LiveResponse with _$LiveResponse {
  const factory LiveResponse({
    required List<LiveDetail>? liveDetails,
    required LivePage? page,
  }) = _LiveResponse;
}
