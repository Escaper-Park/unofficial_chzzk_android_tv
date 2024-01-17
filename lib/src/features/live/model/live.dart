import 'package:json_annotation/json_annotation.dart';

import '../converter/live_json_converter.dart';

import './live_playback.dart';
import '../../channel/model/channel.dart';

part 'live.g.dart';

@JsonSerializable()
class Live {
  final String liveTitle;
  final String status;
  final int concurrentUserCount;
  final int accumulateCount;
  final bool paidPromotion;
  final bool adult;
  final String? chatChannelId;
  final String? categoryType;
  final String? liveCategory;
  final String? liveCategoryValue;
  @LivePollingStatusConverter()
  @JsonKey(name: 'livePollingStatusJson')
  final LivePollingStatus livePollingStatus;
  final String? userAdultStatus;

  Live(
    this.liveTitle,
    this.status,
    this.concurrentUserCount,
    this.accumulateCount,
    this.paidPromotion,
    this.adult,
    this.chatChannelId,
    this.categoryType,
    this.liveCategory,
    this.liveCategoryValue,
    this.livePollingStatus,
    this.userAdultStatus,
  );
}

@JsonSerializable()
class LiveStatus extends Live {
  final String? faultStatus;

  LiveStatus(
    super.liveTitle,
    super.status,
    super.concurrentUserCount,
    super.accumulateCount,
    super.paidPromotion,
    super.adult,
    super.chatChannelId,
    super.categoryType,
    super.liveCategory,
    super.liveCategoryValue,
    super.livePollingStatus,
    super.userAdultStatus,
    this.faultStatus,
  );

  factory LiveStatus.fromJson(Map<String, dynamic> json) =>
      _$LiveStatusFromJson(json);
}

@JsonSerializable()
class LiveDetail extends Live {
  final int liveId;
  final String? liveImageUrl;
  final String? defaultThumbnailImageUrl;
  final String openDate;
  final String? closeDate;
  final bool chatActive;
  final String chatAvailableGroup;
  final String chatAvailableCondition;
  final int minFollowerMinute;
  final ChannelWithPersonalData channel;
  @LivePlaybackConverter()
  @JsonKey(name: 'livePlaybackJson')
  final LivePlayback livePlayback;

  LiveDetail(
    super.liveTitle,
    super.status,
    super.concurrentUserCount,
    super.accumulateCount,
    super.paidPromotion,
    super.adult,
    super.chatChannelId,
    super.categoryType,
    super.liveCategory,
    super.liveCategoryValue,
    super.livePollingStatus,
    super.userAdultStatus,
    this.liveId,
    this.liveImageUrl,
    this.defaultThumbnailImageUrl,
    this.openDate,
    this.closeDate,
    this.chatActive,
    this.chatAvailableGroup,
    this.chatAvailableCondition,
    this.minFollowerMinute,
    this.channel,
    this.livePlayback,
  );

  factory LiveDetail.fromJson(Map<String, dynamic> json) =>
      _$LiveDetailFromJson(json);
}

@JsonSerializable()
class LivePollingStatus {
  final String status;
  final bool isPublishing;
  final String playableStatus;
  final int trafficThrottling;
  final int callPeriodMilliSecond;

  LivePollingStatus(
    this.status,
    this.isPublishing,
    this.playableStatus,
    this.trafficThrottling,
    this.callPeriodMilliSecond,
  );

  factory LivePollingStatus.fromJson(Map<String, dynamic> json) =>
      _$LivePollingStatusFromJson(json);
}
