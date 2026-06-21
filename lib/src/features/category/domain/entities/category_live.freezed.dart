// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_live.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryLivePage {
  List<CategoryLive> get items;
  CategoryLiveCursor? get cursor;
  int get size;

  /// Create a copy of CategoryLivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryLivePageCopyWith<CategoryLivePage> get copyWith =>
      _$CategoryLivePageCopyWithImpl<CategoryLivePage>(
        this as CategoryLivePage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryLivePage &&
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
    return 'CategoryLivePage(items: $items, cursor: $cursor, size: $size)';
  }
}

/// @nodoc
abstract mixin class $CategoryLivePageCopyWith<$Res> {
  factory $CategoryLivePageCopyWith(
    CategoryLivePage value,
    $Res Function(CategoryLivePage) _then,
  ) = _$CategoryLivePageCopyWithImpl;
  @useResult
  $Res call({List<CategoryLive> items, CategoryLiveCursor? cursor, int size});

  $CategoryLiveCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$CategoryLivePageCopyWithImpl<$Res>
    implements $CategoryLivePageCopyWith<$Res> {
  _$CategoryLivePageCopyWithImpl(this._self, this._then);

  final CategoryLivePage _self;
  final $Res Function(CategoryLivePage) _then;

  /// Create a copy of CategoryLivePage
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
                  as List<CategoryLive>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CategoryLiveCursor?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryLivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLiveCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $CategoryLiveCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryLivePage].
extension CategoryLivePagePatterns on CategoryLivePage {
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
    TResult Function(_CategoryLivePage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePage() when $default != null:
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
    TResult Function(_CategoryLivePage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePage():
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
    TResult? Function(_CategoryLivePage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePage() when $default != null:
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
      List<CategoryLive> items,
      CategoryLiveCursor? cursor,
      int size,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePage() when $default != null:
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
      List<CategoryLive> items,
      CategoryLiveCursor? cursor,
      int size,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePage():
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
      List<CategoryLive> items,
      CategoryLiveCursor? cursor,
      int size,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePage() when $default != null:
        return $default(_that.items, _that.cursor, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryLivePage implements CategoryLivePage {
  const _CategoryLivePage({
    final List<CategoryLive> items = const <CategoryLive>[],
    this.cursor,
    this.size = 0,
  }) : _items = items;

  final List<CategoryLive> _items;
  @override
  @JsonKey()
  List<CategoryLive> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CategoryLiveCursor? cursor;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of CategoryLivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryLivePageCopyWith<_CategoryLivePage> get copyWith =>
      __$CategoryLivePageCopyWithImpl<_CategoryLivePage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryLivePage &&
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
    return 'CategoryLivePage(items: $items, cursor: $cursor, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$CategoryLivePageCopyWith<$Res>
    implements $CategoryLivePageCopyWith<$Res> {
  factory _$CategoryLivePageCopyWith(
    _CategoryLivePage value,
    $Res Function(_CategoryLivePage) _then,
  ) = __$CategoryLivePageCopyWithImpl;
  @override
  @useResult
  $Res call({List<CategoryLive> items, CategoryLiveCursor? cursor, int size});

  @override
  $CategoryLiveCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$CategoryLivePageCopyWithImpl<$Res>
    implements _$CategoryLivePageCopyWith<$Res> {
  __$CategoryLivePageCopyWithImpl(this._self, this._then);

  final _CategoryLivePage _self;
  final $Res Function(_CategoryLivePage) _then;

  /// Create a copy of CategoryLivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
  }) {
    return _then(
      _CategoryLivePage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CategoryLive>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CategoryLiveCursor?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryLivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLiveCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $CategoryLiveCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc
mixin _$CategoryLiveCursor {
  int? get concurrentUserCount;
  int? get liveId;

  /// Create a copy of CategoryLiveCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryLiveCursorCopyWith<CategoryLiveCursor> get copyWith =>
      _$CategoryLiveCursorCopyWithImpl<CategoryLiveCursor>(
        this as CategoryLiveCursor,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryLiveCursor &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'CategoryLiveCursor(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class $CategoryLiveCursorCopyWith<$Res> {
  factory $CategoryLiveCursorCopyWith(
    CategoryLiveCursor value,
    $Res Function(CategoryLiveCursor) _then,
  ) = _$CategoryLiveCursorCopyWithImpl;
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class _$CategoryLiveCursorCopyWithImpl<$Res>
    implements $CategoryLiveCursorCopyWith<$Res> {
  _$CategoryLiveCursorCopyWithImpl(this._self, this._then);

  final CategoryLiveCursor _self;
  final $Res Function(CategoryLiveCursor) _then;

  /// Create a copy of CategoryLiveCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? concurrentUserCount = freezed, Object? liveId = freezed}) {
    return _then(
      _self.copyWith(
        concurrentUserCount: freezed == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryLiveCursor].
extension CategoryLiveCursorPatterns on CategoryLiveCursor {
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
    TResult Function(_CategoryLiveCursor value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveCursor() when $default != null:
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
    TResult Function(_CategoryLiveCursor value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveCursor():
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
    TResult? Function(_CategoryLiveCursor value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveCursor() when $default != null:
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
    TResult Function(int? concurrentUserCount, int? liveId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveCursor() when $default != null:
        return $default(_that.concurrentUserCount, _that.liveId);
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
    TResult Function(int? concurrentUserCount, int? liveId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveCursor():
        return $default(_that.concurrentUserCount, _that.liveId);
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
    TResult? Function(int? concurrentUserCount, int? liveId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveCursor() when $default != null:
        return $default(_that.concurrentUserCount, _that.liveId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryLiveCursor implements CategoryLiveCursor {
  const _CategoryLiveCursor({this.concurrentUserCount, this.liveId});

  @override
  final int? concurrentUserCount;
  @override
  final int? liveId;

  /// Create a copy of CategoryLiveCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryLiveCursorCopyWith<_CategoryLiveCursor> get copyWith =>
      __$CategoryLiveCursorCopyWithImpl<_CategoryLiveCursor>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryLiveCursor &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'CategoryLiveCursor(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class _$CategoryLiveCursorCopyWith<$Res>
    implements $CategoryLiveCursorCopyWith<$Res> {
  factory _$CategoryLiveCursorCopyWith(
    _CategoryLiveCursor value,
    $Res Function(_CategoryLiveCursor) _then,
  ) = __$CategoryLiveCursorCopyWithImpl;
  @override
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class __$CategoryLiveCursorCopyWithImpl<$Res>
    implements _$CategoryLiveCursorCopyWith<$Res> {
  __$CategoryLiveCursorCopyWithImpl(this._self, this._then);

  final _CategoryLiveCursor _self;
  final $Res Function(_CategoryLiveCursor) _then;

  /// Create a copy of CategoryLiveCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? concurrentUserCount = freezed, Object? liveId = freezed}) {
    return _then(
      _CategoryLiveCursor(
        concurrentUserCount: freezed == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$CategoryLive {
  int get liveId;
  String get title;
  String? get thumbnailImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  String? get openDate;
  bool get adult;
  List<String> get tags;
  String? get categoryValue;
  CategoryLiveChannel? get channel;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;

  /// Create a copy of CategoryLive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryLiveCopyWith<CategoryLive> get copyWith =>
      _$CategoryLiveCopyWithImpl<CategoryLive>(
        this as CategoryLive,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryLive &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.title, title) || other.title == title) &&
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
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    liveId,
    title,
    thumbnailImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    openDate,
    adult,
    const DeepCollectionEquality().hash(tags),
    categoryValue,
    channel,
    blindType,
    watchPartyTag,
    watchPartyType,
  );

  @override
  String toString() {
    return 'CategoryLive(liveId: $liveId, title: $title, thumbnailImageUrl: $thumbnailImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, categoryValue: $categoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType)';
  }
}

/// @nodoc
abstract mixin class $CategoryLiveCopyWith<$Res> {
  factory $CategoryLiveCopyWith(
    CategoryLive value,
    $Res Function(CategoryLive) _then,
  ) = _$CategoryLiveCopyWithImpl;
  @useResult
  $Res call({
    int liveId,
    String title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    String? openDate,
    bool adult,
    List<String> tags,
    String? categoryValue,
    CategoryLiveChannel? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
  });

  $CategoryLiveChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class _$CategoryLiveCopyWithImpl<$Res> implements $CategoryLiveCopyWith<$Res> {
  _$CategoryLiveCopyWithImpl(this._self, this._then);

  final CategoryLive _self;
  final $Res Function(CategoryLive) _then;

  /// Create a copy of CategoryLive
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = null,
    Object? title = null,
    Object? thumbnailImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? categoryValue = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
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
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as CategoryLiveChannel?,
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
      ),
    );
  }

  /// Create a copy of CategoryLive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLiveChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $CategoryLiveChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryLive].
extension CategoryLivePatterns on CategoryLive {
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
    TResult Function(_CategoryLive value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLive() when $default != null:
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
    TResult Function(_CategoryLive value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLive():
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
    TResult? Function(_CategoryLive value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLive() when $default != null:
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
      String? thumbnailImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? categoryValue,
      CategoryLiveChannel? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLive() when $default != null:
        return $default(
          _that.liveId,
          _that.title,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.categoryValue,
          _that.channel,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
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
      String? thumbnailImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? categoryValue,
      CategoryLiveChannel? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLive():
        return $default(
          _that.liveId,
          _that.title,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.categoryValue,
          _that.channel,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
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
      String? thumbnailImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? categoryValue,
      CategoryLiveChannel? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLive() when $default != null:
        return $default(
          _that.liveId,
          _that.title,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.categoryValue,
          _that.channel,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryLive implements CategoryLive {
  const _CategoryLive({
    required this.liveId,
    required this.title,
    this.thumbnailImageUrl,
    this.defaultThumbnailImageUrl,
    required this.concurrentUserCount,
    this.openDate,
    this.adult = false,
    final List<String> tags = const <String>[],
    this.categoryValue,
    this.channel,
    this.blindType,
    this.watchPartyTag,
    this.watchPartyType,
  }) : _tags = tags;

  @override
  final int liveId;
  @override
  final String title;
  @override
  final String? thumbnailImageUrl;
  @override
  final String? defaultThumbnailImageUrl;
  @override
  final int concurrentUserCount;
  @override
  final String? openDate;
  @override
  @JsonKey()
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
  final String? categoryValue;
  @override
  final CategoryLiveChannel? channel;
  @override
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;

  /// Create a copy of CategoryLive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryLiveCopyWith<_CategoryLive> get copyWith =>
      __$CategoryLiveCopyWithImpl<_CategoryLive>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryLive &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.title, title) || other.title == title) &&
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
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    liveId,
    title,
    thumbnailImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    openDate,
    adult,
    const DeepCollectionEquality().hash(_tags),
    categoryValue,
    channel,
    blindType,
    watchPartyTag,
    watchPartyType,
  );

  @override
  String toString() {
    return 'CategoryLive(liveId: $liveId, title: $title, thumbnailImageUrl: $thumbnailImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, categoryValue: $categoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType)';
  }
}

/// @nodoc
abstract mixin class _$CategoryLiveCopyWith<$Res>
    implements $CategoryLiveCopyWith<$Res> {
  factory _$CategoryLiveCopyWith(
    _CategoryLive value,
    $Res Function(_CategoryLive) _then,
  ) = __$CategoryLiveCopyWithImpl;
  @override
  @useResult
  $Res call({
    int liveId,
    String title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    String? openDate,
    bool adult,
    List<String> tags,
    String? categoryValue,
    CategoryLiveChannel? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
  });

  @override
  $CategoryLiveChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class __$CategoryLiveCopyWithImpl<$Res>
    implements _$CategoryLiveCopyWith<$Res> {
  __$CategoryLiveCopyWithImpl(this._self, this._then);

  final _CategoryLive _self;
  final $Res Function(_CategoryLive) _then;

  /// Create a copy of CategoryLive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? liveId = null,
    Object? title = null,
    Object? thumbnailImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? categoryValue = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
  }) {
    return _then(
      _CategoryLive(
        liveId: null == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
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
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as CategoryLiveChannel?,
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
      ),
    );
  }

  /// Create a copy of CategoryLive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLiveChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $CategoryLiveChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$CategoryLiveChannel {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;

  /// Create a copy of CategoryLiveChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryLiveChannelCopyWith<CategoryLiveChannel> get copyWith =>
      _$CategoryLiveChannelCopyWithImpl<CategoryLiveChannel>(
        this as CategoryLiveChannel,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryLiveChannel &&
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
    return 'CategoryLiveChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark)';
  }
}

/// @nodoc
abstract mixin class $CategoryLiveChannelCopyWith<$Res> {
  factory $CategoryLiveChannelCopyWith(
    CategoryLiveChannel value,
    $Res Function(CategoryLiveChannel) _then,
  ) = _$CategoryLiveChannelCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
  });
}

/// @nodoc
class _$CategoryLiveChannelCopyWithImpl<$Res>
    implements $CategoryLiveChannelCopyWith<$Res> {
  _$CategoryLiveChannelCopyWithImpl(this._self, this._then);

  final CategoryLiveChannel _self;
  final $Res Function(CategoryLiveChannel) _then;

  /// Create a copy of CategoryLiveChannel
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

/// Adds pattern-matching-related methods to [CategoryLiveChannel].
extension CategoryLiveChannelPatterns on CategoryLiveChannel {
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
    TResult Function(_CategoryLiveChannel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveChannel() when $default != null:
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
    TResult Function(_CategoryLiveChannel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveChannel():
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
    TResult? Function(_CategoryLiveChannel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveChannel() when $default != null:
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
      case _CategoryLiveChannel() when $default != null:
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
      case _CategoryLiveChannel():
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
      case _CategoryLiveChannel() when $default != null:
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

class _CategoryLiveChannel implements CategoryLiveChannel {
  const _CategoryLiveChannel({
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

  /// Create a copy of CategoryLiveChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryLiveChannelCopyWith<_CategoryLiveChannel> get copyWith =>
      __$CategoryLiveChannelCopyWithImpl<_CategoryLiveChannel>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryLiveChannel &&
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
    return 'CategoryLiveChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark)';
  }
}

/// @nodoc
abstract mixin class _$CategoryLiveChannelCopyWith<$Res>
    implements $CategoryLiveChannelCopyWith<$Res> {
  factory _$CategoryLiveChannelCopyWith(
    _CategoryLiveChannel value,
    $Res Function(_CategoryLiveChannel) _then,
  ) = __$CategoryLiveChannelCopyWithImpl;
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
class __$CategoryLiveChannelCopyWithImpl<$Res>
    implements _$CategoryLiveChannelCopyWith<$Res> {
  __$CategoryLiveChannelCopyWithImpl(this._self, this._then);

  final _CategoryLiveChannel _self;
  final $Res Function(_CategoryLiveChannel) _then;

  /// Create a copy of CategoryLiveChannel
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
      _CategoryLiveChannel(
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
