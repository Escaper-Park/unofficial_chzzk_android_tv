import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';

part 'vod.freezed.dart';
part 'vod.g.dart';

@freezed
class Vod with _$Vod {
  const factory Vod({
    required int videoNo,
    required String? videoId,
    required String videoTitle,
    required String? videoType,
    required String publishDate,
    required String? thumbnailImageUrl,
    required String? trailerUrl,
    required int duration,
    required int publishDateAt,
    required String? videoCategoryValue,
    required bool adult,
    required Channel channel,
    required String? inKey,
    required String? liveOpenDate,
    required int? readCount,
  }) = _Vod;

  factory Vod.fromJson(Map<String, dynamic> json) => _$VodFromJson(json);
}

@freezed
class VodPage with _$VodPage {
  factory VodPage({
    required int? publishDateAt,
    required int? readCount,
  }) = _VodPage;

  factory VodPage.fromJson(Map<String, dynamic> json) =>
      _$VodPageFromJson(json);
}

@freezed
class VodResponse with _$VodResponse {
  factory VodResponse({
    required List<Vod>? vods,
    required VodPage? page,
  }) = _VodResponse;
}
