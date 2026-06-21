// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_results_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchChannelListDto {
  List<SearchChannelResultDto> get data;
  SearchPageDto? get page;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of SearchChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelListDtoCopyWith<SearchChannelListDto> get copyWith =>
      _$SearchChannelListDtoCopyWithImpl<SearchChannelListDto>(
        this as SearchChannelListDto,
        _$identity,
      );

  /// Serializes this SearchChannelListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannelListDto &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.page, page) || other.page == page) &&
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
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchChannelListDto(data: $data, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelListDtoCopyWith<$Res> {
  factory $SearchChannelListDtoCopyWith(
    SearchChannelListDto value,
    $Res Function(SearchChannelListDto) _then,
  ) = _$SearchChannelListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<SearchChannelResultDto> data,
    SearchPageDto? page,
    int size,
    int totalCount,
    int totalPages,
  });

  $SearchPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$SearchChannelListDtoCopyWithImpl<$Res>
    implements $SearchChannelListDtoCopyWith<$Res> {
  _$SearchChannelListDtoCopyWithImpl(this._self, this._then);

  final SearchChannelListDto _self;
  final $Res Function(SearchChannelListDto) _then;

  /// Create a copy of SearchChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchChannelResultDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchPageDto?,
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

  /// Create a copy of SearchChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchChannelListDto].
extension SearchChannelListDtoPatterns on SearchChannelListDto {
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
    TResult Function(_SearchChannelListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelListDto() when $default != null:
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
    TResult Function(_SearchChannelListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelListDto():
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
    TResult? Function(_SearchChannelListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelListDto() when $default != null:
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
      List<SearchChannelResultDto> data,
      SearchPageDto? page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelListDto() when $default != null:
        return $default(
          _that.data,
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
      List<SearchChannelResultDto> data,
      SearchPageDto? page,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelListDto():
        return $default(
          _that.data,
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
      List<SearchChannelResultDto> data,
      SearchPageDto? page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelListDto() when $default != null:
        return $default(
          _that.data,
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
@JsonSerializable()
class _SearchChannelListDto implements SearchChannelListDto {
  const _SearchChannelListDto({
    final List<SearchChannelResultDto> data = const <SearchChannelResultDto>[],
    this.page,
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _data = data;
  factory _SearchChannelListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelListDtoFromJson(json);

  final List<SearchChannelResultDto> _data;
  @override
  @JsonKey()
  List<SearchChannelResultDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final SearchPageDto? page;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of SearchChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelListDtoCopyWith<_SearchChannelListDto> get copyWith =>
      __$SearchChannelListDtoCopyWithImpl<_SearchChannelListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchChannelListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannelListDto &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.page, page) || other.page == page) &&
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
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchChannelListDto(data: $data, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelListDtoCopyWith<$Res>
    implements $SearchChannelListDtoCopyWith<$Res> {
  factory _$SearchChannelListDtoCopyWith(
    _SearchChannelListDto value,
    $Res Function(_SearchChannelListDto) _then,
  ) = __$SearchChannelListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<SearchChannelResultDto> data,
    SearchPageDto? page,
    int size,
    int totalCount,
    int totalPages,
  });

  @override
  $SearchPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$SearchChannelListDtoCopyWithImpl<$Res>
    implements _$SearchChannelListDtoCopyWith<$Res> {
  __$SearchChannelListDtoCopyWithImpl(this._self, this._then);

  final _SearchChannelListDto _self;
  final $Res Function(_SearchChannelListDto) _then;

  /// Create a copy of SearchChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _SearchChannelListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchChannelResultDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchPageDto?,
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

  /// Create a copy of SearchChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$SearchVideoListDto {
  List<SearchVideoResultDto> get data;
  SearchPageDto? get page;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of SearchVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchVideoListDtoCopyWith<SearchVideoListDto> get copyWith =>
      _$SearchVideoListDtoCopyWithImpl<SearchVideoListDto>(
        this as SearchVideoListDto,
        _$identity,
      );

  /// Serializes this SearchVideoListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchVideoListDto &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.page, page) || other.page == page) &&
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
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchVideoListDto(data: $data, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $SearchVideoListDtoCopyWith<$Res> {
  factory $SearchVideoListDtoCopyWith(
    SearchVideoListDto value,
    $Res Function(SearchVideoListDto) _then,
  ) = _$SearchVideoListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<SearchVideoResultDto> data,
    SearchPageDto? page,
    int size,
    int totalCount,
    int totalPages,
  });

  $SearchPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$SearchVideoListDtoCopyWithImpl<$Res>
    implements $SearchVideoListDtoCopyWith<$Res> {
  _$SearchVideoListDtoCopyWithImpl(this._self, this._then);

  final SearchVideoListDto _self;
  final $Res Function(SearchVideoListDto) _then;

  /// Create a copy of SearchVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideoResultDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchPageDto?,
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

  /// Create a copy of SearchVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchVideoListDto].
extension SearchVideoListDtoPatterns on SearchVideoListDto {
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
    TResult Function(_SearchVideoListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoListDto() when $default != null:
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
    TResult Function(_SearchVideoListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoListDto():
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
    TResult? Function(_SearchVideoListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoListDto() when $default != null:
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
      List<SearchVideoResultDto> data,
      SearchPageDto? page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoListDto() when $default != null:
        return $default(
          _that.data,
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
      List<SearchVideoResultDto> data,
      SearchPageDto? page,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoListDto():
        return $default(
          _that.data,
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
      List<SearchVideoResultDto> data,
      SearchPageDto? page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoListDto() when $default != null:
        return $default(
          _that.data,
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
@JsonSerializable()
class _SearchVideoListDto implements SearchVideoListDto {
  const _SearchVideoListDto({
    final List<SearchVideoResultDto> data = const <SearchVideoResultDto>[],
    this.page,
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _data = data;
  factory _SearchVideoListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchVideoListDtoFromJson(json);

  final List<SearchVideoResultDto> _data;
  @override
  @JsonKey()
  List<SearchVideoResultDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final SearchPageDto? page;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of SearchVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchVideoListDtoCopyWith<_SearchVideoListDto> get copyWith =>
      __$SearchVideoListDtoCopyWithImpl<_SearchVideoListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchVideoListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchVideoListDto &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.page, page) || other.page == page) &&
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
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchVideoListDto(data: $data, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$SearchVideoListDtoCopyWith<$Res>
    implements $SearchVideoListDtoCopyWith<$Res> {
  factory _$SearchVideoListDtoCopyWith(
    _SearchVideoListDto value,
    $Res Function(_SearchVideoListDto) _then,
  ) = __$SearchVideoListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<SearchVideoResultDto> data,
    SearchPageDto? page,
    int size,
    int totalCount,
    int totalPages,
  });

  @override
  $SearchPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$SearchVideoListDtoCopyWithImpl<$Res>
    implements _$SearchVideoListDtoCopyWith<$Res> {
  __$SearchVideoListDtoCopyWithImpl(this._self, this._then);

  final _SearchVideoListDto _self;
  final $Res Function(_SearchVideoListDto) _then;

  /// Create a copy of SearchVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _SearchVideoListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideoResultDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchPageDto?,
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

  /// Create a copy of SearchVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$SearchLiveListDto {
  List<SearchLiveResultDto> get data;
  SearchPageDto? get page;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of SearchLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchLiveListDtoCopyWith<SearchLiveListDto> get copyWith =>
      _$SearchLiveListDtoCopyWithImpl<SearchLiveListDto>(
        this as SearchLiveListDto,
        _$identity,
      );

  /// Serializes this SearchLiveListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchLiveListDto &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.page, page) || other.page == page) &&
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
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchLiveListDto(data: $data, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $SearchLiveListDtoCopyWith<$Res> {
  factory $SearchLiveListDtoCopyWith(
    SearchLiveListDto value,
    $Res Function(SearchLiveListDto) _then,
  ) = _$SearchLiveListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<SearchLiveResultDto> data,
    SearchPageDto? page,
    int size,
    int totalCount,
    int totalPages,
  });

  $SearchPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$SearchLiveListDtoCopyWithImpl<$Res>
    implements $SearchLiveListDtoCopyWith<$Res> {
  _$SearchLiveListDtoCopyWithImpl(this._self, this._then);

  final SearchLiveListDto _self;
  final $Res Function(SearchLiveListDto) _then;

  /// Create a copy of SearchLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchLiveResultDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchPageDto?,
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

  /// Create a copy of SearchLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchLiveListDto].
extension SearchLiveListDtoPatterns on SearchLiveListDto {
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
    TResult Function(_SearchLiveListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveListDto() when $default != null:
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
    TResult Function(_SearchLiveListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveListDto():
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
    TResult? Function(_SearchLiveListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveListDto() when $default != null:
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
      List<SearchLiveResultDto> data,
      SearchPageDto? page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveListDto() when $default != null:
        return $default(
          _that.data,
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
      List<SearchLiveResultDto> data,
      SearchPageDto? page,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveListDto():
        return $default(
          _that.data,
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
      List<SearchLiveResultDto> data,
      SearchPageDto? page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveListDto() when $default != null:
        return $default(
          _that.data,
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
@JsonSerializable()
class _SearchLiveListDto implements SearchLiveListDto {
  const _SearchLiveListDto({
    final List<SearchLiveResultDto> data = const <SearchLiveResultDto>[],
    this.page,
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _data = data;
  factory _SearchLiveListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchLiveListDtoFromJson(json);

  final List<SearchLiveResultDto> _data;
  @override
  @JsonKey()
  List<SearchLiveResultDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final SearchPageDto? page;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of SearchLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchLiveListDtoCopyWith<_SearchLiveListDto> get copyWith =>
      __$SearchLiveListDtoCopyWithImpl<_SearchLiveListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchLiveListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchLiveListDto &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.page, page) || other.page == page) &&
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
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'SearchLiveListDto(data: $data, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$SearchLiveListDtoCopyWith<$Res>
    implements $SearchLiveListDtoCopyWith<$Res> {
  factory _$SearchLiveListDtoCopyWith(
    _SearchLiveListDto value,
    $Res Function(_SearchLiveListDto) _then,
  ) = __$SearchLiveListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<SearchLiveResultDto> data,
    SearchPageDto? page,
    int size,
    int totalCount,
    int totalPages,
  });

  @override
  $SearchPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$SearchLiveListDtoCopyWithImpl<$Res>
    implements _$SearchLiveListDtoCopyWith<$Res> {
  __$SearchLiveListDtoCopyWithImpl(this._self, this._then);

  final _SearchLiveListDto _self;
  final $Res Function(_SearchLiveListDto) _then;

  /// Create a copy of SearchLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _SearchLiveListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchLiveResultDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchPageDto?,
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

  /// Create a copy of SearchLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$SearchPageDto {
  SearchPageNextDto? get next;

  /// Create a copy of SearchPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchPageDtoCopyWith<SearchPageDto> get copyWith =>
      _$SearchPageDtoCopyWithImpl<SearchPageDto>(
        this as SearchPageDto,
        _$identity,
      );

  /// Serializes this SearchPageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'SearchPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $SearchPageDtoCopyWith<$Res> {
  factory $SearchPageDtoCopyWith(
    SearchPageDto value,
    $Res Function(SearchPageDto) _then,
  ) = _$SearchPageDtoCopyWithImpl;
  @useResult
  $Res call({SearchPageNextDto? next});

  $SearchPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$SearchPageDtoCopyWithImpl<$Res>
    implements $SearchPageDtoCopyWith<$Res> {
  _$SearchPageDtoCopyWithImpl(this._self, this._then);

  final SearchPageDto _self;
  final $Res Function(SearchPageDto) _then;

  /// Create a copy of SearchPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as SearchPageNextDto?,
      ),
    );
  }

  /// Create a copy of SearchPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $SearchPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchPageDto].
extension SearchPageDtoPatterns on SearchPageDto {
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
    TResult Function(_SearchPageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchPageDto() when $default != null:
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
    TResult Function(_SearchPageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPageDto():
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
    TResult? Function(_SearchPageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPageDto() when $default != null:
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
    TResult Function(SearchPageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchPageDto() when $default != null:
        return $default(_that.next);
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
    TResult Function(SearchPageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPageDto():
        return $default(_that.next);
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
    TResult? Function(SearchPageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchPageDto implements SearchPageDto {
  const _SearchPageDto({this.next});
  factory _SearchPageDto.fromJson(Map<String, dynamic> json) =>
      _$SearchPageDtoFromJson(json);

  @override
  final SearchPageNextDto? next;

  /// Create a copy of SearchPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchPageDtoCopyWith<_SearchPageDto> get copyWith =>
      __$SearchPageDtoCopyWithImpl<_SearchPageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchPageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'SearchPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$SearchPageDtoCopyWith<$Res>
    implements $SearchPageDtoCopyWith<$Res> {
  factory _$SearchPageDtoCopyWith(
    _SearchPageDto value,
    $Res Function(_SearchPageDto) _then,
  ) = __$SearchPageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({SearchPageNextDto? next});

  @override
  $SearchPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$SearchPageDtoCopyWithImpl<$Res>
    implements _$SearchPageDtoCopyWith<$Res> {
  __$SearchPageDtoCopyWithImpl(this._self, this._then);

  final _SearchPageDto _self;
  final $Res Function(_SearchPageDto) _then;

  /// Create a copy of SearchPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _SearchPageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as SearchPageNextDto?,
      ),
    );
  }

  /// Create a copy of SearchPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $SearchPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$SearchPageNextDto {
  int? get offset;

  /// Create a copy of SearchPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchPageNextDtoCopyWith<SearchPageNextDto> get copyWith =>
      _$SearchPageNextDtoCopyWithImpl<SearchPageNextDto>(
        this as SearchPageNextDto,
        _$identity,
      );

  /// Serializes this SearchPageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchPageNextDto &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, offset);

  @override
  String toString() {
    return 'SearchPageNextDto(offset: $offset)';
  }
}

/// @nodoc
abstract mixin class $SearchPageNextDtoCopyWith<$Res> {
  factory $SearchPageNextDtoCopyWith(
    SearchPageNextDto value,
    $Res Function(SearchPageNextDto) _then,
  ) = _$SearchPageNextDtoCopyWithImpl;
  @useResult
  $Res call({int? offset});
}

/// @nodoc
class _$SearchPageNextDtoCopyWithImpl<$Res>
    implements $SearchPageNextDtoCopyWith<$Res> {
  _$SearchPageNextDtoCopyWithImpl(this._self, this._then);

  final SearchPageNextDto _self;
  final $Res Function(SearchPageNextDto) _then;

  /// Create a copy of SearchPageNextDto
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

/// Adds pattern-matching-related methods to [SearchPageNextDto].
extension SearchPageNextDtoPatterns on SearchPageNextDto {
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
    TResult Function(_SearchPageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchPageNextDto() when $default != null:
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
    TResult Function(_SearchPageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPageNextDto():
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
    TResult? Function(_SearchPageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPageNextDto() when $default != null:
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
      case _SearchPageNextDto() when $default != null:
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
      case _SearchPageNextDto():
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
      case _SearchPageNextDto() when $default != null:
        return $default(_that.offset);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchPageNextDto implements SearchPageNextDto {
  const _SearchPageNextDto({this.offset});
  factory _SearchPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$SearchPageNextDtoFromJson(json);

  @override
  final int? offset;

  /// Create a copy of SearchPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchPageNextDtoCopyWith<_SearchPageNextDto> get copyWith =>
      __$SearchPageNextDtoCopyWithImpl<_SearchPageNextDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchPageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchPageNextDto &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, offset);

  @override
  String toString() {
    return 'SearchPageNextDto(offset: $offset)';
  }
}

/// @nodoc
abstract mixin class _$SearchPageNextDtoCopyWith<$Res>
    implements $SearchPageNextDtoCopyWith<$Res> {
  factory _$SearchPageNextDtoCopyWith(
    _SearchPageNextDto value,
    $Res Function(_SearchPageNextDto) _then,
  ) = __$SearchPageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? offset});
}

/// @nodoc
class __$SearchPageNextDtoCopyWithImpl<$Res>
    implements _$SearchPageNextDtoCopyWith<$Res> {
  __$SearchPageNextDtoCopyWithImpl(this._self, this._then);

  final _SearchPageNextDto _self;
  final $Res Function(_SearchPageNextDto) _then;

  /// Create a copy of SearchPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? offset = freezed}) {
    return _then(
      _SearchPageNextDto(
        offset: freezed == offset
            ? _self.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$SearchChannelResultDto {
  SearchChannelDto? get channel;
  SearchChannelContentDto? get content;

  /// Create a copy of SearchChannelResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelResultDtoCopyWith<SearchChannelResultDto> get copyWith =>
      _$SearchChannelResultDtoCopyWithImpl<SearchChannelResultDto>(
        this as SearchChannelResultDto,
        _$identity,
      );

  /// Serializes this SearchChannelResultDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannelResultDto &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channel, content);

  @override
  String toString() {
    return 'SearchChannelResultDto(channel: $channel, content: $content)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelResultDtoCopyWith<$Res> {
  factory $SearchChannelResultDtoCopyWith(
    SearchChannelResultDto value,
    $Res Function(SearchChannelResultDto) _then,
  ) = _$SearchChannelResultDtoCopyWithImpl;
  @useResult
  $Res call({SearchChannelDto? channel, SearchChannelContentDto? content});

  $SearchChannelDtoCopyWith<$Res>? get channel;
  $SearchChannelContentDtoCopyWith<$Res>? get content;
}

/// @nodoc
class _$SearchChannelResultDtoCopyWithImpl<$Res>
    implements $SearchChannelResultDtoCopyWith<$Res> {
  _$SearchChannelResultDtoCopyWithImpl(this._self, this._then);

  final SearchChannelResultDto _self;
  final $Res Function(SearchChannelResultDto) _then;

  /// Create a copy of SearchChannelResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? channel = freezed, Object? content = freezed}) {
    return _then(
      _self.copyWith(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannelDto?,
        content: freezed == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as SearchChannelContentDto?,
      ),
    );
  }

  /// Create a copy of SearchChannelResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchChannelResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelContentDtoCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $SearchChannelContentDtoCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchChannelResultDto].
extension SearchChannelResultDtoPatterns on SearchChannelResultDto {
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
    TResult Function(_SearchChannelResultDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultDto() when $default != null:
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
    TResult Function(_SearchChannelResultDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultDto():
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
    TResult? Function(_SearchChannelResultDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultDto() when $default != null:
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
      SearchChannelDto? channel,
      SearchChannelContentDto? content,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultDto() when $default != null:
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
    TResult Function(
      SearchChannelDto? channel,
      SearchChannelContentDto? content,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultDto():
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
    TResult? Function(
      SearchChannelDto? channel,
      SearchChannelContentDto? content,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelResultDto() when $default != null:
        return $default(_that.channel, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchChannelResultDto implements SearchChannelResultDto {
  const _SearchChannelResultDto({this.channel, this.content});
  factory _SearchChannelResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelResultDtoFromJson(json);

  @override
  final SearchChannelDto? channel;
  @override
  final SearchChannelContentDto? content;

  /// Create a copy of SearchChannelResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelResultDtoCopyWith<_SearchChannelResultDto> get copyWith =>
      __$SearchChannelResultDtoCopyWithImpl<_SearchChannelResultDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchChannelResultDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannelResultDto &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channel, content);

  @override
  String toString() {
    return 'SearchChannelResultDto(channel: $channel, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelResultDtoCopyWith<$Res>
    implements $SearchChannelResultDtoCopyWith<$Res> {
  factory _$SearchChannelResultDtoCopyWith(
    _SearchChannelResultDto value,
    $Res Function(_SearchChannelResultDto) _then,
  ) = __$SearchChannelResultDtoCopyWithImpl;
  @override
  @useResult
  $Res call({SearchChannelDto? channel, SearchChannelContentDto? content});

  @override
  $SearchChannelDtoCopyWith<$Res>? get channel;
  @override
  $SearchChannelContentDtoCopyWith<$Res>? get content;
}

/// @nodoc
class __$SearchChannelResultDtoCopyWithImpl<$Res>
    implements _$SearchChannelResultDtoCopyWith<$Res> {
  __$SearchChannelResultDtoCopyWithImpl(this._self, this._then);

  final _SearchChannelResultDto _self;
  final $Res Function(_SearchChannelResultDto) _then;

  /// Create a copy of SearchChannelResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = freezed, Object? content = freezed}) {
    return _then(
      _SearchChannelResultDto(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannelDto?,
        content: freezed == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as SearchChannelContentDto?,
      ),
    );
  }

  /// Create a copy of SearchChannelResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchChannelResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelContentDtoCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $SearchChannelContentDtoCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
mixin _$SearchVideoResultDto {
  SearchChannelDto? get channel;
  SearchVideoDto? get video;

  /// Create a copy of SearchVideoResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchVideoResultDtoCopyWith<SearchVideoResultDto> get copyWith =>
      _$SearchVideoResultDtoCopyWithImpl<SearchVideoResultDto>(
        this as SearchVideoResultDto,
        _$identity,
      );

  /// Serializes this SearchVideoResultDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchVideoResultDto &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channel, video);

  @override
  String toString() {
    return 'SearchVideoResultDto(channel: $channel, video: $video)';
  }
}

/// @nodoc
abstract mixin class $SearchVideoResultDtoCopyWith<$Res> {
  factory $SearchVideoResultDtoCopyWith(
    SearchVideoResultDto value,
    $Res Function(SearchVideoResultDto) _then,
  ) = _$SearchVideoResultDtoCopyWithImpl;
  @useResult
  $Res call({SearchChannelDto? channel, SearchVideoDto? video});

  $SearchChannelDtoCopyWith<$Res>? get channel;
  $SearchVideoDtoCopyWith<$Res>? get video;
}

/// @nodoc
class _$SearchVideoResultDtoCopyWithImpl<$Res>
    implements $SearchVideoResultDtoCopyWith<$Res> {
  _$SearchVideoResultDtoCopyWithImpl(this._self, this._then);

  final SearchVideoResultDto _self;
  final $Res Function(SearchVideoResultDto) _then;

  /// Create a copy of SearchVideoResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? channel = freezed, Object? video = freezed}) {
    return _then(
      _self.copyWith(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannelDto?,
        video: freezed == video
            ? _self.video
            : video // ignore: cast_nullable_to_non_nullable
                  as SearchVideoDto?,
      ),
    );
  }

  /// Create a copy of SearchVideoResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchVideoResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchVideoDtoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $SearchVideoDtoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchVideoResultDto].
extension SearchVideoResultDtoPatterns on SearchVideoResultDto {
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
    TResult Function(_SearchVideoResultDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultDto() when $default != null:
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
    TResult Function(_SearchVideoResultDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultDto():
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
    TResult? Function(_SearchVideoResultDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultDto() when $default != null:
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
    TResult Function(SearchChannelDto? channel, SearchVideoDto? video)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultDto() when $default != null:
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
    TResult Function(SearchChannelDto? channel, SearchVideoDto? video) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultDto():
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
    TResult? Function(SearchChannelDto? channel, SearchVideoDto? video)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoResultDto() when $default != null:
        return $default(_that.channel, _that.video);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchVideoResultDto implements SearchVideoResultDto {
  const _SearchVideoResultDto({this.channel, this.video});
  factory _SearchVideoResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchVideoResultDtoFromJson(json);

  @override
  final SearchChannelDto? channel;
  @override
  final SearchVideoDto? video;

  /// Create a copy of SearchVideoResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchVideoResultDtoCopyWith<_SearchVideoResultDto> get copyWith =>
      __$SearchVideoResultDtoCopyWithImpl<_SearchVideoResultDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchVideoResultDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchVideoResultDto &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channel, video);

  @override
  String toString() {
    return 'SearchVideoResultDto(channel: $channel, video: $video)';
  }
}

/// @nodoc
abstract mixin class _$SearchVideoResultDtoCopyWith<$Res>
    implements $SearchVideoResultDtoCopyWith<$Res> {
  factory _$SearchVideoResultDtoCopyWith(
    _SearchVideoResultDto value,
    $Res Function(_SearchVideoResultDto) _then,
  ) = __$SearchVideoResultDtoCopyWithImpl;
  @override
  @useResult
  $Res call({SearchChannelDto? channel, SearchVideoDto? video});

  @override
  $SearchChannelDtoCopyWith<$Res>? get channel;
  @override
  $SearchVideoDtoCopyWith<$Res>? get video;
}

/// @nodoc
class __$SearchVideoResultDtoCopyWithImpl<$Res>
    implements _$SearchVideoResultDtoCopyWith<$Res> {
  __$SearchVideoResultDtoCopyWithImpl(this._self, this._then);

  final _SearchVideoResultDto _self;
  final $Res Function(_SearchVideoResultDto) _then;

  /// Create a copy of SearchVideoResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = freezed, Object? video = freezed}) {
    return _then(
      _SearchVideoResultDto(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannelDto?,
        video: freezed == video
            ? _self.video
            : video // ignore: cast_nullable_to_non_nullable
                  as SearchVideoDto?,
      ),
    );
  }

  /// Create a copy of SearchVideoResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchVideoResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchVideoDtoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $SearchVideoDtoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

/// @nodoc
mixin _$SearchLiveResultDto {
  SearchChannelDto? get channel;
  SearchLiveDto? get live;

  /// Create a copy of SearchLiveResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchLiveResultDtoCopyWith<SearchLiveResultDto> get copyWith =>
      _$SearchLiveResultDtoCopyWithImpl<SearchLiveResultDto>(
        this as SearchLiveResultDto,
        _$identity,
      );

  /// Serializes this SearchLiveResultDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchLiveResultDto &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.live, live) || other.live == live));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channel, live);

  @override
  String toString() {
    return 'SearchLiveResultDto(channel: $channel, live: $live)';
  }
}

/// @nodoc
abstract mixin class $SearchLiveResultDtoCopyWith<$Res> {
  factory $SearchLiveResultDtoCopyWith(
    SearchLiveResultDto value,
    $Res Function(SearchLiveResultDto) _then,
  ) = _$SearchLiveResultDtoCopyWithImpl;
  @useResult
  $Res call({SearchChannelDto? channel, SearchLiveDto? live});

  $SearchChannelDtoCopyWith<$Res>? get channel;
  $SearchLiveDtoCopyWith<$Res>? get live;
}

/// @nodoc
class _$SearchLiveResultDtoCopyWithImpl<$Res>
    implements $SearchLiveResultDtoCopyWith<$Res> {
  _$SearchLiveResultDtoCopyWithImpl(this._self, this._then);

  final SearchLiveResultDto _self;
  final $Res Function(SearchLiveResultDto) _then;

  /// Create a copy of SearchLiveResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? channel = freezed, Object? live = freezed}) {
    return _then(
      _self.copyWith(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannelDto?,
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchLiveDto?,
      ),
    );
  }

  /// Create a copy of SearchLiveResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchLiveResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchLiveDtoCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $SearchLiveDtoCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchLiveResultDto].
extension SearchLiveResultDtoPatterns on SearchLiveResultDto {
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
    TResult Function(_SearchLiveResultDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultDto() when $default != null:
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
    TResult Function(_SearchLiveResultDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultDto():
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
    TResult? Function(_SearchLiveResultDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultDto() when $default != null:
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
    TResult Function(SearchChannelDto? channel, SearchLiveDto? live)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultDto() when $default != null:
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
    TResult Function(SearchChannelDto? channel, SearchLiveDto? live) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultDto():
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
    TResult? Function(SearchChannelDto? channel, SearchLiveDto? live)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveResultDto() when $default != null:
        return $default(_that.channel, _that.live);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchLiveResultDto implements SearchLiveResultDto {
  const _SearchLiveResultDto({this.channel, this.live});
  factory _SearchLiveResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchLiveResultDtoFromJson(json);

  @override
  final SearchChannelDto? channel;
  @override
  final SearchLiveDto? live;

  /// Create a copy of SearchLiveResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchLiveResultDtoCopyWith<_SearchLiveResultDto> get copyWith =>
      __$SearchLiveResultDtoCopyWithImpl<_SearchLiveResultDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchLiveResultDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchLiveResultDto &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.live, live) || other.live == live));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channel, live);

  @override
  String toString() {
    return 'SearchLiveResultDto(channel: $channel, live: $live)';
  }
}

/// @nodoc
abstract mixin class _$SearchLiveResultDtoCopyWith<$Res>
    implements $SearchLiveResultDtoCopyWith<$Res> {
  factory _$SearchLiveResultDtoCopyWith(
    _SearchLiveResultDto value,
    $Res Function(_SearchLiveResultDto) _then,
  ) = __$SearchLiveResultDtoCopyWithImpl;
  @override
  @useResult
  $Res call({SearchChannelDto? channel, SearchLiveDto? live});

  @override
  $SearchChannelDtoCopyWith<$Res>? get channel;
  @override
  $SearchLiveDtoCopyWith<$Res>? get live;
}

/// @nodoc
class __$SearchLiveResultDtoCopyWithImpl<$Res>
    implements _$SearchLiveResultDtoCopyWith<$Res> {
  __$SearchLiveResultDtoCopyWithImpl(this._self, this._then);

  final _SearchLiveResultDto _self;
  final $Res Function(_SearchLiveResultDto) _then;

  /// Create a copy of SearchLiveResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = freezed, Object? live = freezed}) {
    return _then(
      _SearchLiveResultDto(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchChannelDto?,
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchLiveDto?,
      ),
    );
  }

  /// Create a copy of SearchLiveResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of SearchLiveResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchLiveDtoCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $SearchLiveDtoCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }
}

/// @nodoc
mixin _$SearchChannelContentDto {
  SearchLiveDto? get live;
  List<SearchVideoDto> get videos;

  /// Create a copy of SearchChannelContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelContentDtoCopyWith<SearchChannelContentDto> get copyWith =>
      _$SearchChannelContentDtoCopyWithImpl<SearchChannelContentDto>(
        this as SearchChannelContentDto,
        _$identity,
      );

  /// Serializes this SearchChannelContentDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannelContentDto &&
            (identical(other.live, live) || other.live == live) &&
            const DeepCollectionEquality().equals(other.videos, videos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    live,
    const DeepCollectionEquality().hash(videos),
  );

  @override
  String toString() {
    return 'SearchChannelContentDto(live: $live, videos: $videos)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelContentDtoCopyWith<$Res> {
  factory $SearchChannelContentDtoCopyWith(
    SearchChannelContentDto value,
    $Res Function(SearchChannelContentDto) _then,
  ) = _$SearchChannelContentDtoCopyWithImpl;
  @useResult
  $Res call({SearchLiveDto? live, List<SearchVideoDto> videos});

  $SearchLiveDtoCopyWith<$Res>? get live;
}

/// @nodoc
class _$SearchChannelContentDtoCopyWithImpl<$Res>
    implements $SearchChannelContentDtoCopyWith<$Res> {
  _$SearchChannelContentDtoCopyWithImpl(this._self, this._then);

  final SearchChannelContentDto _self;
  final $Res Function(SearchChannelContentDto) _then;

  /// Create a copy of SearchChannelContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? live = freezed, Object? videos = null}) {
    return _then(
      _self.copyWith(
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchLiveDto?,
        videos: null == videos
            ? _self.videos
            : videos // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideoDto>,
      ),
    );
  }

  /// Create a copy of SearchChannelContentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchLiveDtoCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $SearchLiveDtoCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchChannelContentDto].
extension SearchChannelContentDtoPatterns on SearchChannelContentDto {
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
    TResult Function(_SearchChannelContentDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContentDto() when $default != null:
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
    TResult Function(_SearchChannelContentDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContentDto():
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
    TResult? Function(_SearchChannelContentDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContentDto() when $default != null:
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
    TResult Function(SearchLiveDto? live, List<SearchVideoDto> videos)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContentDto() when $default != null:
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
    TResult Function(SearchLiveDto? live, List<SearchVideoDto> videos) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContentDto():
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
    TResult? Function(SearchLiveDto? live, List<SearchVideoDto> videos)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelContentDto() when $default != null:
        return $default(_that.live, _that.videos);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchChannelContentDto implements SearchChannelContentDto {
  const _SearchChannelContentDto({
    this.live,
    final List<SearchVideoDto> videos = const <SearchVideoDto>[],
  }) : _videos = videos;
  factory _SearchChannelContentDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelContentDtoFromJson(json);

  @override
  final SearchLiveDto? live;
  final List<SearchVideoDto> _videos;
  @override
  @JsonKey()
  List<SearchVideoDto> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  /// Create a copy of SearchChannelContentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelContentDtoCopyWith<_SearchChannelContentDto> get copyWith =>
      __$SearchChannelContentDtoCopyWithImpl<_SearchChannelContentDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchChannelContentDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannelContentDto &&
            (identical(other.live, live) || other.live == live) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    live,
    const DeepCollectionEquality().hash(_videos),
  );

  @override
  String toString() {
    return 'SearchChannelContentDto(live: $live, videos: $videos)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelContentDtoCopyWith<$Res>
    implements $SearchChannelContentDtoCopyWith<$Res> {
  factory _$SearchChannelContentDtoCopyWith(
    _SearchChannelContentDto value,
    $Res Function(_SearchChannelContentDto) _then,
  ) = __$SearchChannelContentDtoCopyWithImpl;
  @override
  @useResult
  $Res call({SearchLiveDto? live, List<SearchVideoDto> videos});

  @override
  $SearchLiveDtoCopyWith<$Res>? get live;
}

/// @nodoc
class __$SearchChannelContentDtoCopyWithImpl<$Res>
    implements _$SearchChannelContentDtoCopyWith<$Res> {
  __$SearchChannelContentDtoCopyWithImpl(this._self, this._then);

  final _SearchChannelContentDto _self;
  final $Res Function(_SearchChannelContentDto) _then;

  /// Create a copy of SearchChannelContentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? live = freezed, Object? videos = null}) {
    return _then(
      _SearchChannelContentDto(
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchLiveDto?,
        videos: null == videos
            ? _self._videos
            : videos // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideoDto>,
      ),
    );
  }

  /// Create a copy of SearchChannelContentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchLiveDtoCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $SearchLiveDtoCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }
}

/// @nodoc
mixin _$SearchLiveDto {
  int get liveId;
  String get liveTitle;
  String? get liveImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  String? get openDate;
  bool get adult;
  List<String> get tags;
  String? get chatChannelId;
  String? get liveCategoryValue;
  String? get watchPartyTag;
  String? get watchPartyType;
  String? get channelId;
  String? get livePlaybackJson;
  Map<String, dynamic>? get party;

  /// Create a copy of SearchLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchLiveDtoCopyWith<SearchLiveDto> get copyWith =>
      _$SearchLiveDtoCopyWithImpl<SearchLiveDto>(
        this as SearchLiveDto,
        _$identity,
      );

  /// Serializes this SearchLiveDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchLiveDto &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.liveImageUrl, liveImageUrl) ||
                other.liveImageUrl == liveImageUrl) &&
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
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.livePlaybackJson, livePlaybackJson) ||
                other.livePlaybackJson == livePlaybackJson) &&
            const DeepCollectionEquality().equals(other.party, party));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    liveId,
    liveTitle,
    liveImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    openDate,
    adult,
    const DeepCollectionEquality().hash(tags),
    chatChannelId,
    liveCategoryValue,
    watchPartyTag,
    watchPartyType,
    channelId,
    livePlaybackJson,
    const DeepCollectionEquality().hash(party),
  );

  @override
  String toString() {
    return 'SearchLiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, chatChannelId: $chatChannelId, liveCategoryValue: $liveCategoryValue, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, channelId: $channelId, livePlaybackJson: $livePlaybackJson, party: $party)';
  }
}

/// @nodoc
abstract mixin class $SearchLiveDtoCopyWith<$Res> {
  factory $SearchLiveDtoCopyWith(
    SearchLiveDto value,
    $Res Function(SearchLiveDto) _then,
  ) = _$SearchLiveDtoCopyWithImpl;
  @useResult
  $Res call({
    int liveId,
    String liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    String? openDate,
    bool adult,
    List<String> tags,
    String? chatChannelId,
    String? liveCategoryValue,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
    String? livePlaybackJson,
    Map<String, dynamic>? party,
  });
}

/// @nodoc
class _$SearchLiveDtoCopyWithImpl<$Res>
    implements $SearchLiveDtoCopyWith<$Res> {
  _$SearchLiveDtoCopyWithImpl(this._self, this._then);

  final SearchLiveDto _self;
  final $Res Function(SearchLiveDto) _then;

  /// Create a copy of SearchLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = null,
    Object? liveTitle = null,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? chatChannelId = freezed,
    Object? liveCategoryValue = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? channelId = freezed,
    Object? livePlaybackJson = freezed,
    Object? party = freezed,
  }) {
    return _then(
      _self.copyWith(
        liveId: null == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int,
        liveTitle: null == liveTitle
            ? _self.liveTitle
            : liveTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        liveImageUrl: freezed == liveImageUrl
            ? _self.liveImageUrl
            : liveImageUrl // ignore: cast_nullable_to_non_nullable
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
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
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
        livePlaybackJson: freezed == livePlaybackJson
            ? _self.livePlaybackJson
            : livePlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self.party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchLiveDto].
extension SearchLiveDtoPatterns on SearchLiveDto {
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
    TResult Function(_SearchLiveDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveDto() when $default != null:
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
    TResult Function(_SearchLiveDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveDto():
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
    TResult? Function(_SearchLiveDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveDto() when $default != null:
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
      String liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? chatChannelId,
      String? liveCategoryValue,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
      String? livePlaybackJson,
      Map<String, dynamic>? party,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchLiveDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.liveCategoryValue,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
          _that.livePlaybackJson,
          _that.party,
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
      String liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? chatChannelId,
      String? liveCategoryValue,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
      String? livePlaybackJson,
      Map<String, dynamic>? party,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveDto():
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.liveCategoryValue,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
          _that.livePlaybackJson,
          _that.party,
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
      String liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? chatChannelId,
      String? liveCategoryValue,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
      String? livePlaybackJson,
      Map<String, dynamic>? party,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchLiveDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.liveCategoryValue,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
          _that.livePlaybackJson,
          _that.party,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchLiveDto implements SearchLiveDto {
  const _SearchLiveDto({
    this.liveId = 0,
    this.liveTitle = '',
    this.liveImageUrl,
    this.defaultThumbnailImageUrl,
    this.concurrentUserCount = 0,
    this.openDate,
    this.adult = false,
    final List<String> tags = const <String>[],
    this.chatChannelId,
    this.liveCategoryValue,
    this.watchPartyTag,
    this.watchPartyType,
    this.channelId,
    this.livePlaybackJson,
    final Map<String, dynamic>? party,
  }) : _tags = tags,
       _party = party;
  factory _SearchLiveDto.fromJson(Map<String, dynamic> json) =>
      _$SearchLiveDtoFromJson(json);

  @override
  @JsonKey()
  final int liveId;
  @override
  @JsonKey()
  final String liveTitle;
  @override
  final String? liveImageUrl;
  @override
  final String? defaultThumbnailImageUrl;
  @override
  @JsonKey()
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
  final String? chatChannelId;
  @override
  final String? liveCategoryValue;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  @override
  final String? channelId;
  @override
  final String? livePlaybackJson;
  final Map<String, dynamic>? _party;
  @override
  Map<String, dynamic>? get party {
    final value = _party;
    if (value == null) return null;
    if (_party is EqualUnmodifiableMapView) return _party;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of SearchLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchLiveDtoCopyWith<_SearchLiveDto> get copyWith =>
      __$SearchLiveDtoCopyWithImpl<_SearchLiveDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchLiveDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchLiveDto &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.liveImageUrl, liveImageUrl) ||
                other.liveImageUrl == liveImageUrl) &&
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
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.livePlaybackJson, livePlaybackJson) ||
                other.livePlaybackJson == livePlaybackJson) &&
            const DeepCollectionEquality().equals(other._party, _party));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    liveId,
    liveTitle,
    liveImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    openDate,
    adult,
    const DeepCollectionEquality().hash(_tags),
    chatChannelId,
    liveCategoryValue,
    watchPartyTag,
    watchPartyType,
    channelId,
    livePlaybackJson,
    const DeepCollectionEquality().hash(_party),
  );

  @override
  String toString() {
    return 'SearchLiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, chatChannelId: $chatChannelId, liveCategoryValue: $liveCategoryValue, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, channelId: $channelId, livePlaybackJson: $livePlaybackJson, party: $party)';
  }
}

/// @nodoc
abstract mixin class _$SearchLiveDtoCopyWith<$Res>
    implements $SearchLiveDtoCopyWith<$Res> {
  factory _$SearchLiveDtoCopyWith(
    _SearchLiveDto value,
    $Res Function(_SearchLiveDto) _then,
  ) = __$SearchLiveDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    int liveId,
    String liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    String? openDate,
    bool adult,
    List<String> tags,
    String? chatChannelId,
    String? liveCategoryValue,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
    String? livePlaybackJson,
    Map<String, dynamic>? party,
  });
}

/// @nodoc
class __$SearchLiveDtoCopyWithImpl<$Res>
    implements _$SearchLiveDtoCopyWith<$Res> {
  __$SearchLiveDtoCopyWithImpl(this._self, this._then);

  final _SearchLiveDto _self;
  final $Res Function(_SearchLiveDto) _then;

  /// Create a copy of SearchLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? liveId = null,
    Object? liveTitle = null,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? chatChannelId = freezed,
    Object? liveCategoryValue = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? channelId = freezed,
    Object? livePlaybackJson = freezed,
    Object? party = freezed,
  }) {
    return _then(
      _SearchLiveDto(
        liveId: null == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int,
        liveTitle: null == liveTitle
            ? _self.liveTitle
            : liveTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        liveImageUrl: freezed == liveImageUrl
            ? _self.liveImageUrl
            : liveImageUrl // ignore: cast_nullable_to_non_nullable
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
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
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
        livePlaybackJson: freezed == livePlaybackJson
            ? _self.livePlaybackJson
            : livePlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self._party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
mixin _$SearchVideoDto {
  int get videoNo;
  String? get videoId;
  String get videoTitle;
  String get videoType;
  String get publishDate;
  String? get thumbnailImageUrl;
  int get duration;
  int get readCount;
  int get publishDateAt;
  String? get videoCategoryValue;
  bool get adult;
  int get livePv;
  List<String> get tags;
  SearchChannelDto? get channel;
  String? get blindType;
  int? get watchTimeline;

  /// Create a copy of SearchVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchVideoDtoCopyWith<SearchVideoDto> get copyWith =>
      _$SearchVideoDtoCopyWithImpl<SearchVideoDto>(
        this as SearchVideoDto,
        _$identity,
      );

  /// Serializes this SearchVideoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchVideoDto &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.videoTitle, videoTitle) ||
                other.videoTitle == videoTitle) &&
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
            (identical(other.videoCategoryValue, videoCategoryValue) ||
                other.videoCategoryValue == videoCategoryValue) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.livePv, livePv) || other.livePv == livePv) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    videoNo,
    videoId,
    videoTitle,
    videoType,
    publishDate,
    thumbnailImageUrl,
    duration,
    readCount,
    publishDateAt,
    videoCategoryValue,
    adult,
    livePv,
    const DeepCollectionEquality().hash(tags),
    channel,
    blindType,
    watchTimeline,
  );

  @override
  String toString() {
    return 'SearchVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class $SearchVideoDtoCopyWith<$Res> {
  factory $SearchVideoDtoCopyWith(
    SearchVideoDto value,
    $Res Function(SearchVideoDto) _then,
  ) = _$SearchVideoDtoCopyWithImpl;
  @useResult
  $Res call({
    int videoNo,
    String? videoId,
    String videoTitle,
    String videoType,
    String publishDate,
    String? thumbnailImageUrl,
    int duration,
    int readCount,
    int publishDateAt,
    String? videoCategoryValue,
    bool adult,
    int livePv,
    List<String> tags,
    SearchChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  $SearchChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$SearchVideoDtoCopyWithImpl<$Res>
    implements $SearchVideoDtoCopyWith<$Res> {
  _$SearchVideoDtoCopyWithImpl(this._self, this._then);

  final SearchVideoDto _self;
  final $Res Function(SearchVideoDto) _then;

  /// Create a copy of SearchVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? videoTitle = null,
    Object? videoType = null,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? duration = null,
    Object? readCount = null,
    Object? publishDateAt = null,
    Object? videoCategoryValue = freezed,
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
        videoTitle: null == videoTitle
            ? _self.videoTitle
            : videoTitle // ignore: cast_nullable_to_non_nullable
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
        videoCategoryValue: freezed == videoCategoryValue
            ? _self.videoCategoryValue
            : videoCategoryValue // ignore: cast_nullable_to_non_nullable
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
                  as SearchChannelDto?,
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

  /// Create a copy of SearchVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchVideoDto].
extension SearchVideoDtoPatterns on SearchVideoDto {
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
    TResult Function(_SearchVideoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoDto() when $default != null:
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
    TResult Function(_SearchVideoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoDto():
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
    TResult? Function(_SearchVideoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoDto() when $default != null:
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
      String videoTitle,
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? videoCategoryValue,
      bool adult,
      int livePv,
      List<String> tags,
      SearchChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchVideoDto() when $default != null:
        return $default(
          _that.videoNo,
          _that.videoId,
          _that.videoTitle,
          _that.videoType,
          _that.publishDate,
          _that.thumbnailImageUrl,
          _that.duration,
          _that.readCount,
          _that.publishDateAt,
          _that.videoCategoryValue,
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
      String videoTitle,
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? videoCategoryValue,
      bool adult,
      int livePv,
      List<String> tags,
      SearchChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoDto():
        return $default(
          _that.videoNo,
          _that.videoId,
          _that.videoTitle,
          _that.videoType,
          _that.publishDate,
          _that.thumbnailImageUrl,
          _that.duration,
          _that.readCount,
          _that.publishDateAt,
          _that.videoCategoryValue,
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
      String videoTitle,
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? videoCategoryValue,
      bool adult,
      int livePv,
      List<String> tags,
      SearchChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchVideoDto() when $default != null:
        return $default(
          _that.videoNo,
          _that.videoId,
          _that.videoTitle,
          _that.videoType,
          _that.publishDate,
          _that.thumbnailImageUrl,
          _that.duration,
          _that.readCount,
          _that.publishDateAt,
          _that.videoCategoryValue,
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
@JsonSerializable()
class _SearchVideoDto implements SearchVideoDto {
  const _SearchVideoDto({
    this.videoNo = 0,
    this.videoId,
    this.videoTitle = '',
    this.videoType = '',
    this.publishDate = '',
    this.thumbnailImageUrl,
    this.duration = 0,
    this.readCount = 0,
    this.publishDateAt = 0,
    this.videoCategoryValue,
    this.adult = false,
    this.livePv = 0,
    final List<String> tags = const <String>[],
    this.channel,
    this.blindType,
    this.watchTimeline,
  }) : _tags = tags;
  factory _SearchVideoDto.fromJson(Map<String, dynamic> json) =>
      _$SearchVideoDtoFromJson(json);

  @override
  @JsonKey()
  final int videoNo;
  @override
  final String? videoId;
  @override
  @JsonKey()
  final String videoTitle;
  @override
  @JsonKey()
  final String videoType;
  @override
  @JsonKey()
  final String publishDate;
  @override
  final String? thumbnailImageUrl;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final int readCount;
  @override
  @JsonKey()
  final int publishDateAt;
  @override
  final String? videoCategoryValue;
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
  final SearchChannelDto? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;

  /// Create a copy of SearchVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchVideoDtoCopyWith<_SearchVideoDto> get copyWith =>
      __$SearchVideoDtoCopyWithImpl<_SearchVideoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchVideoDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchVideoDto &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.videoTitle, videoTitle) ||
                other.videoTitle == videoTitle) &&
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
            (identical(other.videoCategoryValue, videoCategoryValue) ||
                other.videoCategoryValue == videoCategoryValue) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.livePv, livePv) || other.livePv == livePv) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    videoNo,
    videoId,
    videoTitle,
    videoType,
    publishDate,
    thumbnailImageUrl,
    duration,
    readCount,
    publishDateAt,
    videoCategoryValue,
    adult,
    livePv,
    const DeepCollectionEquality().hash(_tags),
    channel,
    blindType,
    watchTimeline,
  );

  @override
  String toString() {
    return 'SearchVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class _$SearchVideoDtoCopyWith<$Res>
    implements $SearchVideoDtoCopyWith<$Res> {
  factory _$SearchVideoDtoCopyWith(
    _SearchVideoDto value,
    $Res Function(_SearchVideoDto) _then,
  ) = __$SearchVideoDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    int videoNo,
    String? videoId,
    String videoTitle,
    String videoType,
    String publishDate,
    String? thumbnailImageUrl,
    int duration,
    int readCount,
    int publishDateAt,
    String? videoCategoryValue,
    bool adult,
    int livePv,
    List<String> tags,
    SearchChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  @override
  $SearchChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$SearchVideoDtoCopyWithImpl<$Res>
    implements _$SearchVideoDtoCopyWith<$Res> {
  __$SearchVideoDtoCopyWithImpl(this._self, this._then);

  final _SearchVideoDto _self;
  final $Res Function(_SearchVideoDto) _then;

  /// Create a copy of SearchVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? videoTitle = null,
    Object? videoType = null,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? duration = null,
    Object? readCount = null,
    Object? publishDateAt = null,
    Object? videoCategoryValue = freezed,
    Object? adult = null,
    Object? livePv = null,
    Object? tags = null,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
  }) {
    return _then(
      _SearchVideoDto(
        videoNo: null == videoNo
            ? _self.videoNo
            : videoNo // ignore: cast_nullable_to_non_nullable
                  as int,
        videoId: freezed == videoId
            ? _self.videoId
            : videoId // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoTitle: null == videoTitle
            ? _self.videoTitle
            : videoTitle // ignore: cast_nullable_to_non_nullable
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
        videoCategoryValue: freezed == videoCategoryValue
            ? _self.videoCategoryValue
            : videoCategoryValue // ignore: cast_nullable_to_non_nullable
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
                  as SearchChannelDto?,
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

  /// Create a copy of SearchVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$SearchChannelDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  int get followerCount;
  String get channelDescription;
  List<String> get activatedChannelBadgeIds;
  bool get openLive;
  SearchChannelPersonalDataDto? get personalData;

  /// Create a copy of SearchChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelDtoCopyWith<SearchChannelDto> get copyWith =>
      _$SearchChannelDtoCopyWithImpl<SearchChannelDto>(
        this as SearchChannelDto,
        _$identity,
      );

  /// Serializes this SearchChannelDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannelDto &&
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
            (identical(other.channelDescription, channelDescription) ||
                other.channelDescription == channelDescription) &&
            const DeepCollectionEquality().equals(
              other.activatedChannelBadgeIds,
              activatedChannelBadgeIds,
            ) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    followerCount,
    channelDescription,
    const DeepCollectionEquality().hash(activatedChannelBadgeIds),
    openLive,
    personalData,
  );

  @override
  String toString() {
    return 'SearchChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, channelDescription: $channelDescription, activatedChannelBadgeIds: $activatedChannelBadgeIds, openLive: $openLive, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelDtoCopyWith<$Res> {
  factory $SearchChannelDtoCopyWith(
    SearchChannelDto value,
    $Res Function(SearchChannelDto) _then,
  ) = _$SearchChannelDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    int followerCount,
    String channelDescription,
    List<String> activatedChannelBadgeIds,
    bool openLive,
    SearchChannelPersonalDataDto? personalData,
  });

  $SearchChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$SearchChannelDtoCopyWithImpl<$Res>
    implements $SearchChannelDtoCopyWith<$Res> {
  _$SearchChannelDtoCopyWithImpl(this._self, this._then);

  final SearchChannelDto _self;
  final $Res Function(SearchChannelDto) _then;

  /// Create a copy of SearchChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = null,
    Object? channelDescription = null,
    Object? activatedChannelBadgeIds = null,
    Object? openLive = null,
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
        followerCount: null == followerCount
            ? _self.followerCount
            : followerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        channelDescription: null == channelDescription
            ? _self.channelDescription
            : channelDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self.activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as SearchChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of SearchChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $SearchChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchChannelDto].
extension SearchChannelDtoPatterns on SearchChannelDto {
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
    TResult Function(_SearchChannelDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelDto() when $default != null:
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
    TResult Function(_SearchChannelDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelDto():
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
    TResult? Function(_SearchChannelDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelDto() when $default != null:
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
      String channelDescription,
      List<String> activatedChannelBadgeIds,
      bool openLive,
      SearchChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelDto() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.channelDescription,
          _that.activatedChannelBadgeIds,
          _that.openLive,
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
      int followerCount,
      String channelDescription,
      List<String> activatedChannelBadgeIds,
      bool openLive,
      SearchChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelDto():
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.channelDescription,
          _that.activatedChannelBadgeIds,
          _that.openLive,
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
      int followerCount,
      String channelDescription,
      List<String> activatedChannelBadgeIds,
      bool openLive,
      SearchChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelDto() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.channelDescription,
          _that.activatedChannelBadgeIds,
          _that.openLive,
          _that.personalData,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchChannelDto implements SearchChannelDto {
  const _SearchChannelDto({
    this.channelId = '',
    this.channelName = '',
    this.channelImageUrl,
    this.verifiedMark = false,
    this.followerCount = 0,
    this.channelDescription = '',
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.openLive = false,
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _SearchChannelDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelDtoFromJson(json);

  @override
  @JsonKey()
  final String channelId;
  @override
  @JsonKey()
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  @JsonKey()
  final bool verifiedMark;
  @override
  @JsonKey()
  final int followerCount;
  @override
  @JsonKey()
  final String channelDescription;
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
  @JsonKey()
  final bool openLive;
  @override
  final SearchChannelPersonalDataDto? personalData;

  /// Create a copy of SearchChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelDtoCopyWith<_SearchChannelDto> get copyWith =>
      __$SearchChannelDtoCopyWithImpl<_SearchChannelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchChannelDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannelDto &&
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
            (identical(other.channelDescription, channelDescription) ||
                other.channelDescription == channelDescription) &&
            const DeepCollectionEquality().equals(
              other._activatedChannelBadgeIds,
              _activatedChannelBadgeIds,
            ) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    followerCount,
    channelDescription,
    const DeepCollectionEquality().hash(_activatedChannelBadgeIds),
    openLive,
    personalData,
  );

  @override
  String toString() {
    return 'SearchChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, channelDescription: $channelDescription, activatedChannelBadgeIds: $activatedChannelBadgeIds, openLive: $openLive, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelDtoCopyWith<$Res>
    implements $SearchChannelDtoCopyWith<$Res> {
  factory _$SearchChannelDtoCopyWith(
    _SearchChannelDto value,
    $Res Function(_SearchChannelDto) _then,
  ) = __$SearchChannelDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    int followerCount,
    String channelDescription,
    List<String> activatedChannelBadgeIds,
    bool openLive,
    SearchChannelPersonalDataDto? personalData,
  });

  @override
  $SearchChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$SearchChannelDtoCopyWithImpl<$Res>
    implements _$SearchChannelDtoCopyWith<$Res> {
  __$SearchChannelDtoCopyWithImpl(this._self, this._then);

  final _SearchChannelDto _self;
  final $Res Function(_SearchChannelDto) _then;

  /// Create a copy of SearchChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = null,
    Object? channelDescription = null,
    Object? activatedChannelBadgeIds = null,
    Object? openLive = null,
    Object? personalData = freezed,
  }) {
    return _then(
      _SearchChannelDto(
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
        channelDescription: null == channelDescription
            ? _self.channelDescription
            : channelDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self._activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as SearchChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of SearchChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $SearchChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$SearchChannelPersonalDataDto {
  SearchChannelPersonalFollowingDto? get following;
  bool get privateUserBlock;

  /// Create a copy of SearchChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelPersonalDataDtoCopyWith<SearchChannelPersonalDataDto>
  get copyWith =>
      _$SearchChannelPersonalDataDtoCopyWithImpl<SearchChannelPersonalDataDto>(
        this as SearchChannelPersonalDataDto,
        _$identity,
      );

  /// Serializes this SearchChannelPersonalDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannelPersonalDataDto &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, following, privateUserBlock);

  @override
  String toString() {
    return 'SearchChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelPersonalDataDtoCopyWith<$Res> {
  factory $SearchChannelPersonalDataDtoCopyWith(
    SearchChannelPersonalDataDto value,
    $Res Function(SearchChannelPersonalDataDto) _then,
  ) = _$SearchChannelPersonalDataDtoCopyWithImpl;
  @useResult
  $Res call({
    SearchChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  $SearchChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$SearchChannelPersonalDataDtoCopyWithImpl<$Res>
    implements $SearchChannelPersonalDataDtoCopyWith<$Res> {
  _$SearchChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final SearchChannelPersonalDataDto _self;
  final $Res Function(SearchChannelPersonalDataDto) _then;

  /// Create a copy of SearchChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as SearchChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of SearchChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $SearchChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchChannelPersonalDataDto].
extension SearchChannelPersonalDataDtoPatterns on SearchChannelPersonalDataDto {
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
    TResult Function(_SearchChannelPersonalDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalDataDto() when $default != null:
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
    TResult Function(_SearchChannelPersonalDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalDataDto():
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
    TResult? Function(_SearchChannelPersonalDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalDataDto() when $default != null:
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
      SearchChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
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
      SearchChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalDataDto():
        return $default(_that.following, _that.privateUserBlock);
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
      SearchChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchChannelPersonalDataDto implements SearchChannelPersonalDataDto {
  const _SearchChannelPersonalDataDto({
    this.following,
    this.privateUserBlock = false,
  });
  factory _SearchChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelPersonalDataDtoFromJson(json);

  @override
  final SearchChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool privateUserBlock;

  /// Create a copy of SearchChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelPersonalDataDtoCopyWith<_SearchChannelPersonalDataDto>
  get copyWith =>
      __$SearchChannelPersonalDataDtoCopyWithImpl<
        _SearchChannelPersonalDataDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchChannelPersonalDataDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannelPersonalDataDto &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, following, privateUserBlock);

  @override
  String toString() {
    return 'SearchChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelPersonalDataDtoCopyWith<$Res>
    implements $SearchChannelPersonalDataDtoCopyWith<$Res> {
  factory _$SearchChannelPersonalDataDtoCopyWith(
    _SearchChannelPersonalDataDto value,
    $Res Function(_SearchChannelPersonalDataDto) _then,
  ) = __$SearchChannelPersonalDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    SearchChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  @override
  $SearchChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$SearchChannelPersonalDataDtoCopyWithImpl<$Res>
    implements _$SearchChannelPersonalDataDtoCopyWith<$Res> {
  __$SearchChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final _SearchChannelPersonalDataDto _self;
  final $Res Function(_SearchChannelPersonalDataDto) _then;

  /// Create a copy of SearchChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _SearchChannelPersonalDataDto(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as SearchChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of SearchChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $SearchChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// @nodoc
mixin _$SearchChannelPersonalFollowingDto {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of SearchChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchChannelPersonalFollowingDtoCopyWith<SearchChannelPersonalFollowingDto>
  get copyWith =>
      _$SearchChannelPersonalFollowingDtoCopyWithImpl<
        SearchChannelPersonalFollowingDto
      >(this as SearchChannelPersonalFollowingDto, _$identity);

  /// Serializes this SearchChannelPersonalFollowingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchChannelPersonalFollowingDto &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.followDate, followDate) ||
                other.followDate == followDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, following, notification, followDate);

  @override
  String toString() {
    return 'SearchChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $SearchChannelPersonalFollowingDtoCopyWith<$Res> {
  factory $SearchChannelPersonalFollowingDtoCopyWith(
    SearchChannelPersonalFollowingDto value,
    $Res Function(SearchChannelPersonalFollowingDto) _then,
  ) = _$SearchChannelPersonalFollowingDtoCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$SearchChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements $SearchChannelPersonalFollowingDtoCopyWith<$Res> {
  _$SearchChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final SearchChannelPersonalFollowingDto _self;
  final $Res Function(SearchChannelPersonalFollowingDto) _then;

  /// Create a copy of SearchChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchChannelPersonalFollowingDto].
extension SearchChannelPersonalFollowingDtoPatterns
    on SearchChannelPersonalFollowingDto {
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
    TResult Function(_SearchChannelPersonalFollowingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalFollowingDto() when $default != null:
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
    TResult Function(_SearchChannelPersonalFollowingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalFollowingDto():
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
    TResult? Function(_SearchChannelPersonalFollowingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalFollowingDto() when $default != null:
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
    TResult Function(bool following, bool notification, String? followDate)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
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
    TResult Function(bool following, bool notification, String? followDate)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalFollowingDto():
        return $default(_that.following, _that.notification, _that.followDate);
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
    TResult? Function(bool following, bool notification, String? followDate)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchChannelPersonalFollowingDto
    implements SearchChannelPersonalFollowingDto {
  const _SearchChannelPersonalFollowingDto({
    this.following = false,
    this.notification = false,
    this.followDate,
  });
  factory _SearchChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$SearchChannelPersonalFollowingDtoFromJson(json);

  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of SearchChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchChannelPersonalFollowingDtoCopyWith<
    _SearchChannelPersonalFollowingDto
  >
  get copyWith =>
      __$SearchChannelPersonalFollowingDtoCopyWithImpl<
        _SearchChannelPersonalFollowingDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchChannelPersonalFollowingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchChannelPersonalFollowingDto &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.followDate, followDate) ||
                other.followDate == followDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, following, notification, followDate);

  @override
  String toString() {
    return 'SearchChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$SearchChannelPersonalFollowingDtoCopyWith<$Res>
    implements $SearchChannelPersonalFollowingDtoCopyWith<$Res> {
  factory _$SearchChannelPersonalFollowingDtoCopyWith(
    _SearchChannelPersonalFollowingDto value,
    $Res Function(_SearchChannelPersonalFollowingDto) _then,
  ) = __$SearchChannelPersonalFollowingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$SearchChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements _$SearchChannelPersonalFollowingDtoCopyWith<$Res> {
  __$SearchChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final _SearchChannelPersonalFollowingDto _self;
  final $Res Function(_SearchChannelPersonalFollowingDto) _then;

  /// Create a copy of SearchChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _SearchChannelPersonalFollowingDto(
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
      ),
    );
  }
}
