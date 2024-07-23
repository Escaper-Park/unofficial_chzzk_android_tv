import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';
import './live_playback_json.dart';

part 'live.freezed.dart';
part 'live.g.dart';

@freezed
class LiveInfo with _$LiveInfo {
  const factory LiveInfo({
    // Following
    required int? liveId,
    required String? liveImageUrl,
    required String? defaultThumbnailImageUrl,
    required String? liveTitle,
    required int concurrentUserCount,
    required String? categoryType,
    required String? liveCategory,
    required String? liveCategoryValue,
    required bool? adult,
    required List<String>? tags,
    // Only in popular lives
    required String? openDate,
    required int? accumulateCount,
    required Object? blindType,
    // LiveResponse
    required Channel? channel,
  }) = _LiveInfo;

  factory LiveInfo.fromJson(Map<String, dynamic> json) =>
      _$LiveInfoFromJson(json);
}

@freezed
class LiveDetail with _$LiveDetail {
  const factory LiveDetail({
    // LiveInfo
    required int liveId,
    required String? liveTitle,
    required String? liveImageUrl,
    required String? defaultThumbnailImageUrl,
    required int concurrentUserCount,
    required int accumulateCount,
    required String? openDate,
    required bool adult,
    required List<String> tags,
    required String? categoryType,
    required String? liveCategory,
    required String? liveCategoryValue,
    required Object? blindType,
    // LiveDetail only
    required String status,
    required String? closeDate,
    required bool clipActive,
    required String chatChannelId,
    required bool chatActive,
    required String? chatAvailableGroup,
    required bool paidPromotion,
    required String? chatAvailableCondition,
    required int minFollowerMinute,
    required List<String> p2pQuality,
    required Channel channel,
    // required LivePollingStatusJson livePollingStatusJson,
    required String? userAdultStatus,
    required bool chatDonationRankingExposure,
    // required AdParameter adParameter,
    @LivePlaybackConverter() required LivePlaybackJson livePlaybackJson,
  }) = _LiveDetail;

  factory LiveDetail.fromJson(Map<String, dynamic> json) =>
      _$LiveDetailFromJson(json);
}

@freezed
class LiveResponse with _$LiveResponse {
  const factory LiveResponse({
    required int size,
    @JsonKey(name: 'page', fromJson: _livePageFromJson) required LivePage? next,
    required List<LiveInfo> data,
  }) = _LiveResponse;

  factory LiveResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveResponseFromJson(json);
}

@freezed
class LivePage with _$LivePage {
  const factory LivePage({
    required int concurrentUserCount,
    required int liveId,
  }) = _LivePage;

  factory LivePage.fromJson(Map<String, dynamic> json) =>
      _$LivePageFromJson(json);
}

LivePage _livePageFromJson(Map<String, dynamic> json) =>
    LivePage.fromJson(json['next']);

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
    required bool clipActive,
    required String chatChannelId,
    required List<String>? tags,
    required String? categoryType,
    required String? liveCategory,
    required String? liveCategoryValue,
    // required LivePollingStatusJson? livePollingStatusJson,
    required String? userAdultStatus,
    required Object? faultStatus,
    required Object? blindType,
    required bool chatActive,
    required String? chatAvailableGroup,
    required String? chatAvailableCondition,
    required int? minFollowerMinute,
    required bool chatDonationRankingExposure,
  }) = _LiveStatus;

  factory LiveStatus.fromJson(Map<String, dynamic> json) =>
      _$LiveStatusFromJson(json);
}

// @freezed
// class LivePollingStatusJson with _$LivePollingStatusJson {
//   const factory LivePollingStatusJson({
//     required String status,
//     required bool isPublishing,
//     required String playableStatus,
//     required int trafficThrottling,
//     required int callPeriodMilliSecond,
//   }) = _LivePollingStatusJson;

//   factory LivePollingStatusJson.fromJson(Map<String, dynamic> json) =>
//       _$LivePollingStatusJsonFromJson(json);
// }

// @freezed
// class AdParameter with _$AdParameter {
//   const factory AdParameter({
//     required String? tag,
//   }) = _AdParameter;

//   factory AdParameter.fromJson(Map<String, dynamic> json) =>
//       _$AdParameterFromJson(json);
// }
