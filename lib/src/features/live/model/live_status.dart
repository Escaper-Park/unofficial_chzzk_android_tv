import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_status.g.dart';
part 'live_status.freezed.dart';

@freezed
@JsonSerializable()
class LiveStatus with _$LiveStatus {
  final String liveTitle;
  final String status;
  final int concurrentUserCount;
  final int accumulateCount;
  final bool paidPromotion;
  final bool adult;
  final bool krOnlyViewing;
  final String? openDate;
  final String? closeDate;
  final bool clipActive;
  final String chatChannelId;
  final List<String>? tags;
  final String? categoryType;
  final String? liveCategory;
  final String? liveCategoryValue;
  final Object? faultStatus;
  final String? userAdultStatus;
  final bool abroadCountry;
  final String? blindType;
  final bool chatActive;
  final String? chatAvailableGroup;
  final String? chatAvailableCondition;
  final int? minFollowerMinute;
  final bool allowSubscriberInFollowerMode;
  final int chatSlowModeSec;
  final bool chatEmojiMode;
  final bool chatDonationRankingExposure;
  final int? watchPartyNo;
  final String? watchPartyTag;
  final bool timeMachineActive;
  final String channelId;

  LiveStatus({
    required this.liveTitle,
    required this.status,
    required this.concurrentUserCount,
    required this.accumulateCount,
    required this.paidPromotion,
    required this.adult,
    required this.krOnlyViewing,
    this.openDate,
    this.closeDate,
    required this.clipActive,
    required this.chatChannelId,
    this.tags,
    this.categoryType,
    this.liveCategory,
    this.liveCategoryValue,
    this.faultStatus,
    this.userAdultStatus,
    required this.abroadCountry,
    this.blindType,
    required this.chatActive,
    this.chatAvailableGroup,
    this.chatAvailableCondition,
    this.minFollowerMinute,
    required this.allowSubscriberInFollowerMode,
    required this.chatSlowModeSec,
    required this.chatEmojiMode,
    required this.chatDonationRankingExposure,
    this.watchPartyNo,
    this.watchPartyTag,
    required this.timeMachineActive,
    required this.channelId,
  });

  factory LiveStatus.fromJson(Map<String, dynamic> json) =>
      _$LiveStatusFromJson(json);
}
