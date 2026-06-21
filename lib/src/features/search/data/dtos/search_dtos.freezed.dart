// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchAutoCompleteListDto {
  List<String> get data;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of SearchAutoCompleteListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchAutoCompleteListDtoCopyWith<SearchAutoCompleteListDto> get copyWith =>
      _$SearchAutoCompleteListDtoCopyWithImpl<SearchAutoCompleteListDto>(
        this as SearchAutoCompleteListDto,
        _$identity,
      );

  /// Serializes this SearchAutoCompleteListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchAutoCompleteListDto &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchAutoCompleteListDto(data: $data, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $SearchAutoCompleteListDtoCopyWith<$Res> {
  factory $SearchAutoCompleteListDtoCopyWith(
    SearchAutoCompleteListDto value,
    $Res Function(SearchAutoCompleteListDto) _then,
  ) = _$SearchAutoCompleteListDtoCopyWithImpl;
  @useResult
  $Res call({List<String> data, int size, int totalCount, int totalPages});
}

/// @nodoc
class _$SearchAutoCompleteListDtoCopyWithImpl<$Res>
    implements $SearchAutoCompleteListDtoCopyWith<$Res> {
  _$SearchAutoCompleteListDtoCopyWithImpl(this._self, this._then);

  final SearchAutoCompleteListDto _self;
  final $Res Function(SearchAutoCompleteListDto) _then;

  /// Create a copy of SearchAutoCompleteListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [SearchAutoCompleteListDto].
extension SearchAutoCompleteListDtoPatterns on SearchAutoCompleteListDto {
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
    TResult Function(_SearchAutoCompleteListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchAutoCompleteListDto() when $default != null:
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
    TResult Function(_SearchAutoCompleteListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchAutoCompleteListDto():
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
    TResult? Function(_SearchAutoCompleteListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchAutoCompleteListDto() when $default != null:
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
      List<String> data,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchAutoCompleteListDto() when $default != null:
        return $default(
          _that.data,
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
      List<String> data,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchAutoCompleteListDto():
        return $default(
          _that.data,
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
      List<String> data,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchAutoCompleteListDto() when $default != null:
        return $default(
          _that.data,
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
@JsonSerializable()
class _SearchAutoCompleteListDto implements SearchAutoCompleteListDto {
  const _SearchAutoCompleteListDto({
    final List<String> data = const <String>[],
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _data = data;
  factory _SearchAutoCompleteListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchAutoCompleteListDtoFromJson(json);

  final List<String> _data;
  @override
  @JsonKey()
  List<String> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
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

  /// Create a copy of SearchAutoCompleteListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchAutoCompleteListDtoCopyWith<_SearchAutoCompleteListDto>
  get copyWith =>
      __$SearchAutoCompleteListDtoCopyWithImpl<_SearchAutoCompleteListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchAutoCompleteListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchAutoCompleteListDto &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchAutoCompleteListDto(data: $data, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$SearchAutoCompleteListDtoCopyWith<$Res>
    implements $SearchAutoCompleteListDtoCopyWith<$Res> {
  factory _$SearchAutoCompleteListDtoCopyWith(
    _SearchAutoCompleteListDto value,
    $Res Function(_SearchAutoCompleteListDto) _then,
  ) = __$SearchAutoCompleteListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> data, int size, int totalCount, int totalPages});
}

/// @nodoc
class __$SearchAutoCompleteListDtoCopyWithImpl<$Res>
    implements _$SearchAutoCompleteListDtoCopyWith<$Res> {
  __$SearchAutoCompleteListDtoCopyWithImpl(this._self, this._then);

  final _SearchAutoCompleteListDto _self;
  final $Res Function(_SearchAutoCompleteListDto) _then;

  /// Create a copy of SearchAutoCompleteListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _SearchAutoCompleteListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
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
mixin _$SearchTagAutoCompleteDto {
  List<String> get keywords;

  /// Create a copy of SearchTagAutoCompleteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagAutoCompleteDtoCopyWith<SearchTagAutoCompleteDto> get copyWith =>
      _$SearchTagAutoCompleteDtoCopyWithImpl<SearchTagAutoCompleteDto>(
        this as SearchTagAutoCompleteDto,
        _$identity,
      );

  /// Serializes this SearchTagAutoCompleteDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagAutoCompleteDto &&
            const DeepCollectionEquality().equals(other.keywords, keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keywords));

  @override
  String toString() {
    return 'SearchTagAutoCompleteDto(keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class $SearchTagAutoCompleteDtoCopyWith<$Res> {
  factory $SearchTagAutoCompleteDtoCopyWith(
    SearchTagAutoCompleteDto value,
    $Res Function(SearchTagAutoCompleteDto) _then,
  ) = _$SearchTagAutoCompleteDtoCopyWithImpl;
  @useResult
  $Res call({List<String> keywords});
}

/// @nodoc
class _$SearchTagAutoCompleteDtoCopyWithImpl<$Res>
    implements $SearchTagAutoCompleteDtoCopyWith<$Res> {
  _$SearchTagAutoCompleteDtoCopyWithImpl(this._self, this._then);

  final SearchTagAutoCompleteDto _self;
  final $Res Function(SearchTagAutoCompleteDto) _then;

  /// Create a copy of SearchTagAutoCompleteDto
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

/// Adds pattern-matching-related methods to [SearchTagAutoCompleteDto].
extension SearchTagAutoCompleteDtoPatterns on SearchTagAutoCompleteDto {
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
    TResult Function(_SearchTagAutoCompleteDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagAutoCompleteDto() when $default != null:
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
    TResult Function(_SearchTagAutoCompleteDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagAutoCompleteDto():
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
    TResult? Function(_SearchTagAutoCompleteDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagAutoCompleteDto() when $default != null:
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
      case _SearchTagAutoCompleteDto() when $default != null:
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
      case _SearchTagAutoCompleteDto():
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
      case _SearchTagAutoCompleteDto() when $default != null:
        return $default(_that.keywords);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagAutoCompleteDto implements SearchTagAutoCompleteDto {
  const _SearchTagAutoCompleteDto({
    final List<String> keywords = const <String>[],
  }) : _keywords = keywords;
  factory _SearchTagAutoCompleteDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagAutoCompleteDtoFromJson(json);

  final List<String> _keywords;
  @override
  @JsonKey()
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  /// Create a copy of SearchTagAutoCompleteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagAutoCompleteDtoCopyWith<_SearchTagAutoCompleteDto> get copyWith =>
      __$SearchTagAutoCompleteDtoCopyWithImpl<_SearchTagAutoCompleteDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagAutoCompleteDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagAutoCompleteDto &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_keywords));

  @override
  String toString() {
    return 'SearchTagAutoCompleteDto(keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagAutoCompleteDtoCopyWith<$Res>
    implements $SearchTagAutoCompleteDtoCopyWith<$Res> {
  factory _$SearchTagAutoCompleteDtoCopyWith(
    _SearchTagAutoCompleteDto value,
    $Res Function(_SearchTagAutoCompleteDto) _then,
  ) = __$SearchTagAutoCompleteDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> keywords});
}

/// @nodoc
class __$SearchTagAutoCompleteDtoCopyWithImpl<$Res>
    implements _$SearchTagAutoCompleteDtoCopyWith<$Res> {
  __$SearchTagAutoCompleteDtoCopyWithImpl(this._self, this._then);

  final _SearchTagAutoCompleteDto _self;
  final $Res Function(_SearchTagAutoCompleteDto) _then;

  /// Create a copy of SearchTagAutoCompleteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? keywords = null}) {
    return _then(
      _SearchTagAutoCompleteDto(
        keywords: null == keywords
            ? _self._keywords
            : keywords // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}
