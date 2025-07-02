import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_status.g.dart';
part 'live_status.freezed.dart';

@freezed
class LiveStatus with _$LiveStatus {
  const factory LiveStatus({
    required String liveTitle,
    required String status,
    required int concurrentUserCount,
    required int accumulateCount,
    required bool paidPromotion,
    required bool adult,
    required bool krOnlyViewing,
    String? openDate,
    String? closeDate,
    required bool clipActive,
    required String chatChannelId,
    List<String>? tags,
    String? categoryType,
    String? liveCategory,
    String? liveCategoryValue,
    Object? faultStatus,
    String? userAdultStatus,
    required bool abroadCountry,
    String? blindType,
    required bool chatActive,
    String? chatAvailableGroup,
    String? chatAvailableCondition,
    int? minFollowerMinute,
    required bool allowSubscriberInFollowerMode,
    required int chatSlowModeSec,
    required bool chatEmojiMode,
    required bool chatDonationRankingExposure,
    int? watchPartyNo,
    String? watchPartyTag,
    required bool timeMachineActive,
    required String channelId,
  }) = _LiveStatus;

  factory LiveStatus.fromJson(Map<String, dynamic> json) =>
      _$LiveStatusFromJson(json);
}

