// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_info.dart';

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
  int? get liveId => throw _privateConstructorUsedError;
  String? get liveTitle => throw _privateConstructorUsedError;
  String? get liveImageUrl => throw _privateConstructorUsedError;
  String? get defaultThumbnailImageUrl => throw _privateConstructorUsedError;
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int? get accumulateCount => throw _privateConstructorUsedError;
  String? get openDate => throw _privateConstructorUsedError;
  bool? get adult => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get categoryType => throw _privateConstructorUsedError;
  String? get liveCategory => throw _privateConstructorUsedError;
  String? get liveCategoryValue => throw _privateConstructorUsedError;
  String? get watchPartyTag => throw _privateConstructorUsedError;
  Channel? get channel => throw _privateConstructorUsedError;
  String? get blindType => throw _privateConstructorUsedError;

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
      String? liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      int? accumulateCount,
      String? openDate,
      bool? adult,
      List<String>? tags,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      String? watchPartyTag,
      Channel? channel,
      String? blindType});

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
    Object? liveTitle = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? accumulateCount = freezed,
    Object? openDate = freezed,
    Object? adult = freezed,
    Object? tags = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? watchPartyTag = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
  }) {
    return _then(_value.copyWith(
      liveId: freezed == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      accumulateCount: freezed == accumulateCount
          ? _value.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int?,
      openDate: freezed == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      watchPartyTag: freezed == watchPartyTag
          ? _value.watchPartyTag
          : watchPartyTag // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      blindType: freezed == blindType
          ? _value.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
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
      String? liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      int? accumulateCount,
      String? openDate,
      bool? adult,
      List<String>? tags,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      String? watchPartyTag,
      Channel? channel,
      String? blindType});

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
    Object? liveTitle = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? accumulateCount = freezed,
    Object? openDate = freezed,
    Object? adult = freezed,
    Object? tags = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? watchPartyTag = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
  }) {
    return _then(_$LiveInfoImpl(
      liveId: freezed == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      accumulateCount: freezed == accumulateCount
          ? _value.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int?,
      openDate: freezed == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      watchPartyTag: freezed == watchPartyTag
          ? _value.watchPartyTag
          : watchPartyTag // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      blindType: freezed == blindType
          ? _value.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveInfoImpl implements _LiveInfo {
  const _$LiveInfoImpl(
      {this.liveId,
      this.liveTitle,
      this.liveImageUrl,
      this.defaultThumbnailImageUrl,
      this.concurrentUserCount = 0,
      this.accumulateCount,
      this.openDate,
      this.adult,
      final List<String>? tags,
      this.categoryType,
      this.liveCategory,
      this.liveCategoryValue,
      this.watchPartyTag,
      this.channel,
      this.blindType})
      : _tags = tags;

  factory _$LiveInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveInfoImplFromJson(json);

  @override
  final int? liveId;
  @override
  final String? liveTitle;
  @override
  final String? liveImageUrl;
  @override
  final String? defaultThumbnailImageUrl;
  @override
  @JsonKey()
  final int concurrentUserCount;
  @override
  final int? accumulateCount;
  @override
  final String? openDate;
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

  @override
  final String? categoryType;
  @override
  final String? liveCategory;
  @override
  final String? liveCategoryValue;
  @override
  final String? watchPartyTag;
  @override
  final Channel? channel;
  @override
  final String? blindType;

  @override
  String toString() {
    return 'LiveInfo(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, accumulateCount: $accumulateCount, openDate: $openDate, adult: $adult, tags: $tags, categoryType: $categoryType, liveCategory: $liveCategory, liveCategoryValue: $liveCategoryValue, watchPartyTag: $watchPartyTag, channel: $channel, blindType: $blindType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveInfoImpl &&
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
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
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
      watchPartyTag,
      channel,
      blindType);

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
      {final int? liveId,
      final String? liveTitle,
      final String? liveImageUrl,
      final String? defaultThumbnailImageUrl,
      final int concurrentUserCount,
      final int? accumulateCount,
      final String? openDate,
      final bool? adult,
      final List<String>? tags,
      final String? categoryType,
      final String? liveCategory,
      final String? liveCategoryValue,
      final String? watchPartyTag,
      final Channel? channel,
      final String? blindType}) = _$LiveInfoImpl;

  factory _LiveInfo.fromJson(Map<String, dynamic> json) =
      _$LiveInfoImpl.fromJson;

  @override
  int? get liveId;
  @override
  String? get liveTitle;
  @override
  String? get liveImageUrl;
  @override
  String? get defaultThumbnailImageUrl;
  @override
  int get concurrentUserCount;
  @override
  int? get accumulateCount;
  @override
  String? get openDate;
  @override
  bool? get adult;
  @override
  List<String>? get tags;
  @override
  String? get categoryType;
  @override
  String? get liveCategory;
  @override
  String? get liveCategoryValue;
  @override
  String? get watchPartyTag;
  @override
  Channel? get channel;
  @override
  String? get blindType;

  /// Create a copy of LiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveInfoImplCopyWith<_$LiveInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
