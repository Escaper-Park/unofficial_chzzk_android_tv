import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_feed.freezed.dart';

@freezed
abstract class VodPage with _$VodPage {
  const factory VodPage({
    @Default(<Vod>[]) List<Vod> items,
    VodCursor? cursor,
    @Default(0) int size,
  }) = _VodPage;
}

@freezed
abstract class FollowingVodPage with _$FollowingVodPage {
  const factory FollowingVodPage({
    @Default(<Vod>[]) List<Vod> items,
    FollowingVodCursor? cursor,
    @Default(0) int size,
  }) = _FollowingVodPage;
}

@freezed
abstract class VodCursor with _$VodCursor {
  const factory VodCursor({
    int? publishDateAt,
    int? readCount,
  }) = _VodCursor;
}

@freezed
abstract class FollowingVodCursor with _$FollowingVodCursor {
  const factory FollowingVodCursor({
    String? nextNo,
  }) = _FollowingVodCursor;
}

@freezed
abstract class Vod with _$Vod {
  const factory Vod({
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
    VodChannel? channel,
    String? blindType,
    int? watchTimeline,
    String? userAdultStatus,
    String? membershipBenefitType,
  }) = _Vod;
}

@freezed
abstract class VodChannel with _$VodChannel {
  const factory VodChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
  }) = _VodChannel;
}
