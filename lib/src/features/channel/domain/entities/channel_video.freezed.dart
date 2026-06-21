// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelVideoPage {
  List<ChannelVideo> get items;
  int get page;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of ChannelVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelVideoPageCopyWith<ChannelVideoPage> get copyWith =>
      _$ChannelVideoPageCopyWithImpl<ChannelVideoPage>(
        this as ChannelVideoPage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelVideoPage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(items),
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'ChannelVideoPage(items: $items, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $ChannelVideoPageCopyWith<$Res> {
  factory $ChannelVideoPageCopyWith(
    ChannelVideoPage value,
    $Res Function(ChannelVideoPage) _then,
  ) = _$ChannelVideoPageCopyWithImpl;
  @useResult
  $Res call({
    List<ChannelVideo> items,
    int page,
    int size,
    int totalCount,
    int totalPages,
  });
}

/// @nodoc
class _$ChannelVideoPageCopyWithImpl<$Res>
    implements $ChannelVideoPageCopyWith<$Res> {
  _$ChannelVideoPageCopyWithImpl(this._self, this._then);

  final ChannelVideoPage _self;
  final $Res Function(ChannelVideoPage) _then;

  /// Create a copy of ChannelVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<ChannelVideo>,
        page: null == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCount: null == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _self.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ChannelVideoPage].
extension ChannelVideoPagePatterns on ChannelVideoPage {
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
    TResult Function(_ChannelVideoPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoPage() when $default != null:
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
    TResult Function(_ChannelVideoPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoPage():
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
    TResult? Function(_ChannelVideoPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoPage() when $default != null:
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
      List<ChannelVideo> items,
      int page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoPage() when $default != null:
        return $default(
          _that.items,
          _that.page,
          _that.size,
          _that.totalCount,
          _that.totalPages,
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
      List<ChannelVideo> items,
      int page,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoPage():
        return $default(
          _that.items,
          _that.page,
          _that.size,
          _that.totalCount,
          _that.totalPages,
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
      List<ChannelVideo> items,
      int page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoPage() when $default != null:
        return $default(
          _that.items,
          _that.page,
          _that.size,
          _that.totalCount,
          _that.totalPages,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChannelVideoPage implements ChannelVideoPage {
  const _ChannelVideoPage({
    final List<ChannelVideo> items = const <ChannelVideo>[],
    this.page = 0,
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _items = items;

  final List<ChannelVideo> _items;
  @override
  @JsonKey()
  List<ChannelVideo> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of ChannelVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelVideoPageCopyWith<_ChannelVideoPage> get copyWith =>
      __$ChannelVideoPageCopyWithImpl<_ChannelVideoPage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelVideoPage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'ChannelVideoPage(items: $items, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$ChannelVideoPageCopyWith<$Res>
    implements $ChannelVideoPageCopyWith<$Res> {
  factory _$ChannelVideoPageCopyWith(
    _ChannelVideoPage value,
    $Res Function(_ChannelVideoPage) _then,
  ) = __$ChannelVideoPageCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<ChannelVideo> items,
    int page,
    int size,
    int totalCount,
    int totalPages,
  });
}

/// @nodoc
class __$ChannelVideoPageCopyWithImpl<$Res>
    implements _$ChannelVideoPageCopyWith<$Res> {
  __$ChannelVideoPageCopyWithImpl(this._self, this._then);

  final _ChannelVideoPage _self;
  final $Res Function(_ChannelVideoPage) _then;

  /// Create a copy of ChannelVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _ChannelVideoPage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<ChannelVideo>,
        page: null == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCount: null == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _self.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$ChannelVideo {
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
  String? get blindType;
  int? get watchTimeline;

  /// Create a copy of ChannelVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelVideoCopyWith<ChannelVideo> get copyWith =>
      _$ChannelVideoCopyWithImpl<ChannelVideo>(
        this as ChannelVideo,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelVideo &&
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
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline));
  }

  @override
  int get hashCode => Object.hash(
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
    blindType,
    watchTimeline,
  );

  @override
  String toString() {
    return 'ChannelVideo(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class $ChannelVideoCopyWith<$Res> {
  factory $ChannelVideoCopyWith(
    ChannelVideo value,
    $Res Function(ChannelVideo) _then,
  ) = _$ChannelVideoCopyWithImpl;
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
    String? blindType,
    int? watchTimeline,
  });
}

/// @nodoc
class _$ChannelVideoCopyWithImpl<$Res> implements $ChannelVideoCopyWith<$Res> {
  _$ChannelVideoCopyWithImpl(this._self, this._then);

  final ChannelVideo _self;
  final $Res Function(ChannelVideo) _then;

  /// Create a copy of ChannelVideo
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
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
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
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ChannelVideo].
extension ChannelVideoPatterns on ChannelVideo {
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
    TResult Function(_ChannelVideo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelVideo() when $default != null:
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
    TResult Function(_ChannelVideo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideo():
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
    TResult? Function(_ChannelVideo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideo() when $default != null:
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
      String? blindType,
      int? watchTimeline,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelVideo() when $default != null:
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
          _that.blindType,
          _that.watchTimeline,
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
      String? blindType,
      int? watchTimeline,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideo():
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
          _that.blindType,
          _that.watchTimeline,
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
      String? blindType,
      int? watchTimeline,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideo() when $default != null:
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
          _that.blindType,
          _that.watchTimeline,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChannelVideo implements ChannelVideo {
  const _ChannelVideo({
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
    this.blindType,
    this.watchTimeline,
  }) : _tags = tags;

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
  final String? blindType;
  @override
  final int? watchTimeline;

  /// Create a copy of ChannelVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelVideoCopyWith<_ChannelVideo> get copyWith =>
      __$ChannelVideoCopyWithImpl<_ChannelVideo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelVideo &&
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
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline));
  }

  @override
  int get hashCode => Object.hash(
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
    blindType,
    watchTimeline,
  );

  @override
  String toString() {
    return 'ChannelVideo(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class _$ChannelVideoCopyWith<$Res>
    implements $ChannelVideoCopyWith<$Res> {
  factory _$ChannelVideoCopyWith(
    _ChannelVideo value,
    $Res Function(_ChannelVideo) _then,
  ) = __$ChannelVideoCopyWithImpl;
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
    String? blindType,
    int? watchTimeline,
  });
}

/// @nodoc
class __$ChannelVideoCopyWithImpl<$Res>
    implements _$ChannelVideoCopyWith<$Res> {
  __$ChannelVideoCopyWithImpl(this._self, this._then);

  final _ChannelVideo _self;
  final $Res Function(_ChannelVideo) _then;

  /// Create a copy of ChannelVideo
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
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
  }) {
    return _then(
      _ChannelVideo(
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
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}
