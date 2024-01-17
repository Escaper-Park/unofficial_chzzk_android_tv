import 'package:json_annotation/json_annotation.dart';

import '../../channel/model/channel.dart';

part 'video.g.dart';

@JsonSerializable()
class BaseVideo {
  final int videoNo;
  final String? videoId;
  final String videoTitle;
  final String videoType;
  final String publishDate;
  final String? thumbnailImageUrl;
  final String? trailerUrl;
  final int duration;
  final int readCount;
  final int publishDateAt;
  final String? categoryType;
  final String? videoCategory;
  final String? videoCategoryValue;
  final bool exposure;
  final bool adult;
  final ChannelWithPersonalData channel;

  BaseVideo(
    this.videoNo,
    this.videoId,
    this.videoTitle,
    this.videoType,
    this.publishDate,
    this.thumbnailImageUrl,
    this.trailerUrl,
    this.duration,
    this.readCount,
    this.publishDateAt,
    this.categoryType,
    this.videoCategory,
    this.videoCategoryValue,
    this.exposure,
    this.adult,
    this.channel,
  );

  factory BaseVideo.fromJson(Map<String, dynamic> json) =>
      _$BaseVideoFromJson(json);
}

@JsonSerializable()
class Video extends BaseVideo {
  final bool paidPromotion;
  final String? inKey;
  final String? liveOpenDate;
  final String? vodStatus;
  final BaseVideo? prevVideo;
  final BaseVideo? nextVideo;
  final String? userAdultStatus;

  Video(
    super.videoNo,
    super.videoId,
    super.videoTitle,
    super.videoType,
    super.publishDate,
    super.thumbnailImageUrl,
    super.trailerUrl,
    super.duration,
    super.readCount,
    super.publishDateAt,
    super.categoryType,
    super.videoCategory,
    super.videoCategoryValue,
    super.exposure,
    super.adult,
    super.channel,
    this.paidPromotion,
    this.inKey,
    this.liveOpenDate,
    this.vodStatus,
    this.prevVideo,
    this.nextVideo,
    this.userAdultStatus,
  );

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
