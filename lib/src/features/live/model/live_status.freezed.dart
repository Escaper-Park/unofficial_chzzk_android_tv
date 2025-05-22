// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveStatus {
  String get liveTitle;
  String get status;
  int get concurrentUserCount;
  int get accumulateCount;
  bool get paidPromotion;
  bool get adult;
  bool get krOnlyViewing;
  String? get openDate;
  String? get closeDate;
  bool get clipActive;
  String get chatChannelId;
  List<String>? get tags;
  String? get categoryType;
  String? get liveCategory;
  String? get liveCategoryValue;
  Object? get faultStatus;
  String? get userAdultStatus;
  bool get abroadCountry;
  String? get blindType;
  bool get chatActive;
  String? get chatAvailableGroup;
  String? get chatAvailableCondition;
  int? get minFollowerMinute;
  bool get allowSubscriberInFollowerMode;
  int get chatSlowModeSec;
  bool get chatEmojiMode;
  bool get chatDonationRankingExposure;
  int? get watchPartyNo;
  String? get watchPartyTag;
  bool get timeMachineActive;
  String get channelId;

  /// Create a copy of LiveStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveStatusCopyWith<LiveStatus> get copyWith =>
      _$LiveStatusCopyWithImpl<LiveStatus>(this as LiveStatus, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveStatus &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.accumulateCount, accumulateCount) ||
                other.accumulateCount == accumulateCount) &&
            (identical(other.paidPromotion, paidPromotion) ||
                other.paidPromotion == paidPromotion) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.krOnlyViewing, krOnlyViewing) ||
                other.krOnlyViewing == krOnlyViewing) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.closeDate, closeDate) ||
                other.closeDate == closeDate) &&
            (identical(other.clipActive, clipActive) ||
                other.clipActive == clipActive) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            const DeepCollectionEquality()
                .equals(other.faultStatus, faultStatus) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.abroadCountry, abroadCountry) ||
                other.abroadCountry == abroadCountry) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.chatActive, chatActive) ||
                other.chatActive == chatActive) &&
            (identical(other.chatAvailableGroup, chatAvailableGroup) ||
                other.chatAvailableGroup == chatAvailableGroup) &&
            (identical(other.chatAvailableCondition, chatAvailableCondition) ||
                other.chatAvailableCondition == chatAvailableCondition) &&
            (identical(other.minFollowerMinute, minFollowerMinute) ||
                other.minFollowerMinute == minFollowerMinute) &&
            (identical(other.allowSubscriberInFollowerMode,
                    allowSubscriberInFollowerMode) ||
                other.allowSubscriberInFollowerMode ==
                    allowSubscriberInFollowerMode) &&
            (identical(other.chatSlowModeSec, chatSlowModeSec) ||
                other.chatSlowModeSec == chatSlowModeSec) &&
            (identical(other.chatEmojiMode, chatEmojiMode) ||
                other.chatEmojiMode == chatEmojiMode) &&
            (identical(other.chatDonationRankingExposure,
                    chatDonationRankingExposure) ||
                other.chatDonationRankingExposure ==
                    chatDonationRankingExposure) &&
            (identical(other.watchPartyNo, watchPartyNo) ||
                other.watchPartyNo == watchPartyNo) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        liveTitle,
        status,
        concurrentUserCount,
        accumulateCount,
        paidPromotion,
        adult,
        krOnlyViewing,
        openDate,
        closeDate,
        clipActive,
        chatChannelId,
        const DeepCollectionEquality().hash(tags),
        categoryType,
        liveCategory,
        liveCategoryValue,
        const DeepCollectionEquality().hash(faultStatus),
        userAdultStatus,
        abroadCountry,
        blindType,
        chatActive,
        chatAvailableGroup,
        chatAvailableCondition,
        minFollowerMinute,
        allowSubscriberInFollowerMode,
        chatSlowModeSec,
        chatEmojiMode,
        chatDonationRankingExposure,
        watchPartyNo,
        watchPartyTag,
        timeMachineActive,
        channelId
      ]);

  @override
  String toString() {
    return 'LiveStatus(liveTitle: $liveTitle, status: $status, concurrentUserCount: $concurrentUserCount, accumulateCount: $accumulateCount, paidPromotion: $paidPromotion, adult: $adult, krOnlyViewing: $krOnlyViewing, openDate: $openDate, closeDate: $closeDate, clipActive: $clipActive, chatChannelId: $chatChannelId, tags: $tags, categoryType: $categoryType, liveCategory: $liveCategory, liveCategoryValue: $liveCategoryValue, faultStatus: $faultStatus, userAdultStatus: $userAdultStatus, abroadCountry: $abroadCountry, blindType: $blindType, chatActive: $chatActive, chatAvailableGroup: $chatAvailableGroup, chatAvailableCondition: $chatAvailableCondition, minFollowerMinute: $minFollowerMinute, allowSubscriberInFollowerMode: $allowSubscriberInFollowerMode, chatSlowModeSec: $chatSlowModeSec, chatEmojiMode: $chatEmojiMode, chatDonationRankingExposure: $chatDonationRankingExposure, watchPartyNo: $watchPartyNo, watchPartyTag: $watchPartyTag, timeMachineActive: $timeMachineActive, channelId: $channelId)';
  }
}

