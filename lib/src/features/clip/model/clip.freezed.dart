// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NaverClip {
  String get clipUID;
  String? get videoId;
  String get clipTitle;
  String get ownerChannelId;
  OwnerChannel? get ownerChannel;
  String? get thumbnailImageUrl;
  int get duration;
  bool get adult;
  String? get blindType;
  String? get categoryType;
  String? get clipCategory;
  String? get categoryValue;
  String get createdDate;
  int get readCount;
  RecId? get recId;
  ContentLineage? get contentLineage;
  bool? get privateUserBlock;

  /// Create a copy of NaverClip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NaverClipCopyWith<NaverClip> get copyWith =>
      _$NaverClipCopyWithImpl<NaverClip>(this as NaverClip, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NaverClip &&
            (identical(other.clipUID, clipUID) || other.clipUID == clipUID) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.clipTitle, clipTitle) ||
                other.clipTitle == clipTitle) &&
            (identical(other.ownerChannelId, ownerChannelId) ||
                other.ownerChannelId == ownerChannelId) &&
            (identical(other.ownerChannel, ownerChannel) ||
                other.ownerChannel == ownerChannel) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.clipCategory, clipCategory) ||
                other.clipCategory == clipCategory) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount) &&
            (identical(other.recId, recId) || other.recId == recId) &&
            (identical(other.contentLineage, contentLineage) ||
                other.contentLineage == contentLineage) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clipUID,
      videoId,
      clipTitle,
      ownerChannelId,
      ownerChannel,
      thumbnailImageUrl,
      duration,
      adult,
      blindType,
      categoryType,
      clipCategory,
      categoryValue,
      createdDate,
      readCount,
      recId,
      contentLineage,
      privateUserBlock);

  @override
  String toString() {
    return 'NaverClip(clipUID: $clipUID, videoId: $videoId, clipTitle: $clipTitle, ownerChannelId: $ownerChannelId, ownerChannel: $ownerChannel, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, adult: $adult, blindType: $blindType, categoryType: $categoryType, clipCategory: $clipCategory, categoryValue: $categoryValue, createdDate: $createdDate, readCount: $readCount, recId: $recId, contentLineage: $contentLineage, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $NaverClipCopyWith<$Res> {
  factory $NaverClipCopyWith(NaverClip value, $Res Function(NaverClip) _then) =
      _$NaverClipCopyWithImpl;
  @useResult
  $Res call(
      {String clipUID,
      String? videoId,
      String clipTitle,
      String ownerChannelId,
      OwnerChannel? ownerChannel,
      String? thumbnailImageUrl,
      int duration,
      bool adult,
      String? blindType,
      String? categoryType,
      String? clipCategory,
      String? categoryValue,
      String createdDate,
      int readCount,
      @RecIdConverter() RecId? recId,
      @ContentLineageConverter() ContentLineage? contentLineage,
      bool? privateUserBlock});
}

/// @nodoc
class _$NaverClipCopyWithImpl<$Res> implements $NaverClipCopyWith<$Res> {
  _$NaverClipCopyWithImpl(this._self, this._then);

  final NaverClip _self;
  final $Res Function(NaverClip) _then;

