import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';
import 'live_playback_json.dart';

part 'live_detail.g.dart';
part 'live_detail.freezed.dart';

@freezed
class LiveDetail with _$LiveDetail {
  const factory LiveDetail({
    required int liveId,
    required String liveTitle,
    required String status,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    required int concurrentUserCount,
    required int accumulateCount,
    String? openDate,
    String? closeDate,
    required bool adult,
    required bool krOnlyViewing,
    required bool clipActive,
    List<String>? tags,
    required String chatChannelId,
    String? categoryType,
    String? liveCategory,
    String? liveCategoryValue,
    required bool chatActive,
    String? chatAvailableGroup,
    bool? paidProduct,
    required bool paidPromotion,
    String? chatAvailableCondition,
    int? minFollowerMinute,
    required bool allowSubscriberInFollowerMode,
    @LivePlaybackConverter() required LivePlaybackJson livePlaybackJson,
    List<String>? p2pQuality,
    required bool timeMachineActive,
    required bool timeMachinePlayback,
    required Channel channel,
    String? userAdultStatus,
    String? blindType,
    int? watchPartyNo,
    String? watchPartyTag,
  }) = _LiveDetail;

  factory LiveDetail.fromJson(Map<String, dynamic> json) =>
      _$LiveDetailFromJson(json);
}

