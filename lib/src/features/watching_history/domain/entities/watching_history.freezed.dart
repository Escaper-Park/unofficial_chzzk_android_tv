// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watching_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchingHistoryPage {
  List<WatchingHistoryItem> get items;
  WatchingHistoryCursor? get cursor;
  int get size;

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryPageCopyWith<WatchingHistoryPage> get copyWith =>
      _$WatchingHistoryPageCopyWithImpl<WatchingHistoryPage>(
        this as WatchingHistoryPage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryPage &&
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
    return 'WatchingHistoryPage(items: $items, cursor: $cursor, size: $size)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryPageCopyWith<$Res> {
  factory $WatchingHistoryPageCopyWith(
    WatchingHistoryPage value,
    $Res Function(WatchingHistoryPage) _then,
  ) = _$WatchingHistoryPageCopyWithImpl;
  @useResult
  $Res call({
    List<WatchingHistoryItem> items,
    WatchingHistoryCursor? cursor,
    int size,
  });

  $WatchingHistoryCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$WatchingHistoryPageCopyWithImpl<$Res>
    implements $WatchingHistoryPageCopyWith<$Res> {
  _$WatchingHistoryPageCopyWithImpl(this._self, this._then);

  final WatchingHistoryPage _self;
  final $Res Function(WatchingHistoryPage) _then;

  /// Create a copy of WatchingHistoryPage
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
                  as List<WatchingHistoryItem>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryCursor?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $WatchingHistoryCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryPage].
extension WatchingHistoryPagePatterns on WatchingHistoryPage {
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
    TResult Function(_WatchingHistoryPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPage() when $default != null:
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
    TResult Function(_WatchingHistoryPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPage():
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
    TResult? Function(_WatchingHistoryPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPage() when $default != null:
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
      List<WatchingHistoryItem> items,
      WatchingHistoryCursor? cursor,
      int size,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPage() when $default != null:
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
      List<WatchingHistoryItem> items,
      WatchingHistoryCursor? cursor,
      int size,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPage():
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
      List<WatchingHistoryItem> items,
      WatchingHistoryCursor? cursor,
      int size,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPage() when $default != null:
        return $default(_that.items, _that.cursor, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WatchingHistoryPage implements WatchingHistoryPage {
  const _WatchingHistoryPage({
    final List<WatchingHistoryItem> items = const <WatchingHistoryItem>[],
    this.cursor,
    this.size = 0,
  }) : _items = items;

  final List<WatchingHistoryItem> _items;
  @override
  @JsonKey()
  List<WatchingHistoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final WatchingHistoryCursor? cursor;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryPageCopyWith<_WatchingHistoryPage> get copyWith =>
      __$WatchingHistoryPageCopyWithImpl<_WatchingHistoryPage>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryPage &&
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
    return 'WatchingHistoryPage(items: $items, cursor: $cursor, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryPageCopyWith<$Res>
    implements $WatchingHistoryPageCopyWith<$Res> {
  factory _$WatchingHistoryPageCopyWith(
    _WatchingHistoryPage value,
    $Res Function(_WatchingHistoryPage) _then,
  ) = __$WatchingHistoryPageCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<WatchingHistoryItem> items,
    WatchingHistoryCursor? cursor,
    int size,
  });

  @override
  $WatchingHistoryCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$WatchingHistoryPageCopyWithImpl<$Res>
    implements _$WatchingHistoryPageCopyWith<$Res> {
  __$WatchingHistoryPageCopyWithImpl(this._self, this._then);

  final _WatchingHistoryPage _self;
  final $Res Function(_WatchingHistoryPage) _then;

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
  }) {
    return _then(
      _WatchingHistoryPage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<WatchingHistoryItem>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryCursor?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $WatchingHistoryCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc
mixin _$WatchingHistoryCursor {
  int? get lastTime;

  /// Create a copy of WatchingHistoryCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryCursorCopyWith<WatchingHistoryCursor> get copyWith =>
      _$WatchingHistoryCursorCopyWithImpl<WatchingHistoryCursor>(
        this as WatchingHistoryCursor,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryCursor &&
            (identical(other.lastTime, lastTime) ||
                other.lastTime == lastTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastTime);

  @override
  String toString() {
    return 'WatchingHistoryCursor(lastTime: $lastTime)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryCursorCopyWith<$Res> {
  factory $WatchingHistoryCursorCopyWith(
    WatchingHistoryCursor value,
    $Res Function(WatchingHistoryCursor) _then,
  ) = _$WatchingHistoryCursorCopyWithImpl;
  @useResult
  $Res call({int? lastTime});
}

/// @nodoc
class _$WatchingHistoryCursorCopyWithImpl<$Res>
    implements $WatchingHistoryCursorCopyWith<$Res> {
  _$WatchingHistoryCursorCopyWithImpl(this._self, this._then);

  final WatchingHistoryCursor _self;
  final $Res Function(WatchingHistoryCursor) _then;

  /// Create a copy of WatchingHistoryCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lastTime = freezed}) {
    return _then(
      _self.copyWith(
        lastTime: freezed == lastTime
            ? _self.lastTime
            : lastTime // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryCursor].
extension WatchingHistoryCursorPatterns on WatchingHistoryCursor {
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
    TResult Function(_WatchingHistoryCursor value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryCursor() when $default != null:
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
    TResult Function(_WatchingHistoryCursor value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryCursor():
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
    TResult? Function(_WatchingHistoryCursor value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryCursor() when $default != null:
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
    TResult Function(int? lastTime)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryCursor() when $default != null:
        return $default(_that.lastTime);
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
    TResult Function(int? lastTime) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryCursor():
        return $default(_that.lastTime);
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
    TResult? Function(int? lastTime)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryCursor() when $default != null:
        return $default(_that.lastTime);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WatchingHistoryCursor implements WatchingHistoryCursor {
  const _WatchingHistoryCursor({this.lastTime});

  @override
  final int? lastTime;

  /// Create a copy of WatchingHistoryCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryCursorCopyWith<_WatchingHistoryCursor> get copyWith =>
      __$WatchingHistoryCursorCopyWithImpl<_WatchingHistoryCursor>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryCursor &&
            (identical(other.lastTime, lastTime) ||
                other.lastTime == lastTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastTime);

  @override
  String toString() {
    return 'WatchingHistoryCursor(lastTime: $lastTime)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryCursorCopyWith<$Res>
    implements $WatchingHistoryCursorCopyWith<$Res> {
  factory _$WatchingHistoryCursorCopyWith(
    _WatchingHistoryCursor value,
    $Res Function(_WatchingHistoryCursor) _then,
  ) = __$WatchingHistoryCursorCopyWithImpl;
  @override
  @useResult
  $Res call({int? lastTime});
}

/// @nodoc
class __$WatchingHistoryCursorCopyWithImpl<$Res>
    implements _$WatchingHistoryCursorCopyWith<$Res> {
  __$WatchingHistoryCursorCopyWithImpl(this._self, this._then);

  final _WatchingHistoryCursor _self;
  final $Res Function(_WatchingHistoryCursor) _then;

  /// Create a copy of WatchingHistoryCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? lastTime = freezed}) {
    return _then(
      _WatchingHistoryCursor(
        lastTime: freezed == lastTime
            ? _self.lastTime
            : lastTime // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$WatchingHistoryItem {
  String get historyNo;
  String get channelId;
  int get videoNo;
  int get timeline;
  String get contentType;
  String? get date;
  WatchingHistoryVideo? get video;

  /// Create a copy of WatchingHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryItemCopyWith<WatchingHistoryItem> get copyWith =>
      _$WatchingHistoryItemCopyWithImpl<WatchingHistoryItem>(
        this as WatchingHistoryItem,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryItem &&
            (identical(other.historyNo, historyNo) ||
                other.historyNo == historyNo) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.timeline, timeline) ||
                other.timeline == timeline) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    historyNo,
    channelId,
    videoNo,
    timeline,
    contentType,
    date,
    video,
  );

  @override
  String toString() {
    return 'WatchingHistoryItem(historyNo: $historyNo, channelId: $channelId, videoNo: $videoNo, timeline: $timeline, contentType: $contentType, date: $date, video: $video)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryItemCopyWith<$Res> {
  factory $WatchingHistoryItemCopyWith(
    WatchingHistoryItem value,
    $Res Function(WatchingHistoryItem) _then,
  ) = _$WatchingHistoryItemCopyWithImpl;
  @useResult
  $Res call({
    String historyNo,
    String channelId,
    int videoNo,
    int timeline,
    String contentType,
    String? date,
    WatchingHistoryVideo? video,
  });

  $WatchingHistoryVideoCopyWith<$Res>? get video;
}

/// @nodoc
class _$WatchingHistoryItemCopyWithImpl<$Res>
    implements $WatchingHistoryItemCopyWith<$Res> {
  _$WatchingHistoryItemCopyWithImpl(this._self, this._then);

  final WatchingHistoryItem _self;
  final $Res Function(WatchingHistoryItem) _then;

  /// Create a copy of WatchingHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyNo = null,
    Object? channelId = null,
    Object? videoNo = null,
    Object? timeline = null,
    Object? contentType = null,
    Object? date = freezed,
    Object? video = freezed,
  }) {
    return _then(
      _self.copyWith(
        historyNo: null == historyNo
            ? _self.historyNo
            : historyNo // ignore: cast_nullable_to_non_nullable
                  as String,
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        videoNo: null == videoNo
            ? _self.videoNo
            : videoNo // ignore: cast_nullable_to_non_nullable
                  as int,
        timeline: null == timeline
            ? _self.timeline
            : timeline // ignore: cast_nullable_to_non_nullable
                  as int,
        contentType: null == contentType
            ? _self.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as String,
        date: freezed == date
            ? _self.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        video: freezed == video
            ? _self.video
            : video // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryVideo?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryVideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $WatchingHistoryVideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryItem].
extension WatchingHistoryItemPatterns on WatchingHistoryItem {
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
    TResult Function(_WatchingHistoryItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryItem() when $default != null:
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
    TResult Function(_WatchingHistoryItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryItem():
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
    TResult? Function(_WatchingHistoryItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryItem() when $default != null:
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
      String historyNo,
      String channelId,
      int videoNo,
      int timeline,
      String contentType,
      String? date,
      WatchingHistoryVideo? video,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryItem() when $default != null:
        return $default(
          _that.historyNo,
          _that.channelId,
          _that.videoNo,
          _that.timeline,
          _that.contentType,
          _that.date,
          _that.video,
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
      String historyNo,
      String channelId,
      int videoNo,
      int timeline,
      String contentType,
      String? date,
      WatchingHistoryVideo? video,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryItem():
        return $default(
          _that.historyNo,
          _that.channelId,
          _that.videoNo,
          _that.timeline,
          _that.contentType,
          _that.date,
          _that.video,
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
      String historyNo,
      String channelId,
      int videoNo,
      int timeline,
      String contentType,
      String? date,
      WatchingHistoryVideo? video,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryItem() when $default != null:
        return $default(
          _that.historyNo,
          _that.channelId,
          _that.videoNo,
          _that.timeline,
          _that.contentType,
          _that.date,
          _that.video,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WatchingHistoryItem implements WatchingHistoryItem {
  const _WatchingHistoryItem({
    required this.historyNo,
    required this.channelId,
    required this.videoNo,
    required this.timeline,
    required this.contentType,
    this.date,
    this.video,
  });

  @override
  final String historyNo;
  @override
  final String channelId;
  @override
  final int videoNo;
  @override
  final int timeline;
  @override
  final String contentType;
  @override
  final String? date;
  @override
  final WatchingHistoryVideo? video;

  /// Create a copy of WatchingHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryItemCopyWith<_WatchingHistoryItem> get copyWith =>
      __$WatchingHistoryItemCopyWithImpl<_WatchingHistoryItem>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryItem &&
            (identical(other.historyNo, historyNo) ||
                other.historyNo == historyNo) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.timeline, timeline) ||
                other.timeline == timeline) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    historyNo,
    channelId,
    videoNo,
    timeline,
    contentType,
    date,
    video,
  );

  @override
  String toString() {
    return 'WatchingHistoryItem(historyNo: $historyNo, channelId: $channelId, videoNo: $videoNo, timeline: $timeline, contentType: $contentType, date: $date, video: $video)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryItemCopyWith<$Res>
    implements $WatchingHistoryItemCopyWith<$Res> {
  factory _$WatchingHistoryItemCopyWith(
    _WatchingHistoryItem value,
    $Res Function(_WatchingHistoryItem) _then,
  ) = __$WatchingHistoryItemCopyWithImpl;
  @override
  @useResult
  $Res call({
    String historyNo,
    String channelId,
    int videoNo,
    int timeline,
    String contentType,
    String? date,
    WatchingHistoryVideo? video,
  });

  @override
  $WatchingHistoryVideoCopyWith<$Res>? get video;
}

/// @nodoc
class __$WatchingHistoryItemCopyWithImpl<$Res>
    implements _$WatchingHistoryItemCopyWith<$Res> {
  __$WatchingHistoryItemCopyWithImpl(this._self, this._then);

  final _WatchingHistoryItem _self;
  final $Res Function(_WatchingHistoryItem) _then;

  /// Create a copy of WatchingHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? historyNo = null,
    Object? channelId = null,
    Object? videoNo = null,
    Object? timeline = null,
    Object? contentType = null,
    Object? date = freezed,
    Object? video = freezed,
  }) {
    return _then(
      _WatchingHistoryItem(
        historyNo: null == historyNo
            ? _self.historyNo
            : historyNo // ignore: cast_nullable_to_non_nullable
                  as String,
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        videoNo: null == videoNo
            ? _self.videoNo
            : videoNo // ignore: cast_nullable_to_non_nullable
                  as int,
        timeline: null == timeline
            ? _self.timeline
            : timeline // ignore: cast_nullable_to_non_nullable
                  as int,
        contentType: null == contentType
            ? _self.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as String,
        date: freezed == date
            ? _self.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        video: freezed == video
            ? _self.video
            : video // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryVideo?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryVideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $WatchingHistoryVideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

/// @nodoc
mixin _$WatchingHistoryVideo {
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
  WatchingHistoryChannel? get channel;
  String? get blindType;
  int? get watchTimeline;

  /// Create a copy of WatchingHistoryVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryVideoCopyWith<WatchingHistoryVideo> get copyWith =>
      _$WatchingHistoryVideoCopyWithImpl<WatchingHistoryVideo>(
        this as WatchingHistoryVideo,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryVideo &&
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
    return 'WatchingHistoryVideo(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryVideoCopyWith<$Res> {
  factory $WatchingHistoryVideoCopyWith(
    WatchingHistoryVideo value,
    $Res Function(WatchingHistoryVideo) _then,
  ) = _$WatchingHistoryVideoCopyWithImpl;
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
    WatchingHistoryChannel? channel,
    String? blindType,
    int? watchTimeline,
  });

  $WatchingHistoryChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class _$WatchingHistoryVideoCopyWithImpl<$Res>
    implements $WatchingHistoryVideoCopyWith<$Res> {
  _$WatchingHistoryVideoCopyWithImpl(this._self, this._then);

  final WatchingHistoryVideo _self;
  final $Res Function(WatchingHistoryVideo) _then;

  /// Create a copy of WatchingHistoryVideo
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
                  as WatchingHistoryChannel?,
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

  /// Create a copy of WatchingHistoryVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $WatchingHistoryChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryVideo].
extension WatchingHistoryVideoPatterns on WatchingHistoryVideo {
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
    TResult Function(_WatchingHistoryVideo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideo() when $default != null:
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
    TResult Function(_WatchingHistoryVideo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideo():
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
    TResult? Function(_WatchingHistoryVideo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideo() when $default != null:
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
      WatchingHistoryChannel? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideo() when $default != null:
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
      WatchingHistoryChannel? channel,
      String? blindType,
      int? watchTimeline,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideo():
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
      WatchingHistoryChannel? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideo() when $default != null:
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

class _WatchingHistoryVideo implements WatchingHistoryVideo {
  const _WatchingHistoryVideo({
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
  final WatchingHistoryChannel? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;

  /// Create a copy of WatchingHistoryVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryVideoCopyWith<_WatchingHistoryVideo> get copyWith =>
      __$WatchingHistoryVideoCopyWithImpl<_WatchingHistoryVideo>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryVideo &&
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
    return 'WatchingHistoryVideo(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryVideoCopyWith<$Res>
    implements $WatchingHistoryVideoCopyWith<$Res> {
  factory _$WatchingHistoryVideoCopyWith(
    _WatchingHistoryVideo value,
    $Res Function(_WatchingHistoryVideo) _then,
  ) = __$WatchingHistoryVideoCopyWithImpl;
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
    WatchingHistoryChannel? channel,
    String? blindType,
    int? watchTimeline,
  });

  @override
  $WatchingHistoryChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class __$WatchingHistoryVideoCopyWithImpl<$Res>
    implements _$WatchingHistoryVideoCopyWith<$Res> {
  __$WatchingHistoryVideoCopyWithImpl(this._self, this._then);

  final _WatchingHistoryVideo _self;
  final $Res Function(_WatchingHistoryVideo) _then;

  /// Create a copy of WatchingHistoryVideo
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
      _WatchingHistoryVideo(
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
                  as WatchingHistoryChannel?,
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

  /// Create a copy of WatchingHistoryVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $WatchingHistoryChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$WatchingHistoryChannel {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  WatchingHistoryPersonalData? get personalData;

  /// Create a copy of WatchingHistoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelCopyWith<WatchingHistoryChannel> get copyWith =>
      _$WatchingHistoryChannelCopyWithImpl<WatchingHistoryChannel>(
        this as WatchingHistoryChannel,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryChannel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            const DeepCollectionEquality().equals(
              other.activatedChannelBadgeIds,
              activatedChannelBadgeIds,
            ) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    const DeepCollectionEquality().hash(activatedChannelBadgeIds),
    personalData,
  );

  @override
  String toString() {
    return 'WatchingHistoryChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryChannelCopyWith<$Res> {
  factory $WatchingHistoryChannelCopyWith(
    WatchingHistoryChannel value,
    $Res Function(WatchingHistoryChannel) _then,
  ) = _$WatchingHistoryChannelCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    WatchingHistoryPersonalData? personalData,
  });

  $WatchingHistoryPersonalDataCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$WatchingHistoryChannelCopyWithImpl<$Res>
    implements $WatchingHistoryChannelCopyWith<$Res> {
  _$WatchingHistoryChannelCopyWithImpl(this._self, this._then);

  final WatchingHistoryChannel _self;
  final $Res Function(WatchingHistoryChannel) _then;

  /// Create a copy of WatchingHistoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? activatedChannelBadgeIds = null,
    Object? personalData = freezed,
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
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self.activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryPersonalData?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryPersonalDataCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $WatchingHistoryPersonalDataCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryChannel].
extension WatchingHistoryChannelPatterns on WatchingHistoryChannel {
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
    TResult Function(_WatchingHistoryChannel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannel() when $default != null:
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
    TResult Function(_WatchingHistoryChannel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannel():
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
    TResult? Function(_WatchingHistoryChannel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannel() when $default != null:
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
      List<String> activatedChannelBadgeIds,
      WatchingHistoryPersonalData? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannel() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.activatedChannelBadgeIds,
          _that.personalData,
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
      List<String> activatedChannelBadgeIds,
      WatchingHistoryPersonalData? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannel():
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.activatedChannelBadgeIds,
          _that.personalData,
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
      List<String> activatedChannelBadgeIds,
      WatchingHistoryPersonalData? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannel() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.activatedChannelBadgeIds,
          _that.personalData,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WatchingHistoryChannel implements WatchingHistoryChannel {
  const _WatchingHistoryChannel({
    required this.channelId,
    required this.channelName,
    this.channelImageUrl,
    required this.verifiedMark,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;

  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  final bool verifiedMark;
  final List<String> _activatedChannelBadgeIds;
  @override
  @JsonKey()
  List<String> get activatedChannelBadgeIds {
    if (_activatedChannelBadgeIds is EqualUnmodifiableListView)
      return _activatedChannelBadgeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activatedChannelBadgeIds);
  }

  @override
  final WatchingHistoryPersonalData? personalData;

  /// Create a copy of WatchingHistoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryChannelCopyWith<_WatchingHistoryChannel> get copyWith =>
      __$WatchingHistoryChannelCopyWithImpl<_WatchingHistoryChannel>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryChannel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            const DeepCollectionEquality().equals(
              other._activatedChannelBadgeIds,
              _activatedChannelBadgeIds,
            ) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    const DeepCollectionEquality().hash(_activatedChannelBadgeIds),
    personalData,
  );

  @override
  String toString() {
    return 'WatchingHistoryChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryChannelCopyWith<$Res>
    implements $WatchingHistoryChannelCopyWith<$Res> {
  factory _$WatchingHistoryChannelCopyWith(
    _WatchingHistoryChannel value,
    $Res Function(_WatchingHistoryChannel) _then,
  ) = __$WatchingHistoryChannelCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    WatchingHistoryPersonalData? personalData,
  });

  @override
  $WatchingHistoryPersonalDataCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$WatchingHistoryChannelCopyWithImpl<$Res>
    implements _$WatchingHistoryChannelCopyWith<$Res> {
  __$WatchingHistoryChannelCopyWithImpl(this._self, this._then);

  final _WatchingHistoryChannel _self;
  final $Res Function(_WatchingHistoryChannel) _then;

  /// Create a copy of WatchingHistoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? activatedChannelBadgeIds = null,
    Object? personalData = freezed,
  }) {
    return _then(
      _WatchingHistoryChannel(
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
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self._activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryPersonalData?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryPersonalDataCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $WatchingHistoryPersonalDataCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$WatchingHistoryPersonalData {
  bool get following;
  bool get notification;
  String? get followDate;
  bool get privateUserBlock;

  /// Create a copy of WatchingHistoryPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryPersonalDataCopyWith<WatchingHistoryPersonalData>
  get copyWith =>
      _$WatchingHistoryPersonalDataCopyWithImpl<WatchingHistoryPersonalData>(
        this as WatchingHistoryPersonalData,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryPersonalData &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.followDate, followDate) ||
                other.followDate == followDate) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    following,
    notification,
    followDate,
    privateUserBlock,
  );

  @override
  String toString() {
    return 'WatchingHistoryPersonalData(following: $following, notification: $notification, followDate: $followDate, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryPersonalDataCopyWith<$Res> {
  factory $WatchingHistoryPersonalDataCopyWith(
    WatchingHistoryPersonalData value,
    $Res Function(WatchingHistoryPersonalData) _then,
  ) = _$WatchingHistoryPersonalDataCopyWithImpl;
  @useResult
  $Res call({
    bool following,
    bool notification,
    String? followDate,
    bool privateUserBlock,
  });
}

/// @nodoc
class _$WatchingHistoryPersonalDataCopyWithImpl<$Res>
    implements $WatchingHistoryPersonalDataCopyWith<$Res> {
  _$WatchingHistoryPersonalDataCopyWithImpl(this._self, this._then);

  final WatchingHistoryPersonalData _self;
  final $Res Function(WatchingHistoryPersonalData) _then;

  /// Create a copy of WatchingHistoryPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
    Object? privateUserBlock = null,
  }) {
    return _then(
      _self.copyWith(
        following: null == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as bool,
        notification: null == notification
            ? _self.notification
            : notification // ignore: cast_nullable_to_non_nullable
                  as bool,
        followDate: freezed == followDate
            ? _self.followDate
            : followDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryPersonalData].
extension WatchingHistoryPersonalDataPatterns on WatchingHistoryPersonalData {
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
    TResult Function(_WatchingHistoryPersonalData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPersonalData() when $default != null:
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
    TResult Function(_WatchingHistoryPersonalData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPersonalData():
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
    TResult? Function(_WatchingHistoryPersonalData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPersonalData() when $default != null:
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
      bool following,
      bool notification,
      String? followDate,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPersonalData() when $default != null:
        return $default(
          _that.following,
          _that.notification,
          _that.followDate,
          _that.privateUserBlock,
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
      bool following,
      bool notification,
      String? followDate,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPersonalData():
        return $default(
          _that.following,
          _that.notification,
          _that.followDate,
          _that.privateUserBlock,
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
      bool following,
      bool notification,
      String? followDate,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPersonalData() when $default != null:
        return $default(
          _that.following,
          _that.notification,
          _that.followDate,
          _that.privateUserBlock,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WatchingHistoryPersonalData implements WatchingHistoryPersonalData {
  const _WatchingHistoryPersonalData({
    required this.following,
    required this.notification,
    this.followDate,
    required this.privateUserBlock,
  });

  @override
  final bool following;
  @override
  final bool notification;
  @override
  final String? followDate;
  @override
  final bool privateUserBlock;

  /// Create a copy of WatchingHistoryPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryPersonalDataCopyWith<_WatchingHistoryPersonalData>
  get copyWith =>
      __$WatchingHistoryPersonalDataCopyWithImpl<_WatchingHistoryPersonalData>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryPersonalData &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.followDate, followDate) ||
                other.followDate == followDate) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    following,
    notification,
    followDate,
    privateUserBlock,
  );

  @override
  String toString() {
    return 'WatchingHistoryPersonalData(following: $following, notification: $notification, followDate: $followDate, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryPersonalDataCopyWith<$Res>
    implements $WatchingHistoryPersonalDataCopyWith<$Res> {
  factory _$WatchingHistoryPersonalDataCopyWith(
    _WatchingHistoryPersonalData value,
    $Res Function(_WatchingHistoryPersonalData) _then,
  ) = __$WatchingHistoryPersonalDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool following,
    bool notification,
    String? followDate,
    bool privateUserBlock,
  });
}

/// @nodoc
class __$WatchingHistoryPersonalDataCopyWithImpl<$Res>
    implements _$WatchingHistoryPersonalDataCopyWith<$Res> {
  __$WatchingHistoryPersonalDataCopyWithImpl(this._self, this._then);

  final _WatchingHistoryPersonalData _self;
  final $Res Function(_WatchingHistoryPersonalData) _then;

  /// Create a copy of WatchingHistoryPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
    Object? privateUserBlock = null,
  }) {
    return _then(
      _WatchingHistoryPersonalData(
        following: null == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as bool,
        notification: null == notification
            ? _self.notification
            : notification // ignore: cast_nullable_to_non_nullable
                  as bool,
        followDate: freezed == followDate
            ? _self.followDate
            : followDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