  /// Create a copy of NaverClip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clipUID = null,
    Object? videoId = freezed,
    Object? clipTitle = null,
    Object? ownerChannelId = null,
    Object? ownerChannel = freezed,
    Object? thumbnailImageUrl = freezed,
    Object? duration = null,
    Object? adult = null,
    Object? blindType = freezed,
    Object? categoryType = freezed,
    Object? clipCategory = freezed,
    Object? categoryValue = freezed,
    Object? createdDate = null,
    Object? readCount = null,
    Object? recId = freezed,
    Object? contentLineage = freezed,
    Object? privateUserBlock = freezed,
  }) {
    return _then(NaverClip(
      clipUID: null == clipUID
          ? _self.clipUID
          : clipUID // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: freezed == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      clipTitle: null == clipTitle
          ? _self.clipTitle
          : clipTitle // ignore: cast_nullable_to_non_nullable
              as String,
      ownerChannelId: null == ownerChannelId
          ? _self.ownerChannelId
          : ownerChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerChannel: freezed == ownerChannel
          ? _self.ownerChannel
          : ownerChannel // ignore: cast_nullable_to_non_nullable
              as OwnerChannel?,
      thumbnailImageUrl: freezed == thumbnailImageUrl
          ? _self.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      adult: null == adult
          ? _self.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      blindType: freezed == blindType
          ? _self.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryType: freezed == categoryType
          ? _self.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      clipCategory: freezed == clipCategory
          ? _self.clipCategory
          : clipCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryValue: freezed == categoryValue
          ? _self.categoryValue
          : categoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      readCount: null == readCount
          ? _self.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
      recId: freezed == recId
          ? _self.recId
          : recId // ignore: cast_nullable_to_non_nullable
              as RecId?,
      contentLineage: freezed == contentLineage
          ? _self.contentLineage
          : contentLineage // ignore: cast_nullable_to_non_nullable
              as ContentLineage?,
      privateUserBlock: freezed == privateUserBlock
          ? _self.privateUserBlock
          : privateUserBlock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$OwnerChannel {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;

  /// Create a copy of OwnerChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OwnerChannelCopyWith<OwnerChannel> get copyWith =>
      _$OwnerChannelCopyWithImpl<OwnerChannel>(
          this as OwnerChannel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OwnerChannel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, channelId, channelName, channelImageUrl, verifiedMark);

  @override
  String toString() {
    return 'OwnerChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark)';
  }
}

/// @nodoc
abstract mixin class $OwnerChannelCopyWith<$Res> {
  factory $OwnerChannelCopyWith(
          OwnerChannel value, $Res Function(OwnerChannel) _then) =
      _$OwnerChannelCopyWithImpl;
  @useResult
  $Res call(
      {String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark});
}

/// @nodoc
class _$OwnerChannelCopyWithImpl<$Res> implements $OwnerChannelCopyWith<$Res> {
  _$OwnerChannelCopyWithImpl(this._self, this._then);

  final OwnerChannel _self;
  final $Res Function(OwnerChannel) _then;

  /// Create a copy of OwnerChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
  }) {
    return _then(OwnerChannel(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _self.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      channelImageUrl: freezed == channelImageUrl
          ? _self.channelImageUrl
          : channelImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _self.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$RecId {
  String? get seedClipUID;
  String? get fromType;
  String? get listType;
  String? get orderType;
  String? get filterType;
  String? get recommendRecId;

  /// Create a copy of RecId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecIdCopyWith<RecId> get copyWith =>
      _$RecIdCopyWithImpl<RecId>(this as RecId, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecId &&
            (identical(other.seedClipUID, seedClipUID) ||
                other.seedClipUID == seedClipUID) &&
            (identical(other.fromType, fromType) ||
                other.fromType == fromType) &&
            (identical(other.listType, listType) ||
                other.listType == listType) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType) &&
            (identical(other.recommendRecId, recommendRecId) ||
                other.recommendRecId == recommendRecId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, seedClipUID, fromType, listType,
      orderType, filterType, recommendRecId);

  @override
  String toString() {
    return 'RecId(seedClipUID: $seedClipUID, fromType: $fromType, listType: $listType, orderType: $orderType, filterType: $filterType, recommendRecId: $recommendRecId)';
  }
}

/// @nodoc
abstract mixin class $RecIdCopyWith<$Res> {
  factory $RecIdCopyWith(RecId value, $Res Function(RecId) _then) =
      _$RecIdCopyWithImpl;
  @useResult
  $Res call(
      {String? seedClipUID,
      String? fromType,
      String? listType,
      String? recommendRecId,
      String? orderType,
      String? filterType});
}

/// @nodoc
class _$RecIdCopyWithImpl<$Res> implements $RecIdCopyWith<$Res> {
  _$RecIdCopyWithImpl(this._self, this._then);

  final RecId _self;
  final $Res Function(RecId) _then;

  /// Create a copy of RecId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seedClipUID = freezed,
    Object? fromType = freezed,
    Object? listType = freezed,
    Object? recommendRecId = freezed,
    Object? orderType = freezed,
    Object? filterType = freezed,
  }) {
    return _then(RecId(
      seedClipUID: freezed == seedClipUID
          ? _self.seedClipUID
          : seedClipUID // ignore: cast_nullable_to_non_nullable
              as String?,
      fromType: freezed == fromType
          ? _self.fromType
          : fromType // ignore: cast_nullable_to_non_nullable
              as String?,
      listType: freezed == listType
          ? _self.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendRecId: freezed == recommendRecId
          ? _self.recommendRecId
          : recommendRecId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderType: freezed == orderType
          ? _self.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String?,
      filterType: freezed == filterType
          ? _self.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ContentLineage {
  String? get contentSource;
  String? get contentType;
  ContentTag? get contentTag;

  /// Create a copy of ContentLineage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentLineageCopyWith<ContentLineage> get copyWith =>
      _$ContentLineageCopyWithImpl<ContentLineage>(
          this as ContentLineage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentLineage &&
            (identical(other.contentSource, contentSource) ||
                other.contentSource == contentSource) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.contentTag, contentTag) ||
                other.contentTag == contentTag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contentSource, contentType, contentTag);

  @override
  String toString() {
    return 'ContentLineage(contentSource: $contentSource, contentType: $contentType, contentTag: $contentTag)';
  }
}

/// @nodoc
abstract mixin class $ContentLineageCopyWith<$Res> {
  factory $ContentLineageCopyWith(
          ContentLineage value, $Res Function(ContentLineage) _then) =
      _$ContentLineageCopyWithImpl;
  @useResult
  $Res call(
      {String? contentSource, String? contentType, ContentTag? contentTag});
}

/// @nodoc
class _$ContentLineageCopyWithImpl<$Res>
    implements $ContentLineageCopyWith<$Res> {
  _$ContentLineageCopyWithImpl(this._self, this._then);

  final ContentLineage _self;
  final $Res Function(ContentLineage) _then;

  /// Create a copy of ContentLineage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentSource = freezed,
    Object? contentType = freezed,
    Object? contentTag = freezed,
  }) {
    return _then(ContentLineage(
      contentSource: freezed == contentSource
          ? _self.contentSource
          : contentSource // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      contentTag: freezed == contentTag
          ? _self.contentTag
          : contentTag // ignore: cast_nullable_to_non_nullable
              as ContentTag?,
    ));
  }
}

/// @nodoc
mixin _$ContentTag {
  String? get internal;
  External? get externalTag;

  /// Create a copy of ContentTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentTagCopyWith<ContentTag> get copyWith =>
      _$ContentTagCopyWithImpl<ContentTag>(this as ContentTag, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentTag &&
            (identical(other.internal, internal) ||
                other.internal == internal) &&
            (identical(other.externalTag, externalTag) ||
                other.externalTag == externalTag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, internal, externalTag);

  @override
  String toString() {
    return 'ContentTag(internal: $internal, externalTag: $externalTag)';
  }
}

/// @nodoc
abstract mixin class $ContentTagCopyWith<$Res> {
  factory $ContentTagCopyWith(
          ContentTag value, $Res Function(ContentTag) _then) =
      _$ContentTagCopyWithImpl;
  @useResult
  $Res call(
      {String? internal, @JsonKey(name: 'external') External? externalTag});
}

/// @nodoc
class _$ContentTagCopyWithImpl<$Res> implements $ContentTagCopyWith<$Res> {
  _$ContentTagCopyWithImpl(this._self, this._then);

  final ContentTag _self;
  final $Res Function(ContentTag) _then;

  /// Create a copy of ContentTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internal = freezed,
    Object? externalTag = freezed,
  }) {
    return _then(ContentTag(
      internal: freezed == internal
          ? _self.internal
          : internal // ignore: cast_nullable_to_non_nullable
              as String?,
      externalTag: freezed == externalTag
          ? _self.externalTag
          : externalTag // ignore: cast_nullable_to_non_nullable
              as External?,
    ));
  }
}

/// @nodoc
mixin _$External {
  String? get rqt;
  String? get apiRequestKey;

  /// Create a copy of External
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExternalCopyWith<External> get copyWith =>
      _$ExternalCopyWithImpl<External>(this as External, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is External &&
            (identical(other.rqt, rqt) || other.rqt == rqt) &&
            (identical(other.apiRequestKey, apiRequestKey) ||
                other.apiRequestKey == apiRequestKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rqt, apiRequestKey);

  @override
  String toString() {
    return 'External(rqt: $rqt, apiRequestKey: $apiRequestKey)';
  }
}

/// @nodoc
abstract mixin class $ExternalCopyWith<$Res> {
  factory $ExternalCopyWith(External value, $Res Function(External) _then) =
      _$ExternalCopyWithImpl;
  @useResult
  $Res call({String? rqt, String? apiRequestKey});
}

/// @nodoc
class _$ExternalCopyWithImpl<$Res> implements $ExternalCopyWith<$Res> {
  _$ExternalCopyWithImpl(this._self, this._then);

  final External _self;
  final $Res Function(External) _then;

  /// Create a copy of External
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rqt = freezed,
    Object? apiRequestKey = freezed,
  }) {
    return _then(External(
      rqt: freezed == rqt
          ? _self.rqt
          : rqt // ignore: cast_nullable_to_non_nullable
              as String?,
      apiRequestKey: freezed == apiRequestKey
          ? _self.apiRequestKey
          : apiRequestKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
