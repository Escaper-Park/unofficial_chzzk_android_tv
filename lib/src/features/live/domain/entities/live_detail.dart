import 'package:freezed_annotation/freezed_annotation.dart';

import 'live_feed.dart';

part 'live_detail.freezed.dart';

@freezed
abstract class LiveDetail with _$LiveDetail {
  const factory LiveDetail({
    required int liveId,
    required String title,
    required String status,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    required int concurrentUserCount,
    String? openDate,
    required bool adult,
    @Default(<String>[]) List<String> tags,
    String? chatChannelId,
    String? categoryValue,
    String? categoryType,
    String? categoryId,
    String? livePlaybackJson,
    LiveChannel? channel,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    @Default(false) bool timeMachineActive,
    @Default(false) bool timeMachinePlayback,
    String? membershipBenefitType,
  }) = _LiveDetail;
}
