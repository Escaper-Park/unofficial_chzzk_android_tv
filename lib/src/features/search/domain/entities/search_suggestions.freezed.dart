// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_suggestions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchSuggestions {
  List<String> get items;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of SearchSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchSuggestionsCopyWith<SearchSuggestions> get copyWith =>
      _$SearchSuggestionsCopyWithImpl<SearchSuggestions>(
        this as SearchSuggestions,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchSuggestions &&
            const DeepCollectionEquality().equals(other.items, items) &&
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
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchSuggestions(items: $items, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $SearchSuggestionsCopyWith<$Res> {
  factory $SearchSuggestionsCopyWith(
    SearchSuggestions value,
    $Res Function(SearchSuggestions) _then,
  ) = _$SearchSuggestionsCopyWithImpl;
  @useResult
  $Res call({List<String> items, int size, int totalCount, int totalPages});
}

/// @nodoc
class _$SearchSuggestionsCopyWithImpl<$Res>
    implements $SearchSuggestionsCopyWith<$Res> {
  _$SearchSuggestionsCopyWithImpl(this._self, this._then);

  final SearchSuggestions _self;
  final $Res Function(SearchSuggestions) _then;

  /// Create a copy of SearchSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<String>,
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

/// Adds pattern-matching-related methods to [SearchSuggestions].
extension SearchSuggestionsPatterns on SearchSuggestions {
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
    TResult Function(_SearchSuggestions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchSuggestions() when $default != null:
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
    TResult Function(_SearchSuggestions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchSuggestions():
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
    TResult? Function(_SearchSuggestions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchSuggestions() when $default != null:
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
      List<String> items,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchSuggestions() when $default != null:
        return $default(
          _that.items,
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
      List<String> items,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchSuggestions():
        return $default(
          _that.items,
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
      List<String> items,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchSuggestions() when $default != null:
        return $default(
          _that.items,
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

class _SearchSuggestions implements SearchSuggestions {
  const _SearchSuggestions({
    final List<String> items = const <String>[],
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _items = items;

  final List<String> _items;
  @override
  @JsonKey()
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of SearchSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchSuggestionsCopyWith<_SearchSuggestions> get copyWith =>
      __$SearchSuggestionsCopyWithImpl<_SearchSuggestions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchSuggestions &&
            const DeepCollectionEquality().equals(other._items, _items) &&
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
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchSuggestions(items: $items, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$SearchSuggestionsCopyWith<$Res>
    implements $SearchSuggestionsCopyWith<$Res> {
  factory _$SearchSuggestionsCopyWith(
    _SearchSuggestions value,
    $Res Function(_SearchSuggestions) _then,
  ) = __$SearchSuggestionsCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> items, int size, int totalCount, int totalPages});
}

/// @nodoc
class __$SearchSuggestionsCopyWithImpl<$Res>
    implements _$SearchSuggestionsCopyWith<$Res> {
  __$SearchSuggestionsCopyWithImpl(this._self, this._then);

  final _SearchSuggestions _self;
  final $Res Function(_SearchSuggestions) _then;

  /// Create a copy of SearchSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _SearchSuggestions(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<String>,
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
mixin _$SearchTagSuggestions {
  List<String> get keywords;

  /// Create a copy of SearchTagSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagSuggestionsCopyWith<SearchTagSuggestions> get copyWith =>
      _$SearchTagSuggestionsCopyWithImpl<SearchTagSuggestions>(
        this as SearchTagSuggestions,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagSuggestions &&
            const DeepCollectionEquality().equals(other.keywords, keywords));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keywords));

  @override
  String toString() {
    return 'SearchTagSuggestions(keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class $SearchTagSuggestionsCopyWith<$Res> {
  factory $SearchTagSuggestionsCopyWith(
    SearchTagSuggestions value,
    $Res Function(SearchTagSuggestions) _then,
  ) = _$SearchTagSuggestionsCopyWithImpl;
  @useResult
  $Res call({List<String> keywords});
}

/// @nodoc
class _$SearchTagSuggestionsCopyWithImpl<$Res>
    implements $SearchTagSuggestionsCopyWith<$Res> {
  _$SearchTagSuggestionsCopyWithImpl(this._self, this._then);

  final SearchTagSuggestions _self;
  final $Res Function(SearchTagSuggestions) _then;

  /// Create a copy of SearchTagSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? keywords = null}) {
    return _then(
      _self.copyWith(
        keywords: null == keywords
            ? _self.keywords
            : keywords // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchTagSuggestions].
extension SearchTagSuggestionsPatterns on SearchTagSuggestions {
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
    TResult Function(_SearchTagSuggestions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagSuggestions() when $default != null:
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
    TResult Function(_SearchTagSuggestions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagSuggestions():
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
    TResult? Function(_SearchTagSuggestions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagSuggestions() when $default != null:
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
    TResult Function(List<String> keywords)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagSuggestions() when $default != null:
        return $default(_that.keywords);
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
    TResult Function(List<String> keywords) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagSuggestions():
        return $default(_that.keywords);
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
    TResult? Function(List<String> keywords)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagSuggestions() when $default != null:
        return $default(_that.keywords);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchTagSuggestions implements SearchTagSuggestions {
  const _SearchTagSuggestions({final List<String> keywords = const <String>[]})
    : _keywords = keywords;

  final List<String> _keywords;
  @override
  @JsonKey()
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  /// Create a copy of SearchTagSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagSuggestionsCopyWith<_SearchTagSuggestions> get copyWith =>
      __$SearchTagSuggestionsCopyWithImpl<_SearchTagSuggestions>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagSuggestions &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_keywords));

  @override
  String toString() {
    return 'SearchTagSuggestions(keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagSuggestionsCopyWith<$Res>
    implements $SearchTagSuggestionsCopyWith<$Res> {
  factory _$SearchTagSuggestionsCopyWith(
    _SearchTagSuggestions value,
    $Res Function(_SearchTagSuggestions) _then,
  ) = __$SearchTagSuggestionsCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> keywords});
}

/// @nodoc
class __$SearchTagSuggestionsCopyWithImpl<$Res>
    implements _$SearchTagSuggestionsCopyWith<$Res> {
  __$SearchTagSuggestionsCopyWithImpl(this._self, this._then);

  final _SearchTagSuggestions _self;
  final $Res Function(_SearchTagSuggestions) _then;

  /// Create a copy of SearchTagSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? keywords = null}) {
    return _then(
      _SearchTagSuggestions(
        keywords: null == keywords
            ? _self._keywords
            : keywords // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}
