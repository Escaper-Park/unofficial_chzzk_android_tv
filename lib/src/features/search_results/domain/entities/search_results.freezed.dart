// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchChannelResultsPage {
  List<SearchChannelResult> get items;
  SearchCursor? get cursor;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of SearchChannelResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelResultsPageCopyWith<SearchChannelResultsPage> get copyWith =>
      _$SearchChannelResultsPageCopyWithImpl<SearchChannelResultsPage>(
        this as SearchChannelResultsPage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannelResultsPage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
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
    cursor,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchChannelResultsPage(items: $items, cursor: $cursor, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelResultsPageCopyWith<$Res> {
  factory $SearchChannelResultsPageCopyWith(
    SearchChannelResultsPage value,
    $Res Function(SearchChannelResultsPage) _then,
  ) = _$SearchChannelResultsPageCopyWithImpl;
  @useResult
  $Res call({
    List<SearchChannelResult> items,
    SearchCursor? cursor,
    int size,
    int totalCount,
    int totalPages,
  });

  $SearchCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$SearchChannelResultsPageCopyWithImpl<$Res>
    implements $SearchChannelResultsPageCopyWith<$Res> {
  _$SearchChannelResultsPageCopyWithImpl(this._self, this._then);

  final SearchChannelResultsPage _self;
  final $Res Function(SearchChannelResultsPage) _then;

  /// Create a copy of SearchChannelResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<SearchChannelResult>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as SearchCursor?,
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

  /// Create a copy of SearchChannelResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $SearchCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchChannelResultsPage].
extension SearchChannelResultsPagePatterns on SearchChannelResultsPage {
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
    TResult Function(_SearchChannelResultsPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultsPage() when $default != null:
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
    TResult Function(_SearchChannelResultsPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultsPage():
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
    TResult? Function(_SearchChannelResultsPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultsPage() when $default != null:
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
      List<SearchChannelResult> items,
      SearchCursor? cursor,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultsPage() when $default != null:
        return $default(
          _that.items,
          _that.cursor,
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
      List<SearchChannelResult> items,
      SearchCursor? cursor,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultsPage():
        return $default(
          _that.items,
          _that.cursor,
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
      List<SearchChannelResult> items,
      SearchCursor? cursor,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultsPage() when $default != null:
        return $default(
          _that.items,
          _that.cursor,
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

class _SearchChannelResultsPage implements SearchChannelResultsPage {
  const _SearchChannelResultsPage({
    final List<SearchChannelResult> items = const <SearchChannelResult>[],
    this.cursor,
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _items = items;

  final List<SearchChannelResult> _items;
  @override
  @JsonKey()
  List<SearchChannelResult> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final SearchCursor? cursor;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of SearchChannelResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelResultsPageCopyWith<_SearchChannelResultsPage> get copyWith =>
      __$SearchChannelResultsPageCopyWithImpl<_SearchChannelResultsPage>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannelResultsPage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
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
    cursor,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchChannelResultsPage(items: $items, cursor: $cursor, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelResultsPageCopyWith<$Res>
    implements $SearchChannelResultsPageCopyWith<$Res> {
  factory _$SearchChannelResultsPageCopyWith(
    _SearchChannelResultsPage value,
    $Res Function(_SearchChannelResultsPage) _then,
  ) = __$SearchChannelResultsPageCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<SearchChannelResult> items,
    SearchCursor? cursor,
    int size,
    int totalCount,
    int totalPages,
  });

  @override
  $SearchCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$SearchChannelResultsPageCopyWithImpl<$Res>
    implements _$SearchChannelResultsPageCopyWith<$Res> {
  __$SearchChannelResultsPageCopyWithImpl(this._self, this._then);

  final _SearchChannelResultsPage _self;
  final $Res Function(_SearchChannelResultsPage) _then;

  /// Create a copy of SearchChannelResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _SearchChannelResultsPage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<SearchChannelResult>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as SearchCursor?,
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

  /// Create a copy of SearchChannelResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $SearchCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc
mixin _$SearchVideoResultsPage {
  List<SearchVideoResult> get items;
  SearchCursor? get cursor;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of SearchVideoResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchVideoResultsPageCopyWith<SearchVideoResultsPage> get copyWith =>
      _$SearchVideoResultsPageCopyWithImpl<SearchVideoResultsPage>(
        this as SearchVideoResultsPage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchVideoResultsPage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
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
    cursor,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchVideoResultsPage(items: $items, cursor: $cursor, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $SearchVideoResultsPageCopyWith<$Res> {
  factory $SearchVideoResultsPageCopyWith(
    SearchVideoResultsPage value,
    $Res Function(SearchVideoResultsPage) _then,
  ) = _$SearchVideoResultsPageCopyWithImpl;
  @useResult
  $Res call({
    List<SearchVideoResult> items,
    SearchCursor? cursor,
    int size,
    int totalCount,
    int totalPages,
  });

  $SearchCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$SearchVideoResultsPageCopyWithImpl<$Res>
    implements $SearchVideoResultsPageCopyWith<$Res> {
  _$SearchVideoResultsPageCopyWithImpl(this._self, this._then);

  final SearchVideoResultsPage _self;
  final $Res Function(SearchVideoResultsPage) _then;

  /// Create a copy of SearchVideoResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideoResult>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as SearchCursor?,
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

  /// Create a copy of SearchVideoResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $SearchCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchVideoResultsPage].
extension SearchVideoResultsPagePatterns on SearchVideoResultsPage {
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
    TResult Function(_SearchVideoResultsPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultsPage() when $default != null:
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
    TResult Function(_SearchVideoResultsPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultsPage():
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
    TResult? Function(_SearchVideoResultsPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultsPage() when $default != null:
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
      List<SearchVideoResult> items,
      SearchCursor? cursor,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultsPage() when $default != null:
        return $default(
          _that.items,
          _that.cursor,
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
      List<SearchVideoResult> items,
      SearchCursor? cursor,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultsPage():
        return $default(
          _that.items,
          _that.cursor,
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
      List<SearchVideoResult> items,
      SearchCursor? cursor,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultsPage() when $default != null:
        return $default(
          _that.items,
          _that.cursor,
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

class _SearchVideoResultsPage implements SearchVideoResultsPage {
  const _SearchVideoResultsPage({
    final List<SearchVideoResult> items = const <SearchVideoResult>[],
    this.cursor,
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _items = items;

  final List<SearchVideoResult> _items;
  @override
  @JsonKey()
  List<SearchVideoResult> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final SearchCursor? cursor;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of SearchVideoResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchVideoResultsPageCopyWith<_SearchVideoResultsPage> get copyWith =>
      __$SearchVideoResultsPageCopyWithImpl<_SearchVideoResultsPage>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchVideoResultsPage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
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
    cursor,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchVideoResultsPage(items: $items, cursor: $cursor, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$SearchVideoResultsPageCopyWith<$Res>
    implements $SearchVideoResultsPageCopyWith<$Res> {
  factory _$SearchVideoResultsPageCopyWith(
    _SearchVideoResultsPage value,
    $Res Function(_SearchVideoResultsPage) _then,
  ) = __$SearchVideoResultsPageCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<SearchVideoResult> items,
    SearchCursor? cursor,
    int size,
    int totalCount,
    int totalPages,
  });

  @override
  $SearchCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$SearchVideoResultsPageCopyWithImpl<$Res>
    implements _$SearchVideoResultsPageCopyWith<$Res> {
  __$SearchVideoResultsPageCopyWithImpl(this._self, this._then);

  final _SearchVideoResultsPage _self;
  final $Res Function(_SearchVideoResultsPage) _then;

  /// Create a copy of SearchVideoResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _SearchVideoResultsPage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideoResult>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as SearchCursor?,
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

  /// Create a copy of SearchVideoResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $SearchCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc
mixin _$SearchLiveResultsPage {
  List<SearchLiveResult> get items;
  SearchCursor? get cursor;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of SearchLiveResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchLiveResultsPageCopyWith<SearchLiveResultsPage> get copyWith =>
      _$SearchLiveResultsPageCopyWithImpl<SearchLiveResultsPage>(
        this as SearchLiveResultsPage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchLiveResultsPage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
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
    cursor,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchLiveResultsPage(items: $items, cursor: $cursor, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $SearchLiveResultsPageCopyWith<$Res> {
  factory $SearchLiveResultsPageCopyWith(
    SearchLiveResultsPage value,
    $Res Function(SearchLiveResultsPage) _then,
  ) = _$SearchLiveResultsPageCopyWithImpl;
  @useResult
  $Res call({
    List<SearchLiveResult> items,
    SearchCursor? cursor,
    int size,
    int totalCount,
    int totalPages,
  });

  $SearchCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$SearchLiveResultsPageCopyWithImpl<$Res>
    implements $SearchLiveResultsPageCopyWith<$Res> {
  _$SearchLiveResultsPageCopyWithImpl(this._self, this._then);

  final SearchLiveResultsPage _self;
  final $Res Function(SearchLiveResultsPage) _then;

  /// Create a copy of SearchLiveResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<SearchLiveResult>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as SearchCursor?,
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

  /// Create a copy of SearchLiveResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $SearchCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchLiveResultsPage].
extension SearchLiveResultsPagePatterns on SearchLiveResultsPage {
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
    TResult Function(_SearchLiveResultsPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultsPage() when $default != null:
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
    TResult Function(_SearchLiveResultsPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultsPage():
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
    TResult? Function(_SearchLiveResultsPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultsPage() when $default != null:
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
      List<SearchLiveResult> items,
      SearchCursor? cursor,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultsPage() when $default != null:
        return $default(
          _that.items,
          _that.cursor,
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
      List<SearchLiveResult> items,
      SearchCursor? cursor,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultsPage():
        return $default(
          _that.items,
          _that.cursor,
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
      List<SearchLiveResult> items,
      SearchCursor? cursor,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultsPage() when $default != null:
        return $default(
          _that.items,
          _that.cursor,
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

class _SearchLiveResultsPage implements SearchLiveResultsPage {
  const _SearchLiveResultsPage({
    final List<SearchLiveResult> items = const <SearchLiveResult>[],
    this.cursor,
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _items = items;

  final List<SearchLiveResult> _items;
  @override
  @JsonKey()
  List<SearchLiveResult> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final SearchCursor? cursor;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of SearchLiveResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchLiveResultsPageCopyWith<_SearchLiveResultsPage> get copyWith =>
      __$SearchLiveResultsPageCopyWithImpl<_SearchLiveResultsPage>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchLiveResultsPage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
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
    cursor,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchLiveResultsPage(items: $items, cursor: $cursor, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$SearchLiveResultsPageCopyWith<$Res>
    implements $SearchLiveResultsPageCopyWith<$Res> {
  factory _$SearchLiveResultsPageCopyWith(
    _SearchLiveResultsPage value,
    $Res Function(_SearchLiveResultsPage) _then,
  ) = __$SearchLiveResultsPageCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<SearchLiveResult> items,
    SearchCursor? cursor,
    int size,
    int totalCount,
    int totalPages,
  });

  @override
  $SearchCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$SearchLiveResultsPageCopyWithImpl<$Res>
    implements _$SearchLiveResultsPageCopyWith<$Res> {
  __$SearchLiveResultsPageCopyWithImpl(this._self, this._then);

  final _SearchLiveResultsPage _self;
  final $Res Function(_SearchLiveResultsPage) _then;

  /// Create a copy of SearchLiveResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _SearchLiveResultsPage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<SearchLiveResult>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as SearchCursor?,
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

  /// Create a copy of SearchLiveResultsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $SearchCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc
mixin _$SearchCursor {
  int? get offset;

  /// Create a copy of SearchCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchCursorCopyWith<SearchCursor> get copyWith =>
      _$SearchCursorCopyWithImpl<SearchCursor>(
        this as SearchCursor,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchCursor &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offset);

  @override
  String toString() {
    return 'SearchCursor(offset: $offset)';
  }
}

/// @nodoc
abstract mixin class $SearchCursorCopyWith<$Res> {
  factory $SearchCursorCopyWith(
    SearchCursor value,
    $Res Function(SearchCursor) _then,
  ) = _$SearchCursorCopyWithImpl;
  @useResult
  $Res call({int? offset});
}

/// @nodoc
class _$SearchCursorCopyWithImpl<$Res> implements $SearchCursorCopyWith<$Res> {
  _$SearchCursorCopyWithImpl(this._self, this._then);

  final SearchCursor _self;
  final $Res Function(SearchCursor) _then;

  /// Create a copy of SearchCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? offset = freezed}) {
    return _then(
      _self.copyWith(
        offset: freezed == offset
            ? _self.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchCursor].
extension SearchCursorPatterns on SearchCursor {
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
    TResult Function(_SearchCursor value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchCursor() when $default != null:
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
    TResult Function(_SearchCursor value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchCursor():
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
    TResult? Function(_SearchCursor value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchCursor() when $default != null:
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
    TResult Function(int? offset)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchCursor() when $default != null:
        return $default(_that.offset);
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
    TResult Function(int? offset) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchCursor():
        return $default(_that.offset);
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
    TResult? Function(int? offset)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchCursor() when $default != null:
        return $default(_that.offset);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchCursor implements SearchCursor {
  const _SearchCursor({this.offset});

  @override
  final int? offset;

  /// Create a copy of SearchCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchCursorCopyWith<_SearchCursor> get copyWith =>
      __$SearchCursorCopyWithImpl<_SearchCursor>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchCursor &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offset);

  @override
  String toString() {
    return 'SearchCursor(offset: $offset)';
  }
}

/// @nodoc
abstract mixin class _$SearchCursorCopyWith<$Res>
    implements $SearchCursorCopyWith<$Res> {
  factory _$SearchCursorCopyWith(
    _SearchCursor value,
    $Res Function(_SearchCursor) _then,
  ) = __$SearchCursorCopyWithImpl;
  @override
  @useResult
  $Res call({int? offset});
}

/// @nodoc
class __$SearchCursorCopyWithImpl<$Res>
    implements _$SearchCursorCopyWith<$Res> {
  __$SearchCursorCopyWithImpl(this._self, this._then);

  final _SearchCursor _self;
  final $Res Function(_SearchCursor) _then;

  /// Create a copy of SearchCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? offset = freezed}) {
    return _then(
      _SearchCursor(
        offset: freezed == offset
            ? _self.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$SearchChannelResult {
  SearchChannel? get channel;
  SearchChannelContent? get content;

  /// Create a copy of SearchChannelResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelResultCopyWith<SearchChannelResult> get copyWith =>
      _$SearchChannelResultCopyWithImpl<SearchChannelResult>(
        this as SearchChannelResult,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannelResult &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, content);

  @override
  String toString() {
    return 'SearchChannelResult(channel: $channel, content: $content)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelResultCopyWith<$Res> {
  factory $SearchChannelResultCopyWith(
    SearchChannelResult value,
    $Res Function(SearchChannelResult) _then,
  ) = _$SearchChannelResultCopyWithImpl;
  @useResult
  $Res call({SearchChannel? channel, SearchChannelContent? content});

  $SearchChannelCopyWith<$Res>? get channel;
  $SearchChannelContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$SearchChannelResultCopyWithImpl<$Res>
    implements $SearchChannelResultCopyWith<$Res> {
  _$SearchChannelResultCopyWithImpl(this._self, this._then);

  final SearchChannelResult _self;
  final $Res Function(SearchChannelResult) _then;

  /// Create a copy of SearchChannelResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? channel = freezed, Object? content = freezed}) {
    return _then(
      _self.copyWith(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannel?,
        content: freezed == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as SearchChannelContent?,
      ),
    );
  }

  /// Create a copy of SearchChannelResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchChannelResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $SearchChannelContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchChannelResult].
extension SearchChannelResultPatterns on SearchChannelResult {
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
    TResult Function(_SearchChannelResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResult() when $default != null:
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
    TResult Function(_SearchChannelResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResult():
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
    TResult? Function(_SearchChannelResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResult() when $default != null:
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
    TResult Function(SearchChannel? channel, SearchChannelContent? content)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResult() when $default != null:
        return $default(_that.channel, _that.content);
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
    TResult Function(SearchChannel? channel, SearchChannelContent? content)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResult():
        return $default(_that.channel, _that.content);
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
    TResult? Function(SearchChannel? channel, SearchChannelContent? content)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResult() when $default != null:
        return $default(_that.channel, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchChannelResult implements SearchChannelResult {
  const _SearchChannelResult({this.channel, this.content});

  @override
  final SearchChannel? channel;
  @override
  final SearchChannelContent? content;

  /// Create a copy of SearchChannelResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelResultCopyWith<_SearchChannelResult> get copyWith =>
      __$SearchChannelResultCopyWithImpl<_SearchChannelResult>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannelResult &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, content);

  @override
  String toString() {
    return 'SearchChannelResult(channel: $channel, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelResultCopyWith<$Res>
    implements $SearchChannelResultCopyWith<$Res> {
  factory _$SearchChannelResultCopyWith(
    _SearchChannelResult value,
    $Res Function(_SearchChannelResult) _then,
  ) = __$SearchChannelResultCopyWithImpl;
  @override
  @useResult
  $Res call({SearchChannel? channel, SearchChannelContent? content});

  @override
  $SearchChannelCopyWith<$Res>? get channel;
  @override
  $SearchChannelContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$SearchChannelResultCopyWithImpl<$Res>
    implements _$SearchChannelResultCopyWith<$Res> {
  __$SearchChannelResultCopyWithImpl(this._self, this._then);

  final _SearchChannelResult _self;
  final $Res Function(_SearchChannelResult) _then;

  /// Create a copy of SearchChannelResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = freezed, Object? content = freezed}) {
    return _then(
      _SearchChannelResult(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannel?,
        content: freezed == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as SearchChannelContent?,
      ),
    );
  }

  /// Create a copy of SearchChannelResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchChannelResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $SearchChannelContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
mixin _$SearchVideoResult {
  SearchChannel? get channel;
  SearchVideo? get video;

  /// Create a copy of SearchVideoResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchVideoResultCopyWith<SearchVideoResult> get copyWith =>
      _$SearchVideoResultCopyWithImpl<SearchVideoResult>(
        this as SearchVideoResult,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchVideoResult &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, video);

  @override
  String toString() {
    return 'SearchVideoResult(channel: $channel, video: $video)';
  }
}

/// @nodoc
abstract mixin class $SearchVideoResultCopyWith<$Res> {
  factory $SearchVideoResultCopyWith(
    SearchVideoResult value,
    $Res Function(SearchVideoResult) _then,
  ) = _$SearchVideoResultCopyWithImpl;
  @useResult
  $Res call({SearchChannel? channel, SearchVideo? video});

  $SearchChannelCopyWith<$Res>? get channel;
  $SearchVideoCopyWith<$Res>? get video;
}

/// @nodoc
class _$SearchVideoResultCopyWithImpl<$Res>
    implements $SearchVideoResultCopyWith<$Res> {
  _$SearchVideoResultCopyWithImpl(this._self, this._then);

  final SearchVideoResult _self;
  final $Res Function(SearchVideoResult) _then;

  /// Create a copy of SearchVideoResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? channel = freezed, Object? video = freezed}) {
    return _then(
      _self.copyWith(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannel?,
        video: freezed == video
            ? _self.video
            : video // ignore: cast_nullable_to_non_nullable
                  as SearchVideo?,
      ),
    );
  }

  /// Create a copy of SearchVideoResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchVideoResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchVideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $SearchVideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchVideoResult].
extension SearchVideoResultPatterns on SearchVideoResult {
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
    TResult Function(_SearchVideoResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResult() when $default != null:
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
    TResult Function(_SearchVideoResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResult():
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
    TResult? Function(_SearchVideoResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResult() when $default != null:
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
    TResult Function(SearchChannel? channel, SearchVideo? video)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResult() when $default != null:
        return $default(_that.channel, _that.video);
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
    TResult Function(SearchChannel? channel, SearchVideo? video) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResult():
        return $default(_that.channel, _that.video);
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
    TResult? Function(SearchChannel? channel, SearchVideo? video)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResult() when $default != null:
        return $default(_that.channel, _that.video);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchVideoResult implements SearchVideoResult {
  const _SearchVideoResult({this.channel, this.video});

  @override
  final SearchChannel? channel;
  @override
  final SearchVideo? video;

  /// Create a copy of SearchVideoResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchVideoResultCopyWith<_SearchVideoResult> get copyWith =>
      __$SearchVideoResultCopyWithImpl<_SearchVideoResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchVideoResult &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, video);

  @override
  String toString() {
    return 'SearchVideoResult(channel: $channel, video: $video)';
  }
}

/// @nodoc
abstract mixin class _$SearchVideoResultCopyWith<$Res>
    implements $SearchVideoResultCopyWith<$Res> {
  factory _$SearchVideoResultCopyWith(
    _SearchVideoResult value,
    $Res Function(_SearchVideoResult) _then,
  ) = __$SearchVideoResultCopyWithImpl;
  @override
  @useResult
  $Res call({SearchChannel? channel, SearchVideo? video});

  @override
  $SearchChannelCopyWith<$Res>? get channel;
  @override
  $SearchVideoCopyWith<$Res>? get video;
}

/// @nodoc
class __$SearchVideoResultCopyWithImpl<$Res>
    implements _$SearchVideoResultCopyWith<$Res> {
  __$SearchVideoResultCopyWithImpl(this._self, this._then);

  final _SearchVideoResult _self;
  final $Res Function(_SearchVideoResult) _then;

  /// Create a copy of SearchVideoResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = freezed, Object? video = freezed}) {
    return _then(
      _SearchVideoResult(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannel?,
        video: freezed == video
            ? _self.video
            : video // ignore: cast_nullable_to_non_nullable
                  as SearchVideo?,
      ),
    );
  }

  /// Create a copy of SearchVideoResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchVideoResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchVideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $SearchVideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

/// @nodoc
mixin _$SearchLiveResult {
  SearchChannel? get channel;
  SearchLive? get live;

  /// Create a copy of SearchLiveResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchLiveResultCopyWith<SearchLiveResult> get copyWith =>
      _$SearchLiveResultCopyWithImpl<SearchLiveResult>(
        this as SearchLiveResult,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchLiveResult &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.live, live) || other.live == live));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, live);

  @override
  String toString() {
    return 'SearchLiveResult(channel: $channel, live: $live)';
  }
}

/// @nodoc
abstract mixin class $SearchLiveResultCopyWith<$Res> {
  factory $SearchLiveResultCopyWith(
    SearchLiveResult value,
    $Res Function(SearchLiveResult) _then,
  ) = _$SearchLiveResultCopyWithImpl;
  @useResult
  $Res call({SearchChannel? channel, SearchLive? live});

  $SearchChannelCopyWith<$Res>? get channel;
  $SearchLiveCopyWith<$Res>? get live;
}

/// @nodoc
class _$SearchLiveResultCopyWithImpl<$Res>
    implements $SearchLiveResultCopyWith<$Res> {
  _$SearchLiveResultCopyWithImpl(this._self, this._then);

  final SearchLiveResult _self;
  final $Res Function(SearchLiveResult) _then;

  /// Create a copy of SearchLiveResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? channel = freezed, Object? live = freezed}) {
    return _then(
      _self.copyWith(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannel?,
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchLive?,
      ),
    );
  }

  /// Create a copy of SearchLiveResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchLiveResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchLiveCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $SearchLiveCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchLiveResult].
extension SearchLiveResultPatterns on SearchLiveResult {
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
    TResult Function(_SearchLiveResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResult() when $default != null:
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
    TResult Function(_SearchLiveResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResult():
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
    TResult? Function(_SearchLiveResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResult() when $default != null:
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
    TResult Function(SearchChannel? channel, SearchLive? live)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResult() when $default != null:
        return $default(_that.channel, _that.live);
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
    TResult Function(SearchChannel? channel, SearchLive? live) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResult():
        return $default(_that.channel, _that.live);
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
    TResult? Function(SearchChannel? channel, SearchLive? live)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResult() when $default != null:
        return $default(_that.channel, _that.live);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchLiveResult implements SearchLiveResult {
  const _SearchLiveResult({this.channel, this.live});

  @override
  final SearchChannel? channel;
  @override
  final SearchLive? live;

  /// Create a copy of SearchLiveResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchLiveResultCopyWith<_SearchLiveResult> get copyWith =>
      __$SearchLiveResultCopyWithImpl<_SearchLiveResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchLiveResult &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.live, live) || other.live == live));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, live);

  @override
  String toString() {
    return 'SearchLiveResult(channel: $channel, live: $live)';
  }
}

/// @nodoc
abstract mixin class _$SearchLiveResultCopyWith<$Res>
    implements $SearchLiveResultCopyWith<$Res> {
  factory _$SearchLiveResultCopyWith(
    _SearchLiveResult value,
    $Res Function(_SearchLiveResult) _then,
  ) = __$SearchLiveResultCopyWithImpl;
  @override
  @useResult
  $Res call({SearchChannel? channel, SearchLive? live});

  @override
  $SearchChannelCopyWith<$Res>? get channel;
  @override
  $SearchLiveCopyWith<$Res>? get live;
}

/// @nodoc
class __$SearchLiveResultCopyWithImpl<$Res>
    implements _$SearchLiveResultCopyWith<$Res> {
  __$SearchLiveResultCopyWithImpl(this._self, this._then);

  final _SearchLiveResult _self;
  final $Res Function(_SearchLiveResult) _then;

  /// Create a copy of SearchLiveResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = freezed, Object? live = freezed}) {
    return _then(
      _SearchLiveResult(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannel?,
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchLive?,
      ),
    );
  }

  /// Create a copy of SearchLiveResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchLiveResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchLiveCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $SearchLiveCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }
}

/// @nodoc
mixin _$SearchChannelContent {
  SearchLive? get live;
  List<SearchVideo> get videos;

  /// Create a copy of SearchChannelContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelContentCopyWith<SearchChannelContent> get copyWith =>
      _$SearchChannelContentCopyWithImpl<SearchChannelContent>(
        this as SearchChannelContent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannelContent &&
            (identical(other.live, live) || other.live == live) &&
            const DeepCollectionEquality().equals(other.videos, videos));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    live,
    const DeepCollectionEquality().hash(videos),
  );

  @override
  String toString() {
    return 'SearchChannelContent(live: $live, videos: $videos)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelContentCopyWith<$Res> {
  factory $SearchChannelContentCopyWith(
    SearchChannelContent value,
    $Res Function(SearchChannelContent) _then,
  ) = _$SearchChannelContentCopyWithImpl;
  @useResult
  $Res call({SearchLive? live, List<SearchVideo> videos});

  $SearchLiveCopyWith<$Res>? get live;
}

/// @nodoc
class _$SearchChannelContentCopyWithImpl<$Res>
    implements $SearchChannelContentCopyWith<$Res> {
  _$SearchChannelContentCopyWithImpl(this._self, this._then);

  final SearchChannelContent _self;
  final $Res Function(SearchChannelContent) _then;

  /// Create a copy of SearchChannelContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? live = freezed, Object? videos = null}) {
    return _then(
      _self.copyWith(
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchLive?,
        videos: null == videos
            ? _self.videos
            : videos // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideo>,
      ),
    );
  }

  /// Create a copy of SearchChannelContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchLiveCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $SearchLiveCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchChannelContent].
extension SearchChannelContentPatterns on SearchChannelContent {
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
    TResult Function(_SearchChannelContent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContent() when $default != null:
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
    TResult Function(_SearchChannelContent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContent():
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
    TResult? Function(_SearchChannelContent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContent() when $default != null:
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
    TResult Function(SearchLive? live, List<SearchVideo> videos)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContent() when $default != null:
        return $default(_that.live, _that.videos);
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
    TResult Function(SearchLive? live, List<SearchVideo> videos) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContent():
        return $default(_that.live, _that.videos);
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
    TResult? Function(SearchLive? live, List<SearchVideo> videos)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContent() when $default != null:
        return $default(_that.live, _that.videos);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchChannelContent implements SearchChannelContent {
  const _SearchChannelContent({
    this.live,
    final List<SearchVideo> videos = const <SearchVideo>[],
  }) : _videos = videos;

  @override
  final SearchLive? live;
  final List<SearchVideo> _videos;
  @override
  @JsonKey()
  List<SearchVideo> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  /// Create a copy of SearchChannelContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelContentCopyWith<_SearchChannelContent> get copyWith =>
      __$SearchChannelContentCopyWithImpl<_SearchChannelContent>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannelContent &&
            (identical(other.live, live) || other.live == live) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    live,
    const DeepCollectionEquality().hash(_videos),
  );

  @override
  String toString() {
    return 'SearchChannelContent(live: $live, videos: $videos)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelContentCopyWith<$Res>
    implements $SearchChannelContentCopyWith<$Res> {
  factory _$SearchChannelContentCopyWith(
    _SearchChannelContent value,
    $Res Function(_SearchChannelContent) _then,
  ) = __$SearchChannelContentCopyWithImpl;
  @override
  @useResult
  $Res call({SearchLive? live, List<SearchVideo> videos});

  @override
  $SearchLiveCopyWith<$Res>? get live;
}

/// @nodoc
class __$SearchChannelContentCopyWithImpl<$Res>
    implements _$SearchChannelContentCopyWith<$Res> {
  __$SearchChannelContentCopyWithImpl(this._self, this._then);

  final _SearchChannelContent _self;
  final $Res Function(_SearchChannelContent) _then;

  /// Create a copy of SearchChannelContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? live = freezed, Object? videos = null}) {
    return _then(
      _SearchChannelContent(
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchLive?,
        videos: null == videos
            ? _self._videos
            : videos // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideo>,
      ),
    );
  }

  /// Create a copy of SearchChannelContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchLiveCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $SearchLiveCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }
}

/// @nodoc
mixin _$SearchChannel {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  int get followerCount;
  String get description;
  bool get openLive;

  /// Create a copy of SearchChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelCopyWith<SearchChannel> get copyWith =>
      _$SearchChannelCopyWithImpl<SearchChannel>(
        this as SearchChannel,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    followerCount,
    description,
    openLive,
  );

  @override
  String toString() {
    return 'SearchChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, description: $description, openLive: $openLive)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelCopyWith<$Res> {
  factory $SearchChannelCopyWith(
    SearchChannel value,
    $Res Function(SearchChannel) _then,
  ) = _$SearchChannelCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    int followerCount,
    String description,
    bool openLive,
  });
}

/// @nodoc
class _$SearchChannelCopyWithImpl<$Res>
    implements $SearchChannelCopyWith<$Res> {
  _$SearchChannelCopyWithImpl(this._self, this._then);

  final SearchChannel _self;
  final $Res Function(SearchChannel) _then;

  /// Create a copy of SearchChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = null,
    Object? description = null,
    Object? openLive = null,
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
        followerCount: null == followerCount
            ? _self.followerCount
            : followerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchChannel].
extension SearchChannelPatterns on SearchChannel {
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
    TResult Function(_SearchChannel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannel() when $default != null:
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
    TResult Function(_SearchChannel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannel():
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
    TResult? Function(_SearchChannel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannel() when $default != null:
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
      int followerCount,
      String description,
      bool openLive,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannel() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.description,
          _that.openLive,
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
      int followerCount,
      String description,
      bool openLive,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannel():
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.description,
          _that.openLive,
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
      int followerCount,
      String description,
      bool openLive,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannel() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.description,
          _that.openLive,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchChannel implements SearchChannel {
  const _SearchChannel({
    required this.channelId,
    required this.channelName,
    this.channelImageUrl,
    required this.verifiedMark,
    required this.followerCount,
    required this.description,
    required this.openLive,
  });

  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  final bool verifiedMark;
  @override
  final int followerCount;
  @override
  final String description;
  @override
  final bool openLive;

  /// Create a copy of SearchChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelCopyWith<_SearchChannel> get copyWith =>
      __$SearchChannelCopyWithImpl<_SearchChannel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    followerCount,
    description,
    openLive,
  );

  @override
  String toString() {
    return 'SearchChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, description: $description, openLive: $openLive)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelCopyWith<$Res>
    implements $SearchChannelCopyWith<$Res> {
  factory _$SearchChannelCopyWith(
    _SearchChannel value,
    $Res Function(_SearchChannel) _then,
  ) = __$SearchChannelCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    int followerCount,
    String description,
    bool openLive,
  });
}

/// @nodoc
class __$SearchChannelCopyWithImpl<$Res>
    implements _$SearchChannelCopyWith<$Res> {
  __$SearchChannelCopyWithImpl(this._self, this._then);

  final _SearchChannel _self;
  final $Res Function(_SearchChannel) _then;

  /// Create a copy of SearchChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = null,
    Object? description = null,
    Object? openLive = null,
  }) {
    return _then(
      _SearchChannel(
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
        followerCount: null == followerCount
            ? _self.followerCount
            : followerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$SearchLive {
  int get liveId;
  String get title;
  String? get thumbnailImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  String? get openDate;
  bool get adult;
  List<String> get tags;
  String? get chatChannelId;
  String? get categoryValue;
  String? get watchPartyTag;
  String? get watchPartyType;
  String? get channelId;

  /// Create a copy of SearchLive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchLiveCopyWith<SearchLive> get copyWith =>
      _$SearchLiveCopyWithImpl<SearchLive>(this as SearchLive, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchLive &&
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
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
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
    chatChannelId,
    categoryValue,
    watchPartyTag,
    watchPartyType,
    channelId,
  );

  @override
  String toString() {
    return 'SearchLive(liveId: $liveId, title: $title, thumbnailImageUrl: $thumbnailImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, chatChannelId: $chatChannelId, categoryValue: $categoryValue, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, channelId: $channelId)';
  }
}

/// @nodoc
abstract mixin class $SearchLiveCopyWith<$Res> {
  factory $SearchLiveCopyWith(
    SearchLive value,
    $Res Function(SearchLive) _then,
  ) = _$SearchLiveCopyWithImpl;
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
    String? chatChannelId,
    String? categoryValue,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
  });
}

/// @nodoc
class _$SearchLiveCopyWithImpl<$Res> implements $SearchLiveCopyWith<$Res> {
  _$SearchLiveCopyWithImpl(this._self, this._then);

  final SearchLive _self;
  final $Res Function(SearchLive) _then;

  /// Create a copy of SearchLive
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
    Object? chatChannelId = freezed,
    Object? categoryValue = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? channelId = freezed,
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
        chatChannelId: freezed == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyTag: freezed == watchPartyTag
            ? _self.watchPartyTag
            : watchPartyTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyType: freezed == watchPartyType
            ? _self.watchPartyType
            : watchPartyType // ignore: cast_nullable_to_non_nullable
                  as String?,
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchLive].
extension SearchLivePatterns on SearchLive {
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
    TResult Function(_SearchLive value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLive() when $default != null:
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
    TResult Function(_SearchLive value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLive():
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
    TResult? Function(_SearchLive value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLive() when $default != null:
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
      String? chatChannelId,
      String? categoryValue,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLive() when $default != null:
        return $default(
          _that.liveId,
          _that.title,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.categoryValue,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
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
      String? chatChannelId,
      String? categoryValue,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLive():
        return $default(
          _that.liveId,
          _that.title,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.categoryValue,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
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
      String? chatChannelId,
      String? categoryValue,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLive() when $default != null:
        return $default(
          _that.liveId,
          _that.title,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.categoryValue,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchLive implements SearchLive {
  const _SearchLive({
    required this.liveId,
    required this.title,
    this.thumbnailImageUrl,
    this.defaultThumbnailImageUrl,
    required this.concurrentUserCount,
    this.openDate,
    required this.adult,
    final List<String> tags = const <String>[],
    this.chatChannelId,
    this.categoryValue,
    this.watchPartyTag,
    this.watchPartyType,
    this.channelId,
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
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  @override
  final String? channelId;

  /// Create a copy of SearchLive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchLiveCopyWith<_SearchLive> get copyWith =>
      __$SearchLiveCopyWithImpl<_SearchLive>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchLive &&
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
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
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
    chatChannelId,
    categoryValue,
    watchPartyTag,
    watchPartyType,
    channelId,
  );

  @override
  String toString() {
    return 'SearchLive(liveId: $liveId, title: $title, thumbnailImageUrl: $thumbnailImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, chatChannelId: $chatChannelId, categoryValue: $categoryValue, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, channelId: $channelId)';
  }
}

/// @nodoc
abstract mixin class _$SearchLiveCopyWith<$Res>
    implements $SearchLiveCopyWith<$Res> {
  factory _$SearchLiveCopyWith(
    _SearchLive value,
    $Res Function(_SearchLive) _then,
  ) = __$SearchLiveCopyWithImpl;
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
    String? chatChannelId,
    String? categoryValue,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
  });
}

/// @nodoc
class __$SearchLiveCopyWithImpl<$Res> implements _$SearchLiveCopyWith<$Res> {
  __$SearchLiveCopyWithImpl(this._self, this._then);

  final _SearchLive _self;
  final $Res Function(_SearchLive) _then;

  /// Create a copy of SearchLive
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
    Object? chatChannelId = freezed,
    Object? categoryValue = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? channelId = freezed,
  }) {
    return _then(
      _SearchLive(
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
        chatChannelId: freezed == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyTag: freezed == watchPartyTag
            ? _self.watchPartyTag
            : watchPartyTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyType: freezed == watchPartyType
            ? _self.watchPartyType
            : watchPartyType // ignore: cast_nullable_to_non_nullable
                  as String?,
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$SearchVideo {
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

  /// Create a copy of SearchVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchVideoCopyWith<SearchVideo> get copyWith =>
      _$SearchVideoCopyWithImpl<SearchVideo>(this as SearchVideo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchVideo &&
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
    return 'SearchVideo(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class $SearchVideoCopyWith<$Res> {
  factory $SearchVideoCopyWith(
    SearchVideo value,
    $Res Function(SearchVideo) _then,
  ) = _$SearchVideoCopyWithImpl;
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
class _$SearchVideoCopyWithImpl<$Res> implements $SearchVideoCopyWith<$Res> {
  _$SearchVideoCopyWithImpl(this._self, this._then);

  final SearchVideo _self;
  final $Res Function(SearchVideo) _then;

  /// Create a copy of SearchVideo
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

/// Adds pattern-matching-related methods to [SearchVideo].
extension SearchVideoPatterns on SearchVideo {
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
    TResult Function(_SearchVideo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideo() when $default != null:
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
    TResult Function(_SearchVideo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideo():
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
    TResult? Function(_SearchVideo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideo() when $default != null:
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
      case _SearchVideo() when $default != null:
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
      case _SearchVideo():
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
      case _SearchVideo() when $default != null:
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

class _SearchVideo implements SearchVideo {
  const _SearchVideo({
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

  /// Create a copy of SearchVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchVideoCopyWith<_SearchVideo> get copyWith =>
      __$SearchVideoCopyWithImpl<_SearchVideo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchVideo &&
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
    return 'SearchVideo(videoNo: $videoNo, videoId: $videoId, title: $title, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, categoryValue: $categoryValue, adult: $adult, livePv: $livePv, tags: $tags, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class _$SearchVideoCopyWith<$Res>
    implements $SearchVideoCopyWith<$Res> {
  factory _$SearchVideoCopyWith(
    _SearchVideo value,
    $Res Function(_SearchVideo) _then,
  ) = __$SearchVideoCopyWithImpl;
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
class __$SearchVideoCopyWithImpl<$Res> implements _$SearchVideoCopyWith<$Res> {
  __$SearchVideoCopyWithImpl(this._self, this._then);

  final _SearchVideo _self;
  final $Res Function(_SearchVideo) _then;

  /// Create a copy of SearchVideo
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
      _SearchVideo(
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
