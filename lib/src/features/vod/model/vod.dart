import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';
import 'live_rewind_playback_json.dart';

part 'vod.g.dart';
part 'vod.freezed.dart';

@freezed
@JsonSerializable(createToJson: true, explicitToJson: true)
class Vod with _$Vod {
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
  final bool? exposure;
  final bool adult;
  final bool? clipActive;
  final int? livePv; // accumulated live count
  final List<String>? tags;
  final Channel? channel;
  final String? blindType;
  final int? watchTimeline; // user last seen
  /* vod detail*/
  final bool? paidPromotion;
  final String? inKey;
  final String? liveOpenDate;
  final String? vodStatus;
  @LiveRewindPlaybackConverter()
  final LiveRewindPlaybackJson? liveRewindPlaybackJson;
  final String? userAdultStatus;
  final bool? videoChatEnabled;
  final String? videoChatChannelId;

  Vod({
    required this.videoNo,
    required this.videoId,
    required this.videoTitle,
    required this.videoType,
    required this.publishDate,
    this.thumbnailImageUrl,
    this.trailerUrl,
    required this.duration,
    required this.readCount,
    required this.publishDateAt,
    this.categoryType,
    this.videoCategory,
    this.videoCategoryValue,
    this.exposure,
    required this.adult,
    this.clipActive,
    this.livePv,
    this.tags,
    this.channel,
    this.blindType,
    this.watchTimeline,
    this.paidPromotion,
    this.inKey,
    this.liveOpenDate,
    this.vodStatus,
    this.liveRewindPlaybackJson,
    this.userAdultStatus,
    this.videoChatEnabled,
    this.videoChatChannelId,
  });

  factory Vod.fromJson(Map<String, dynamic> json) => _$VodFromJson(json);

  Map<String, Object?> toJson() => _$VodToJson(this);
}
