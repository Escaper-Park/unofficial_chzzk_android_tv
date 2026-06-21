// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryPage {
  List<CategoryItem> get items;
  CategoryPageCursor? get cursor;
  int get size;

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryPageCopyWith<CategoryPage> get copyWith =>
      _$CategoryPageCopyWithImpl<CategoryPage>(
        this as CategoryPage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryPage &&
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
    return 'CategoryPage(items: $items, cursor: $cursor, size: $size)';
  }
}

/// @nodoc
abstract mixin class $CategoryPageCopyWith<$Res> {
  factory $CategoryPageCopyWith(
    CategoryPage value,
    $Res Function(CategoryPage) _then,
  ) = _$CategoryPageCopyWithImpl;
  @useResult
  $Res call({List<CategoryItem> items, CategoryPageCursor? cursor, int size});

  $CategoryPageCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$CategoryPageCopyWithImpl<$Res> implements $CategoryPageCopyWith<$Res> {
  _$CategoryPageCopyWithImpl(this._self, this._then);

  final CategoryPage _self;
  final $Res Function(CategoryPage) _then;

  /// Create a copy of CategoryPage
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
                  as List<CategoryItem>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CategoryPageCursor?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryPageCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $CategoryPageCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryPage].
extension CategoryPagePatterns on CategoryPage {
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
    TResult Function(_CategoryPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryPage() when $default != null:
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
    TResult Function(_CategoryPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPage():
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
    TResult? Function(_CategoryPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPage() when $default != null:
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
      List<CategoryItem> items,
      CategoryPageCursor? cursor,
      int size,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryPage() when $default != null:
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
      List<CategoryItem> items,
      CategoryPageCursor? cursor,
      int size,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPage():
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
      List<CategoryItem> items,
      CategoryPageCursor? cursor,
      int size,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPage() when $default != null:
        return $default(_that.items, _that.cursor, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryPage implements CategoryPage {
  const _CategoryPage({
    final List<CategoryItem> items = const <CategoryItem>[],
    this.cursor,
    this.size = 0,
  }) : _items = items;

  final List<CategoryItem> _items;
  @override
  @JsonKey()
  List<CategoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CategoryPageCursor? cursor;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryPageCopyWith<_CategoryPage> get copyWith =>
      __$CategoryPageCopyWithImpl<_CategoryPage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryPage &&
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
    return 'CategoryPage(items: $items, cursor: $cursor, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$CategoryPageCopyWith<$Res>
    implements $CategoryPageCopyWith<$Res> {
  factory _$CategoryPageCopyWith(
    _CategoryPage value,
    $Res Function(_CategoryPage) _then,
  ) = __$CategoryPageCopyWithImpl;
  @override
  @useResult
  $Res call({List<CategoryItem> items, CategoryPageCursor? cursor, int size});

  @override
  $CategoryPageCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$CategoryPageCopyWithImpl<$Res>
    implements _$CategoryPageCopyWith<$Res> {
  __$CategoryPageCopyWithImpl(this._self, this._then);

  final _CategoryPage _self;
  final $Res Function(_CategoryPage) _then;

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? cursor = freezed,
    Object? size = null,
  }) {
    return _then(
      _CategoryPage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CategoryItem>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CategoryPageCursor?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryPageCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $CategoryPageCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc
mixin _$CategoryPageCursor {
  String get categoryId;
  String? get categoryType;
  int? get concurrentUserCount;
  int? get openLiveCount;

  /// Create a copy of CategoryPageCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryPageCursorCopyWith<CategoryPageCursor> get copyWith =>
      _$CategoryPageCursorCopyWithImpl<CategoryPageCursor>(
        this as CategoryPageCursor,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryPageCursor &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    concurrentUserCount,
    openLiveCount,
  );

  @override
  String toString() {
    return 'CategoryPageCursor(categoryId: $categoryId, categoryType: $categoryType, concurrentUserCount: $concurrentUserCount, openLiveCount: $openLiveCount)';
  }
}

/// @nodoc
abstract mixin class $CategoryPageCursorCopyWith<$Res> {
  factory $CategoryPageCursorCopyWith(
    CategoryPageCursor value,
    $Res Function(CategoryPageCursor) _then,
  ) = _$CategoryPageCursorCopyWithImpl;
  @useResult
  $Res call({
    String categoryId,
    String? categoryType,
    int? concurrentUserCount,
    int? openLiveCount,
  });
}

/// @nodoc
class _$CategoryPageCursorCopyWithImpl<$Res>
    implements $CategoryPageCursorCopyWith<$Res> {
  _$CategoryPageCursorCopyWithImpl(this._self, this._then);

  final CategoryPageCursor _self;
  final $Res Function(CategoryPageCursor) _then;

  /// Create a copy of CategoryPageCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryType = freezed,
    Object? concurrentUserCount = freezed,
    Object? openLiveCount = freezed,
  }) {
    return _then(
      _self.copyWith(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        concurrentUserCount: freezed == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        openLiveCount: freezed == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryPageCursor].
extension CategoryPageCursorPatterns on CategoryPageCursor {
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
    TResult Function(_CategoryPageCursor value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryPageCursor() when $default != null:
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
    TResult Function(_CategoryPageCursor value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageCursor():
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
    TResult? Function(_CategoryPageCursor value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageCursor() when $default != null:
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
      String categoryId,
      String? categoryType,
      int? concurrentUserCount,
      int? openLiveCount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryPageCursor() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.concurrentUserCount,
          _that.openLiveCount,
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
      String categoryId,
      String? categoryType,
      int? concurrentUserCount,
      int? openLiveCount,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageCursor():
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.concurrentUserCount,
          _that.openLiveCount,
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
      String categoryId,
      String? categoryType,
      int? concurrentUserCount,
      int? openLiveCount,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageCursor() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.concurrentUserCount,
          _that.openLiveCount,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryPageCursor implements CategoryPageCursor {
  const _CategoryPageCursor({
    required this.categoryId,
    this.categoryType,
    this.concurrentUserCount,
    this.openLiveCount,
  });

  @override
  final String categoryId;
  @override
  final String? categoryType;
  @override
  final int? concurrentUserCount;
  @override
  final int? openLiveCount;

  /// Create a copy of CategoryPageCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryPageCursorCopyWith<_CategoryPageCursor> get copyWith =>
      __$CategoryPageCursorCopyWithImpl<_CategoryPageCursor>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryPageCursor &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    concurrentUserCount,
    openLiveCount,
  );

  @override
  String toString() {
    return 'CategoryPageCursor(categoryId: $categoryId, categoryType: $categoryType, concurrentUserCount: $concurrentUserCount, openLiveCount: $openLiveCount)';
  }
}

/// @nodoc
abstract mixin class _$CategoryPageCursorCopyWith<$Res>
    implements $CategoryPageCursorCopyWith<$Res> {
  factory _$CategoryPageCursorCopyWith(
    _CategoryPageCursor value,
    $Res Function(_CategoryPageCursor) _then,
  ) = __$CategoryPageCursorCopyWithImpl;
  @override
  @useResult
  $Res call({
    String categoryId,
    String? categoryType,
    int? concurrentUserCount,
    int? openLiveCount,
  });
}

/// @nodoc
class __$CategoryPageCursorCopyWithImpl<$Res>
    implements _$CategoryPageCursorCopyWith<$Res> {
  __$CategoryPageCursorCopyWithImpl(this._self, this._then);

  final _CategoryPageCursor _self;
  final $Res Function(_CategoryPageCursor) _then;

  /// Create a copy of CategoryPageCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
    Object? categoryType = freezed,
    Object? concurrentUserCount = freezed,
    Object? openLiveCount = freezed,
  }) {
    return _then(
      _CategoryPageCursor(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        concurrentUserCount: freezed == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        openLiveCount: freezed == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}
