// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodDetail {
  int get videoNo;
  String? get videoId;
  String get title;
  String get videoType;
  String get publishDate;
  String? get thumbnailImageUrl;
  int get duration;
  int get readCount;
  int get publishDateAt;
  String? get categoryValue;
  bool get adult;
  int get livePv;
  List<String> get tags;
  bool get chapterActive;
  List<VodChapter> get chapters;
  VodChannel? get channel;
  String? get blindType;
  int? get watchTimeline;
  String? get inKey;
  String? get liveOpenDate;
  String? get liveRewindPlaybackJson;
  String? get userAdultStatus;
  bool get videoChatEnabled;
  String? get videoChatChannelId;
  String? get membershipBenefitType;

  /// Create a copy of VodDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodDetailCopyWith<VodDetail> get copyWith =>
      _$VodDetailCopyWithImpl<VodDetail>(this as VodDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodDetail &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.videoType, videoType) ||
                other.videoType == videoType) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount) &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.livePv, livePv) || other.livePv == livePv) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.chapterActive, chapterActive) ||
                other.chapterActive == chapterActive) &&
            const DeepCollectionEquality().equals(other.chapters, chapters) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline) &&
            (identical(other.inKey, inKey) || other.inKey == inKey) &&
            (identical(other.liveOpenDate, liveOpenDate) ||
                other.liveOpenDate == liveOpenDate) &&
            (identical(other.liveRewindPlaybackJson, liveRewindPlaybackJson) ||
                other.liveRewindPlaybackJson == liveRewindPlaybackJson) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.videoChatEnabled, videoChatEnabled) ||
                other.videoChatEnabled == videoChatEnabled) &&
            (identical(other.videoChatChannelId, videoChatChannelId) ||
                other.videoChatChannelId == videoChatChannelId) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    videoNo,
    videoId,
    title,
    videoType,
    publishDate,
    thumbnailImageUrl,
    duration,
    readCount,
    publishDateAt,
    categoryValue,
    adult,
    livePv,
    const DeepCollectionEquality().hash(tags),
    chapterActive,
    const DeepCollectionEquality().hash(chapters),
    channel,
    blindType,
    watchTimeline,
    inKey,
    liveOpenDate,
    liveRewindPlaybackJson,
    userAdultStatus,
    videoChatEnabled,
    videoChatChannelId,
    membershipBenefitType,
  ]);

  @override
  String toString() {
    return 'VodDetail(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, chapterActive: $chapterActive, chapters: $chapters, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline, inKey: $inKey, liveOpenDate: $liveOpenDate, liveRewindPlaybackJson: $liveRewindPlaybackJson, userAdultStatus: $userAdultStatus, videoChatEnabled: $videoChatEnabled, videoChatChannelId: $videoChatChannelId, membershipBenefitType: $membershipBenefitType)';
  }
}

