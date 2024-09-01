// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveInfo _$LiveInfoFromJson(Map<String, dynamic> json) {
  return _LiveInfo.fromJson(json);
}

/// @nodoc
mixin _$LiveInfo {
// Following
  int? get liveId => throw _privateConstructorUsedError;
  String? get liveImageUrl => throw _privateConstructorUsedError;
  String? get defaultThumbnailImageUrl => throw _privateConstructorUsedError;
  String? get liveTitle => throw _privateConstructorUsedError;
  int get concurrentUserCount => throw _privateConstructorUsedError;
  String? get categoryType => throw _privateConstructorUsedError;
  String? get liveCategory => throw _privateConstructorUsedError;
  String? get liveCategoryValue => throw _privateConstructorUsedError;
  bool? get adult => throw _privateConstructorUsedError;
  List<String>? get tags =>
      throw _privateConstructorUsedError; // Only in popular lives
  String? get openDate => throw _privateConstructorUsedError;
  int? get accumulateCount => throw _privateConstructorUsedError;
  Object? get blindType => throw _privateConstructorUsedError; // LiveResponse
  Channel? get channel => throw _privateConstructorUsedError;

  /// Serializes this LiveInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveInfoCopyWith<LiveInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveInfoCopyWith<$Res> {
  factory $LiveInfoCopyWith(LiveInfo value, $Res Function(LiveInfo) then) =
      _$LiveInfoCopyWithImpl<$Res, LiveInfo>;
  @useResult
  $Res call(
      {int? liveId,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      String? liveTitle,
      int concurrentUserCount,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      bool? adult,
      List<String>? tags,
      String? openDate,
      int? accumulateCount,
      Object? blindType,
      Channel? channel});

  $ChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class _$LiveInfoCopyWithImpl<$Res, $Val extends LiveInfo>
    implements $LiveInfoCopyWith<$Res> {
  _$LiveInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? liveTitle = freezed,
    Object? concurrentUserCount = null,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? adult = freezed,
    Object? tags = freezed,
    Object? openDate = freezed,
    Object? accumulateCount = freezed,
    Object? blindType = freezed,
    Object? channel = freezed,
  }) {
    return _then(_value.copyWith(
      liveId: freezed == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int?,
      liveImageUrl: freezed == liveImageUrl
          ? _value.liveImageUrl
          : liveImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
          ? _value.defaultThumbnailImageUrl
          : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      liveTitle: freezed == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
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
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      openDate: freezed == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      accumulateCount: freezed == accumulateCount
          ? _value.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int?,
      blindType: freezed == blindType ? _value.blindType : blindType,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
    ) as $Val);
  }

  /// Create a copy of LiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<$Res>? get channel {
    if (_value.channel == null) {
      return null;
    }

    return $ChannelCopyWith<$Res>(_value.channel!, (value) {
      return _then(_value.copyWith(channel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveInfoImplCopyWith<$Res>
    implements $LiveInfoCopyWith<$Res> {
  factory _$$LiveInfoImplCopyWith(
          _$LiveInfoImpl value, $Res Function(_$LiveInfoImpl) then) =
      __$$LiveInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? liveId,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      String? liveTitle,
      int concurrentUserCount,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      bool? adult,
      List<String>? tags,
      String? openDate,
      int? accumulateCount,
      Object? blindType,
      Channel? channel});

  @override
  $ChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class __$$LiveInfoImplCopyWithImpl<$Res>
    extends _$LiveInfoCopyWithImpl<$Res, _$LiveInfoImpl>
    implements _$$LiveInfoImplCopyWith<$Res> {
  __$$LiveInfoImplCopyWithImpl(
      _$LiveInfoImpl _value, $Res Function(_$LiveInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? liveTitle = freezed,
    Object? concurrentUserCount = null,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? adult = freezed,
    Object? tags = freezed,
    Object? openDate = freezed,
    Object? accumulateCount = freezed,
    Object? blindType = freezed,
    Object? channel = freezed,
  }) {
    return _then(_$LiveInfoImpl(
      liveId: freezed == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int?,
      liveImageUrl: freezed == liveImageUrl
          ? _value.liveImageUrl
          : liveImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
          ? _value.defaultThumbnailImageUrl
          : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      liveTitle: freezed == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
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
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      openDate: freezed == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      accumulateCount: freezed == accumulateCount
          ? _value.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int?,
      blindType: freezed == blindType ? _value.blindType : blindType,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveInfoImpl implements _LiveInfo {
  const _$LiveInfoImpl(
      {required this.liveId,
      required this.liveImageUrl,
      required this.defaultThumbnailImageUrl,
      required this.liveTitle,
      required this.concurrentUserCount,
      required this.categoryType,
      required this.liveCategory,
      required this.liveCategoryValue,
      required this.adult,
      required final List<String>? tags,
      required this.openDate,
      required this.accumulateCount,
      required this.blindType,
      required this.channel})
      : _tags = tags;

  factory _$LiveInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveInfoImplFromJson(json);

// Following
  @override
  final int? liveId;
  @override
  final String? liveImageUrl;
  @override
  final String? defaultThumbnailImageUrl;
  @override
  final String? liveTitle;
  @override
  final int concurrentUserCount;
  @override
  final String? categoryType;
  @override
  final String? liveCategory;
  @override
  final String? liveCategoryValue;
  @override
  final bool? adult;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Only in popular lives
  @override
  final String? openDate;
  @override
  final int? accumulateCount;
  @override
  final Object? blindType;
// LiveResponse
  @override
  final Channel? channel;

  @override
  String toString() {
    return 'LiveInfo(liveId: $liveId, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, liveTitle: $liveTitle, concurrentUserCount: $concurrentUserCount, categoryType: $categoryType, liveCategory: $liveCategory, liveCategoryValue: $liveCategoryValue, adult: $adult, tags: $tags, openDate: $openDate, accumulateCount: $accumulateCount, blindType: $blindType, channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveInfoImpl &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveImageUrl, liveImageUrl) ||
                other.liveImageUrl == liveImageUrl) &&
            (identical(
                    other.defaultThumbnailImageUrl, defaultThumbnailImageUrl) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.accumulateCount, accumulateCount) ||
                other.accumulateCount == accumulateCount) &&
            const DeepCollectionEquality().equals(other.blindType, blindType) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      liveId,
      liveImageUrl,
      defaultThumbnailImageUrl,
      liveTitle,
      concurrentUserCount,
      categoryType,
      liveCategory,
      liveCategoryValue,
      adult,
      const DeepCollectionEquality().hash(_tags),
      openDate,
      accumulateCount,
      const DeepCollectionEquality().hash(blindType),
      channel);

  /// Create a copy of LiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveInfoImplCopyWith<_$LiveInfoImpl> get copyWith =>
      __$$LiveInfoImplCopyWithImpl<_$LiveInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveInfoImplToJson(
      this,
    );
  }
}

abstract class _LiveInfo implements LiveInfo {
  const factory _LiveInfo(
      {required final int? liveId,
      required final String? liveImageUrl,
      required final String? defaultThumbnailImageUrl,
      required final String? liveTitle,
      required final int concurrentUserCount,
      required final String? categoryType,
      required final String? liveCategory,
      required final String? liveCategoryValue,
      required final bool? adult,
      required final List<String>? tags,
      required final String? openDate,
      required final int? accumulateCount,
      required final Object? blindType,
      required final Channel? channel}) = _$LiveInfoImpl;

  factory _LiveInfo.fromJson(Map<String, dynamic> json) =
      _$LiveInfoImpl.fromJson;

// Following
  @override
  int? get liveId;
  @override
  String? get liveImageUrl;
  @override
  String? get defaultThumbnailImageUrl;
  @override
  String? get liveTitle;
  @override
  int get concurrentUserCount;
  @override
  String? get categoryType;
  @override
  String? get liveCategory;
  @override
  String? get liveCategoryValue;
  @override
  bool? get adult;
  @override
  List<String>? get tags; // Only in popular lives
  @override
  String? get openDate;
  @override
  int? get accumulateCount;
  @override
  Object? get blindType; // LiveResponse
  @override
  Channel? get channel;

  /// Create a copy of LiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveInfoImplCopyWith<_$LiveInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveDetail _$LiveDetailFromJson(Map<String, dynamic> json) {
  return _LiveDetail.fromJson(json);
}

/// @nodoc
mixin _$LiveDetail {
// LiveInfo
  int get liveId => throw _privateConstructorUsedError;
  String? get liveTitle => throw _privateConstructorUsedError;
  String? get liveImageUrl => throw _privateConstructorUsedError;
  String? get defaultThumbnailImageUrl => throw _privateConstructorUsedError;
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int get accumulateCount => throw _privateConstructorUsedError;
  String? get openDate => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get categoryType => throw _privateConstructorUsedError;
  String? get liveCategory => throw _privateConstructorUsedError;
  String? get liveCategoryValue => throw _privateConstructorUsedError;
  Object? get blindType =>
      throw _privateConstructorUsedError; // LiveDetail only
  String get status => throw _privateConstructorUsedError;
  String? get closeDate => throw _privateConstructorUsedError;
  bool get clipActive => throw _privateConstructorUsedError;
  String get chatChannelId => throw _privateConstructorUsedError;
  bool get chatActive => throw _privateConstructorUsedError;
  String? get chatAvailableGroup => throw _privateConstructorUsedError;
  bool get paidPromotion => throw _privateConstructorUsedError;
  String? get chatAvailableCondition => throw _privateConstructorUsedError;
  int get minFollowerMinute => throw _privateConstructorUsedError;
  List<String> get p2pQuality => throw _privateConstructorUsedError;
  Channel get channel =>
      throw _privateConstructorUsedError; // required LivePollingStatusJson livePollingStatusJson,
  String? get userAdultStatus => throw _privateConstructorUsedError;
  bool get chatDonationRankingExposure =>
      throw _privateConstructorUsedError; // required AdParameter adParameter,
  @LivePlaybackConverter()
  LivePlaybackJson get livePlaybackJson => throw _privateConstructorUsedError;

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
      String? liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      int accumulateCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      Object? blindType,
      String status,
      String? closeDate,
      bool clipActive,
      String chatChannelId,
      bool chatActive,
      String? chatAvailableGroup,
      bool paidPromotion,
      String? chatAvailableCondition,
      int minFollowerMinute,
      List<String> p2pQuality,
      Channel channel,
      String? userAdultStatus,
      bool chatDonationRankingExposure,
      @LivePlaybackConverter() LivePlaybackJson livePlaybackJson});

  $ChannelCopyWith<$Res> get channel;
  $LivePlaybackJsonCopyWith<$Res> get livePlaybackJson;
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
    Object? liveTitle = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? accumulateCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? blindType = freezed,
    Object? status = null,
    Object? closeDate = freezed,
    Object? clipActive = null,
    Object? chatChannelId = null,
    Object? chatActive = null,
    Object? chatAvailableGroup = freezed,
    Object? paidPromotion = null,
    Object? chatAvailableCondition = freezed,
    Object? minFollowerMinute = null,
    Object? p2pQuality = null,
    Object? channel = null,
    Object? userAdultStatus = freezed,
    Object? chatDonationRankingExposure = null,
    Object? livePlaybackJson = null,
  }) {
    return _then(_value.copyWith(
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
      liveTitle: freezed == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String?,
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
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      blindType: freezed == blindType ? _value.blindType : blindType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      closeDate: freezed == closeDate
          ? _value.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clipActive: null == clipActive
          ? _value.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatChannelId: null == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      chatActive: null == chatActive
          ? _value.chatActive
          : chatActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableGroup: freezed == chatAvailableGroup
          ? _value.chatAvailableGroup
          : chatAvailableGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      paidPromotion: null == paidPromotion
          ? _value.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableCondition: freezed == chatAvailableCondition
          ? _value.chatAvailableCondition
          : chatAvailableCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      minFollowerMinute: null == minFollowerMinute
          ? _value.minFollowerMinute
          : minFollowerMinute // ignore: cast_nullable_to_non_nullable
              as int,
      p2pQuality: null == p2pQuality
          ? _value.p2pQuality
          : p2pQuality // ignore: cast_nullable_to_non_nullable
              as List<String>,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      chatDonationRankingExposure: null == chatDonationRankingExposure
          ? _value.chatDonationRankingExposure
          : chatDonationRankingExposure // ignore: cast_nullable_to_non_nullable
              as bool,
      livePlaybackJson: null == livePlaybackJson
          ? _value.livePlaybackJson
          : livePlaybackJson // ignore: cast_nullable_to_non_nullable
              as LivePlaybackJson,
    ) as $Val);
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

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LivePlaybackJsonCopyWith<$Res> get livePlaybackJson {
    return $LivePlaybackJsonCopyWith<$Res>(_value.livePlaybackJson, (value) {
      return _then(_value.copyWith(livePlaybackJson: value) as $Val);
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
      String? liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      int accumulateCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      Object? blindType,
      String status,
      String? closeDate,
      bool clipActive,
      String chatChannelId,
      bool chatActive,
      String? chatAvailableGroup,
      bool paidPromotion,
      String? chatAvailableCondition,
      int minFollowerMinute,
      List<String> p2pQuality,
      Channel channel,
      String? userAdultStatus,
      bool chatDonationRankingExposure,
      @LivePlaybackConverter() LivePlaybackJson livePlaybackJson});

  @override
  $ChannelCopyWith<$Res> get channel;
  @override
  $LivePlaybackJsonCopyWith<$Res> get livePlaybackJson;
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
    Object? liveTitle = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? accumulateCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? blindType = freezed,
    Object? status = null,
    Object? closeDate = freezed,
    Object? clipActive = null,
    Object? chatChannelId = null,
    Object? chatActive = null,
    Object? chatAvailableGroup = freezed,
    Object? paidPromotion = null,
    Object? chatAvailableCondition = freezed,
    Object? minFollowerMinute = null,
    Object? p2pQuality = null,
    Object? channel = null,
    Object? userAdultStatus = freezed,
    Object? chatDonationRankingExposure = null,
    Object? livePlaybackJson = null,
  }) {
    return _then(_$LiveDetailImpl(
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
      liveTitle: freezed == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String?,
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
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      blindType: freezed == blindType ? _value.blindType : blindType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      closeDate: freezed == closeDate
          ? _value.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clipActive: null == clipActive
          ? _value.clipActive
          : clipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatChannelId: null == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      chatActive: null == chatActive
          ? _value.chatActive
          : chatActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableGroup: freezed == chatAvailableGroup
          ? _value.chatAvailableGroup
          : chatAvailableGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      paidPromotion: null == paidPromotion
          ? _value.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableCondition: freezed == chatAvailableCondition
          ? _value.chatAvailableCondition
          : chatAvailableCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      minFollowerMinute: null == minFollowerMinute
          ? _value.minFollowerMinute
          : minFollowerMinute // ignore: cast_nullable_to_non_nullable
              as int,
      p2pQuality: null == p2pQuality
          ? _value._p2pQuality
          : p2pQuality // ignore: cast_nullable_to_non_nullable
              as List<String>,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      chatDonationRankingExposure: null == chatDonationRankingExposure
          ? _value.chatDonationRankingExposure
          : chatDonationRankingExposure // ignore: cast_nullable_to_non_nullable
              as bool,
      livePlaybackJson: null == livePlaybackJson
          ? _value.livePlaybackJson
          : livePlaybackJson // ignore: cast_nullable_to_non_nullable
              as LivePlaybackJson,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveDetailImpl implements _LiveDetail {
  const _$LiveDetailImpl(
      {required this.liveId,
      required this.liveTitle,
      required this.liveImageUrl,
      required this.defaultThumbnailImageUrl,
      required this.concurrentUserCount,
      required this.accumulateCount,
      required this.openDate,
      required this.adult,
      required final List<String> tags,
      required this.categoryType,
      required this.liveCategory,
      required this.liveCategoryValue,
      required this.blindType,
      required this.status,
      required this.closeDate,
      required this.clipActive,
      required this.chatChannelId,
      required this.chatActive,
      required this.chatAvailableGroup,
      required this.paidPromotion,
      required this.chatAvailableCondition,
      required this.minFollowerMinute,
      required final List<String> p2pQuality,
      required this.channel,
      required this.userAdultStatus,
      required this.chatDonationRankingExposure,
      @LivePlaybackConverter() required this.livePlaybackJson})
      : _tags = tags,
        _p2pQuality = p2pQuality;

  factory _$LiveDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveDetailImplFromJson(json);

// LiveInfo
  @override
  final int liveId;
  @override
  final String? liveTitle;
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
  final bool adult;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? categoryType;
  @override
  final String? liveCategory;
  @override
  final String? liveCategoryValue;
  @override
  final Object? blindType;
// LiveDetail only
  @override
  final String status;
  @override
  final String? closeDate;
  @override
  final bool clipActive;
  @override
  final String chatChannelId;
  @override
  final bool chatActive;
  @override
  final String? chatAvailableGroup;
  @override
  final bool paidPromotion;
  @override
  final String? chatAvailableCondition;
  @override
  final int minFollowerMinute;
  final List<String> _p2pQuality;
  @override
  List<String> get p2pQuality {
    if (_p2pQuality is EqualUnmodifiableListView) return _p2pQuality;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_p2pQuality);
  }

  @override
  final Channel channel;
// required LivePollingStatusJson livePollingStatusJson,
  @override
  final String? userAdultStatus;
  @override
  final bool chatDonationRankingExposure;
// required AdParameter adParameter,
  @override
  @LivePlaybackConverter()
  final LivePlaybackJson livePlaybackJson;

  @override
  String toString() {
    return 'LiveDetail(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, accumulateCount: $accumulateCount, openDate: $openDate, adult: $adult, tags: $tags, categoryType: $categoryType, liveCategory: $liveCategory, liveCategoryValue: $liveCategoryValue, blindType: $blindType, status: $status, closeDate: $closeDate, clipActive: $clipActive, chatChannelId: $chatChannelId, chatActive: $chatActive, chatAvailableGroup: $chatAvailableGroup, paidPromotion: $paidPromotion, chatAvailableCondition: $chatAvailableCondition, minFollowerMinute: $minFollowerMinute, p2pQuality: $p2pQuality, channel: $channel, userAdultStatus: $userAdultStatus, chatDonationRankingExposure: $chatDonationRankingExposure, livePlaybackJson: $livePlaybackJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveDetailImpl &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.liveImageUrl, liveImageUrl) ||
                other.liveImageUrl == liveImageUrl) &&
            (identical(
                    other.defaultThumbnailImageUrl, defaultThumbnailImageUrl) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.accumulateCount, accumulateCount) ||
                other.accumulateCount == accumulateCount) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            const DeepCollectionEquality().equals(other.blindType, blindType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.closeDate, closeDate) ||
                other.closeDate == closeDate) &&
            (identical(other.clipActive, clipActive) ||
                other.clipActive == clipActive) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.chatActive, chatActive) ||
                other.chatActive == chatActive) &&
            (identical(other.chatAvailableGroup, chatAvailableGroup) ||
                other.chatAvailableGroup == chatAvailableGroup) &&
            (identical(other.paidPromotion, paidPromotion) ||
                other.paidPromotion == paidPromotion) &&
            (identical(other.chatAvailableCondition, chatAvailableCondition) ||
                other.chatAvailableCondition == chatAvailableCondition) &&
            (identical(other.minFollowerMinute, minFollowerMinute) ||
                other.minFollowerMinute == minFollowerMinute) &&
            const DeepCollectionEquality()
                .equals(other._p2pQuality, _p2pQuality) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.chatDonationRankingExposure,
                    chatDonationRankingExposure) ||
                other.chatDonationRankingExposure ==
                    chatDonationRankingExposure) &&
            (identical(other.livePlaybackJson, livePlaybackJson) ||
                other.livePlaybackJson == livePlaybackJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        liveId,
        liveTitle,
        liveImageUrl,
        defaultThumbnailImageUrl,
        concurrentUserCount,
        accumulateCount,
        openDate,
        adult,
        const DeepCollectionEquality().hash(_tags),
        categoryType,
        liveCategory,
        liveCategoryValue,
        const DeepCollectionEquality().hash(blindType),
        status,
        closeDate,
        clipActive,
        chatChannelId,
        chatActive,
        chatAvailableGroup,
        paidPromotion,
        chatAvailableCondition,
        minFollowerMinute,
        const DeepCollectionEquality().hash(_p2pQuality),
        channel,
        userAdultStatus,
        chatDonationRankingExposure,
        livePlaybackJson
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
      required final String? liveTitle,
      required final String? liveImageUrl,
      required final String? defaultThumbnailImageUrl,
      required final int concurrentUserCount,
      required final int accumulateCount,
      required final String? openDate,
      required final bool adult,
      required final List<String> tags,
      required final String? categoryType,
      required final String? liveCategory,
      required final String? liveCategoryValue,
      required final Object? blindType,
      required final String status,
      required final String? closeDate,
      required final bool clipActive,
      required final String chatChannelId,
      required final bool chatActive,
      required final String? chatAvailableGroup,
      required final bool paidPromotion,
      required final String? chatAvailableCondition,
      required final int minFollowerMinute,
      required final List<String> p2pQuality,
      required final Channel channel,
      required final String? userAdultStatus,
      required final bool chatDonationRankingExposure,
      @LivePlaybackConverter()
      required final LivePlaybackJson livePlaybackJson}) = _$LiveDetailImpl;

  factory _LiveDetail.fromJson(Map<String, dynamic> json) =
      _$LiveDetailImpl.fromJson;

