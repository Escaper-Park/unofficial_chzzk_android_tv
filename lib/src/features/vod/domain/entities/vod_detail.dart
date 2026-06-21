import 'package:freezed_annotation/freezed_annotation.dart';

import 'vod_feed.dart';

part 'vod_detail.freezed.dart';

@freezed
abstract class VodDetail with _$VodDetail {
  const factory VodDetail({
    required int videoNo,
    String? videoId,
    required String title,
    required String videoType,
    required String publishDate,
    String? thumbnailImageUrl,
    required int duration,
    required int readCount,
    required int publishDateAt,
    String? categoryValue,
    required bool adult,
    required int livePv,
    @Default(<String>[]) List<String> tags,
    required bool chapterActive,
    @Default(<VodChapter>[]) List<VodChapter> chapters,
    VodChannel? channel,
    String? blindType,
    int? watchTimeline,
    String? inKey,
    String? liveOpenDate,
    String? liveRewindPlaybackJson,
    String? userAdultStatus,
    required bool videoChatEnabled,
    String? videoChatChannelId,
    String? membershipBenefitType,
  }) = _VodDetail;
}

@freezed
abstract class VodChapter with _$VodChapter {
  const factory VodChapter({
    required String title,
    required int startTime,
    required int endTime,
    String? thumbnailUrl,
  }) = _VodChapter;
}
