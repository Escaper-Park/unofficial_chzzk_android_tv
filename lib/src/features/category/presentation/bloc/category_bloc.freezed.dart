// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent()';
  }
}

/// @nodoc
class $CategoryEventCopyWith<$Res> {
  $CategoryEventCopyWith(CategoryEvent _, $Res Function(CategoryEvent) __);
}

/// Adds pattern-matching-related methods to [CategoryEvent].
extension CategoryEventPatterns on CategoryEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_LoadMoreRequested value)? loadMoreRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_LoadMoreRequested value) loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _RetryRequested():
        return retryRequested(_that);
      case _LoadMoreRequested():
        return loadMoreRequested(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_LoadMoreRequested value)? loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? retryRequested,
    TResult Function()? loadMoreRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
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
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() retryRequested,
    required TResult Function() loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _RetryRequested():
        return retryRequested();
      case _LoadMoreRequested():
        return loadMoreRequested();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? retryRequested,
    TResult? Function()? loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements CategoryEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent.started()';
  }
}

/// @nodoc

class _RetryRequested implements CategoryEvent {
  const _RetryRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RetryRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent.retryRequested()';
  }
}

/// @nodoc

class _LoadMoreRequested implements CategoryEvent {
  const _LoadMoreRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMoreRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent.loadMoreRequested()';
  }
}

/// @nodoc
mixin _$CategoryState {
  CategoryLoadStatus get loadStatus;
  List<CategoryItem> get items;
  CategoryPageCursor? get cursor;
  CategoryPaginationStatus get paginationStatus;
  CategoryFeedbackType? get feedbackType;
  int get feedbackSerial;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      _$CategoryStateCopyWithImpl<CategoryState>(
        this as CategoryState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryState &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loadStatus,
    const DeepCollectionEquality().hash(items),
    cursor,
    paginationStatus,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'CategoryState(loadStatus: $loadStatus, items: $items, cursor: $cursor, paginationStatus: $paginationStatus, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
    CategoryState value,
    $Res Function(CategoryState) _then,
  ) = _$CategoryStateCopyWithImpl;
  @useResult
  $Res call({
    CategoryLoadStatus loadStatus,
    List<CategoryItem> items,
    CategoryPageCursor? cursor,
    CategoryPaginationStatus paginationStatus,
    CategoryFeedbackType? feedbackType,
    int feedbackSerial,
  });

  $CategoryPageCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._self, this._then);

  final CategoryState _self;
  final $Res Function(CategoryState) _then;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadStatus = null,
    Object? items = null,
    Object? cursor = freezed,
    Object? paginationStatus = null,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _self.copyWith(
        loadStatus: null == loadStatus
            ? _self.loadStatus
            : loadStatus // ignore: cast_nullable_to_non_nullable
                  as CategoryLoadStatus,
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CategoryItem>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CategoryPageCursor?,
        paginationStatus: null == paginationStatus
            ? _self.paginationStatus
            : paginationStatus // ignore: cast_nullable_to_non_nullable
                  as CategoryPaginationStatus,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as CategoryFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryState
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

/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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
    TResult Function(_CategoryState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryState() when $default != null:
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
    TResult Function(_CategoryState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryState():
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
    TResult? Function(_CategoryState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryState() when $default != null:
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
      CategoryLoadStatus loadStatus,
      List<CategoryItem> items,
      CategoryPageCursor? cursor,
      CategoryPaginationStatus paginationStatus,
      CategoryFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryState() when $default != null:
        return $default(
          _that.loadStatus,
          _that.items,
          _that.cursor,
          _that.paginationStatus,
          _that.feedbackType,
          _that.feedbackSerial,
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
      CategoryLoadStatus loadStatus,
      List<CategoryItem> items,
      CategoryPageCursor? cursor,
      CategoryPaginationStatus paginationStatus,
      CategoryFeedbackType? feedbackType,
      int feedbackSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryState():
        return $default(
          _that.loadStatus,
          _that.items,
          _that.cursor,
          _that.paginationStatus,
          _that.feedbackType,
          _that.feedbackSerial,
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
      CategoryLoadStatus loadStatus,
      List<CategoryItem> items,
      CategoryPageCursor? cursor,
      CategoryPaginationStatus paginationStatus,
      CategoryFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryState() when $default != null:
        return $default(
          _that.loadStatus,
          _that.items,
          _that.cursor,
          _that.paginationStatus,
          _that.feedbackType,
          _that.feedbackSerial,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryState extends CategoryState {
  const _CategoryState({
    this.loadStatus = CategoryLoadStatus.initial,
    final List<CategoryItem> items = const <CategoryItem>[],
    this.cursor,
    this.paginationStatus = CategoryPaginationStatus.idle,
    this.feedbackType,
    this.feedbackSerial = 0,
  }) : _items = items,
       super._();

  @override
  @JsonKey()
  final CategoryLoadStatus loadStatus;
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
  final CategoryPaginationStatus paginationStatus;
  @override
  final CategoryFeedbackType? feedbackType;
  @override
  @JsonKey()
  final int feedbackSerial;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryStateCopyWith<_CategoryState> get copyWith =>
      __$CategoryStateCopyWithImpl<_CategoryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryState &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loadStatus,
    const DeepCollectionEquality().hash(_items),
    cursor,
    paginationStatus,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'CategoryState(loadStatus: $loadStatus, items: $items, cursor: $cursor, paginationStatus: $paginationStatus, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class _$CategoryStateCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$CategoryStateCopyWith(
    _CategoryState value,
    $Res Function(_CategoryState) _then,
  ) = __$CategoryStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    CategoryLoadStatus loadStatus,
    List<CategoryItem> items,
    CategoryPageCursor? cursor,
    CategoryPaginationStatus paginationStatus,
    CategoryFeedbackType? feedbackType,
    int feedbackSerial,
  });

  @override
  $CategoryPageCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$CategoryStateCopyWithImpl<$Res>
    implements _$CategoryStateCopyWith<$Res> {
  __$CategoryStateCopyWithImpl(this._self, this._then);

  final _CategoryState _self;
  final $Res Function(_CategoryState) _then;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadStatus = null,
    Object? items = null,
    Object? cursor = freezed,
    Object? paginationStatus = null,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _CategoryState(
        loadStatus: null == loadStatus
            ? _self.loadStatus
            : loadStatus // ignore: cast_nullable_to_non_nullable
                  as CategoryLoadStatus,
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CategoryItem>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CategoryPageCursor?,
        paginationStatus: null == paginationStatus
            ? _self.paginationStatus
            : paginationStatus // ignore: cast_nullable_to_non_nullable
                  as CategoryPaginationStatus,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as CategoryFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryState
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