// LiveInfo
  @override
  int get liveId;
  @override
  String? get liveTitle;
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
  bool get adult;
  @override
  List<String> get tags;
  @override
  String? get categoryType;
  @override
  String? get liveCategory;
  @override
  String? get liveCategoryValue;
  @override
  Object? get blindType; // LiveDetail only
  @override
  String get status;
  @override
  String? get closeDate;
  @override
  bool get clipActive;
  @override
  String get chatChannelId;
  @override
  bool get chatActive;
  @override
  String? get chatAvailableGroup;
  @override
  bool get paidPromotion;
  @override
  String? get chatAvailableCondition;
  @override
  int get minFollowerMinute;
  @override
  List<String> get p2pQuality;
  @override
  Channel get channel; // required LivePollingStatusJson livePollingStatusJson,
  @override
  String? get userAdultStatus;
  @override
  bool get chatDonationRankingExposure; // required AdParameter adParameter,
  @override
  @LivePlaybackConverter()
  LivePlaybackJson get livePlaybackJson;

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveDetailImplCopyWith<_$LiveDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveResponse _$LiveResponseFromJson(Map<String, dynamic> json) {
  return _LiveResponse.fromJson(json);
}

/// @nodoc
mixin _$LiveResponse {
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'page', fromJson: _livePageFromJson)
  LivePage? get next => throw _privateConstructorUsedError;
  List<LiveInfo> get data => throw _privateConstructorUsedError;

  /// Serializes this LiveResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveResponseCopyWith<LiveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveResponseCopyWith<$Res> {
  factory $LiveResponseCopyWith(
          LiveResponse value, $Res Function(LiveResponse) then) =
      _$LiveResponseCopyWithImpl<$Res, LiveResponse>;
  @useResult
  $Res call(
      {int size,
      @JsonKey(name: 'page', fromJson: _livePageFromJson) LivePage? next,
      List<LiveInfo> data});

  $LivePageCopyWith<$Res>? get next;
}

