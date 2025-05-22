import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';
import 'live_playback_json.dart';

part 'live_detail.g.dart';
part 'live_detail.freezed.dart';

@freezed
@JsonSerializable(createToJson: true, explicitToJson: true)
class LiveDetail with _$LiveDetail {
  final int liveId;
  final String liveTitle;
  final String status;
  final String? liveImageUrl;
  final String? defaultThumbnailImageUrl;
  final int concurrentUserCount;
  final int accumulateCount;
  final String? openDate;
  final String? closeDate;
  final bool adult;
  final bool krOnlyViewing;
  final bool clipActive;
  final List<String>? tags;
  final String chatChannelId;
  final String? categoryType;
  final String? liveCategory;
  final String? liveCategoryValue;
  final bool chatActive;
  final String? chatAvailableGroup;
  final bool? paidProduct;
  final bool paidPromotion;
  final String? chatAvailableCondition;
  final int? minFollowerMinute;
  final bool allowSubscriberInFollowerMode;
  @LivePlaybackConverter()
  final LivePlaybackJson livePlaybackJson;
  final List<String>? p2pQuality;
  final bool timeMachineActive;
  final bool timeMachinePlayback;
  final Channel channel;
  final String? userAdultStatus;
  final String? blindType;
  final int? watchPartyNo;
  final String? watchPartyTag;

  const LiveDetail({
    required this.liveId,
    required this.liveTitle,
    required this.status,
    this.liveImageUrl,
    this.defaultThumbnailImageUrl,
    required this.concurrentUserCount,
    required this.accumulateCount,
    this.openDate,
    this.closeDate,
    required this.adult,
    required this.krOnlyViewing,
    required this.clipActive,
    this.tags,
    required this.chatChannelId,
    this.categoryType,
    this.liveCategory,
    this.liveCategoryValue,
    required this.chatActive,
    this.chatAvailableGroup,
    this.paidProduct,
    required this.paidPromotion,
    this.chatAvailableCondition,
    this.minFollowerMinute,
    required this.allowSubscriberInFollowerMode,
    @LivePlaybackConverter() required this.livePlaybackJson,
    this.p2pQuality,
    required this.timeMachineActive,
    required this.timeMachinePlayback,
    required this.channel,
    this.userAdultStatus,
    this.blindType,
    this.watchPartyNo,
    this.watchPartyTag,
  });

  factory LiveDetail.fromJson(Map<String, dynamic> json) =>
      _$LiveDetailFromJson(json);

  Map<String, Object?> toJson() => _$LiveDetailToJson(this);
}
