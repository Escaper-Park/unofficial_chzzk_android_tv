import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_feed.freezed.dart';

@freezed
abstract class LivePage with _$LivePage {
  const factory LivePage({
    @Default(<Live>[]) List<Live> items,
    LiveCursor? cursor,
    @Default(0) int size,
  }) = _LivePage;
}

@freezed
abstract class LiveCursor with _$LiveCursor {
  const factory LiveCursor({
    int? concurrentUserCount,
    int? liveId,
  }) = _LiveCursor;
}

@freezed
abstract class Live with _$Live {
  const factory Live({
    required int liveId,
    required String title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    required int concurrentUserCount,
    String? openDate,
    required bool adult,
    @Default(<String>[]) List<String> tags,
    String? categoryValue,
    LiveChannel? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? membershipBenefitType,
  }) = _Live;
}

@freezed
abstract class LiveChannel with _$LiveChannel {
  const factory LiveChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
  }) = _LiveChannel;
}