/// @nodoc
abstract mixin class $VodDetailCopyWith<$Res> {
  factory $VodDetailCopyWith(VodDetail value, $Res Function(VodDetail) _then) =
      _$VodDetailCopyWithImpl;
  @useResult
  $Res call({
    int videoNo,
    String? videoId,
    String title,
    String videoType,
    String publishDate,
    String? thumbnailImageUrl,
    int duration,
    int readCount,
    int publishDateAt,
    String? categoryValue,
    bool adult,
    int livePv,
    List<String> tags,
    bool chapterActive,
    List<VodChapter> chapters,
    VodChannel? channel,
    String? blindType,
    int? watchTimeline,
    String? inKey,
    String? liveOpenDate,
    String? liveRewindPlaybackJson,
    String? userAdultStatus,
    bool videoChatEnabled,
    String? videoChatChannelId,
    String? membershipBenefitType,
  });

  $VodChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class _$VodDetailCopyWithImpl<$Res> implements $VodDetailCopyWith<$Res> {
  _$VodDetailCopyWithImpl(this._self, this._then);

  final VodDetail _self;
  final $Res Function(VodDetail) _then;

  /// Create a copy of VodDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? title = null,
    Object? videoType = null,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? duration = null,
    Object? readCount = null,
    Object? publishDateAt = null,
    Object? categoryValue = freezed,
    Object? adult = null,
    Object? livePv = null,
    Object? tags = null,
    Object? chapterActive = null,
    Object? chapters = null,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
    Object? inKey = freezed,
    Object? liveOpenDate = freezed,
    Object? liveRewindPlaybackJson = freezed,
    Object? userAdultStatus = freezed,
    Object? videoChatEnabled = null,
    Object? videoChatChannelId = freezed,
    Object? membershipBenefitType = freezed,
  }) {
    return _then(
      _self.copyWith(
        videoNo: null == videoNo
            ? _self.videoNo
            : videoNo // ignore: cast_nullable_to_non_nullable
                  as int,
        videoId: freezed == videoId
            ? _self.videoId
            : videoId // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        videoType: null == videoType
            ? _self.videoType
            : videoType // ignore: cast_nullable_to_non_nullable
                  as String,
        publishDate: null == publishDate
            ? _self.publishDate
            : publishDate // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailImageUrl: freezed == thumbnailImageUrl
            ? _self.thumbnailImageUrl
            : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        readCount: null == readCount
            ? _self.readCount
            : readCount // ignore: cast_nullable_to_non_nullable
                  as int,
        publishDateAt: null == publishDateAt
            ? _self.publishDateAt
            : publishDateAt // ignore: cast_nullable_to_non_nullable
                  as int,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        livePv: null == livePv
            ? _self.livePv
            : livePv // ignore: cast_nullable_to_non_nullable
                  as int,
        tags: null == tags
            ? _self.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        chapterActive: null == chapterActive
            ? _self.chapterActive
            : chapterActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        chapters: null == chapters
            ? _self.chapters
            : chapters // ignore: cast_nullable_to_non_nullable
                  as List<VodChapter>,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as VodChannel?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
        inKey: freezed == inKey
            ? _self.inKey
            : inKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveOpenDate: freezed == liveOpenDate
            ? _self.liveOpenDate
            : liveOpenDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveRewindPlaybackJson: freezed == liveRewindPlaybackJson
            ? _self.liveRewindPlaybackJson
            : liveRewindPlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoChatEnabled: null == videoChatEnabled
            ? _self.videoChatEnabled
            : videoChatEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        videoChatChannelId: freezed == videoChatChannelId
            ? _self.videoChatChannelId
            : videoChatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of VodDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $VodChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodDetail].
extension VodDetailPatterns on VodDetail {
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
    TResult Function(_VodDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodDetail() when $default != null:
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
    TResult Function(_VodDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDetail():
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
    TResult? Function(_VodDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDetail() when $default != null:
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
      int videoNo,
      String? videoId,
      String title,
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? categoryValue,
      bool adult,
      int livePv,
      List<String> tags,
      bool chapterActive,
      List<VodChapter> chapters,
      VodChannel? channel,
      String? blindType,
      int? watchTimeline,
      String? inKey,
      String? liveOpenDate,
      String? liveRewindPlaybackJson,
      String? userAdultStatus,
      bool videoChatEnabled,
      String? videoChatChannelId,
      String? membershipBenefitType,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodDetail() when $default != null:
        return $default(
          _that.videoNo,
          _that.videoId,
          _that.title,
          _that.videoType,
          _that.publishDate,
          _that.thumbnailImageUrl,
          _that.duration,
          _that.readCount,
          _that.publishDateAt,
          _that.categoryValue,
          _that.adult,
          _that.livePv,
          _that.tags,
          _that.chapterActive,
          _that.chapters,
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
          _that.inKey,
          _that.liveOpenDate,
          _that.liveRewindPlaybackJson,
          _that.userAdultStatus,
          _that.videoChatEnabled,
          _that.videoChatChannelId,
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
      int videoNo,
      String? videoId,
      String title,
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? categoryValue,
      bool adult,
      int livePv,
      List<String> tags,
      bool chapterActive,
      List<VodChapter> chapters,
      VodChannel? channel,
      String? blindType,
      int? watchTimeline,
      String? inKey,
      String? liveOpenDate,
      String? liveRewindPlaybackJson,
      String? userAdultStatus,
      bool videoChatEnabled,
      String? videoChatChannelId,
      String? membershipBenefitType,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDetail():
        return $default(
          _that.videoNo,
          _that.videoId,
          _that.title,
          _that.videoType,
          _that.publishDate,
          _that.thumbnailImageUrl,
          _that.duration,
          _that.readCount,
          _that.publishDateAt,
          _that.categoryValue,
          _that.adult,
          _that.livePv,
          _that.tags,
          _that.chapterActive,
          _that.chapters,
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
          _that.inKey,
          _that.liveOpenDate,
          _that.liveRewindPlaybackJson,
          _that.userAdultStatus,
          _that.videoChatEnabled,
          _that.videoChatChannelId,
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
      int videoNo,
      String? videoId,
      String title,
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? categoryValue,
      bool adult,
      int livePv,
      List<String> tags,
      bool chapterActive,
      List<VodChapter> chapters,
      VodChannel? channel,
      String? blindType,
      int? watchTimeline,
      String? inKey,
      String? liveOpenDate,
      String? liveRewindPlaybackJson,
      String? userAdultStatus,
      bool videoChatEnabled,
      String? videoChatChannelId,
      String? membershipBenefitType,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDetail() when $default != null:
        return $default(
          _that.videoNo,
          _that.videoId,
          _that.title,
          _that.videoType,
          _that.publishDate,
          _that.thumbnailImageUrl,
          _that.duration,
          _that.readCount,
          _that.publishDateAt,
          _that.categoryValue,
          _that.adult,
          _that.livePv,
          _that.tags,
          _that.chapterActive,
          _that.chapters,
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
          _that.inKey,
          _that.liveOpenDate,
          _that.liveRewindPlaybackJson,
          _that.userAdultStatus,
          _that.videoChatEnabled,
          _that.videoChatChannelId,
          _that.membershipBenefitType,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VodDetail implements VodDetail {
  const _VodDetail({
    required this.videoNo,
    this.videoId,
    required this.title,
    required this.videoType,
    required this.publishDate,
    this.thumbnailImageUrl,
    required this.duration,
    required this.readCount,
    required this.publishDateAt,
    this.categoryValue,
    required this.adult,
    required this.livePv,
    final List<String> tags = const <String>[],
    required this.chapterActive,
    final List<VodChapter> chapters = const <VodChapter>[],
    this.channel,
    this.blindType,
    this.watchTimeline,
    this.inKey,
    this.liveOpenDate,
    this.liveRewindPlaybackJson,
    this.userAdultStatus,
    required this.videoChatEnabled,
    this.videoChatChannelId,
    this.membershipBenefitType,
  }) : _tags = tags,
       _chapters = chapters;

  @override
  final int videoNo;
  @override
  final String? videoId;
  @override
  final String title;
  @override
  final String videoType;
  @override
  final String publishDate;
  @override
  final String? thumbnailImageUrl;
  @override
  final int duration;
  @override
  final int readCount;
  @override
  final int publishDateAt;
  @override
  final String? categoryValue;
  @override
  final bool adult;
  @override
  final int livePv;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final bool chapterActive;
  final List<VodChapter> _chapters;
  @override
  @JsonKey()
  List<VodChapter> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  final VodChannel? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;
  @override
  final String? inKey;
  @override
  final String? liveOpenDate;
  @override
  final String? liveRewindPlaybackJson;
  @override
  final String? userAdultStatus;
  @override
  final bool videoChatEnabled;
  @override
  final String? videoChatChannelId;
  @override
  final String? membershipBenefitType;

  /// Create a copy of VodDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodDetailCopyWith<_VodDetail> get copyWith =>
      __$VodDetailCopyWithImpl<_VodDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodDetail &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.videoType, videoType) ||
                other.videoType == videoType) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount) &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.livePv, livePv) || other.livePv == livePv) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.chapterActive, chapterActive) ||
                other.chapterActive == chapterActive) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline) &&
            (identical(other.inKey, inKey) || other.inKey == inKey) &&
            (identical(other.liveOpenDate, liveOpenDate) ||
                other.liveOpenDate == liveOpenDate) &&
            (identical(other.liveRewindPlaybackJson, liveRewindPlaybackJson) ||
                other.liveRewindPlaybackJson == liveRewindPlaybackJson) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.videoChatEnabled, videoChatEnabled) ||
                other.videoChatEnabled == videoChatEnabled) &&
            (identical(other.videoChatChannelId, videoChatChannelId) ||
                other.videoChatChannelId == videoChatChannelId) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    videoNo,
    videoId,
    title,
    videoType,
    publishDate,
    thumbnailImageUrl,
    duration,
    readCount,
    publishDateAt,
    categoryValue,
    adult,
    livePv,
    const DeepCollectionEquality().hash(_tags),
    chapterActive,
    const DeepCollectionEquality().hash(_chapters),
    channel,
    blindType,
    watchTimeline,
    inKey,
    liveOpenDate,
    liveRewindPlaybackJson,
    userAdultStatus,
    videoChatEnabled,
    videoChatChannelId,
    membershipBenefitType,
  ]);

  @override
  String toString() {
    return 'VodDetail(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, chapterActive: $chapterActive, chapters: $chapters, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline, inKey: $inKey, liveOpenDate: $liveOpenDate, liveRewindPlaybackJson: $liveRewindPlaybackJson, userAdultStatus: $userAdultStatus, videoChatEnabled: $videoChatEnabled, videoChatChannelId: $videoChatChannelId, membershipBenefitType: $membershipBenefitType)';
  }
}

