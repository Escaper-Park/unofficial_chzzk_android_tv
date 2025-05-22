// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveDetail {
  int get liveId;
  String get liveTitle;
  String get status;
  String? get liveImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  int get accumulateCount;
  String? get openDate;
  String? get closeDate;
  bool get adult;
  bool get krOnlyViewing;
  bool get clipActive;
  List<String>? get tags;
  String get chatChannelId;
  String? get categoryType;
  String? get liveCategory;
  String? get liveCategoryValue;
  bool get chatActive;
  String? get chatAvailableGroup;
  bool? get paidProduct;
  bool get paidPromotion;
  String? get chatAvailableCondition;
  int? get minFollowerMinute;
  bool get allowSubscriberInFollowerMode;
  LivePlaybackJson get livePlaybackJson;
  List<String>? get p2pQuality;
  bool get timeMachineActive;
  bool get timeMachinePlayback;
  Channel get channel;
  String? get userAdultStatus;
  String? get blindType;
  int? get watchPartyNo;
  String? get watchPartyTag;

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveDetailCopyWith<LiveDetail> get copyWith =>
      _$LiveDetailCopyWithImpl<LiveDetail>(this as LiveDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveDetail &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.liveImageUrl, liveImageUrl) ||
                other.liveImageUrl == liveImageUrl) &&
            (identical(other.defaultThumbnailImageUrl, defaultThumbnailImageUrl) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.accumulateCount, accumulateCount) ||
                other.accumulateCount == accumulateCount) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.closeDate, closeDate) ||
                other.closeDate == closeDate) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.krOnlyViewing, krOnlyViewing) ||
                other.krOnlyViewing == krOnlyViewing) &&
            (identical(other.clipActive, clipActive) ||
                other.clipActive == clipActive) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.chatActive, chatActive) ||
                other.chatActive == chatActive) &&
            (identical(other.chatAvailableGroup, chatAvailableGroup) ||
                other.chatAvailableGroup == chatAvailableGroup) &&
            (identical(other.paidProduct, paidProduct) ||
                other.paidProduct == paidProduct) &&
            (identical(other.paidPromotion, paidPromotion) ||
                other.paidPromotion == paidPromotion) &&
            (identical(other.chatAvailableCondition, chatAvailableCondition) ||
                other.chatAvailableCondition == chatAvailableCondition) &&
            (identical(other.minFollowerMinute, minFollowerMinute) ||
                other.minFollowerMinute == minFollowerMinute) &&
            (identical(other.allowSubscriberInFollowerMode,
                    allowSubscriberInFollowerMode) ||
                other.allowSubscriberInFollowerMode ==
                    allowSubscriberInFollowerMode) &&
            (identical(other.livePlaybackJson, livePlaybackJson) ||
                other.livePlaybackJson == livePlaybackJson) &&
            const DeepCollectionEquality()
                .equals(other.p2pQuality, p2pQuality) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.timeMachinePlayback, timeMachinePlayback) ||
                other.timeMachinePlayback == timeMachinePlayback) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyNo, watchPartyNo) ||
                other.watchPartyNo == watchPartyNo) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        liveId,
        liveTitle,
        status,
        liveImageUrl,
        defaultThumbnailImageUrl,
        concurrentUserCount,
        accumulateCount,
        openDate,
        closeDate,
        adult,
        krOnlyViewing,
        clipActive,
        const DeepCollectionEquality().hash(tags),
        chatChannelId,
        categoryType,
        liveCategory,
        liveCategoryValue,
        chatActive,
        chatAvailableGroup,
        paidProduct,
        paidPromotion,
        chatAvailableCondition,
        minFollowerMinute,
        allowSubscriberInFollowerMode,
        livePlaybackJson,
        const DeepCollectionEquality().hash(p2pQuality),
        timeMachineActive,
        timeMachinePlayback,
        channel,
        userAdultStatus,
        blindType,
        watchPartyNo,
        watchPartyTag
      ]);

  @override
  String toString() {
    return 'LiveDetail(liveId: $liveId, liveTitle: $liveTitle, status: $status, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, accumulateCount: $accumulateCount, openDate: $openDate, closeDate: $closeDate, adult: $adult, krOnlyViewing: $krOnlyViewing, clipActive: $clipActive, tags: $tags, chatChannelId: $chatChannelId, categoryType: $categoryType, liveCategory: $liveCategory, liveCategoryValue: $liveCategoryValue, chatActive: $chatActive, chatAvailableGroup: $chatAvailableGroup, paidProduct: $paidProduct, paidPromotion: $paidPromotion, chatAvailableCondition: $chatAvailableCondition, minFollowerMinute: $minFollowerMinute, allowSubscriberInFollowerMode: $allowSubscriberInFollowerMode, livePlaybackJson: $livePlaybackJson, p2pQuality: $p2pQuality, timeMachineActive: $timeMachineActive, timeMachinePlayback: $timeMachinePlayback, channel: $channel, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyNo: $watchPartyNo, watchPartyTag: $watchPartyTag)';
  }
}

