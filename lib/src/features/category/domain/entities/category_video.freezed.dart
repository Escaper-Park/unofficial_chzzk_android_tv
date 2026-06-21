// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryVideoPage {
  List<CategoryVideo> get items;
  CategoryVideoCursor? get cursor;
  int get size;

  /// Create a copy of CategoryVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVideoPageCopyWith<CategoryVideoPage> get copyWith =>
      _$CategoryVideoPageCopyWithImpl<CategoryVideoPage>(
        this as CategoryVideoPage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVideoPage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(items),
    cursor,
    size,
  );

  @override
  String toString() {
    return 'CategoryVideoPage(items: $items, cursor: $cursor, size: $size)';
  }
}

/// @nodoc
abstract mixin class $CategoryVideoPageCopyWith<$Res> {
  factory $CategoryVideoPageCopyWith(
    CategoryVideoPage value,
    $Res Function(CategoryVideoPage) _then,
  ) = _$CategoryVideoPageCopyWithImpl;
  @useResult
  $Res call({List<CategoryVideo> items, CategoryVideoCursor? cursor, int size});

  $CategoryVideoCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$CategoryVideoPageCopyWithImpl<$Res>
    implements $CategoryVideoPageCopyWith<$Res> {
  _$CategoryVideoPageCopyWithImpl(this._self, this._then);

  final CategoryVideoPage _self;
  final $Res Function(CategoryVideoPage) _then;

  /// Create a copy of CategoryVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
  }) {
    return _then(
      _self.copyWith(
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CategoryVideo>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CategoryVideoCursor?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVideoCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $CategoryVideoCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryVideoPage].
extension CategoryVideoPagePatterns on CategoryVideoPage {
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
    TResult Function(_CategoryVideoPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPage() when $default != null:
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
    TResult Function(_CategoryVideoPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPage():
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
    TResult? Function(_CategoryVideoPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPage() when $default != null:
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
      List<CategoryVideo> items,
      CategoryVideoCursor? cursor,
      int size,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPage() when $default != null:
        return $default(_that.items, _that.cursor, _that.size);
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
      List<CategoryVideo> items,
      CategoryVideoCursor? cursor,
      int size,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPage():
        return $default(_that.items, _that.cursor, _that.size);
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
      List<CategoryVideo> items,
      CategoryVideoCursor? cursor,
      int size,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPage() when $default != null:
        return $default(_that.items, _that.cursor, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryVideoPage implements CategoryVideoPage {
  const _CategoryVideoPage({
    final List<CategoryVideo> items = const <CategoryVideo>[],
    this.cursor,
    this.size = 0,
  }) : _items = items;

  final List<CategoryVideo> _items;
  @override
  @JsonKey()
  List<CategoryVideo> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CategoryVideoCursor? cursor;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of CategoryVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryVideoPageCopyWith<_CategoryVideoPage> get copyWith =>
      __$CategoryVideoPageCopyWithImpl<_CategoryVideoPage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryVideoPage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    cursor,
    size,
  );

  @override
  String toString() {
    return 'CategoryVideoPage(items: $items, cursor: $cursor, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$CategoryVideoPageCopyWith<$Res>
    implements $CategoryVideoPageCopyWith<$Res> {
  factory _$CategoryVideoPageCopyWith(
    _CategoryVideoPage value,
    $Res Function(_CategoryVideoPage) _then,
  ) = __$CategoryVideoPageCopyWithImpl;
  @override
  @useResult
  $Res call({List<CategoryVideo> items, CategoryVideoCursor? cursor, int size});

  @override
  $CategoryVideoCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$CategoryVideoPageCopyWithImpl<$Res>
    implements _$CategoryVideoPageCopyWith<$Res> {
  __$CategoryVideoPageCopyWithImpl(this._self, this._then);

  final _CategoryVideoPage _self;
  final $Res Function(_CategoryVideoPage) _then;

  /// Create a copy of CategoryVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
  }) {
    return _then(
      _CategoryVideoPage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CategoryVideo>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CategoryVideoCursor?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryVideoPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVideoCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $CategoryVideoCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc
mixin _$CategoryVideoCursor {
  int? get publishDateAt;
  int? get readCount;

  /// Create a copy of CategoryVideoCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVideoCursorCopyWith<CategoryVideoCursor> get copyWith =>
      _$CategoryVideoCursorCopyWithImpl<CategoryVideoCursor>(
        this as CategoryVideoCursor,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVideoCursor &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, publishDateAt, readCount);

  @override
  String toString() {
    return 'CategoryVideoCursor(publishDateAt: $publishDateAt, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class $CategoryVideoCursorCopyWith<$Res> {
  factory $CategoryVideoCursorCopyWith(
    CategoryVideoCursor value,
    $Res Function(CategoryVideoCursor) _then,
  ) = _$CategoryVideoCursorCopyWithImpl;
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class _$CategoryVideoCursorCopyWithImpl<$Res>
    implements $CategoryVideoCursorCopyWith<$Res> {
  _$CategoryVideoCursorCopyWithImpl(this._self, this._then);

  final CategoryVideoCursor _self;
  final $Res Function(CategoryVideoCursor) _then;

  /// Create a copy of CategoryVideoCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? publishDateAt = freezed, Object? readCount = freezed}) {
    return _then(
      _self.copyWith(
        publishDateAt: freezed == publishDateAt
            ? _self.publishDateAt
            : publishDateAt // ignore: cast_nullable_to_non_nullable
                  as int?,
        readCount: freezed == readCount
            ? _self.readCount
            : readCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryVideoCursor].
extension CategoryVideoCursorPatterns on CategoryVideoCursor {
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
    TResult Function(_CategoryVideoCursor value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoCursor() when $default != null:
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
    TResult Function(_CategoryVideoCursor value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoCursor():
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
    TResult? Function(_CategoryVideoCursor value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoCursor() when $default != null:
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
    TResult Function(int? publishDateAt, int? readCount)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoCursor() when $default != null:
        return $default(_that.publishDateAt, _that.readCount);
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
    TResult Function(int? publishDateAt, int? readCount) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoCursor():
        return $default(_that.publishDateAt, _that.readCount);
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
    TResult? Function(int? publishDateAt, int? readCount)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoCursor() when $default != null:
        return $default(_that.publishDateAt, _that.readCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryVideoCursor implements CategoryVideoCursor {
  const _CategoryVideoCursor({this.publishDateAt, this.readCount});

  @override
  final int? publishDateAt;
  @override
  final int? readCount;

  /// Create a copy of CategoryVideoCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryVideoCursorCopyWith<_CategoryVideoCursor> get copyWith =>
      __$CategoryVideoCursorCopyWithImpl<_CategoryVideoCursor>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryVideoCursor &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, publishDateAt, readCount);

  @override
  String toString() {
    return 'CategoryVideoCursor(publishDateAt: $publishDateAt, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class _$CategoryVideoCursorCopyWith<$Res>
    implements $CategoryVideoCursorCopyWith<$Res> {
  factory _$CategoryVideoCursorCopyWith(
    _CategoryVideoCursor value,
    $Res Function(_CategoryVideoCursor) _then,
  ) = __$CategoryVideoCursorCopyWithImpl;
  @override
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class __$CategoryVideoCursorCopyWithImpl<$Res>
    implements _$CategoryVideoCursorCopyWith<$Res> {
  __$CategoryVideoCursorCopyWithImpl(this._self, this._then);

  final _CategoryVideoCursor _self;
  final $Res Function(_CategoryVideoCursor) _then;

  /// Create a copy of CategoryVideoCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? publishDateAt = freezed, Object? readCount = freezed}) {
    return _then(
      _CategoryVideoCursor(
        publishDateAt: freezed == publishDateAt
            ? _self.publishDateAt
            : publishDateAt // ignore: cast_nullable_to_non_nullable
                  as int?,
        readCount: freezed == readCount
            ? _self.readCount
            : readCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$CategoryVideo {
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
  CategoryVideoChannel? get channel;
  String? get blindType;
  int? get watchTimeline;

  /// Create a copy of CategoryVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVideoCopyWith<CategoryVideo> get copyWith =>
      _$CategoryVideoCopyWithImpl<CategoryVideo>(
        this as CategoryVideo,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVideo &&
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
            (identical(other.channel, channel) || other.channel == channel) &&
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
    channel,
    blindType,
    watchTimeline,
  );

  @override
  String toString() {
    return 'CategoryVideo(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class $CategoryVideoCopyWith<$Res> {
  factory $CategoryVideoCopyWith(
    CategoryVideo value,
    $Res Function(CategoryVideo) _then,
  ) = _$CategoryVideoCopyWithImpl;
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
    CategoryVideoChannel? channel,
    String? blindType,
    int? watchTimeline,
  });

  $CategoryVideoChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class _$CategoryVideoCopyWithImpl<$Res>
    implements $CategoryVideoCopyWith<$Res> {
  _$CategoryVideoCopyWithImpl(this._self, this._then);

  final CategoryVideo _self;
  final $Res Function(CategoryVideo) _then;

  /// Create a copy of CategoryVideo
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
    Object? channel = freezed,
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
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as CategoryVideoChannel?,
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

  /// Create a copy of CategoryVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVideoChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $CategoryVideoChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryVideo].
extension CategoryVideoPatterns on CategoryVideo {
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
    TResult Function(_CategoryVideo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideo() when $default != null:
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
    TResult Function(_CategoryVideo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideo():
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
    TResult? Function(_CategoryVideo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideo() when $default != null:
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
      CategoryVideoChannel? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideo() when $default != null:
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
          _that.channel,
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
      CategoryVideoChannel? channel,
      String? blindType,
      int? watchTimeline,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideo():
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
          _that.channel,
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
      CategoryVideoChannel? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideo() when $default != null:
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
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryVideo implements CategoryVideo {
  const _CategoryVideo({
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
    this.adult = false,
    this.livePv = 0,
    final List<String> tags = const <String>[],
    this.channel,
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
  @JsonKey()
  final bool adult;
  @override
  @JsonKey()
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
  final CategoryVideoChannel? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;

  /// Create a copy of CategoryVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryVideoCopyWith<_CategoryVideo> get copyWith =>
      __$CategoryVideoCopyWithImpl<_CategoryVideo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryVideo &&
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
            (identical(other.channel, channel) || other.channel == channel) &&
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
    channel,
    blindType,
    watchTimeline,
  );

  @override
  String toString() {
    return 'CategoryVideo(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class _$CategoryVideoCopyWith<$Res>
    implements $CategoryVideoCopyWith<$Res> {
  factory _$CategoryVideoCopyWith(
    _CategoryVideo value,
    $Res Function(_CategoryVideo) _then,
  ) = __$CategoryVideoCopyWithImpl;
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
    CategoryVideoChannel? channel,
    String? blindType,
    int? watchTimeline,
  });

  @override
  $CategoryVideoChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class __$CategoryVideoCopyWithImpl<$Res>
    implements _$CategoryVideoCopyWith<$Res> {
  __$CategoryVideoCopyWithImpl(this._self, this._then);

  final _CategoryVideo _self;
  final $Res Function(_CategoryVideo) _then;

  /// Create a copy of CategoryVideo
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
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
  }) {
    return _then(
      _CategoryVideo(
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
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as CategoryVideoChannel?,
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

  /// Create a copy of CategoryVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVideoChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $CategoryVideoChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$CategoryVideoChannel {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;

  /// Create a copy of CategoryVideoChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVideoChannelCopyWith<CategoryVideoChannel> get copyWith =>
      _$CategoryVideoChannelCopyWithImpl<CategoryVideoChannel>(
        this as CategoryVideoChannel,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVideoChannel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
  );

  @override
  String toString() {
    return 'CategoryVideoChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark)';
  }
}

/// @nodoc
abstract mixin class $CategoryVideoChannelCopyWith<$Res> {
  factory $CategoryVideoChannelCopyWith(
    CategoryVideoChannel value,
    $Res Function(CategoryVideoChannel) _then,
  ) = _$CategoryVideoChannelCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
  });
}

/// @nodoc
class _$CategoryVideoChannelCopyWithImpl<$Res>
    implements $CategoryVideoChannelCopyWith<$Res> {
  _$CategoryVideoChannelCopyWithImpl(this._self, this._then);

  final CategoryVideoChannel _self;
  final $Res Function(CategoryVideoChannel) _then;

  /// Create a copy of CategoryVideoChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
  }) {
    return _then(
      _self.copyWith(
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryVideoChannel].
extension CategoryVideoChannelPatterns on CategoryVideoChannel {
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
    TResult Function(_CategoryVideoChannel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoChannel() when $default != null:
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
    TResult Function(_CategoryVideoChannel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoChannel():
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
    TResult? Function(_CategoryVideoChannel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoChannel() when $default != null:
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
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoChannel() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
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
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoChannel():
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
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
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoChannel() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryVideoChannel implements CategoryVideoChannel {
  const _CategoryVideoChannel({
    required this.channelId,
    required this.channelName,
    this.channelImageUrl,
    this.verifiedMark = false,
  });

  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  @JsonKey()
  final bool verifiedMark;

  /// Create a copy of CategoryVideoChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryVideoChannelCopyWith<_CategoryVideoChannel> get copyWith =>
      __$CategoryVideoChannelCopyWithImpl<_CategoryVideoChannel>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryVideoChannel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
  );

  @override
  String toString() {
    return 'CategoryVideoChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark)';
  }
}

/// @nodoc
abstract mixin class _$CategoryVideoChannelCopyWith<$Res>
    implements $CategoryVideoChannelCopyWith<$Res> {
  factory _$CategoryVideoChannelCopyWith(
    _CategoryVideoChannel value,
    $Res Function(_CategoryVideoChannel) _then,
  ) = __$CategoryVideoChannelCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
  });
}

/// @nodoc
class __$CategoryVideoChannelCopyWithImpl<$Res>
    implements _$CategoryVideoChannelCopyWith<$Res> {
  __$CategoryVideoChannelCopyWithImpl(this._self, this._then);

  final _CategoryVideoChannel _self;
  final $Res Function(_CategoryVideoChannel) _then;

  /// Create a copy of CategoryVideoChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
  }) {
    return _then(
      _CategoryVideoChannel(
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
      ),
    );
  }
}
