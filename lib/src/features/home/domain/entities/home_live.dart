import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_live.freezed.dart';

@freezed
abstract class HomeLive with _$HomeLive {
  const factory HomeLive({
    required int liveId,
    required String title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    required int concurrentUserCount,
    required bool adult,
    @Default(<String>[]) List<String> tags,
    String? openDate,
    String? categoryValue,
    HomeChannel? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? membershipBenefitType,
  }) = _HomeLive;
}

@freezed
abstract class HomeChannel with _$HomeChannel {
  const factory HomeChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
  }) = _HomeChannel;
}