/// @nodoc
abstract mixin class _$VodDetailCopyWith<$Res>
    implements $VodDetailCopyWith<$Res> {
  factory _$VodDetailCopyWith(
    _VodDetail value,
    $Res Function(_VodDetail) _then,
  ) = __$VodDetailCopyWithImpl;
  @override
  @useResult
  $Res call({
    int videoNo,
    String? videoId,
    String title,
    String videoType,
    String publishDate,
    String? thumbnailImageUrl,
    int duration,
    int readCount,
    int publishDateAt,
    String? categoryValue,
    bool adult,
    int livePv,
    List<String> tags,
    bool chapterActive,
    List<VodChapter> chapters,
    VodChannel? channel,
    String? blindType,
    int? watchTimeline,
    String? inKey,
    String? liveOpenDate,
    String? liveRewindPlaybackJson,
    String? userAdultStatus,
    bool videoChatEnabled,
    String? videoChatChannelId,
    String? membershipBenefitType,
  });

  @override
  $VodChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class __$VodDetailCopyWithImpl<$Res> implements _$VodDetailCopyWith<$Res> {
  __$VodDetailCopyWithImpl(this._self, this._then);

  final _VodDetail _self;
  final $Res Function(_VodDetail) _then;

  /// Create a copy of VodDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? title = null,
    Object? videoType = null,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? duration = null,
    Object? readCount = null,
    Object? publishDateAt = null,
    Object? categoryValue = freezed,
    Object? adult = null,
    Object? livePv = null,
    Object? tags = null,
    Object? chapterActive = null,
    Object? chapters = null,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
    Object? inKey = freezed,
    Object? liveOpenDate = freezed,
    Object? liveRewindPlaybackJson = freezed,
    Object? userAdultStatus = freezed,
    Object? videoChatEnabled = null,
    Object? videoChatChannelId = freezed,
    Object? membershipBenefitType = freezed,
  }) {
    return _then(
      _VodDetail(
        videoNo: null == videoNo
            ? _self.videoNo
            : videoNo // ignore: cast_nullable_to_non_nullable
                  as int,
        videoId: freezed == videoId
            ? _self.videoId
            : videoId // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        videoType: null == videoType
            ? _self.videoType
            : videoType // ignore: cast_nullable_to_non_nullable
                  as String,
        publishDate: null == publishDate
            ? _self.publishDate
            : publishDate // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailImageUrl: freezed == thumbnailImageUrl
            ? _self.thumbnailImageUrl
            : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        readCount: null == readCount
            ? _self.readCount
            : readCount // ignore: cast_nullable_to_non_nullable
                  as int,
        publishDateAt: null == publishDateAt
            ? _self.publishDateAt
            : publishDateAt // ignore: cast_nullable_to_non_nullable
                  as int,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        livePv: null == livePv
            ? _self.livePv
            : livePv // ignore: cast_nullable_to_non_nullable
                  as int,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        chapterActive: null == chapterActive
            ? _self.chapterActive
            : chapterActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        chapters: null == chapters
            ? _self._chapters
            : chapters // ignore: cast_nullable_to_non_nullable
                  as List<VodChapter>,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as VodChannel?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
        inKey: freezed == inKey
            ? _self.inKey
            : inKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveOpenDate: freezed == liveOpenDate
            ? _self.liveOpenDate
            : liveOpenDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveRewindPlaybackJson: freezed == liveRewindPlaybackJson
            ? _self.liveRewindPlaybackJson
            : liveRewindPlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoChatEnabled: null == videoChatEnabled
            ? _self.videoChatEnabled
            : videoChatEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        videoChatChannelId: freezed == videoChatChannelId
            ? _self.videoChatChannelId
            : videoChatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of VodDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $VodChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$VodChapter {
  String get title;
  int get startTime;
  int get endTime;
  String? get thumbnailUrl;

  /// Create a copy of VodChapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodChapterCopyWith<VodChapter> get copyWith =>
      _$VodChapterCopyWithImpl<VodChapter>(this as VodChapter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodChapter &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, startTime, endTime, thumbnailUrl);

  @override
  String toString() {
    return 'VodChapter(title: $title, startTime: $startTime, endTime: $endTime, thumbnailUrl: $thumbnailUrl)';
  }
}

/// @nodoc
abstract mixin class $VodChapterCopyWith<$Res> {
  factory $VodChapterCopyWith(
    VodChapter value,
    $Res Function(VodChapter) _then,
  ) = _$VodChapterCopyWithImpl;
  @useResult
  $Res call({String title, int startTime, int endTime, String? thumbnailUrl});
}

/// @nodoc
class _$VodChapterCopyWithImpl<$Res> implements $VodChapterCopyWith<$Res> {
  _$VodChapterCopyWithImpl(this._self, this._then);

  final VodChapter _self;
  final $Res Function(VodChapter) _then;

  /// Create a copy of VodChapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _self.copyWith(
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as int,
        endTime: null == endTime
            ? _self.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailUrl: freezed == thumbnailUrl
            ? _self.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodChapter].
extension VodChapterPatterns on VodChapter {
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
    TResult Function(_VodChapter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodChapter() when $default != null:
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
    TResult Function(_VodChapter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChapter():
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
    TResult? Function(_VodChapter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChapter() when $default != null:
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
      String title,
      int startTime,
      int endTime,
      String? thumbnailUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodChapter() when $default != null:
        return $default(
          _that.title,
          _that.startTime,
          _that.endTime,
          _that.thumbnailUrl,
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
      String title,
      int startTime,
      int endTime,
      String? thumbnailUrl,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChapter():
        return $default(
          _that.title,
          _that.startTime,
          _that.endTime,
          _that.thumbnailUrl,
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
      String title,
      int startTime,
      int endTime,
      String? thumbnailUrl,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChapter() when $default != null:
        return $default(
          _that.title,
          _that.startTime,
          _that.endTime,
          _that.thumbnailUrl,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VodChapter implements VodChapter {
  const _VodChapter({
    required this.title,
    required this.startTime,
    required this.endTime,
    this.thumbnailUrl,
  });

  @override
  final String title;
  @override
  final int startTime;
  @override
  final int endTime;
  @override
  final String? thumbnailUrl;

  /// Create a copy of VodChapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodChapterCopyWith<_VodChapter> get copyWith =>
      __$VodChapterCopyWithImpl<_VodChapter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodChapter &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, startTime, endTime, thumbnailUrl);

  @override
  String toString() {
    return 'VodChapter(title: $title, startTime: $startTime, endTime: $endTime, thumbnailUrl: $thumbnailUrl)';
  }
}

/// @nodoc
abstract mixin class _$VodChapterCopyWith<$Res>
    implements $VodChapterCopyWith<$Res> {
  factory _$VodChapterCopyWith(
    _VodChapter value,
    $Res Function(_VodChapter) _then,
  ) = __$VodChapterCopyWithImpl;
  @override
  @useResult
  $Res call({String title, int startTime, int endTime, String? thumbnailUrl});
}

/// @nodoc
class __$VodChapterCopyWithImpl<$Res> implements _$VodChapterCopyWith<$Res> {
  __$VodChapterCopyWithImpl(this._self, this._then);

  final _VodChapter _self;
  final $Res Function(_VodChapter) _then;

  /// Create a copy of VodChapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _VodChapter(
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as int,
        endTime: null == endTime
            ? _self.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailUrl: freezed == thumbnailUrl
            ? _self.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
