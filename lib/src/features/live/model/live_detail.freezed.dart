// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveDetail _$LiveDetailFromJson(Map<String, dynamic> json) {
  return _LiveDetail.fromJson(json);
}

/// @nodoc
mixin _$LiveDetail {
  int get liveId => throw _privateConstructorUsedError;
  String get liveTitle => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get liveImageUrl => throw _privateConstructorUsedError;
  String? get defaultThumbnailImageUrl => throw _privateConstructorUsedError;
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int get accumulateCount => throw _privateConstructorUsedError;
  String? get openDate => throw _privateConstructorUsedError;
  String? get closeDate => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  bool get krOnlyViewing => throw _privateConstructorUsedError;
  bool get clipActive => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String get chatChannelId => throw _privateConstructorUsedError;
  String? get categoryType => throw _privateConstructorUsedError;
  String? get liveCategory => throw _privateConstructorUsedError;
  String? get liveCategoryValue => throw _privateConstructorUsedError;
  bool get chatActive => throw _privateConstructorUsedError;
  String? get chatAvailableGroup => throw _privateConstructorUsedError;
  bool? get paidProduct => throw _privateConstructorUsedError;
  bool get paidPromotion => throw _privateConstructorUsedError;
  String? get chatAvailableCondition => throw _privateConstructorUsedError;
  int? get minFollowerMinute => throw _privateConstructorUsedError;
  bool get allowSubscriberInFollowerMode => throw _privateConstructorUsedError;
  @LivePlaybackConverter()
  LivePlaybackJson get livePlaybackJson => throw _privateConstructorUsedError;
  List<String>? get p2pQuality => throw _privateConstructorUsedError;
  bool get timeMachineActive => throw _privateConstructorUsedError;
  bool get timeMachinePlayback => throw _privateConstructorUsedError;
  Channel get channel => throw _privateConstructorUsedError;
  String? get userAdultStatus => throw _privateConstructorUsedError;
  String? get blindType => throw _privateConstructorUsedError;
  int? get watchPartyNo => throw _privateConstructorUsedError;
  String? get watchPartyTag => throw _privateConstructorUsedError;

  /// Serializes this LiveDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveDetailCopyWith<LiveDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveDetailCopyWith<$Res> {
  factory $LiveDetailCopyWith(
          LiveDetail value, $Res Function(LiveDetail) then) =
      _$LiveDetailCopyWithImpl<$Res, LiveDetail>;
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

  $LivePlaybackJsonCopyWith<$Res> get livePlaybackJson;
  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class _$LiveDetailCopyWithImpl<$Res, $Val extends LiveDetail>
    implements $LiveDetailCopyWith<$Res> {
  _$LiveDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
      liveTitle: null == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      liveImageUrl: freezed == liveImageUrl
          ? _value.liveImageUrl
          : liveImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
          ? _value.defaultThumbnailImageUrl
          : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      accumulateCount: null == accumulateCount
          ? _value.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int,
      openDate: freezed == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      closeDate: freezed == closeDate
          ? _value.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      krOnlyViewing: null == krOnlyViewing
          ? _value.krOnlyViewing
          : krOnlyViewing // ignore: cast_nullable_to_non_nullable
              as bool,
      clipActive: null == clipActive
          ? _value.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      chatChannelId: null == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategory: freezed == liveCategory
          ? _value.liveCategory
          : liveCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategoryValue: freezed == liveCategoryValue
          ? _value.liveCategoryValue
          : liveCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      chatActive: null == chatActive
          ? _value.chatActive
          : chatActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableGroup: freezed == chatAvailableGroup
          ? _value.chatAvailableGroup
          : chatAvailableGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      paidProduct: freezed == paidProduct
          ? _value.paidProduct
          : paidProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidPromotion: null == paidPromotion
          ? _value.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableCondition: freezed == chatAvailableCondition
          ? _value.chatAvailableCondition
          : chatAvailableCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      minFollowerMinute: freezed == minFollowerMinute
          ? _value.minFollowerMinute
          : minFollowerMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      allowSubscriberInFollowerMode: null == allowSubscriberInFollowerMode
          ? _value.allowSubscriberInFollowerMode
          : allowSubscriberInFollowerMode // ignore: cast_nullable_to_non_nullable
              as bool,
      livePlaybackJson: null == livePlaybackJson
          ? _value.livePlaybackJson
          : livePlaybackJson // ignore: cast_nullable_to_non_nullable
              as LivePlaybackJson,
      p2pQuality: freezed == p2pQuality
          ? _value.p2pQuality
          : p2pQuality // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      timeMachineActive: null == timeMachineActive
          ? _value.timeMachineActive
          : timeMachineActive // ignore: cast_nullable_to_non_nullable
              as bool,
      timeMachinePlayback: null == timeMachinePlayback
          ? _value.timeMachinePlayback
          : timeMachinePlayback // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      blindType: freezed == blindType
          ? _value.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      watchPartyNo: freezed == watchPartyNo
          ? _value.watchPartyNo
          : watchPartyNo // ignore: cast_nullable_to_non_nullable
              as int?,
      watchPartyTag: freezed == watchPartyTag
          ? _value.watchPartyTag
          : watchPartyTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LivePlaybackJsonCopyWith<$Res> get livePlaybackJson {
    return $LivePlaybackJsonCopyWith<$Res>(_value.livePlaybackJson, (value) {
      return _then(_value.copyWith(livePlaybackJson: value) as $Val);
    });
  }

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<$Res> get channel {
    return $ChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveDetailImplCopyWith<$Res>
    implements $LiveDetailCopyWith<$Res> {
  factory _$$LiveDetailImplCopyWith(
          _$LiveDetailImpl value, $Res Function(_$LiveDetailImpl) then) =
      __$$LiveDetailImplCopyWithImpl<$Res>;
  @override
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

  @override
  $LivePlaybackJsonCopyWith<$Res> get livePlaybackJson;
  @override
  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$$LiveDetailImplCopyWithImpl<$Res>
    extends _$LiveDetailCopyWithImpl<$Res, _$LiveDetailImpl>
    implements _$$LiveDetailImplCopyWith<$Res> {
  __$$LiveDetailImplCopyWithImpl(
      _$LiveDetailImpl _value, $Res Function(_$LiveDetailImpl) _then)
      : super(_value, _then);

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
    return _then(_$LiveDetailImpl(
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
      liveTitle: null == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      liveImageUrl: freezed == liveImageUrl
          ? _value.liveImageUrl
          : liveImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
          ? _value.defaultThumbnailImageUrl
          : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      accumulateCount: null == accumulateCount
          ? _value.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int,
      openDate: freezed == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      closeDate: freezed == closeDate
          ? _value.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      krOnlyViewing: null == krOnlyViewing
          ? _value.krOnlyViewing
          : krOnlyViewing // ignore: cast_nullable_to_non_nullable
              as bool,
      clipActive: null == clipActive
          ? _value.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      chatChannelId: null == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategory: freezed == liveCategory
          ? _value.liveCategory
          : liveCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategoryValue: freezed == liveCategoryValue
          ? _value.liveCategoryValue
          : liveCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      chatActive: null == chatActive
          ? _value.chatActive
          : chatActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableGroup: freezed == chatAvailableGroup
          ? _value.chatAvailableGroup
          : chatAvailableGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      paidProduct: freezed == paidProduct
          ? _value.paidProduct
          : paidProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidPromotion: null == paidPromotion
          ? _value.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableCondition: freezed == chatAvailableCondition
          ? _value.chatAvailableCondition
          : chatAvailableCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      minFollowerMinute: freezed == minFollowerMinute
          ? _value.minFollowerMinute
          : minFollowerMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      allowSubscriberInFollowerMode: null == allowSubscriberInFollowerMode
          ? _value.allowSubscriberInFollowerMode
          : allowSubscriberInFollowerMode // ignore: cast_nullable_to_non_nullable
              as bool,
      livePlaybackJson: null == livePlaybackJson
          ? _value.livePlaybackJson
          : livePlaybackJson // ignore: cast_nullable_to_non_nullable
              as LivePlaybackJson,
      p2pQuality: freezed == p2pQuality
          ? _value._p2pQuality
          : p2pQuality // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      timeMachineActive: null == timeMachineActive
          ? _value.timeMachineActive
          : timeMachineActive // ignore: cast_nullable_to_non_nullable
              as bool,
      timeMachinePlayback: null == timeMachinePlayback
          ? _value.timeMachinePlayback
          : timeMachinePlayback // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      blindType: freezed == blindType
          ? _value.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      watchPartyNo: freezed == watchPartyNo
          ? _value.watchPartyNo
          : watchPartyNo // ignore: cast_nullable_to_non_nullable
              as int?,
      watchPartyTag: freezed == watchPartyTag
          ? _value.watchPartyTag
          : watchPartyTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveDetailImpl implements _LiveDetail {
  const _$LiveDetailImpl(
      {required this.liveId,
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
      final List<String>? tags,
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
      final List<String>? p2pQuality,
      required this.timeMachineActive,
      required this.timeMachinePlayback,
      required this.channel,
      this.userAdultStatus,
      this.blindType,
      this.watchPartyNo,
      this.watchPartyTag})
      : _tags = tags,
        _p2pQuality = p2pQuality;

  factory _$LiveDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveDetailImplFromJson(json);

  @override
  final int liveId;
  @override
  final String liveTitle;
  @override
  final String status;
  @override
  final String? liveImageUrl;
  @override
  final String? defaultThumbnailImageUrl;
  @override
  final int concurrentUserCount;
  @override
  final int accumulateCount;
  @override
  final String? openDate;
  @override
  final String? closeDate;
  @override
  final bool adult;
  @override
  final bool krOnlyViewing;
  @override
  final bool clipActive;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String chatChannelId;
  @override
  final String? categoryType;
  @override
  final String? liveCategory;
  @override
  final String? liveCategoryValue;
  @override
  final bool chatActive;
  @override
  final String? chatAvailableGroup;
  @override
  final bool? paidProduct;
  @override
  final bool paidPromotion;
  @override
  final String? chatAvailableCondition;
  @override
  final int? minFollowerMinute;
  @override
  final bool allowSubscriberInFollowerMode;
  @override
  @LivePlaybackConverter()
  final LivePlaybackJson livePlaybackJson;
  final List<String>? _p2pQuality;
  @override
  List<String>? get p2pQuality {
    final value = _p2pQuality;
    if (value == null) return null;
    if (_p2pQuality is EqualUnmodifiableListView) return _p2pQuality;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool timeMachineActive;
  @override
  final bool timeMachinePlayback;
  @override
  final Channel channel;
  @override
  final String? userAdultStatus;
  @override
  final String? blindType;
  @override
  final int? watchPartyNo;
  @override
  final String? watchPartyTag;

  @override
  String toString() {
    return 'LiveDetail(liveId: $liveId, liveTitle: $liveTitle, status: $status, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, accumulateCount: $accumulateCount, openDate: $openDate, closeDate: $closeDate, adult: $adult, krOnlyViewing: $krOnlyViewing, clipActive: $clipActive, tags: $tags, chatChannelId: $chatChannelId, categoryType: $categoryType, liveCategory: $liveCategory, liveCategoryValue: $liveCategoryValue, chatActive: $chatActive, chatAvailableGroup: $chatAvailableGroup, paidProduct: $paidProduct, paidPromotion: $paidPromotion, chatAvailableCondition: $chatAvailableCondition, minFollowerMinute: $minFollowerMinute, allowSubscriberInFollowerMode: $allowSubscriberInFollowerMode, livePlaybackJson: $livePlaybackJson, p2pQuality: $p2pQuality, timeMachineActive: $timeMachineActive, timeMachinePlayback: $timeMachinePlayback, channel: $channel, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyNo: $watchPartyNo, watchPartyTag: $watchPartyTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveDetailImpl &&
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
            const DeepCollectionEquality().equals(other._tags, _tags) &&
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
                .equals(other._p2pQuality, _p2pQuality) &&
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
        const DeepCollectionEquality().hash(_tags),
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
        const DeepCollectionEquality().hash(_p2pQuality),
        timeMachineActive,
        timeMachinePlayback,
        channel,
        userAdultStatus,
        blindType,
        watchPartyNo,
        watchPartyTag
      ]);

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveDetailImplCopyWith<_$LiveDetailImpl> get copyWith =>
      __$$LiveDetailImplCopyWithImpl<_$LiveDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveDetailImplToJson(
      this,
    );
  }
}

abstract class _LiveDetail implements LiveDetail {
  const factory _LiveDetail(
      {required final int liveId,
      required final String liveTitle,
      required final String status,
      final String? liveImageUrl,
      final String? defaultThumbnailImageUrl,
      required final int concurrentUserCount,
      required final int accumulateCount,
      final String? openDate,
      final String? closeDate,
      required final bool adult,
      required final bool krOnlyViewing,
      required final bool clipActive,
      final List<String>? tags,
      required final String chatChannelId,
      final String? categoryType,
      final String? liveCategory,
      final String? liveCategoryValue,
      required final bool chatActive,
      final String? chatAvailableGroup,
      final bool? paidProduct,
      required final bool paidPromotion,
      final String? chatAvailableCondition,
      final int? minFollowerMinute,
      required final bool allowSubscriberInFollowerMode,
      @LivePlaybackConverter() required final LivePlaybackJson livePlaybackJson,
      final List<String>? p2pQuality,
      required final bool timeMachineActive,
      required final bool timeMachinePlayback,
      required final Channel channel,
      final String? userAdultStatus,
      final String? blindType,
      final int? watchPartyNo,
      final String? watchPartyTag}) = _$LiveDetailImpl;

  factory _LiveDetail.fromJson(Map<String, dynamic> json) =
      _$LiveDetailImpl.fromJson;

  @override
  int get liveId;
  @override
  String get liveTitle;
  @override
  String get status;
  @override
  String? get liveImageUrl;
  @override
  String? get defaultThumbnailImageUrl;
  @override
  int get concurrentUserCount;
  @override
  int get accumulateCount;
  @override
  String? get openDate;
  @override
  String? get closeDate;
  @override
  bool get adult;
  @override
  bool get krOnlyViewing;
  @override
  bool get clipActive;
  @override
  List<String>? get tags;
  @override
  String get chatChannelId;
  @override
  String? get categoryType;
  @override
  String? get liveCategory;
  @override
  String? get liveCategoryValue;
  @override
  bool get chatActive;
  @override
  String? get chatAvailableGroup;
  @override
  bool? get paidProduct;
  @override
  bool get paidPromotion;
  @override
  String? get chatAvailableCondition;
  @override
  int? get minFollowerMinute;
  @override
  bool get allowSubscriberInFollowerMode;
  @override
  @LivePlaybackConverter()
  LivePlaybackJson get livePlaybackJson;
  @override
  List<String>? get p2pQuality;
  @override
  bool get timeMachineActive;
  @override
  bool get timeMachinePlayback;
  @override
  Channel get channel;
  @override
  String? get userAdultStatus;
  @override
  String? get blindType;
  @override
  int? get watchPartyNo;
  @override
  String? get watchPartyTag;

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveDetailImplCopyWith<_$LiveDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