/// @nodoc
class _$LiveResponseCopyWithImpl<$Res, $Val extends LiveResponse>
    implements $LiveResponseCopyWith<$Res> {
  _$LiveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? next = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as LivePage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveInfo>,
    ) as $Val);
  }

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LivePageCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $LivePageCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveResponseImplCopyWith<$Res>
    implements $LiveResponseCopyWith<$Res> {
  factory _$$LiveResponseImplCopyWith(
          _$LiveResponseImpl value, $Res Function(_$LiveResponseImpl) then) =
      __$$LiveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int size,
      @JsonKey(name: 'page', fromJson: _livePageFromJson) LivePage? next,
      List<LiveInfo> data});

  @override
  $LivePageCopyWith<$Res>? get next;
}

/// @nodoc
class __$$LiveResponseImplCopyWithImpl<$Res>
    extends _$LiveResponseCopyWithImpl<$Res, _$LiveResponseImpl>
    implements _$$LiveResponseImplCopyWith<$Res> {
  __$$LiveResponseImplCopyWithImpl(
      _$LiveResponseImpl _value, $Res Function(_$LiveResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? next = freezed,
    Object? data = null,
  }) {
    return _then(_$LiveResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as LivePage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveResponseImpl implements _LiveResponse {
  const _$LiveResponseImpl(
      {required this.size,
      @JsonKey(name: 'page', fromJson: _livePageFromJson) required this.next,
      required final List<LiveInfo> data})
      : _data = data;

  factory _$LiveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveResponseImplFromJson(json);

  @override
  final int size;
  @override
  @JsonKey(name: 'page', fromJson: _livePageFromJson)
  final LivePage? next;
  final List<LiveInfo> _data;
  @override
  List<LiveInfo> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LiveResponse(size: $size, next: $next, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.next, next) || other.next == next) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, next, const DeepCollectionEquality().hash(_data));

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveResponseImplCopyWith<_$LiveResponseImpl> get copyWith =>
      __$$LiveResponseImplCopyWithImpl<_$LiveResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveResponseImplToJson(
      this,
    );
  }
}

