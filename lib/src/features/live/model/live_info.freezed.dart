// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveInfo {
  int? get liveId;
  String? get liveTitle;
  String? get liveImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  int? get accumulateCount;
  String? get openDate;
  bool? get adult;
  List<String>? get tags;
  String? get categoryType;
  String? get liveCategory;
  String? get liveCategoryValue;
  String? get watchPartyTag;
  Channel? get channel;
  String? get blindType;

  /// Create a copy of LiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveInfoCopyWith<LiveInfo> get copyWith =>
      _$LiveInfoCopyWithImpl<LiveInfo>(this as LiveInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveInfo &&
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
            const DeepCollectionEquality().equals(other.tags, tags) &&
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
      const DeepCollectionEquality().hash(tags),
      categoryType,
      liveCategory,
      liveCategoryValue,
      watchPartyTag,
      channel,
      blindType);

  @override
  String toString() {
    return 'LiveInfo(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, accumulateCount: $accumulateCount, openDate: $openDate, adult: $adult, tags: $tags, categoryType: $categoryType, liveCategory: $liveCategory, liveCategoryValue: $liveCategoryValue, watchPartyTag: $watchPartyTag, channel: $channel, blindType: $blindType)';
  }
}

/// @nodoc
abstract mixin class $LiveInfoCopyWith<$Res> {
  factory $LiveInfoCopyWith(LiveInfo value, $Res Function(LiveInfo) _then) =
      _$LiveInfoCopyWithImpl;
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
}

/// @nodoc
class _$LiveInfoCopyWithImpl<$Res> implements $LiveInfoCopyWith<$Res> {
  _$LiveInfoCopyWithImpl(this._self, this._then);

  final LiveInfo _self;
  final $Res Function(LiveInfo) _then;

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
    return _then(LiveInfo(
      liveId: freezed == liveId
          ? _self.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int?,
      liveTitle: freezed == liveTitle
          ? _self.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String?,
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
      accumulateCount: freezed == accumulateCount
          ? _self.accumulateCount
          : accumulateCount // ignore: cast_nullable_to_non_nullable
              as int?,
      openDate: freezed == openDate
          ? _self.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: freezed == adult
          ? _self.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      watchPartyTag: freezed == watchPartyTag
          ? _self.watchPartyTag
          : watchPartyTag // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      blindType: freezed == blindType
          ? _self.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
