// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_tag_results_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchTagLiveListDto {
  List<SearchTagLiveDto> get data;
  SearchTagLivePageDto? get page;
  int get size;

  /// Create a copy of SearchTagLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagLiveListDtoCopyWith<SearchTagLiveListDto> get copyWith =>
      _$SearchTagLiveListDtoCopyWithImpl<SearchTagLiveListDto>(
        this as SearchTagLiveListDto,
        _$identity,
      );

  /// Serializes this SearchTagLiveListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagLiveListDto &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    page,
    size,
  );

  @override
  String toString() {
    return 'SearchTagLiveListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class $SearchTagLiveListDtoCopyWith<$Res> {
  factory $SearchTagLiveListDtoCopyWith(
    SearchTagLiveListDto value,
    $Res Function(SearchTagLiveListDto) _then,
  ) = _$SearchTagLiveListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<SearchTagLiveDto> data,
    SearchTagLivePageDto? page,
    int size,
  });

  $SearchTagLivePageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$SearchTagLiveListDtoCopyWithImpl<$Res>
    implements $SearchTagLiveListDtoCopyWith<$Res> {
  _$SearchTagLiveListDtoCopyWithImpl(this._self, this._then);

  final SearchTagLiveListDto _self;
  final $Res Function(SearchTagLiveListDto) _then;

  /// Create a copy of SearchTagLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _self.copyWith(
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchTagLiveDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchTagLivePageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of SearchTagLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagLivePageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchTagLivePageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchTagLiveListDto].
extension SearchTagLiveListDtoPatterns on SearchTagLiveListDto {
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
    TResult Function(_SearchTagLiveListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveListDto() when $default != null:
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
    TResult Function(_SearchTagLiveListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveListDto():
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
    TResult? Function(_SearchTagLiveListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveListDto() when $default != null:
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
      List<SearchTagLiveDto> data,
      SearchTagLivePageDto? page,
      int size,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
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
      List<SearchTagLiveDto> data,
      SearchTagLivePageDto? page,
      int size,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveListDto():
        return $default(_that.data, _that.page, _that.size);
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
      List<SearchTagLiveDto> data,
      SearchTagLivePageDto? page,
      int size,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagLiveListDto implements SearchTagLiveListDto {
  const _SearchTagLiveListDto({
    final List<SearchTagLiveDto> data = const <SearchTagLiveDto>[],
    this.page,
    this.size = 0,
  }) : _data = data;
  factory _SearchTagLiveListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLiveListDtoFromJson(json);

  final List<SearchTagLiveDto> _data;
  @override
  @JsonKey()
  List<SearchTagLiveDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final SearchTagLivePageDto? page;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of SearchTagLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagLiveListDtoCopyWith<_SearchTagLiveListDto> get copyWith =>
      __$SearchTagLiveListDtoCopyWithImpl<_SearchTagLiveListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagLiveListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagLiveListDto &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    page,
    size,
  );

  @override
  String toString() {
    return 'SearchTagLiveListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagLiveListDtoCopyWith<$Res>
    implements $SearchTagLiveListDtoCopyWith<$Res> {
  factory _$SearchTagLiveListDtoCopyWith(
    _SearchTagLiveListDto value,
    $Res Function(_SearchTagLiveListDto) _then,
  ) = __$SearchTagLiveListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<SearchTagLiveDto> data,
    SearchTagLivePageDto? page,
    int size,
  });

  @override
  $SearchTagLivePageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$SearchTagLiveListDtoCopyWithImpl<$Res>
    implements _$SearchTagLiveListDtoCopyWith<$Res> {
  __$SearchTagLiveListDtoCopyWithImpl(this._self, this._then);

  final _SearchTagLiveListDto _self;
  final $Res Function(_SearchTagLiveListDto) _then;

  /// Create a copy of SearchTagLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _SearchTagLiveListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchTagLiveDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchTagLivePageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of SearchTagLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagLivePageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchTagLivePageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$SearchTagLivePageDto {
  SearchTagLivePageNextDto? get next;

  /// Create a copy of SearchTagLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagLivePageDtoCopyWith<SearchTagLivePageDto> get copyWith =>
      _$SearchTagLivePageDtoCopyWithImpl<SearchTagLivePageDto>(
        this as SearchTagLivePageDto,
        _$identity,
      );

  /// Serializes this SearchTagLivePageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagLivePageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'SearchTagLivePageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $SearchTagLivePageDtoCopyWith<$Res> {
  factory $SearchTagLivePageDtoCopyWith(
    SearchTagLivePageDto value,
    $Res Function(SearchTagLivePageDto) _then,
  ) = _$SearchTagLivePageDtoCopyWithImpl;
  @useResult
  $Res call({SearchTagLivePageNextDto? next});

  $SearchTagLivePageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$SearchTagLivePageDtoCopyWithImpl<$Res>
    implements $SearchTagLivePageDtoCopyWith<$Res> {
  _$SearchTagLivePageDtoCopyWithImpl(this._self, this._then);

  final SearchTagLivePageDto _self;
  final $Res Function(SearchTagLivePageDto) _then;

  /// Create a copy of SearchTagLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as SearchTagLivePageNextDto?,
      ),
    );
  }

  /// Create a copy of SearchTagLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagLivePageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $SearchTagLivePageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchTagLivePageDto].
extension SearchTagLivePageDtoPatterns on SearchTagLivePageDto {
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
    TResult Function(_SearchTagLivePageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagLivePageDto() when $default != null:
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
    TResult Function(_SearchTagLivePageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLivePageDto():
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
    TResult? Function(_SearchTagLivePageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLivePageDto() when $default != null:
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
    TResult Function(SearchTagLivePageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagLivePageDto() when $default != null:
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
    TResult Function(SearchTagLivePageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLivePageDto():
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
    TResult? Function(SearchTagLivePageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLivePageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagLivePageDto implements SearchTagLivePageDto {
  const _SearchTagLivePageDto({this.next});
  factory _SearchTagLivePageDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLivePageDtoFromJson(json);

  @override
  final SearchTagLivePageNextDto? next;

  /// Create a copy of SearchTagLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagLivePageDtoCopyWith<_SearchTagLivePageDto> get copyWith =>
      __$SearchTagLivePageDtoCopyWithImpl<_SearchTagLivePageDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagLivePageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagLivePageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'SearchTagLivePageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagLivePageDtoCopyWith<$Res>
    implements $SearchTagLivePageDtoCopyWith<$Res> {
  factory _$SearchTagLivePageDtoCopyWith(
    _SearchTagLivePageDto value,
    $Res Function(_SearchTagLivePageDto) _then,
  ) = __$SearchTagLivePageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({SearchTagLivePageNextDto? next});

  @override
  $SearchTagLivePageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$SearchTagLivePageDtoCopyWithImpl<$Res>
    implements _$SearchTagLivePageDtoCopyWith<$Res> {
  __$SearchTagLivePageDtoCopyWithImpl(this._self, this._then);

  final _SearchTagLivePageDto _self;
  final $Res Function(_SearchTagLivePageDto) _then;

  /// Create a copy of SearchTagLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _SearchTagLivePageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as SearchTagLivePageNextDto?,
      ),
    );
  }

  /// Create a copy of SearchTagLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagLivePageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $SearchTagLivePageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$SearchTagLivePageNextDto {
  int? get concurrentUserCount;
  int? get liveId;

  /// Create a copy of SearchTagLivePageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagLivePageNextDtoCopyWith<SearchTagLivePageNextDto> get copyWith =>
      _$SearchTagLivePageNextDtoCopyWithImpl<SearchTagLivePageNextDto>(
        this as SearchTagLivePageNextDto,
        _$identity,
      );

  /// Serializes this SearchTagLivePageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagLivePageNextDto &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'SearchTagLivePageNextDto(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class $SearchTagLivePageNextDtoCopyWith<$Res> {
  factory $SearchTagLivePageNextDtoCopyWith(
    SearchTagLivePageNextDto value,
    $Res Function(SearchTagLivePageNextDto) _then,
  ) = _$SearchTagLivePageNextDtoCopyWithImpl;
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class _$SearchTagLivePageNextDtoCopyWithImpl<$Res>
    implements $SearchTagLivePageNextDtoCopyWith<$Res> {
  _$SearchTagLivePageNextDtoCopyWithImpl(this._self, this._then);

  final SearchTagLivePageNextDto _self;
  final $Res Function(SearchTagLivePageNextDto) _then;

  /// Create a copy of SearchTagLivePageNextDto
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

/// Adds pattern-matching-related methods to [SearchTagLivePageNextDto].
extension SearchTagLivePageNextDtoPatterns on SearchTagLivePageNextDto {
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
    TResult Function(_SearchTagLivePageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagLivePageNextDto() when $default != null:
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
    TResult Function(_SearchTagLivePageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLivePageNextDto():
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
    TResult? Function(_SearchTagLivePageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLivePageNextDto() when $default != null:
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
      case _SearchTagLivePageNextDto() when $default != null:
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
      case _SearchTagLivePageNextDto():
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
      case _SearchTagLivePageNextDto() when $default != null:
        return $default(_that.concurrentUserCount, _that.liveId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagLivePageNextDto implements SearchTagLivePageNextDto {
  const _SearchTagLivePageNextDto({this.concurrentUserCount, this.liveId});
  factory _SearchTagLivePageNextDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLivePageNextDtoFromJson(json);

  @override
  final int? concurrentUserCount;
  @override
  final int? liveId;

  /// Create a copy of SearchTagLivePageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagLivePageNextDtoCopyWith<_SearchTagLivePageNextDto> get copyWith =>
      __$SearchTagLivePageNextDtoCopyWithImpl<_SearchTagLivePageNextDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagLivePageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagLivePageNextDto &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'SearchTagLivePageNextDto(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagLivePageNextDtoCopyWith<$Res>
    implements $SearchTagLivePageNextDtoCopyWith<$Res> {
  factory _$SearchTagLivePageNextDtoCopyWith(
    _SearchTagLivePageNextDto value,
    $Res Function(_SearchTagLivePageNextDto) _then,
  ) = __$SearchTagLivePageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class __$SearchTagLivePageNextDtoCopyWithImpl<$Res>
    implements _$SearchTagLivePageNextDtoCopyWith<$Res> {
  __$SearchTagLivePageNextDtoCopyWithImpl(this._self, this._then);

  final _SearchTagLivePageNextDto _self;
  final $Res Function(_SearchTagLivePageNextDto) _then;

  /// Create a copy of SearchTagLivePageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? concurrentUserCount = freezed, Object? liveId = freezed}) {
    return _then(
      _SearchTagLivePageNextDto(
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
mixin _$SearchTagVideoListDto {
  List<SearchTagVideoDto> get data;
  SearchTagVideoPageDto? get page;
  int get size;

  /// Create a copy of SearchTagVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagVideoListDtoCopyWith<SearchTagVideoListDto> get copyWith =>
      _$SearchTagVideoListDtoCopyWithImpl<SearchTagVideoListDto>(
        this as SearchTagVideoListDto,
        _$identity,
      );

  /// Serializes this SearchTagVideoListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagVideoListDto &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    page,
    size,
  );

  @override
  String toString() {
    return 'SearchTagVideoListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class $SearchTagVideoListDtoCopyWith<$Res> {
  factory $SearchTagVideoListDtoCopyWith(
    SearchTagVideoListDto value,
    $Res Function(SearchTagVideoListDto) _then,
  ) = _$SearchTagVideoListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<SearchTagVideoDto> data,
    SearchTagVideoPageDto? page,
    int size,
  });

  $SearchTagVideoPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$SearchTagVideoListDtoCopyWithImpl<$Res>
    implements $SearchTagVideoListDtoCopyWith<$Res> {
  _$SearchTagVideoListDtoCopyWithImpl(this._self, this._then);

  final SearchTagVideoListDto _self;
  final $Res Function(SearchTagVideoListDto) _then;

  /// Create a copy of SearchTagVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _self.copyWith(
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchTagVideoDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchTagVideoPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of SearchTagVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagVideoPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchTagVideoPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchTagVideoListDto].
extension SearchTagVideoListDtoPatterns on SearchTagVideoListDto {
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
    TResult Function(_SearchTagVideoListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoListDto() when $default != null:
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
    TResult Function(_SearchTagVideoListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoListDto():
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
    TResult? Function(_SearchTagVideoListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoListDto() when $default != null:
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
      List<SearchTagVideoDto> data,
      SearchTagVideoPageDto? page,
      int size,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
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
      List<SearchTagVideoDto> data,
      SearchTagVideoPageDto? page,
      int size,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoListDto():
        return $default(_that.data, _that.page, _that.size);
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
      List<SearchTagVideoDto> data,
      SearchTagVideoPageDto? page,
      int size,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagVideoListDto implements SearchTagVideoListDto {
  const _SearchTagVideoListDto({
    final List<SearchTagVideoDto> data = const <SearchTagVideoDto>[],
    this.page,
    this.size = 0,
  }) : _data = data;
  factory _SearchTagVideoListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVideoListDtoFromJson(json);

  final List<SearchTagVideoDto> _data;
  @override
  @JsonKey()
  List<SearchTagVideoDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final SearchTagVideoPageDto? page;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of SearchTagVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagVideoListDtoCopyWith<_SearchTagVideoListDto> get copyWith =>
      __$SearchTagVideoListDtoCopyWithImpl<_SearchTagVideoListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagVideoListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagVideoListDto &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    page,
    size,
  );

  @override
  String toString() {
    return 'SearchTagVideoListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagVideoListDtoCopyWith<$Res>
    implements $SearchTagVideoListDtoCopyWith<$Res> {
  factory _$SearchTagVideoListDtoCopyWith(
    _SearchTagVideoListDto value,
    $Res Function(_SearchTagVideoListDto) _then,
  ) = __$SearchTagVideoListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<SearchTagVideoDto> data,
    SearchTagVideoPageDto? page,
    int size,
  });

  @override
  $SearchTagVideoPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$SearchTagVideoListDtoCopyWithImpl<$Res>
    implements _$SearchTagVideoListDtoCopyWith<$Res> {
  __$SearchTagVideoListDtoCopyWithImpl(this._self, this._then);

  final _SearchTagVideoListDto _self;
  final $Res Function(_SearchTagVideoListDto) _then;

  /// Create a copy of SearchTagVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _SearchTagVideoListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SearchTagVideoDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as SearchTagVideoPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of SearchTagVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagVideoPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $SearchTagVideoPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$SearchTagVideoPageDto {
  SearchTagVideoPageNextDto? get next;

  /// Create a copy of SearchTagVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagVideoPageDtoCopyWith<SearchTagVideoPageDto> get copyWith =>
      _$SearchTagVideoPageDtoCopyWithImpl<SearchTagVideoPageDto>(
        this as SearchTagVideoPageDto,
        _$identity,
      );

  /// Serializes this SearchTagVideoPageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagVideoPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'SearchTagVideoPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $SearchTagVideoPageDtoCopyWith<$Res> {
  factory $SearchTagVideoPageDtoCopyWith(
    SearchTagVideoPageDto value,
    $Res Function(SearchTagVideoPageDto) _then,
  ) = _$SearchTagVideoPageDtoCopyWithImpl;
  @useResult
  $Res call({SearchTagVideoPageNextDto? next});

  $SearchTagVideoPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$SearchTagVideoPageDtoCopyWithImpl<$Res>
    implements $SearchTagVideoPageDtoCopyWith<$Res> {
  _$SearchTagVideoPageDtoCopyWithImpl(this._self, this._then);

  final SearchTagVideoPageDto _self;
  final $Res Function(SearchTagVideoPageDto) _then;

  /// Create a copy of SearchTagVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as SearchTagVideoPageNextDto?,
      ),
    );
  }

  /// Create a copy of SearchTagVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagVideoPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $SearchTagVideoPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchTagVideoPageDto].
extension SearchTagVideoPageDtoPatterns on SearchTagVideoPageDto {
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
    TResult Function(_SearchTagVideoPageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageDto() when $default != null:
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
    TResult Function(_SearchTagVideoPageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageDto():
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
    TResult? Function(_SearchTagVideoPageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageDto() when $default != null:
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
    TResult Function(SearchTagVideoPageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageDto() when $default != null:
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
    TResult Function(SearchTagVideoPageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageDto():
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
    TResult? Function(SearchTagVideoPageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagVideoPageDto implements SearchTagVideoPageDto {
  const _SearchTagVideoPageDto({this.next});
  factory _SearchTagVideoPageDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVideoPageDtoFromJson(json);

  @override
  final SearchTagVideoPageNextDto? next;

  /// Create a copy of SearchTagVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagVideoPageDtoCopyWith<_SearchTagVideoPageDto> get copyWith =>
      __$SearchTagVideoPageDtoCopyWithImpl<_SearchTagVideoPageDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagVideoPageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagVideoPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'SearchTagVideoPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagVideoPageDtoCopyWith<$Res>
    implements $SearchTagVideoPageDtoCopyWith<$Res> {
  factory _$SearchTagVideoPageDtoCopyWith(
    _SearchTagVideoPageDto value,
    $Res Function(_SearchTagVideoPageDto) _then,
  ) = __$SearchTagVideoPageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({SearchTagVideoPageNextDto? next});

  @override
  $SearchTagVideoPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$SearchTagVideoPageDtoCopyWithImpl<$Res>
    implements _$SearchTagVideoPageDtoCopyWith<$Res> {
  __$SearchTagVideoPageDtoCopyWithImpl(this._self, this._then);

  final _SearchTagVideoPageDto _self;
  final $Res Function(_SearchTagVideoPageDto) _then;

  /// Create a copy of SearchTagVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _SearchTagVideoPageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as SearchTagVideoPageNextDto?,
      ),
    );
  }

  /// Create a copy of SearchTagVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagVideoPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $SearchTagVideoPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$SearchTagVideoPageNextDto {
  int? get start;

  /// Create a copy of SearchTagVideoPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagVideoPageNextDtoCopyWith<SearchTagVideoPageNextDto> get copyWith =>
      _$SearchTagVideoPageNextDtoCopyWithImpl<SearchTagVideoPageNextDto>(
        this as SearchTagVideoPageNextDto,
        _$identity,
      );

  /// Serializes this SearchTagVideoPageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagVideoPageNextDto &&
            (identical(other.start, start) || other.start == start));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start);

  @override
  String toString() {
    return 'SearchTagVideoPageNextDto(start: $start)';
  }
}

/// @nodoc
abstract mixin class $SearchTagVideoPageNextDtoCopyWith<$Res> {
  factory $SearchTagVideoPageNextDtoCopyWith(
    SearchTagVideoPageNextDto value,
    $Res Function(SearchTagVideoPageNextDto) _then,
  ) = _$SearchTagVideoPageNextDtoCopyWithImpl;
  @useResult
  $Res call({int? start});
}

/// @nodoc
class _$SearchTagVideoPageNextDtoCopyWithImpl<$Res>
    implements $SearchTagVideoPageNextDtoCopyWith<$Res> {
  _$SearchTagVideoPageNextDtoCopyWithImpl(this._self, this._then);

  final SearchTagVideoPageNextDto _self;
  final $Res Function(SearchTagVideoPageNextDto) _then;

  /// Create a copy of SearchTagVideoPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = freezed}) {
    return _then(
      _self.copyWith(
        start: freezed == start
            ? _self.start
            : start // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchTagVideoPageNextDto].
extension SearchTagVideoPageNextDtoPatterns on SearchTagVideoPageNextDto {
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
    TResult Function(_SearchTagVideoPageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageNextDto() when $default != null:
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
    TResult Function(_SearchTagVideoPageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageNextDto():
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
    TResult? Function(_SearchTagVideoPageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageNextDto() when $default != null:
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
    TResult Function(int? start)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageNextDto() when $default != null:
        return $default(_that.start);
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
  TResult when<TResult extends Object?>(TResult Function(int? start) $default) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageNextDto():
        return $default(_that.start);
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
    TResult? Function(int? start)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoPageNextDto() when $default != null:
        return $default(_that.start);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagVideoPageNextDto implements SearchTagVideoPageNextDto {
  const _SearchTagVideoPageNextDto({this.start});
  factory _SearchTagVideoPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVideoPageNextDtoFromJson(json);

  @override
  final int? start;

  /// Create a copy of SearchTagVideoPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagVideoPageNextDtoCopyWith<_SearchTagVideoPageNextDto>
  get copyWith =>
      __$SearchTagVideoPageNextDtoCopyWithImpl<_SearchTagVideoPageNextDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagVideoPageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagVideoPageNextDto &&
            (identical(other.start, start) || other.start == start));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start);

  @override
  String toString() {
    return 'SearchTagVideoPageNextDto(start: $start)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagVideoPageNextDtoCopyWith<$Res>
    implements $SearchTagVideoPageNextDtoCopyWith<$Res> {
  factory _$SearchTagVideoPageNextDtoCopyWith(
    _SearchTagVideoPageNextDto value,
    $Res Function(_SearchTagVideoPageNextDto) _then,
  ) = __$SearchTagVideoPageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? start});
}

/// @nodoc
class __$SearchTagVideoPageNextDtoCopyWithImpl<$Res>
    implements _$SearchTagVideoPageNextDtoCopyWith<$Res> {
  __$SearchTagVideoPageNextDtoCopyWithImpl(this._self, this._then);

  final _SearchTagVideoPageNextDto _self;
  final $Res Function(_SearchTagVideoPageNextDto) _then;

  /// Create a copy of SearchTagVideoPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? start = freezed}) {
    return _then(
      _SearchTagVideoPageNextDto(
        start: freezed == start
            ? _self.start
            : start // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$SearchTagLiveDto {
  int get liveId;
  String get liveTitle;
  String? get liveImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  String? get openDate;
  bool get adult;
  List<String> get tags;
  String? get liveCategoryValue;
  SearchTagChannelDto? get channel;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;
  Map<String, dynamic>? get party;

  /// Create a copy of SearchTagLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagLiveDtoCopyWith<SearchTagLiveDto> get copyWith =>
      _$SearchTagLiveDtoCopyWithImpl<SearchTagLiveDto>(
        this as SearchTagLiveDto,
        _$identity,
      );

  /// Serializes this SearchTagLiveDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagLiveDto &&
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
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
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
    liveCategoryValue,
    channel,
    blindType,
    watchPartyTag,
    watchPartyType,
    const DeepCollectionEquality().hash(party),
  );

  @override
  String toString() {
    return 'SearchTagLiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, liveCategoryValue: $liveCategoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, party: $party)';
  }
}

/// @nodoc
abstract mixin class $SearchTagLiveDtoCopyWith<$Res> {
  factory $SearchTagLiveDtoCopyWith(
    SearchTagLiveDto value,
    $Res Function(SearchTagLiveDto) _then,
  ) = _$SearchTagLiveDtoCopyWithImpl;
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
    String? liveCategoryValue,
    SearchTagChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    Map<String, dynamic>? party,
  });

  $SearchTagChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$SearchTagLiveDtoCopyWithImpl<$Res>
    implements $SearchTagLiveDtoCopyWith<$Res> {
  _$SearchTagLiveDtoCopyWithImpl(this._self, this._then);

  final SearchTagLiveDto _self;
  final $Res Function(SearchTagLiveDto) _then;

  /// Create a copy of SearchTagLiveDto
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
    Object? liveCategoryValue = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
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
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchTagChannelDto?,
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
        party: freezed == party
            ? _self.party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }

  /// Create a copy of SearchTagLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchTagChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchTagLiveDto].
extension SearchTagLiveDtoPatterns on SearchTagLiveDto {
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
    TResult Function(_SearchTagLiveDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveDto() when $default != null:
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
    TResult Function(_SearchTagLiveDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveDto():
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
    TResult? Function(_SearchTagLiveDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveDto() when $default != null:
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
      String? liveCategoryValue,
      SearchTagChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      Map<String, dynamic>? party,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.liveCategoryValue,
          _that.channel,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
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
      String? liveCategoryValue,
      SearchTagChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      Map<String, dynamic>? party,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveDto():
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.liveCategoryValue,
          _that.channel,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
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
      String? liveCategoryValue,
      SearchTagChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      Map<String, dynamic>? party,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagLiveDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.liveCategoryValue,
          _that.channel,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.party,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagLiveDto implements SearchTagLiveDto {
  const _SearchTagLiveDto({
    this.liveId = 0,
    this.liveTitle = '',
    this.liveImageUrl,
    this.defaultThumbnailImageUrl,
    this.concurrentUserCount = 0,
    this.openDate,
    this.adult = false,
    final List<String> tags = const <String>[],
    this.liveCategoryValue,
    this.channel,
    this.blindType,
    this.watchPartyTag,
    this.watchPartyType,
    final Map<String, dynamic>? party,
  }) : _tags = tags,
       _party = party;
  factory _SearchTagLiveDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLiveDtoFromJson(json);

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
  final String? liveCategoryValue;
  @override
  final SearchTagChannelDto? channel;
  @override
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  final Map<String, dynamic>? _party;
  @override
  Map<String, dynamic>? get party {
    final value = _party;
    if (value == null) return null;
    if (_party is EqualUnmodifiableMapView) return _party;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of SearchTagLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagLiveDtoCopyWith<_SearchTagLiveDto> get copyWith =>
      __$SearchTagLiveDtoCopyWithImpl<_SearchTagLiveDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagLiveDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagLiveDto &&
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
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
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
    liveCategoryValue,
    channel,
    blindType,
    watchPartyTag,
    watchPartyType,
    const DeepCollectionEquality().hash(_party),
  );

  @override
  String toString() {
    return 'SearchTagLiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, liveCategoryValue: $liveCategoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, party: $party)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagLiveDtoCopyWith<$Res>
    implements $SearchTagLiveDtoCopyWith<$Res> {
  factory _$SearchTagLiveDtoCopyWith(
    _SearchTagLiveDto value,
    $Res Function(_SearchTagLiveDto) _then,
  ) = __$SearchTagLiveDtoCopyWithImpl;
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
    String? liveCategoryValue,
    SearchTagChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    Map<String, dynamic>? party,
  });

  @override
  $SearchTagChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$SearchTagLiveDtoCopyWithImpl<$Res>
    implements _$SearchTagLiveDtoCopyWith<$Res> {
  __$SearchTagLiveDtoCopyWithImpl(this._self, this._then);

  final _SearchTagLiveDto _self;
  final $Res Function(_SearchTagLiveDto) _then;

  /// Create a copy of SearchTagLiveDto
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
    Object? liveCategoryValue = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? party = freezed,
  }) {
    return _then(
      _SearchTagLiveDto(
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
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as SearchTagChannelDto?,
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
        party: freezed == party
            ? _self._party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }

  /// Create a copy of SearchTagLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchTagChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$SearchTagVideoDto {
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
  SearchTagChannelDto? get channel;
  String? get blindType;
  int? get watchTimeline;

  /// Create a copy of SearchTagVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagVideoDtoCopyWith<SearchTagVideoDto> get copyWith =>
      _$SearchTagVideoDtoCopyWithImpl<SearchTagVideoDto>(
        this as SearchTagVideoDto,
        _$identity,
      );

  /// Serializes this SearchTagVideoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagVideoDto &&
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
    return 'SearchTagVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class $SearchTagVideoDtoCopyWith<$Res> {
  factory $SearchTagVideoDtoCopyWith(
    SearchTagVideoDto value,
    $Res Function(SearchTagVideoDto) _then,
  ) = _$SearchTagVideoDtoCopyWithImpl;
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
    SearchTagChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  $SearchTagChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$SearchTagVideoDtoCopyWithImpl<$Res>
    implements $SearchTagVideoDtoCopyWith<$Res> {
  _$SearchTagVideoDtoCopyWithImpl(this._self, this._then);

  final SearchTagVideoDto _self;
  final $Res Function(SearchTagVideoDto) _then;

  /// Create a copy of SearchTagVideoDto
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
                  as SearchTagChannelDto?,
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

  /// Create a copy of SearchTagVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchTagChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchTagVideoDto].
extension SearchTagVideoDtoPatterns on SearchTagVideoDto {
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
    TResult Function(_SearchTagVideoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoDto() when $default != null:
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
    TResult Function(_SearchTagVideoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoDto():
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
    TResult? Function(_SearchTagVideoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoDto() when $default != null:
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
      SearchTagChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoDto() when $default != null:
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
      SearchTagChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoDto():
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
      SearchTagChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagVideoDto() when $default != null:
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
class _SearchTagVideoDto implements SearchTagVideoDto {
  const _SearchTagVideoDto({
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
  factory _SearchTagVideoDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVideoDtoFromJson(json);

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
  final SearchTagChannelDto? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;

  /// Create a copy of SearchTagVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagVideoDtoCopyWith<_SearchTagVideoDto> get copyWith =>
      __$SearchTagVideoDtoCopyWithImpl<_SearchTagVideoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagVideoDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagVideoDto &&
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
    return 'SearchTagVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagVideoDtoCopyWith<$Res>
    implements $SearchTagVideoDtoCopyWith<$Res> {
  factory _$SearchTagVideoDtoCopyWith(
    _SearchTagVideoDto value,
    $Res Function(_SearchTagVideoDto) _then,
  ) = __$SearchTagVideoDtoCopyWithImpl;
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
    SearchTagChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  @override
  $SearchTagChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$SearchTagVideoDtoCopyWithImpl<$Res>
    implements _$SearchTagVideoDtoCopyWith<$Res> {
  __$SearchTagVideoDtoCopyWithImpl(this._self, this._then);

  final _SearchTagVideoDto _self;
  final $Res Function(_SearchTagVideoDto) _then;

  /// Create a copy of SearchTagVideoDto
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
      _SearchTagVideoDto(
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
                  as SearchTagChannelDto?,
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

  /// Create a copy of SearchTagVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $SearchTagChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$SearchTagChannelDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  SearchTagChannelPersonalDataDto? get personalData;

  /// Create a copy of SearchTagChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagChannelDtoCopyWith<SearchTagChannelDto> get copyWith =>
      _$SearchTagChannelDtoCopyWithImpl<SearchTagChannelDto>(
        this as SearchTagChannelDto,
        _$identity,
      );

  /// Serializes this SearchTagChannelDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagChannelDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'SearchTagChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $SearchTagChannelDtoCopyWith<$Res> {
  factory $SearchTagChannelDtoCopyWith(
    SearchTagChannelDto value,
    $Res Function(SearchTagChannelDto) _then,
  ) = _$SearchTagChannelDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    SearchTagChannelPersonalDataDto? personalData,
  });

  $SearchTagChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$SearchTagChannelDtoCopyWithImpl<$Res>
    implements $SearchTagChannelDtoCopyWith<$Res> {
  _$SearchTagChannelDtoCopyWithImpl(this._self, this._then);

  final SearchTagChannelDto _self;
  final $Res Function(SearchTagChannelDto) _then;

  /// Create a copy of SearchTagChannelDto
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
                  as SearchTagChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of SearchTagChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $SearchTagChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchTagChannelDto].
extension SearchTagChannelDtoPatterns on SearchTagChannelDto {
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
    TResult Function(_SearchTagChannelDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelDto() when $default != null:
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
    TResult Function(_SearchTagChannelDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelDto():
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
    TResult? Function(_SearchTagChannelDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelDto() when $default != null:
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
      SearchTagChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelDto() when $default != null:
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
      SearchTagChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelDto():
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
      SearchTagChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelDto() when $default != null:
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
@JsonSerializable()
class _SearchTagChannelDto implements SearchTagChannelDto {
  const _SearchTagChannelDto({
    this.channelId = '',
    this.channelName = '',
    this.channelImageUrl,
    this.verifiedMark = false,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _SearchTagChannelDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagChannelDtoFromJson(json);

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
  final SearchTagChannelPersonalDataDto? personalData;

  /// Create a copy of SearchTagChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagChannelDtoCopyWith<_SearchTagChannelDto> get copyWith =>
      __$SearchTagChannelDtoCopyWithImpl<_SearchTagChannelDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagChannelDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagChannelDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'SearchTagChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagChannelDtoCopyWith<$Res>
    implements $SearchTagChannelDtoCopyWith<$Res> {
  factory _$SearchTagChannelDtoCopyWith(
    _SearchTagChannelDto value,
    $Res Function(_SearchTagChannelDto) _then,
  ) = __$SearchTagChannelDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    SearchTagChannelPersonalDataDto? personalData,
  });

  @override
  $SearchTagChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$SearchTagChannelDtoCopyWithImpl<$Res>
    implements _$SearchTagChannelDtoCopyWith<$Res> {
  __$SearchTagChannelDtoCopyWithImpl(this._self, this._then);

  final _SearchTagChannelDto _self;
  final $Res Function(_SearchTagChannelDto) _then;

  /// Create a copy of SearchTagChannelDto
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
      _SearchTagChannelDto(
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
                  as SearchTagChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of SearchTagChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $SearchTagChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$SearchTagChannelPersonalDataDto {
  SearchTagChannelPersonalFollowingDto? get following;
  bool get privateUserBlock;

  /// Create a copy of SearchTagChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagChannelPersonalDataDtoCopyWith<SearchTagChannelPersonalDataDto>
  get copyWith =>
      _$SearchTagChannelPersonalDataDtoCopyWithImpl<
        SearchTagChannelPersonalDataDto
      >(this as SearchTagChannelPersonalDataDto, _$identity);

  /// Serializes this SearchTagChannelPersonalDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagChannelPersonalDataDto &&
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
    return 'SearchTagChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $SearchTagChannelPersonalDataDtoCopyWith<$Res> {
  factory $SearchTagChannelPersonalDataDtoCopyWith(
    SearchTagChannelPersonalDataDto value,
    $Res Function(SearchTagChannelPersonalDataDto) _then,
  ) = _$SearchTagChannelPersonalDataDtoCopyWithImpl;
  @useResult
  $Res call({
    SearchTagChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  $SearchTagChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$SearchTagChannelPersonalDataDtoCopyWithImpl<$Res>
    implements $SearchTagChannelPersonalDataDtoCopyWith<$Res> {
  _$SearchTagChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final SearchTagChannelPersonalDataDto _self;
  final $Res Function(SearchTagChannelPersonalDataDto) _then;

  /// Create a copy of SearchTagChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as SearchTagChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of SearchTagChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $SearchTagChannelPersonalFollowingDtoCopyWith<$Res>(
      _self.following!,
      (value) {
        return _then(_self.copyWith(following: value));
      },
    );
  }
}

/// Adds pattern-matching-related methods to [SearchTagChannelPersonalDataDto].
extension SearchTagChannelPersonalDataDtoPatterns
    on SearchTagChannelPersonalDataDto {
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
    TResult Function(_SearchTagChannelPersonalDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelPersonalDataDto() when $default != null:
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
    TResult Function(_SearchTagChannelPersonalDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelPersonalDataDto():
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
    TResult? Function(_SearchTagChannelPersonalDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelPersonalDataDto() when $default != null:
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
      SearchTagChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelPersonalDataDto() when $default != null:
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
      SearchTagChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelPersonalDataDto():
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
      SearchTagChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagChannelPersonalDataDto
    implements SearchTagChannelPersonalDataDto {
  const _SearchTagChannelPersonalDataDto({
    this.following,
    this.privateUserBlock = false,
  });
  factory _SearchTagChannelPersonalDataDto.fromJson(
    Map<String, dynamic> json,
  ) => _$SearchTagChannelPersonalDataDtoFromJson(json);

  @override
  final SearchTagChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool privateUserBlock;

  /// Create a copy of SearchTagChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagChannelPersonalDataDtoCopyWith<_SearchTagChannelPersonalDataDto>
  get copyWith =>
      __$SearchTagChannelPersonalDataDtoCopyWithImpl<
        _SearchTagChannelPersonalDataDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagChannelPersonalDataDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagChannelPersonalDataDto &&
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
    return 'SearchTagChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagChannelPersonalDataDtoCopyWith<$Res>
    implements $SearchTagChannelPersonalDataDtoCopyWith<$Res> {
  factory _$SearchTagChannelPersonalDataDtoCopyWith(
    _SearchTagChannelPersonalDataDto value,
    $Res Function(_SearchTagChannelPersonalDataDto) _then,
  ) = __$SearchTagChannelPersonalDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    SearchTagChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  @override
  $SearchTagChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$SearchTagChannelPersonalDataDtoCopyWithImpl<$Res>
    implements _$SearchTagChannelPersonalDataDtoCopyWith<$Res> {
  __$SearchTagChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final _SearchTagChannelPersonalDataDto _self;
  final $Res Function(_SearchTagChannelPersonalDataDto) _then;

  /// Create a copy of SearchTagChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _SearchTagChannelPersonalDataDto(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as SearchTagChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of SearchTagChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $SearchTagChannelPersonalFollowingDtoCopyWith<$Res>(
      _self.following!,
      (value) {
        return _then(_self.copyWith(following: value));
      },
    );
  }
}

/// @nodoc
mixin _$SearchTagChannelPersonalFollowingDto {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of SearchTagChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagChannelPersonalFollowingDtoCopyWith<
    SearchTagChannelPersonalFollowingDto
  >
  get copyWith =>
      _$SearchTagChannelPersonalFollowingDtoCopyWithImpl<
        SearchTagChannelPersonalFollowingDto
      >(this as SearchTagChannelPersonalFollowingDto, _$identity);

  /// Serializes this SearchTagChannelPersonalFollowingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagChannelPersonalFollowingDto &&
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
    return 'SearchTagChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $SearchTagChannelPersonalFollowingDtoCopyWith<$Res> {
  factory $SearchTagChannelPersonalFollowingDtoCopyWith(
    SearchTagChannelPersonalFollowingDto value,
    $Res Function(SearchTagChannelPersonalFollowingDto) _then,
  ) = _$SearchTagChannelPersonalFollowingDtoCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$SearchTagChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements $SearchTagChannelPersonalFollowingDtoCopyWith<$Res> {
  _$SearchTagChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final SearchTagChannelPersonalFollowingDto _self;
  final $Res Function(SearchTagChannelPersonalFollowingDto) _then;

  /// Create a copy of SearchTagChannelPersonalFollowingDto
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

/// Adds pattern-matching-related methods to [SearchTagChannelPersonalFollowingDto].
extension SearchTagChannelPersonalFollowingDtoPatterns
    on SearchTagChannelPersonalFollowingDto {
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
    TResult Function(_SearchTagChannelPersonalFollowingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelPersonalFollowingDto() when $default != null:
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
    TResult Function(_SearchTagChannelPersonalFollowingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelPersonalFollowingDto():
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
    TResult? Function(_SearchTagChannelPersonalFollowingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagChannelPersonalFollowingDto() when $default != null:
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
      case _SearchTagChannelPersonalFollowingDto() when $default != null:
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
      case _SearchTagChannelPersonalFollowingDto():
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
      case _SearchTagChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchTagChannelPersonalFollowingDto
    implements SearchTagChannelPersonalFollowingDto {
  const _SearchTagChannelPersonalFollowingDto({
    this.following = false,
    this.notification = false,
    this.followDate,
  });
  factory _SearchTagChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$SearchTagChannelPersonalFollowingDtoFromJson(json);

  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of SearchTagChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagChannelPersonalFollowingDtoCopyWith<
    _SearchTagChannelPersonalFollowingDto
  >
  get copyWith =>
      __$SearchTagChannelPersonalFollowingDtoCopyWithImpl<
        _SearchTagChannelPersonalFollowingDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchTagChannelPersonalFollowingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagChannelPersonalFollowingDto &&
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
    return 'SearchTagChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagChannelPersonalFollowingDtoCopyWith<$Res>
    implements $SearchTagChannelPersonalFollowingDtoCopyWith<$Res> {
  factory _$SearchTagChannelPersonalFollowingDtoCopyWith(
    _SearchTagChannelPersonalFollowingDto value,
    $Res Function(_SearchTagChannelPersonalFollowingDto) _then,
  ) = __$SearchTagChannelPersonalFollowingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$SearchTagChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements _$SearchTagChannelPersonalFollowingDtoCopyWith<$Res> {
  __$SearchTagChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final _SearchTagChannelPersonalFollowingDto _self;
  final $Res Function(_SearchTagChannelPersonalFollowingDto) _then;

  /// Create a copy of SearchTagChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _SearchTagChannelPersonalFollowingDto(
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
