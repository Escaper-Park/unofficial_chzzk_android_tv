import 'package:freezed_annotation/freezed_annotation.dart';

import '../channel/channel.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class Video with _$Video {
  factory Video({
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
    required String? userAdultStatus,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
