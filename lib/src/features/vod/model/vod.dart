import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';
import 'live_rewind_playback_json.dart';

part 'vod.g.dart';
part 'vod.freezed.dart';

@freezed
class Vod with _$Vod {
  const factory Vod({
    required int videoNo,
    String? videoId,
    required String videoTitle,
    required String videoType,
    required String publishDate,
    String? thumbnailImageUrl,
    String? trailerUrl,
    required int duration,
    required int readCount,
    required int publishDateAt,
    String? categoryType,
    String? videoCategory,
    String? videoCategoryValue,
    bool? exposure,
    required bool adult,
    bool? clipActive,
    int? livePv, // accumulated live count
    List<String>? tags,
    Channel? channel,
    String? blindType,
    int? watchTimeline, // user last seen
    /* vod detail*/
    bool? paidPromotion,
    String? inKey,
    String? liveOpenDate,
    String? vodStatus,
    @LiveRewindPlaybackConverter() LiveRewindPlaybackJson? liveRewindPlaybackJson,
    String? userAdultStatus,
    bool? videoChatEnabled,
    String? videoChatChannelId,
  }) = _Vod;

  factory Vod.fromJson(Map<String, dynamic> json) => _$VodFromJson(json);
}