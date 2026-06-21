// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveDetail {
  int get liveId;
  String get title;
  String get status;
  String? get thumbnailImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  String? get openDate;
  bool get adult;
  List<String> get tags;
  String? get chatChannelId;
  String? get categoryValue;
  String? get categoryType;
  String? get categoryId;
  String? get livePlaybackJson;
  LiveChannel? get channel;
  String? get userAdultStatus;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;
  bool get timeMachineActive;
  bool get timeMachinePlayback;
  String? get membershipBenefitType;

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
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(
                  other.defaultThumbnailImageUrl,
                  defaultThumbnailImageUrl,
                ) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.livePlaybackJson, livePlaybackJson) ||
                other.livePlaybackJson == livePlaybackJson) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.timeMachinePlayback, timeMachinePlayback) ||
                other.timeMachinePlayback == timeMachinePlayback) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    liveId,
    title,
    status,
    thumbnailImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    openDate,
    adult,
    const DeepCollectionEquality().hash(tags),
    chatChannelId,
    categoryValue,
    categoryType,
    categoryId,
    livePlaybackJson,
    channel,
    userAdultStatus,
    blindType,
    watchPartyTag,
    watchPartyType,
    timeMachineActive,
    timeMachinePlayback,
    membershipBenefitType,
  ]);

  @override
  String toString() {
    return 'LiveDetail(liveId: $liveId, title: $title, status: $status, thumbnailImageUrl: $thumbnailImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, chatChannelId: $chatChannelId, categoryValue: $categoryValue, categoryType: $categoryType, categoryId: $categoryId, livePlaybackJson: $livePlaybackJson, channel: $channel, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, timeMachineActive: $timeMachineActive, timeMachinePlayback: $timeMachinePlayback, membershipBenefitType: $membershipBenefitType)';
  }
}

/// @nodoc
abstract mixin class $LiveDetailCopyWith<$Res> {
  factory $LiveDetailCopyWith(
    LiveDetail value,
    $Res Function(LiveDetail) _then,
  ) = _$LiveDetailCopyWithImpl;
  @useResult
  $Res call({
    int liveId,
    String title,
    String status,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    String? openDate,
    bool adult,
    List<String> tags,
    String? chatChannelId,
    String? categoryValue,
    String? categoryType,
    String? categoryId,
    String? livePlaybackJson,
    LiveChannel? channel,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    bool timeMachineActive,
    bool timeMachinePlayback,
    String? membershipBenefitType,
  });

  $LiveChannelCopyWith<$Res>? get channel;
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
    Object? title = null,
    Object? status = null,
    Object? thumbnailImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? chatChannelId = freezed,
    Object? categoryValue = freezed,
    Object? categoryType = freezed,
    Object? categoryId = freezed,
    Object? livePlaybackJson = freezed,
    Object? channel = freezed,
    Object? userAdultStatus = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? timeMachineActive = null,
    Object? timeMachinePlayback = null,
    Object? membershipBenefitType = freezed,
  }) {
    return _then(
      _self.copyWith(
        liveId: null == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailImageUrl: freezed == thumbnailImageUrl
            ? _self.thumbnailImageUrl
            : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
            ? _self.defaultThumbnailImageUrl
            : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        openDate: freezed == openDate
            ? _self.openDate
            : openDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _self.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        chatChannelId: freezed == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        livePlaybackJson: freezed == livePlaybackJson
            ? _self.livePlaybackJson
            : livePlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as LiveChannel?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyTag: freezed == watchPartyTag
            ? _self.watchPartyTag
            : watchPartyTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyType: freezed == watchPartyType
            ? _self.watchPartyType
            : watchPartyType // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeMachineActive: null == timeMachineActive
            ? _self.timeMachineActive
            : timeMachineActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        timeMachinePlayback: null == timeMachinePlayback
            ? _self.timeMachinePlayback
            : timeMachinePlayback // ignore: cast_nullable_to_non_nullable
                  as bool,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $LiveChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LiveDetail].
extension LiveDetailPatterns on LiveDetail {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LiveDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveDetail() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LiveDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDetail():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LiveDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDetail() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int liveId,
      String title,
      String status,
      String? thumbnailImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? chatChannelId,
      String? categoryValue,
      String? categoryType,
      String? categoryId,
      String? livePlaybackJson,
      LiveChannel? channel,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      bool timeMachineActive,
      bool timeMachinePlayback,
      String? membershipBenefitType,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveDetail() when $default != null:
        return $default(
          _that.liveId,
          _that.title,
          _that.status,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.categoryValue,
          _that.categoryType,
          _that.categoryId,
          _that.livePlaybackJson,
          _that.channel,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.timeMachineActive,
          _that.timeMachinePlayback,
          _that.membershipBenefitType,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int liveId,
      String title,
      String status,
      String? thumbnailImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? chatChannelId,
      String? categoryValue,
      String? categoryType,
      String? categoryId,
      String? livePlaybackJson,
      LiveChannel? channel,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      bool timeMachineActive,
      bool timeMachinePlayback,
      String? membershipBenefitType,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDetail():
        return $default(
          _that.liveId,
          _that.title,
          _that.status,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.categoryValue,
          _that.categoryType,
          _that.categoryId,
          _that.livePlaybackJson,
          _that.channel,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.timeMachineActive,
          _that.timeMachinePlayback,
          _that.membershipBenefitType,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int liveId,
      String title,
      String status,
      String? thumbnailImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? chatChannelId,
      String? categoryValue,
      String? categoryType,
      String? categoryId,
      String? livePlaybackJson,
      LiveChannel? channel,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      bool timeMachineActive,
      bool timeMachinePlayback,
      String? membershipBenefitType,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDetail() when $default != null:
        return $default(
          _that.liveId,
          _that.title,
          _that.status,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.categoryValue,
          _that.categoryType,
          _that.categoryId,
          _that.livePlaybackJson,
          _that.channel,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.timeMachineActive,
          _that.timeMachinePlayback,
          _that.membershipBenefitType,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LiveDetail implements LiveDetail {
  const _LiveDetail({
    required this.liveId,
    required this.title,
    required this.status,
    this.thumbnailImageUrl,
    this.defaultThumbnailImageUrl,
    required this.concurrentUserCount,
    this.openDate,
    required this.adult,
    final List<String> tags = const <String>[],
    this.chatChannelId,
    this.categoryValue,
    this.categoryType,
    this.categoryId,
    this.livePlaybackJson,
    this.channel,
    this.userAdultStatus,
    this.blindType,
    this.watchPartyTag,
    this.watchPartyType,
    this.timeMachineActive = false,
    this.timeMachinePlayback = false,
    this.membershipBenefitType,
  }) : _tags = tags;

  @override
  final int liveId;
  @override
  final String title;
  @override
  final String status;
  @override
  final String? thumbnailImageUrl;
  @override
  final String? defaultThumbnailImageUrl;
  @override
  final int concurrentUserCount;
  @override
  final String? openDate;
  @override
  final bool adult;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? chatChannelId;
  @override
  final String? categoryValue;
  @override
  final String? categoryType;
  @override
  final String? categoryId;
  @override
  final String? livePlaybackJson;
  @override
  final LiveChannel? channel;
  @override
  final String? userAdultStatus;
  @override
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  @override
  @JsonKey()
  final bool timeMachineActive;
  @override
  @JsonKey()
  final bool timeMachinePlayback;
  @override
  final String? membershipBenefitType;

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveDetailCopyWith<_LiveDetail> get copyWith =>
      __$LiveDetailCopyWithImpl<_LiveDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveDetail &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(
                  other.defaultThumbnailImageUrl,
                  defaultThumbnailImageUrl,
                ) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.livePlaybackJson, livePlaybackJson) ||
                other.livePlaybackJson == livePlaybackJson) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.timeMachinePlayback, timeMachinePlayback) ||
                other.timeMachinePlayback == timeMachinePlayback) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    liveId,
    title,
    status,
    thumbnailImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    openDate,
    adult,
    const DeepCollectionEquality().hash(_tags),
    chatChannelId,
    categoryValue,
    categoryType,
    categoryId,
    livePlaybackJson,
    channel,
    userAdultStatus,
    blindType,
    watchPartyTag,
    watchPartyType,
    timeMachineActive,
    timeMachinePlayback,
    membershipBenefitType,
  ]);

  @override
  String toString() {
    return 'LiveDetail(liveId: $liveId, title: $title, status: $status, thumbnailImageUrl: $thumbnailImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, chatChannelId: $chatChannelId, categoryValue: $categoryValue, categoryType: $categoryType, categoryId: $categoryId, livePlaybackJson: $livePlaybackJson, channel: $channel, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, timeMachineActive: $timeMachineActive, timeMachinePlayback: $timeMachinePlayback, membershipBenefitType: $membershipBenefitType)';
  }
}