abstract class _LiveResponse implements LiveResponse {
  const factory _LiveResponse(
      {required final int size,
      @JsonKey(name: 'page', fromJson: _livePageFromJson)
      required final LivePage? next,
      required final List<LiveInfo> data}) = _$LiveResponseImpl;

  factory _LiveResponse.fromJson(Map<String, dynamic> json) =
      _$LiveResponseImpl.fromJson;

  @override
  int get size;
  @override
  @JsonKey(name: 'page', fromJson: _livePageFromJson)
  LivePage? get next;
  @override
  List<LiveInfo> get data;

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveResponseImplCopyWith<_$LiveResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LivePage _$LivePageFromJson(Map<String, dynamic> json) {
  return _LivePage.fromJson(json);
}

/// @nodoc
mixin _$LivePage {
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int get liveId => throw _privateConstructorUsedError;

  /// Serializes this LivePage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LivePageCopyWith<LivePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivePageCopyWith<$Res> {
  factory $LivePageCopyWith(LivePage value, $Res Function(LivePage) then) =
      _$LivePageCopyWithImpl<$Res, LivePage>;
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class _$LivePageCopyWithImpl<$Res, $Val extends LivePage>
    implements $LivePageCopyWith<$Res> {
  _$LivePageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? liveId = null,
  }) {
    return _then(_value.copyWith(
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LivePageImplCopyWith<$Res>
    implements $LivePageCopyWith<$Res> {
  factory _$$LivePageImplCopyWith(
          _$LivePageImpl value, $Res Function(_$LivePageImpl) then) =
      __$$LivePageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class __$$LivePageImplCopyWithImpl<$Res>
    extends _$LivePageCopyWithImpl<$Res, _$LivePageImpl>
    implements _$$LivePageImplCopyWith<$Res> {
  __$$LivePageImplCopyWithImpl(
      _$LivePageImpl _value, $Res Function(_$LivePageImpl) _then)
      : super(_value, _then);

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? liveId = null,
  }) {
    return _then(_$LivePageImpl(
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LivePageImpl implements _LivePage {
  const _$LivePageImpl(
      {required this.concurrentUserCount, required this.liveId});

  factory _$LivePageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LivePageImplFromJson(json);

  @override
  final int concurrentUserCount;
  @override
  final int liveId;

  @override
  String toString() {
    return 'LivePage(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivePageImpl &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LivePageImplCopyWith<_$LivePageImpl> get copyWith =>
      __$$LivePageImplCopyWithImpl<_$LivePageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LivePageImplToJson(
      this,
    );
  }
}

abstract class _LivePage implements LivePage {
  const factory _LivePage(
      {required final int concurrentUserCount,
      required final int liveId}) = _$LivePageImpl;

  factory _LivePage.fromJson(Map<String, dynamic> json) =
      _$LivePageImpl.fromJson;

  @override
  int get concurrentUserCount;
  @override
  int get liveId;

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LivePageImplCopyWith<_$LivePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveStatus _$LiveStatusFromJson(Map<String, dynamic> json) {
  return _LiveStatus.fromJson(json);
}

/// @nodoc
mixin _$LiveStatus {
  String get liveTitle => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int get accumulateCount => throw _privateConstructorUsedError;
  bool get paidPromotion => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  bool get krOnlyViewing => throw _privateConstructorUsedError;
  bool get clipActive => throw _privateConstructorUsedError;
  String get chatChannelId => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get categoryType => throw _privateConstructorUsedError;
  String? get liveCategory => throw _privateConstructorUsedError;
  String? get liveCategoryValue =>
      throw _privateConstructorUsedError; // required LivePollingStatusJson? livePollingStatusJson,
  String? get userAdultStatus => throw _privateConstructorUsedError;
  Object? get faultStatus => throw _privateConstructorUsedError;
  Object? get blindType => throw _privateConstructorUsedError;
  bool get chatActive => throw _privateConstructorUsedError;
  String? get chatAvailableGroup => throw _privateConstructorUsedError;
  String? get chatAvailableCondition => throw _privateConstructorUsedError;
  int? get minFollowerMinute => throw _privateConstructorUsedError;
  bool get chatDonationRankingExposure => throw _privateConstructorUsedError;

  /// Serializes this LiveStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveStatusCopyWith<LiveStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveStatusCopyWith<$Res> {
  factory $LiveStatusCopyWith(
          LiveStatus value, $Res Function(LiveStatus) then) =
      _$LiveStatusCopyWithImpl<$Res, LiveStatus>;
  @useResult
  $Res call(
      {String liveTitle,
      String status,
      int concurrentUserCount,
      int accumulateCount,
      bool paidPromotion,
      bool adult,
      bool krOnlyViewing,
      bool clipActive,
      String chatChannelId,
      List<String>? tags,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      String? userAdultStatus,
      Object? faultStatus,
      Object? blindType,
      bool chatActive,
      String? chatAvailableGroup,
      String? chatAvailableCondition,
      int? minFollowerMinute,
      bool chatDonationRankingExposure});
}

/// @nodoc
class _$LiveStatusCopyWithImpl<$Res, $Val extends LiveStatus>
    implements $LiveStatusCopyWith<$Res> {
  _$LiveStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? clipActive = null,
    Object? chatChannelId = null,
    Object? tags = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? userAdultStatus = freezed,
    Object? faultStatus = freezed,
    Object? blindType = freezed,
    Object? chatActive = null,
    Object? chatAvailableGroup = freezed,
    Object? chatAvailableCondition = freezed,
    Object? minFollowerMinute = freezed,
    Object? chatDonationRankingExposure = null,
  }) {
    return _then(_value.copyWith(
      liveTitle: null == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      accumulateCount: null == accumulateCount
          ? _value.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int,
      paidPromotion: null == paidPromotion
          ? _value.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
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
      chatChannelId: null == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      faultStatus: freezed == faultStatus ? _value.faultStatus : faultStatus,
      blindType: freezed == blindType ? _value.blindType : blindType,
      chatActive: null == chatActive
          ? _value.chatActive
          : chatActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableGroup: freezed == chatAvailableGroup
          ? _value.chatAvailableGroup
          : chatAvailableGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      chatAvailableCondition: freezed == chatAvailableCondition
          ? _value.chatAvailableCondition
          : chatAvailableCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      minFollowerMinute: freezed == minFollowerMinute
          ? _value.minFollowerMinute
          : minFollowerMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      chatDonationRankingExposure: null == chatDonationRankingExposure
          ? _value.chatDonationRankingExposure
          : chatDonationRankingExposure // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveStatusImplCopyWith<$Res>
    implements $LiveStatusCopyWith<$Res> {
  factory _$$LiveStatusImplCopyWith(
          _$LiveStatusImpl value, $Res Function(_$LiveStatusImpl) then) =
      __$$LiveStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String liveTitle,
      String status,
      int concurrentUserCount,
      int accumulateCount,
      bool paidPromotion,
      bool adult,
      bool krOnlyViewing,
      bool clipActive,
      String chatChannelId,
      List<String>? tags,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      String? userAdultStatus,
      Object? faultStatus,
      Object? blindType,
      bool chatActive,
      String? chatAvailableGroup,
      String? chatAvailableCondition,
      int? minFollowerMinute,
      bool chatDonationRankingExposure});
}

/// @nodoc
class __$$LiveStatusImplCopyWithImpl<$Res>
    extends _$LiveStatusCopyWithImpl<$Res, _$LiveStatusImpl>
    implements _$$LiveStatusImplCopyWith<$Res> {
  __$$LiveStatusImplCopyWithImpl(
      _$LiveStatusImpl _value, $Res Function(_$LiveStatusImpl) _then)
      : super(_value, _then);

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
    Object? clipActive = null,
    Object? chatChannelId = null,
    Object? tags = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? userAdultStatus = freezed,
    Object? faultStatus = freezed,
    Object? blindType = freezed,
    Object? chatActive = null,
    Object? chatAvailableGroup = freezed,
    Object? chatAvailableCondition = freezed,
    Object? minFollowerMinute = freezed,
    Object? chatDonationRankingExposure = null,
  }) {
    return _then(_$LiveStatusImpl(
      liveTitle: null == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      accumulateCount: null == accumulateCount
          ? _value.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int,
      paidPromotion: null == paidPromotion
          ? _value.paidPromotion
          : paidPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
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
      chatChannelId: null == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      faultStatus: freezed == faultStatus ? _value.faultStatus : faultStatus,
      blindType: freezed == blindType ? _value.blindType : blindType,
      chatActive: null == chatActive
          ? _value.chatActive
          : chatActive // ignore: cast_nullable_to_non_nullable
              as bool,
      chatAvailableGroup: freezed == chatAvailableGroup
          ? _value.chatAvailableGroup
          : chatAvailableGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      chatAvailableCondition: freezed == chatAvailableCondition
          ? _value.chatAvailableCondition
          : chatAvailableCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      minFollowerMinute: freezed == minFollowerMinute
          ? _value.minFollowerMinute
          : minFollowerMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      chatDonationRankingExposure: null == chatDonationRankingExposure
          ? _value.chatDonationRankingExposure
          : chatDonationRankingExposure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveStatusImpl implements _LiveStatus {
  const _$LiveStatusImpl(
      {required this.liveTitle,
      required this.status,
      required this.concurrentUserCount,
      required this.accumulateCount,
      required this.paidPromotion,
      required this.adult,
      required this.krOnlyViewing,
      required this.clipActive,
      required this.chatChannelId,
      required final List<String>? tags,
      required this.categoryType,
      required this.liveCategory,
      required this.liveCategoryValue,
      required this.userAdultStatus,
      required this.faultStatus,
      required this.blindType,
      required this.chatActive,
      required this.chatAvailableGroup,
      required this.chatAvailableCondition,
      required this.minFollowerMinute,
      required this.chatDonationRankingExposure})
      : _tags = tags;

  factory _$LiveStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveStatusImplFromJson(json);

  @override
  final String liveTitle;
  @override
  final String status;
  @override
  final int concurrentUserCount;
  @override
  final int accumulateCount;
  @override
  final bool paidPromotion;
  @override
  final bool adult;
  @override
  final bool krOnlyViewing;
  @override
  final bool clipActive;
  @override
  final String chatChannelId;
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
  final String? categoryType;
  @override
  final String? liveCategory;
  @override
  final String? liveCategoryValue;
// required LivePollingStatusJson? livePollingStatusJson,
  @override
  final String? userAdultStatus;
  @override
  final Object? faultStatus;
  @override
  final Object? blindType;
  @override
  final bool chatActive;
  @override
  final String? chatAvailableGroup;
  @override
  final String? chatAvailableCondition;
  @override
  final int? minFollowerMinute;
  @override
  final bool chatDonationRankingExposure;

  @override
  String toString() {
    return 'LiveStatus(liveTitle: $liveTitle, status: $status, concurrentUserCount: $concurrentUserCount, accumulateCount: $accumulateCount, paidPromotion: $paidPromotion, adult: $adult, krOnlyViewing: $krOnlyViewing, clipActive: $clipActive, chatChannelId: $chatChannelId, tags: $tags, categoryType: $categoryType, liveCategory: $liveCategory, liveCategoryValue: $liveCategoryValue, userAdultStatus: $userAdultStatus, faultStatus: $faultStatus, blindType: $blindType, chatActive: $chatActive, chatAvailableGroup: $chatAvailableGroup, chatAvailableCondition: $chatAvailableCondition, minFollowerMinute: $minFollowerMinute, chatDonationRankingExposure: $chatDonationRankingExposure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveStatusImpl &&
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
            (identical(other.clipActive, clipActive) ||
                other.clipActive == clipActive) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            const DeepCollectionEquality()
                .equals(other.faultStatus, faultStatus) &&
            const DeepCollectionEquality().equals(other.blindType, blindType) &&
            (identical(other.chatActive, chatActive) ||
                other.chatActive == chatActive) &&
            (identical(other.chatAvailableGroup, chatAvailableGroup) ||
                other.chatAvailableGroup == chatAvailableGroup) &&
            (identical(other.chatAvailableCondition, chatAvailableCondition) ||
                other.chatAvailableCondition == chatAvailableCondition) &&
            (identical(other.minFollowerMinute, minFollowerMinute) ||
                other.minFollowerMinute == minFollowerMinute) &&
            (identical(other.chatDonationRankingExposure,
                    chatDonationRankingExposure) ||
                other.chatDonationRankingExposure ==
                    chatDonationRankingExposure));
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
        clipActive,
        chatChannelId,
        const DeepCollectionEquality().hash(_tags),
        categoryType,
        liveCategory,
        liveCategoryValue,
        userAdultStatus,
        const DeepCollectionEquality().hash(faultStatus),
        const DeepCollectionEquality().hash(blindType),
        chatActive,
        chatAvailableGroup,
        chatAvailableCondition,
        minFollowerMinute,
        chatDonationRankingExposure
      ]);

  /// Create a copy of LiveStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveStatusImplCopyWith<_$LiveStatusImpl> get copyWith =>
      __$$LiveStatusImplCopyWithImpl<_$LiveStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveStatusImplToJson(
      this,
    );
  }
}

abstract class _LiveStatus implements LiveStatus {
  const factory _LiveStatus(
      {required final String liveTitle,
      required final String status,
      required final int concurrentUserCount,
      required final int accumulateCount,
      required final bool paidPromotion,
      required final bool adult,
      required final bool krOnlyViewing,
      required final bool clipActive,
      required final String chatChannelId,
      required final List<String>? tags,
      required final String? categoryType,
      required final String? liveCategory,
      required final String? liveCategoryValue,
      required final String? userAdultStatus,
      required final Object? faultStatus,
      required final Object? blindType,
      required final bool chatActive,
      required final String? chatAvailableGroup,
      required final String? chatAvailableCondition,
      required final int? minFollowerMinute,
      required final bool chatDonationRankingExposure}) = _$LiveStatusImpl;

  factory _LiveStatus.fromJson(Map<String, dynamic> json) =
      _$LiveStatusImpl.fromJson;

  @override
  String get liveTitle;
  @override
  String get status;
  @override
  int get concurrentUserCount;
  @override
  int get accumulateCount;
  @override
  bool get paidPromotion;
  @override
  bool get adult;
  @override
  bool get krOnlyViewing;
  @override
  bool get clipActive;
  @override
  String get chatChannelId;
  @override
  List<String>? get tags;
  @override
  String? get categoryType;
  @override
  String? get liveCategory;
  @override
  String?
      get liveCategoryValue; // required LivePollingStatusJson? livePollingStatusJson,
  @override
  String? get userAdultStatus;
  @override
  Object? get faultStatus;
  @override
  Object? get blindType;
  @override
  bool get chatActive;
  @override
  String? get chatAvailableGroup;
  @override
  String? get chatAvailableCondition;
  @override
  int? get minFollowerMinute;
  @override
  bool get chatDonationRankingExposure;

  /// Create a copy of LiveStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveStatusImplCopyWith<_$LiveStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
