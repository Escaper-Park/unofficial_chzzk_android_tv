// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NaverClip _$NaverClipFromJson(Map<String, dynamic> json) {
  return _NaverClip.fromJson(json);
}

/// @nodoc
mixin _$NaverClip {
  String get clipUID => throw _privateConstructorUsedError;
  String? get videoId => throw _privateConstructorUsedError;
  String get clipTitle => throw _privateConstructorUsedError;
  String get ownerChannelId => throw _privateConstructorUsedError;
  OwnerChannel? get ownerChannel => throw _privateConstructorUsedError;
  String? get thumbnailImageUrl => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  String? get blindType => throw _privateConstructorUsedError;
  String? get categoryType => throw _privateConstructorUsedError;
  String? get clipCategory => throw _privateConstructorUsedError;
  String? get categoryValue => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  int get readCount => throw _privateConstructorUsedError;
  @RecIdConverter()
  RecId? get recId => throw _privateConstructorUsedError;
  @ContentLineageConverter()
  ContentLineage? get contentLineage => throw _privateConstructorUsedError;
  bool? get privateUserBlock => throw _privateConstructorUsedError;

  /// Serializes this NaverClip to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NaverClip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NaverClipCopyWith<NaverClip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaverClipCopyWith<$Res> {
  factory $NaverClipCopyWith(NaverClip value, $Res Function(NaverClip) then) =
      _$NaverClipCopyWithImpl<$Res, NaverClip>;
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

  $OwnerChannelCopyWith<$Res>? get ownerChannel;
  $RecIdCopyWith<$Res>? get recId;
  $ContentLineageCopyWith<$Res>? get contentLineage;
}