/// @nodoc
abstract mixin class _$LiveDetailCopyWith<$Res>
    implements $LiveDetailCopyWith<$Res> {
  factory _$LiveDetailCopyWith(
    _LiveDetail value,
    $Res Function(_LiveDetail) _then,
  ) = __$LiveDetailCopyWithImpl;
  @override
  @useResult
  $Res call({
    int liveId,
    String title,
    String status,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    String? openDate,
    bool adult,
    List<String> tags,
    String? chatChannelId,
    String? categoryValue,
    String? categoryType,
    String? categoryId,
    String? livePlaybackJson,
    LiveChannel? channel,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    bool timeMachineActive,
    bool timeMachinePlayback,
    String? membershipBenefitType,
  });

  @override
  $LiveChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class __$LiveDetailCopyWithImpl<$Res> implements _$LiveDetailCopyWith<$Res> {
  __$LiveDetailCopyWithImpl(this._self, this._then);

  final _LiveDetail _self;
  final $Res Function(_LiveDetail) _then;

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? liveId = null,
    Object? title = null,
    Object? status = null,
    Object? thumbnailImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? chatChannelId = freezed,
    Object? categoryValue = freezed,
    Object? categoryType = freezed,
    Object? categoryId = freezed,
    Object? livePlaybackJson = freezed,
    Object? channel = freezed,
    Object? userAdultStatus = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? timeMachineActive = null,
    Object? timeMachinePlayback = null,
    Object? membershipBenefitType = freezed,
  }) {
    return _then(
      _LiveDetail(
        liveId: null == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailImageUrl: freezed == thumbnailImageUrl
            ? _self.thumbnailImageUrl
            : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
            ? _self.defaultThumbnailImageUrl
            : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        openDate: freezed == openDate
            ? _self.openDate
            : openDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        chatChannelId: freezed == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        livePlaybackJson: freezed == livePlaybackJson
            ? _self.livePlaybackJson
            : livePlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as LiveChannel?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyTag: freezed == watchPartyTag
            ? _self.watchPartyTag
            : watchPartyTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyType: freezed == watchPartyType
            ? _self.watchPartyType
            : watchPartyType // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeMachineActive: null == timeMachineActive
            ? _self.timeMachineActive
            : timeMachineActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        timeMachinePlayback: null == timeMachinePlayback
            ? _self.timeMachinePlayback
            : timeMachinePlayback // ignore: cast_nullable_to_non_nullable
                  as bool,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of LiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $LiveChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}