/// @nodoc
abstract mixin class $LiveStatusCopyWith<$Res> {
  factory $LiveStatusCopyWith(
          LiveStatus value, $Res Function(LiveStatus) _then) =
      _$LiveStatusCopyWithImpl;
  @useResult
  $Res call(
      {String liveTitle,
      String status,
      int concurrentUserCount,
      int accumulateCount,
      bool paidPromotion,
      bool adult,
      bool krOnlyViewing,
      String? openDate,
      String? closeDate,
      bool clipActive,
      String chatChannelId,
      List<String>? tags,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      Object? faultStatus,
      String? userAdultStatus,
      bool abroadCountry,
      String? blindType,
      bool chatActive,
      String? chatAvailableGroup,
      String? chatAvailableCondition,
      int? minFollowerMinute,
      bool allowSubscriberInFollowerMode,
      int chatSlowModeSec,
      bool chatEmojiMode,
      bool chatDonationRankingExposure,
      int? watchPartyNo,
      String? watchPartyTag,
      bool timeMachineActive,
      String channelId});
}

/// @nodoc
class _$LiveStatusCopyWithImpl<$Res> implements $LiveStatusCopyWith<$Res> {
  _$LiveStatusCopyWithImpl(this._self, this._then);

  final LiveStatus _self;
  final $Res Function(LiveStatus) _then;

  /// Create a copy of LiveStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveTitle = null,
    Object? status = null,
    Object? concurrentUserCount = null,
    Object? accumulateCount = null,
    Object? paidPromotion = null,
    Object? adult = null,
    Object? krOnlyViewing = null,
    Object? openDate = freezed,
    Object? closeDate = freezed,
    Object? clipActive = null,
    Object? chatChannelId = null,
    Object? tags = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? faultStatus = freezed,
    Object? userAdultStatus = freezed,
    Object? abroadCountry = null,
    Object? blindType = freezed,
    Object? chatActive = null,
    Object? chatAvailableGroup = freezed,
    Object? chatAvailableCondition = freezed,
    Object? minFollowerMinute = freezed,
    Object? allowSubscriberInFollowerMode = null,
    Object? chatSlowModeSec = null,
    Object? chatEmojiMode = null,
    Object? chatDonationRankingExposure = null,
    Object? watchPartyNo = freezed,
    Object? watchPartyTag = freezed,
    Object? timeMachineActive = null,
    Object? channelId = null,
  }) {
    return _then(LiveStatus(
      liveTitle: null == liveTitle
          ? _self.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      concurrentUserCount: null == concurrentUserCount
          ? _self.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      accumulateCount: null == accumulateCount
          ? _self.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int,
      paidPromotion: null == paidPromotion
          ? _self.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
      adult: null == adult
          ? _self.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      krOnlyViewing: null == krOnlyViewing
          ? _self.krOnlyViewing
          : krOnlyViewing // ignore: cast_nullable_to_non_nullable
              as bool,
      openDate: freezed == openDate
          ? _self.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      closeDate: freezed == closeDate
          ? _self.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clipActive: null == clipActive
          ? _self.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatChannelId: null == chatChannelId
          ? _self.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      faultStatus: freezed == faultStatus ? _self.faultStatus : faultStatus,
      userAdultStatus: freezed == userAdultStatus
          ? _self.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      abroadCountry: null == abroadCountry
          ? _self.abroadCountry
          : abroadCountry // ignore: cast_nullable_to_non_nullable
              as bool,
      blindType: freezed == blindType
          ? _self.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      chatActive: null == chatActive
          ? _self.chatActive
          : chatActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableGroup: freezed == chatAvailableGroup
          ? _self.chatAvailableGroup
          : chatAvailableGroup // ignore: cast_nullable_to_non_nullable
              as String?,
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
      chatSlowModeSec: null == chatSlowModeSec
          ? _self.chatSlowModeSec
          : chatSlowModeSec // ignore: cast_nullable_to_non_nullable
              as int,
      chatEmojiMode: null == chatEmojiMode
          ? _self.chatEmojiMode
          : chatEmojiMode // ignore: cast_nullable_to_non_nullable
              as bool,
      chatDonationRankingExposure: null == chatDonationRankingExposure
          ? _self.chatDonationRankingExposure
          : chatDonationRankingExposure // ignore: cast_nullable_to_non_nullable
              as bool,
      watchPartyNo: freezed == watchPartyNo
          ? _self.watchPartyNo
          : watchPartyNo // ignore: cast_nullable_to_non_nullable
              as int?,
      watchPartyTag: freezed == watchPartyTag
          ? _self.watchPartyTag
          : watchPartyTag // ignore: cast_nullable_to_non_nullable
              as String?,
      timeMachineActive: null == timeMachineActive
          ? _self.timeMachineActive
          : timeMachineActive // ignore: cast_nullable_to_non_nullable
              as bool,
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