/// @nodoc
class _$NaverClipCopyWithImpl<$Res, $Val extends NaverClip>
    implements $NaverClipCopyWith<$Res> {
  _$NaverClipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      clipUID: null == clipUID
          ? _value.clipUID
          : clipUID // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      clipTitle: null == clipTitle
          ? _value.clipTitle
          : clipTitle // ignore: cast_nullable_to_non_nullable
              as String,
      ownerChannelId: null == ownerChannelId
          ? _value.ownerChannelId
          : ownerChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerChannel: freezed == ownerChannel
          ? _value.ownerChannel
          : ownerChannel // ignore: cast_nullable_to_non_nullable
              as OwnerChannel?,
      thumbnailImageUrl: freezed == thumbnailImageUrl
          ? _value.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      blindType: freezed == blindType
          ? _value.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      clipCategory: freezed == clipCategory
          ? _value.clipCategory
          : clipCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryValue: freezed == categoryValue
          ? _value.categoryValue
          : categoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
      recId: freezed == recId
          ? _value.recId
          : recId // ignore: cast_nullable_to_non_nullable
              as RecId?,
      contentLineage: freezed == contentLineage
          ? _value.contentLineage
          : contentLineage // ignore: cast_nullable_to_non_nullable
              as ContentLineage?,
      privateUserBlock: freezed == privateUserBlock
          ? _value.privateUserBlock
          : privateUserBlock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of NaverClip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerChannelCopyWith<$Res>? get ownerChannel {
    if (_value.ownerChannel == null) {
      return null;
    }

    return $OwnerChannelCopyWith<$Res>(_value.ownerChannel!, (value) {
      return _then(_value.copyWith(ownerChannel: value) as $Val);
    });
  }

  /// Create a copy of NaverClip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecIdCopyWith<$Res>? get recId {
    if (_value.recId == null) {
      return null;
    }

    return $RecIdCopyWith<$Res>(_value.recId!, (value) {
      return _then(_value.copyWith(recId: value) as $Val);
    });
  }

  /// Create a copy of NaverClip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentLineageCopyWith<$Res>? get contentLineage {
    if (_value.contentLineage == null) {
      return null;
    }

    return $ContentLineageCopyWith<$Res>(_value.contentLineage!, (value) {
      return _then(_value.copyWith(contentLineage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NaverClipImplCopyWith<$Res>
    implements $NaverClipCopyWith<$Res> {
  factory _$$NaverClipImplCopyWith(
          _$NaverClipImpl value, $Res Function(_$NaverClipImpl) then) =
      __$$NaverClipImplCopyWithImpl<$Res>;
  @override
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

  @override
  $OwnerChannelCopyWith<$Res>? get ownerChannel;
  @override
  $RecIdCopyWith<$Res>? get recId;
  @override
  $ContentLineageCopyWith<$Res>? get contentLineage;
}

/// @nodoc
class __$$NaverClipImplCopyWithImpl<$Res>
    extends _$NaverClipCopyWithImpl<$Res, _$NaverClipImpl>
    implements _$$NaverClipImplCopyWith<$Res> {
  __$$NaverClipImplCopyWithImpl(
      _$NaverClipImpl _value, $Res Function(_$NaverClipImpl) _then)
      : super(_value, _then);

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
    return _then(_$NaverClipImpl(
      clipUID: null == clipUID
          ? _value.clipUID
          : clipUID // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      clipTitle: null == clipTitle
          ? _value.clipTitle
          : clipTitle // ignore: cast_nullable_to_non_nullable
              as String,
      ownerChannelId: null == ownerChannelId
          ? _value.ownerChannelId
          : ownerChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerChannel: freezed == ownerChannel
          ? _value.ownerChannel
          : ownerChannel // ignore: cast_nullable_to_non_nullable
              as OwnerChannel?,
      thumbnailImageUrl: freezed == thumbnailImageUrl
          ? _value.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      blindType: freezed == blindType
          ? _value.blindType
          : blindType // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      clipCategory: freezed == clipCategory
          ? _value.clipCategory
          : clipCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryValue: freezed == categoryValue
          ? _value.categoryValue
          : categoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
      recId: freezed == recId
          ? _value.recId
          : recId // ignore: cast_nullable_to_non_nullable
              as RecId?,
      contentLineage: freezed == contentLineage
          ? _value.contentLineage
          : contentLineage // ignore: cast_nullable_to_non_nullable
              as ContentLineage?,
      privateUserBlock: freezed == privateUserBlock
          ? _value.privateUserBlock
          : privateUserBlock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NaverClipImpl implements _NaverClip {
  const _$NaverClipImpl(
      {required this.clipUID,
      this.videoId,
      required this.clipTitle,
      required this.ownerChannelId,
      this.ownerChannel,
      this.thumbnailImageUrl,
      required this.duration,
      required this.adult,
      this.blindType,
      this.categoryType,
      this.clipCategory,
      this.categoryValue,
      required this.createdDate,
      required this.readCount,
      @RecIdConverter() this.recId,
      @ContentLineageConverter() this.contentLineage,
      this.privateUserBlock});

  factory _$NaverClipImpl.fromJson(Map<String, dynamic> json) =>
      _$$NaverClipImplFromJson(json);

  @override
  final String clipUID;
  @override
  final String? videoId;
  @override
  final String clipTitle;
  @override
  final String ownerChannelId;
  @override
  final OwnerChannel? ownerChannel;
  @override
  final String? thumbnailImageUrl;
  @override
  final int duration;
  @override
  final bool adult;
  @override
  final String? blindType;
  @override
  final String? categoryType;
  @override
  final String? clipCategory;
  @override
  final String? categoryValue;
  @override
  final String createdDate;
  @override
  final int readCount;
  @override
  @RecIdConverter()
  final RecId? recId;
  @override
  @ContentLineageConverter()
  final ContentLineage? contentLineage;
  @override
  final bool? privateUserBlock;

  @override
  String toString() {
    return 'NaverClip(clipUID: $clipUID, videoId: $videoId, clipTitle: $clipTitle, ownerChannelId: $ownerChannelId, ownerChannel: $ownerChannel, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, adult: $adult, blindType: $blindType, categoryType: $categoryType, clipCategory: $clipCategory, categoryValue: $categoryValue, createdDate: $createdDate, readCount: $readCount, recId: $recId, contentLineage: $contentLineage, privateUserBlock: $privateUserBlock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NaverClipImpl &&
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

  /// Create a copy of NaverClip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NaverClipImplCopyWith<_$NaverClipImpl> get copyWith =>
      __$$NaverClipImplCopyWithImpl<_$NaverClipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NaverClipImplToJson(
      this,
    );
  }
}

abstract class _NaverClip implements NaverClip {
  const factory _NaverClip(
      {required final String clipUID,
      final String? videoId,
      required final String clipTitle,
      required final String ownerChannelId,
      final OwnerChannel? ownerChannel,
      final String? thumbnailImageUrl,
      required final int duration,
      required final bool adult,
      final String? blindType,
      final String? categoryType,
      final String? clipCategory,
      final String? categoryValue,
      required final String createdDate,
      required final int readCount,
      @RecIdConverter() final RecId? recId,
      @ContentLineageConverter() final ContentLineage? contentLineage,
      final bool? privateUserBlock}) = _$NaverClipImpl;

  factory _NaverClip.fromJson(Map<String, dynamic> json) =
      _$NaverClipImpl.fromJson;

  @override
  String get clipUID;
  @override
  String? get videoId;
  @override
  String get clipTitle;
  @override
  String get ownerChannelId;
  @override
  OwnerChannel? get ownerChannel;
  @override
  String? get thumbnailImageUrl;
  @override
  int get duration;
  @override
  bool get adult;
  @override
  String? get blindType;
  @override
  String? get categoryType;
  @override
  String? get clipCategory;
  @override
  String? get categoryValue;
  @override
  String get createdDate;
  @override
  int get readCount;
  @override
  @RecIdConverter()
  RecId? get recId;
  @override
  @ContentLineageConverter()
  ContentLineage? get contentLineage;
  @override
  bool? get privateUserBlock;

  /// Create a copy of NaverClip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NaverClipImplCopyWith<_$NaverClipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OwnerChannel _$OwnerChannelFromJson(Map<String, dynamic> json) {
  return _OwnerChannel.fromJson(json);
}

/// @nodoc
mixin _$OwnerChannel {
  String get channelId => throw _privateConstructorUsedError;
  String get channelName => throw _privateConstructorUsedError;
  String? get channelImageUrl => throw _privateConstructorUsedError;
  bool get verifiedMark => throw _privateConstructorUsedError;

  /// Serializes this OwnerChannel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OwnerChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OwnerChannelCopyWith<OwnerChannel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerChannelCopyWith<$Res> {
  factory $OwnerChannelCopyWith(
          OwnerChannel value, $Res Function(OwnerChannel) then) =
      _$OwnerChannelCopyWithImpl<$Res, OwnerChannel>;
  @useResult
  $Res call(
      {String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark});
}

/// @nodoc
class _$OwnerChannelCopyWithImpl<$Res, $Val extends OwnerChannel>
    implements $OwnerChannelCopyWith<$Res> {
  _$OwnerChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      channelImageUrl: freezed == channelImageUrl
          ? _value.channelImageUrl
          : channelImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnerChannelImplCopyWith<$Res>
    implements $OwnerChannelCopyWith<$Res> {
  factory _$$OwnerChannelImplCopyWith(
          _$OwnerChannelImpl value, $Res Function(_$OwnerChannelImpl) then) =
      __$$OwnerChannelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark});
}

/// @nodoc
class __$$OwnerChannelImplCopyWithImpl<$Res>
    extends _$OwnerChannelCopyWithImpl<$Res, _$OwnerChannelImpl>
    implements _$$OwnerChannelImplCopyWith<$Res> {
  __$$OwnerChannelImplCopyWithImpl(
      _$OwnerChannelImpl _value, $Res Function(_$OwnerChannelImpl) _then)
      : super(_value, _then);

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
    return _then(_$OwnerChannelImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      channelImageUrl: freezed == channelImageUrl
          ? _value.channelImageUrl
          : channelImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerChannelImpl implements _OwnerChannel {
  const _$OwnerChannelImpl(
      {required this.channelId,
      required this.channelName,
      this.channelImageUrl,
      required this.verifiedMark});

  factory _$OwnerChannelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerChannelImplFromJson(json);

  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  final bool verifiedMark;

  @override
  String toString() {
    return 'OwnerChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerChannelImpl &&
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

  /// Create a copy of OwnerChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerChannelImplCopyWith<_$OwnerChannelImpl> get copyWith =>
      __$$OwnerChannelImplCopyWithImpl<_$OwnerChannelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerChannelImplToJson(
      this,
    );
  }
}

abstract class _OwnerChannel implements OwnerChannel {
  const factory _OwnerChannel(
      {required final String channelId,
      required final String channelName,
      final String? channelImageUrl,
      required final bool verifiedMark}) = _$OwnerChannelImpl;

  factory _OwnerChannel.fromJson(Map<String, dynamic> json) =
      _$OwnerChannelImpl.fromJson;

  @override
  String get channelId;
  @override
  String get channelName;
  @override
  String? get channelImageUrl;
  @override
  bool get verifiedMark;

  /// Create a copy of OwnerChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OwnerChannelImplCopyWith<_$OwnerChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecId _$RecIdFromJson(Map<String, dynamic> json) {
  return _RecId.fromJson(json);
}

/// @nodoc
mixin _$RecId {
  String? get seedClipUID => throw _privateConstructorUsedError;
  String? get fromType => throw _privateConstructorUsedError;
  String? get listType => throw _privateConstructorUsedError;
  String? get orderType => throw _privateConstructorUsedError;
  String? get filterType => throw _privateConstructorUsedError;
  String? get recommendRecId => throw _privateConstructorUsedError;

  /// Serializes this RecId to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecIdCopyWith<RecId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecIdCopyWith<$Res> {
  factory $RecIdCopyWith(RecId value, $Res Function(RecId) then) =
      _$RecIdCopyWithImpl<$Res, RecId>;
  @useResult
  $Res call(
      {String? seedClipUID,
      String? fromType,
      String? listType,
      String? orderType,
      String? filterType,
      String? recommendRecId});
}

/// @nodoc
class _$RecIdCopyWithImpl<$Res, $Val extends RecId>
    implements $RecIdCopyWith<$Res> {
  _$RecIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seedClipUID = freezed,
    Object? fromType = freezed,
    Object? listType = freezed,
    Object? orderType = freezed,
    Object? filterType = freezed,
    Object? recommendRecId = freezed,
  }) {
    return _then(_value.copyWith(
      seedClipUID: freezed == seedClipUID
          ? _value.seedClipUID
          : seedClipUID // ignore: cast_nullable_to_non_nullable
              as String?,
      fromType: freezed == fromType
          ? _value.fromType
          : fromType // ignore: cast_nullable_to_non_nullable
              as String?,
      listType: freezed == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as String?,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String?,
      filterType: freezed == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendRecId: freezed == recommendRecId
          ? _value.recommendRecId
          : recommendRecId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecIdImplCopyWith<$Res> implements $RecIdCopyWith<$Res> {
  factory _$$RecIdImplCopyWith(
          _$RecIdImpl value, $Res Function(_$RecIdImpl) then) =
      __$$RecIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? seedClipUID,
      String? fromType,
      String? listType,
      String? orderType,
      String? filterType,
      String? recommendRecId});
}

/// @nodoc
class __$$RecIdImplCopyWithImpl<$Res>
    extends _$RecIdCopyWithImpl<$Res, _$RecIdImpl>
    implements _$$RecIdImplCopyWith<$Res> {
  __$$RecIdImplCopyWithImpl(
      _$RecIdImpl _value, $Res Function(_$RecIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seedClipUID = freezed,
    Object? fromType = freezed,
    Object? listType = freezed,
    Object? orderType = freezed,
    Object? filterType = freezed,
    Object? recommendRecId = freezed,
  }) {
    return _then(_$RecIdImpl(
      seedClipUID: freezed == seedClipUID
          ? _value.seedClipUID
          : seedClipUID // ignore: cast_nullable_to_non_nullable
              as String?,
      fromType: freezed == fromType
          ? _value.fromType
          : fromType // ignore: cast_nullable_to_non_nullable
              as String?,
      listType: freezed == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as String?,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String?,
      filterType: freezed == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendRecId: freezed == recommendRecId
          ? _value.recommendRecId
          : recommendRecId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecIdImpl implements _RecId {
  const _$RecIdImpl(
      {this.seedClipUID,
      this.fromType,
      this.listType,
      this.orderType,
      this.filterType,
      this.recommendRecId});

  factory _$RecIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecIdImplFromJson(json);

  @override
  final String? seedClipUID;
  @override
  final String? fromType;
  @override
  final String? listType;
  @override
  final String? orderType;
  @override
  final String? filterType;
  @override
  final String? recommendRecId;

  @override
  String toString() {
    return 'RecId(seedClipUID: $seedClipUID, fromType: $fromType, listType: $listType, orderType: $orderType, filterType: $filterType, recommendRecId: $recommendRecId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecIdImpl &&
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

  /// Create a copy of RecId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecIdImplCopyWith<_$RecIdImpl> get copyWith =>
      __$$RecIdImplCopyWithImpl<_$RecIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecIdImplToJson(
      this,
    );
  }
}

abstract class _RecId implements RecId {
  const factory _RecId(
      {final String? seedClipUID,
      final String? fromType,
      final String? listType,
      final String? orderType,
      final String? filterType,
      final String? recommendRecId}) = _$RecIdImpl;

  factory _RecId.fromJson(Map<String, dynamic> json) = _$RecIdImpl.fromJson;

  @override
  String? get seedClipUID;
  @override
  String? get fromType;
  @override
  String? get listType;
  @override
  String? get orderType;
  @override
  String? get filterType;
  @override
  String? get recommendRecId;

  /// Create a copy of RecId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecIdImplCopyWith<_$RecIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentLineage _$ContentLineageFromJson(Map<String, dynamic> json) {
  return _ContentLineage.fromJson(json);
}

/// @nodoc
mixin _$ContentLineage {
  String? get contentSource => throw _privateConstructorUsedError;
  String? get contentType => throw _privateConstructorUsedError;
  ContentTag? get contentTag => throw _privateConstructorUsedError;

  /// Serializes this ContentLineage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentLineage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentLineageCopyWith<ContentLineage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentLineageCopyWith<$Res> {
  factory $ContentLineageCopyWith(
          ContentLineage value, $Res Function(ContentLineage) then) =
      _$ContentLineageCopyWithImpl<$Res, ContentLineage>;
  @useResult
  $Res call(
      {String? contentSource, String? contentType, ContentTag? contentTag});

  $ContentTagCopyWith<$Res>? get contentTag;
}

/// @nodoc
class _$ContentLineageCopyWithImpl<$Res, $Val extends ContentLineage>
    implements $ContentLineageCopyWith<$Res> {
  _$ContentLineageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentLineage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentSource = freezed,
    Object? contentType = freezed,
    Object? contentTag = freezed,
  }) {
    return _then(_value.copyWith(
      contentSource: freezed == contentSource
          ? _value.contentSource
          : contentSource // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      contentTag: freezed == contentTag
          ? _value.contentTag
          : contentTag // ignore: cast_nullable_to_non_nullable
              as ContentTag?,
    ) as $Val);
  }

  /// Create a copy of ContentLineage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentTagCopyWith<$Res>? get contentTag {
    if (_value.contentTag == null) {
      return null;
    }

    return $ContentTagCopyWith<$Res>(_value.contentTag!, (value) {
      return _then(_value.copyWith(contentTag: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentLineageImplCopyWith<$Res>
    implements $ContentLineageCopyWith<$Res> {
  factory _$$ContentLineageImplCopyWith(_$ContentLineageImpl value,
          $Res Function(_$ContentLineageImpl) then) =
      __$$ContentLineageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? contentSource, String? contentType, ContentTag? contentTag});

  @override
  $ContentTagCopyWith<$Res>? get contentTag;
}

/// @nodoc
class __$$ContentLineageImplCopyWithImpl<$Res>
    extends _$ContentLineageCopyWithImpl<$Res, _$ContentLineageImpl>
    implements _$$ContentLineageImplCopyWith<$Res> {
  __$$ContentLineageImplCopyWithImpl(
      _$ContentLineageImpl _value, $Res Function(_$ContentLineageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentLineage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentSource = freezed,
    Object? contentType = freezed,
    Object? contentTag = freezed,
  }) {
    return _then(_$ContentLineageImpl(
      contentSource: freezed == contentSource
          ? _value.contentSource
          : contentSource // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      contentTag: freezed == contentTag
          ? _value.contentTag
          : contentTag // ignore: cast_nullable_to_non_nullable
              as ContentTag?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentLineageImpl implements _ContentLineage {
  const _$ContentLineageImpl(
      {this.contentSource, this.contentType, this.contentTag});

  factory _$ContentLineageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentLineageImplFromJson(json);

  @override
  final String? contentSource;
  @override
  final String? contentType;
  @override
  final ContentTag? contentTag;

  @override
  String toString() {
    return 'ContentLineage(contentSource: $contentSource, contentType: $contentType, contentTag: $contentTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentLineageImpl &&
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

  /// Create a copy of ContentLineage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentLineageImplCopyWith<_$ContentLineageImpl> get copyWith =>
      __$$ContentLineageImplCopyWithImpl<_$ContentLineageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentLineageImplToJson(
      this,
    );
  }
}

abstract class _ContentLineage implements ContentLineage {
  const factory _ContentLineage(
      {final String? contentSource,
      final String? contentType,
      final ContentTag? contentTag}) = _$ContentLineageImpl;

  factory _ContentLineage.fromJson(Map<String, dynamic> json) =
      _$ContentLineageImpl.fromJson;

  @override
  String? get contentSource;
  @override
  String? get contentType;
  @override
  ContentTag? get contentTag;

  /// Create a copy of ContentLineage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentLineageImplCopyWith<_$ContentLineageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentTag _$ContentTagFromJson(Map<String, dynamic> json) {
  return _ContentTag.fromJson(json);
}

/// @nodoc
mixin _$ContentTag {
  String? get internal => throw _privateConstructorUsedError;
  @JsonKey(name: 'external')
  External? get externalTag => throw _privateConstructorUsedError;

  /// Serializes this ContentTag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentTagCopyWith<ContentTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentTagCopyWith<$Res> {
  factory $ContentTagCopyWith(
          ContentTag value, $Res Function(ContentTag) then) =
      _$ContentTagCopyWithImpl<$Res, ContentTag>;
  @useResult
  $Res call(
      {String? internal, @JsonKey(name: 'external') External? externalTag});

  $ExternalCopyWith<$Res>? get externalTag;
}

/// @nodoc
class _$ContentTagCopyWithImpl<$Res, $Val extends ContentTag>
    implements $ContentTagCopyWith<$Res> {
  _$ContentTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internal = freezed,
    Object? externalTag = freezed,
  }) {
    return _then(_value.copyWith(
      internal: freezed == internal
          ? _value.internal
          : internal // ignore: cast_nullable_to_non_nullable
              as String?,
      externalTag: freezed == externalTag
          ? _value.externalTag
          : externalTag // ignore: cast_nullable_to_non_nullable
              as External?,
    ) as $Val);
  }

  /// Create a copy of ContentTag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExternalCopyWith<$Res>? get externalTag {
    if (_value.externalTag == null) {
      return null;
    }

    return $ExternalCopyWith<$Res>(_value.externalTag!, (value) {
      return _then(_value.copyWith(externalTag: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentTagImplCopyWith<$Res>
    implements $ContentTagCopyWith<$Res> {
  factory _$$ContentTagImplCopyWith(
          _$ContentTagImpl value, $Res Function(_$ContentTagImpl) then) =
      __$$ContentTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? internal, @JsonKey(name: 'external') External? externalTag});

  @override
  $ExternalCopyWith<$Res>? get externalTag;
}

/// @nodoc
class __$$ContentTagImplCopyWithImpl<$Res>
    extends _$ContentTagCopyWithImpl<$Res, _$ContentTagImpl>
    implements _$$ContentTagImplCopyWith<$Res> {
  __$$ContentTagImplCopyWithImpl(
      _$ContentTagImpl _value, $Res Function(_$ContentTagImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internal = freezed,
    Object? externalTag = freezed,
  }) {
    return _then(_$ContentTagImpl(
      internal: freezed == internal
          ? _value.internal
          : internal // ignore: cast_nullable_to_non_nullable
              as String?,
      externalTag: freezed == externalTag
          ? _value.externalTag
          : externalTag // ignore: cast_nullable_to_non_nullable
              as External?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentTagImpl implements _ContentTag {
  const _$ContentTagImpl(
      {this.internal, @JsonKey(name: 'external') this.externalTag});

  factory _$ContentTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentTagImplFromJson(json);

  @override
  final String? internal;
  @override
  @JsonKey(name: 'external')
  final External? externalTag;

  @override
  String toString() {
    return 'ContentTag(internal: $internal, externalTag: $externalTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentTagImpl &&
            (identical(other.internal, internal) ||
                other.internal == internal) &&
            (identical(other.externalTag, externalTag) ||
                other.externalTag == externalTag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, internal, externalTag);

  /// Create a copy of ContentTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentTagImplCopyWith<_$ContentTagImpl> get copyWith =>
      __$$ContentTagImplCopyWithImpl<_$ContentTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentTagImplToJson(
      this,
    );
  }
}

abstract class _ContentTag implements ContentTag {
  const factory _ContentTag(
          {final String? internal,
          @JsonKey(name: 'external') final External? externalTag}) =
      _$ContentTagImpl;

  factory _ContentTag.fromJson(Map<String, dynamic> json) =
      _$ContentTagImpl.fromJson;

  @override
  String? get internal;
  @override
  @JsonKey(name: 'external')
  External? get externalTag;

  /// Create a copy of ContentTag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentTagImplCopyWith<_$ContentTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

External _$ExternalFromJson(Map<String, dynamic> json) {
  return _External.fromJson(json);
}

/// @nodoc
mixin _$External {
  String? get rqt => throw _privateConstructorUsedError;
  String? get apiRequestKey => throw _privateConstructorUsedError;

  /// Serializes this External to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of External
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExternalCopyWith<External> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalCopyWith<$Res> {
  factory $ExternalCopyWith(External value, $Res Function(External) then) =
      _$ExternalCopyWithImpl<$Res, External>;
  @useResult
  $Res call({String? rqt, String? apiRequestKey});
}

/// @nodoc
class _$ExternalCopyWithImpl<$Res, $Val extends External>
    implements $ExternalCopyWith<$Res> {
  _$ExternalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of External
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rqt = freezed,
    Object? apiRequestKey = freezed,
  }) {
    return _then(_value.copyWith(
      rqt: freezed == rqt
          ? _value.rqt
          : rqt // ignore: cast_nullable_to_non_nullable
              as String?,
      apiRequestKey: freezed == apiRequestKey
          ? _value.apiRequestKey
          : apiRequestKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExternalImplCopyWith<$Res>
    implements $ExternalCopyWith<$Res> {
  factory _$$ExternalImplCopyWith(
          _$ExternalImpl value, $Res Function(_$ExternalImpl) then) =
      __$$ExternalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? rqt, String? apiRequestKey});
}

/// @nodoc
class __$$ExternalImplCopyWithImpl<$Res>
    extends _$ExternalCopyWithImpl<$Res, _$ExternalImpl>
    implements _$$ExternalImplCopyWith<$Res> {
  __$$ExternalImplCopyWithImpl(
      _$ExternalImpl _value, $Res Function(_$ExternalImpl) _then)
      : super(_value, _then);

  /// Create a copy of External
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rqt = freezed,
    Object? apiRequestKey = freezed,
  }) {
    return _then(_$ExternalImpl(
      rqt: freezed == rqt
          ? _value.rqt
          : rqt // ignore: cast_nullable_to_non_nullable
              as String?,
      apiRequestKey: freezed == apiRequestKey
          ? _value.apiRequestKey
          : apiRequestKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExternalImpl implements _External {
  const _$ExternalImpl({this.rqt, this.apiRequestKey});

  factory _$ExternalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExternalImplFromJson(json);

  @override
  final String? rqt;
  @override
  final String? apiRequestKey;

  @override
  String toString() {
    return 'External(rqt: $rqt, apiRequestKey: $apiRequestKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExternalImpl &&
            (identical(other.rqt, rqt) || other.rqt == rqt) &&
            (identical(other.apiRequestKey, apiRequestKey) ||
                other.apiRequestKey == apiRequestKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rqt, apiRequestKey);

  /// Create a copy of External
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExternalImplCopyWith<_$ExternalImpl> get copyWith =>
      __$$ExternalImplCopyWithImpl<_$ExternalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExternalImplToJson(
      this,
    );
  }
}

abstract class _External implements External {
  const factory _External({final String? rqt, final String? apiRequestKey}) =
      _$ExternalImpl;

  factory _External.fromJson(Map<String, dynamic> json) =
      _$ExternalImpl.fromJson;

  @override
  String? get rqt;
  @override
  String? get apiRequestKey;

  /// Create a copy of External
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExternalImplCopyWith<_$ExternalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