/// @nodoc
abstract mixin class $LiveDetailCopyWith<$Res> {
  factory $LiveDetailCopyWith(
          LiveDetail value, $Res Function(LiveDetail) _then) =
      _$LiveDetailCopyWithImpl;
  @useResult
  $Res call(
      {int liveId,
      String liveTitle,
      String status,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      int accumulateCount,
      String? openDate,
      String? closeDate,
      bool adult,
      bool krOnlyViewing,
      bool clipActive,
      List<String>? tags,
      String chatChannelId,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      bool chatActive,
      String? chatAvailableGroup,
      bool? paidProduct,
      bool paidPromotion,
      String? chatAvailableCondition,
      int? minFollowerMinute,
      bool allowSubscriberInFollowerMode,
      @LivePlaybackConverter() LivePlaybackJson livePlaybackJson,
      List<String>? p2pQuality,
      bool timeMachineActive,
      bool timeMachinePlayback,
      Channel channel,
      String? userAdultStatus,
      String? blindType,
      int? watchPartyNo,
      String? watchPartyTag});
}

/// @nodoc
class _$LiveDetailCopyWithImpl<$Res> implements $LiveDetailCopyWith<$Res> {
  _$LiveDetailCopyWithImpl(this._self, this._then);

  final LiveDetail _self;
  final $Res Function(LiveDetail) _then;

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = null,
    Object? liveTitle = null,
    Object? status = null,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? accumulateCount = null,
    Object? openDate = freezed,
    Object? closeDate = freezed,
    Object? adult = null,
    Object? krOnlyViewing = null,
    Object? clipActive = null,
    Object? tags = freezed,
    Object? chatChannelId = null,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? chatActive = null,
    Object? chatAvailableGroup = freezed,
    Object? paidProduct = freezed,
    Object? paidPromotion = null,
    Object? chatAvailableCondition = freezed,
    Object? minFollowerMinute = freezed,
    Object? allowSubscriberInFollowerMode = null,
    Object? livePlaybackJson = null,
    Object? p2pQuality = freezed,
    Object? timeMachineActive = null,
    Object? timeMachinePlayback = null,
    Object? channel = null,
    Object? userAdultStatus = freezed,
    Object? blindType = freezed,
    Object? watchPartyNo = freezed,
    Object? watchPartyTag = freezed,
  }) {
    return _then(LiveDetail(
      liveId: null == liveId
          ? _self.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
      liveTitle: null == liveTitle
          ? _self.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      liveImageUrl: freezed == liveImageUrl
          ? _self.liveImageUrl
          : liveImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
          ? _self.defaultThumbnailImageUrl
          : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      concurrentUserCount: null == concurrentUserCount
          ? _self.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      accumulateCount: null == accumulateCount
          ? _self.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int,
      openDate: freezed == openDate
          ? _self.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      closeDate: freezed == closeDate
          ? _self.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: null == adult
          ? _self.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      krOnlyViewing: null == krOnlyViewing
          ? _self.krOnlyViewing
          : krOnlyViewing // ignore: cast_nullable_to_non_nullable
              as bool,
      clipActive: null == clipActive
          ? _self.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      chatChannelId: null == chatChannelId
          ? _self.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: freezed == categoryType
          ? _self.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategory: freezed == liveCategory
          ? _self.liveCategory
          : liveCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategoryValue: freezed == liveCategoryValue
          ? _self.liveCategoryValue
          : liveCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      chatActive: null == chatActive
          ? _self.chatActive
          : chatActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableGroup: freezed == chatAvailableGroup
          ? _self.chatAvailableGroup
          : chatAvailableGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      paidProduct: freezed == paidProduct
          ? _self.paidProduct
          : paidProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidPromotion: null == paidPromotion
          ? _self.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableCondition: freezed == chatAvailableCondition
          ? _self.chatAvailableCondition
          : chatAvailableCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      minFollowerMinute: freezed == minFollowerMinute
          ? _self.minFollowerMinute
          : minFollowerMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      allowSubscriberInFollowerMode: null == allowSubscriberInFollowerMode
          ? _self.allowSubscriberInFollowerMode
          : allowSubscriberInFollowerMode // ignore: cast_nullable_to_non_nullable
              as bool,
      livePlaybackJson: null == livePlaybackJson
          ? _self.livePlaybackJson
          : livePlaybackJson // ignore: cast_nullable_to_non_nullable
              as LivePlaybackJson,
      p2pQuality: freezed == p2pQuality
          ? _self.p2pQuality
          : p2pQuality // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      timeMachineActive: null == timeMachineActive
          ? _self.timeMachineActive
          : timeMachineActive // ignore: cast_nullable_to_non_nullable
              as bool,
      timeMachinePlayback: null == timeMachinePlayback
          ? _self.timeMachinePlayback
          : timeMachinePlayback // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: null == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      userAdultStatus: freezed == userAdultStatus
          ? _self.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      blindType: freezed == blindType
          ? _self.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      watchPartyNo: freezed == watchPartyNo
          ? _self.watchPartyNo
          : watchPartyNo // ignore: cast_nullable_to_non_nullable
              as int?,
      watchPartyTag: freezed == watchPartyTag
          ? _self.watchPartyTag
          : watchPartyTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
