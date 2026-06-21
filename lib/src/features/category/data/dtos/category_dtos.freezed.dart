// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryListDto {
  List<CategoryDto> get data;
  CategoryPageDto? get page;
  int get size;

  /// Create a copy of CategoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryListDtoCopyWith<CategoryListDto> get copyWith =>
      _$CategoryListDtoCopyWithImpl<CategoryListDto>(
        this as CategoryListDto,
        _$identity,
      );

  /// Serializes this CategoryListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryListDto &&
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
    return 'CategoryListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class $CategoryListDtoCopyWith<$Res> {
  factory $CategoryListDtoCopyWith(
    CategoryListDto value,
    $Res Function(CategoryListDto) _then,
  ) = _$CategoryListDtoCopyWithImpl;
  @useResult
  $Res call({List<CategoryDto> data, CategoryPageDto? page, int size});

  $CategoryPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$CategoryListDtoCopyWithImpl<$Res>
    implements $CategoryListDtoCopyWith<$Res> {
  _$CategoryListDtoCopyWithImpl(this._self, this._then);

  final CategoryListDto _self;
  final $Res Function(CategoryListDto) _then;

  /// Create a copy of CategoryListDto
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
                  as List<CategoryDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as CategoryPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $CategoryPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryListDto].
extension CategoryListDtoPatterns on CategoryListDto {
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
    TResult Function(_CategoryListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryListDto() when $default != null:
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
    TResult Function(_CategoryListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryListDto():
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
    TResult? Function(_CategoryListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryListDto() when $default != null:
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
    TResult Function(List<CategoryDto> data, CategoryPageDto? page, int size)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryListDto() when $default != null:
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
    TResult Function(List<CategoryDto> data, CategoryPageDto? page, int size)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryListDto():
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
    TResult? Function(List<CategoryDto> data, CategoryPageDto? page, int size)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryListDto implements CategoryListDto {
  const _CategoryListDto({
    final List<CategoryDto> data = const <CategoryDto>[],
    this.page,
    this.size = 0,
  }) : _data = data;
  factory _CategoryListDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryListDtoFromJson(json);

  final List<CategoryDto> _data;
  @override
  @JsonKey()
  List<CategoryDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final CategoryPageDto? page;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of CategoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryListDtoCopyWith<_CategoryListDto> get copyWith =>
      __$CategoryListDtoCopyWithImpl<_CategoryListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryListDto &&
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
    return 'CategoryListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$CategoryListDtoCopyWith<$Res>
    implements $CategoryListDtoCopyWith<$Res> {
  factory _$CategoryListDtoCopyWith(
    _CategoryListDto value,
    $Res Function(_CategoryListDto) _then,
  ) = __$CategoryListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<CategoryDto> data, CategoryPageDto? page, int size});

  @override
  $CategoryPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$CategoryListDtoCopyWithImpl<$Res>
    implements _$CategoryListDtoCopyWith<$Res> {
  __$CategoryListDtoCopyWithImpl(this._self, this._then);

  final _CategoryListDto _self;
  final $Res Function(_CategoryListDto) _then;

  /// Create a copy of CategoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _CategoryListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<CategoryDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as CategoryPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $CategoryPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$CategoryPageDto {
  CategoryPageNextDto? get next;

  /// Create a copy of CategoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryPageDtoCopyWith<CategoryPageDto> get copyWith =>
      _$CategoryPageDtoCopyWithImpl<CategoryPageDto>(
        this as CategoryPageDto,
        _$identity,
      );

  /// Serializes this CategoryPageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'CategoryPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $CategoryPageDtoCopyWith<$Res> {
  factory $CategoryPageDtoCopyWith(
    CategoryPageDto value,
    $Res Function(CategoryPageDto) _then,
  ) = _$CategoryPageDtoCopyWithImpl;
  @useResult
  $Res call({CategoryPageNextDto? next});

  $CategoryPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$CategoryPageDtoCopyWithImpl<$Res>
    implements $CategoryPageDtoCopyWith<$Res> {
  _$CategoryPageDtoCopyWithImpl(this._self, this._then);

  final CategoryPageDto _self;
  final $Res Function(CategoryPageDto) _then;

  /// Create a copy of CategoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as CategoryPageNextDto?,
      ),
    );
  }

  /// Create a copy of CategoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $CategoryPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryPageDto].
extension CategoryPageDtoPatterns on CategoryPageDto {
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
    TResult Function(_CategoryPageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryPageDto() when $default != null:
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
    TResult Function(_CategoryPageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageDto():
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
    TResult? Function(_CategoryPageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageDto() when $default != null:
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
    TResult Function(CategoryPageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryPageDto() when $default != null:
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
    TResult Function(CategoryPageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageDto():
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
    TResult? Function(CategoryPageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryPageDto implements CategoryPageDto {
  const _CategoryPageDto({this.next});
  factory _CategoryPageDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryPageDtoFromJson(json);

  @override
  final CategoryPageNextDto? next;

  /// Create a copy of CategoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryPageDtoCopyWith<_CategoryPageDto> get copyWith =>
      __$CategoryPageDtoCopyWithImpl<_CategoryPageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryPageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'CategoryPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$CategoryPageDtoCopyWith<$Res>
    implements $CategoryPageDtoCopyWith<$Res> {
  factory _$CategoryPageDtoCopyWith(
    _CategoryPageDto value,
    $Res Function(_CategoryPageDto) _then,
  ) = __$CategoryPageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({CategoryPageNextDto? next});

  @override
  $CategoryPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$CategoryPageDtoCopyWithImpl<$Res>
    implements _$CategoryPageDtoCopyWith<$Res> {
  __$CategoryPageDtoCopyWithImpl(this._self, this._then);

  final _CategoryPageDto _self;
  final $Res Function(_CategoryPageDto) _then;

  /// Create a copy of CategoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _CategoryPageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as CategoryPageNextDto?,
      ),
    );
  }

  /// Create a copy of CategoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $CategoryPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$CategoryPageNextDto {
  String? get categoryId;
  String? get categoryType;
  int? get concurrentUserCount;
  int? get openLiveCount;

  /// Create a copy of CategoryPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryPageNextDtoCopyWith<CategoryPageNextDto> get copyWith =>
      _$CategoryPageNextDtoCopyWithImpl<CategoryPageNextDto>(
        this as CategoryPageNextDto,
        _$identity,
      );

  /// Serializes this CategoryPageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryPageNextDto &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'CategoryPageNextDto(categoryId: $categoryId, categoryType: $categoryType, concurrentUserCount: $concurrentUserCount, openLiveCount: $openLiveCount)';
  }
}

/// @nodoc
abstract mixin class $CategoryPageNextDtoCopyWith<$Res> {
  factory $CategoryPageNextDtoCopyWith(
    CategoryPageNextDto value,
    $Res Function(CategoryPageNextDto) _then,
  ) = _$CategoryPageNextDtoCopyWithImpl;
  @useResult
  $Res call({
    String? categoryId,
    String? categoryType,
    int? concurrentUserCount,
    int? openLiveCount,
  });
}

/// @nodoc
class _$CategoryPageNextDtoCopyWithImpl<$Res>
    implements $CategoryPageNextDtoCopyWith<$Res> {
  _$CategoryPageNextDtoCopyWithImpl(this._self, this._then);

  final CategoryPageNextDto _self;
  final $Res Function(CategoryPageNextDto) _then;

  /// Create a copy of CategoryPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryType = freezed,
    Object? concurrentUserCount = freezed,
    Object? openLiveCount = freezed,
  }) {
    return _then(
      _self.copyWith(
        categoryId: freezed == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
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

/// Adds pattern-matching-related methods to [CategoryPageNextDto].
extension CategoryPageNextDtoPatterns on CategoryPageNextDto {
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
    TResult Function(_CategoryPageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryPageNextDto() when $default != null:
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
    TResult Function(_CategoryPageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageNextDto():
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
    TResult? Function(_CategoryPageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageNextDto() when $default != null:
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
      String? categoryId,
      String? categoryType,
      int? concurrentUserCount,
      int? openLiveCount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryPageNextDto() when $default != null:
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
      String? categoryId,
      String? categoryType,
      int? concurrentUserCount,
      int? openLiveCount,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageNextDto():
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
      String? categoryId,
      String? categoryType,
      int? concurrentUserCount,
      int? openLiveCount,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryPageNextDto() when $default != null:
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
@JsonSerializable()
class _CategoryPageNextDto implements CategoryPageNextDto {
  const _CategoryPageNextDto({
    this.categoryId,
    this.categoryType,
    this.concurrentUserCount,
    this.openLiveCount,
  });
  factory _CategoryPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryPageNextDtoFromJson(json);

  @override
  final String? categoryId;
  @override
  final String? categoryType;
  @override
  final int? concurrentUserCount;
  @override
  final int? openLiveCount;

  /// Create a copy of CategoryPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryPageNextDtoCopyWith<_CategoryPageNextDto> get copyWith =>
      __$CategoryPageNextDtoCopyWithImpl<_CategoryPageNextDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryPageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryPageNextDto &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'CategoryPageNextDto(categoryId: $categoryId, categoryType: $categoryType, concurrentUserCount: $concurrentUserCount, openLiveCount: $openLiveCount)';
  }
}

/// @nodoc
abstract mixin class _$CategoryPageNextDtoCopyWith<$Res>
    implements $CategoryPageNextDtoCopyWith<$Res> {
  factory _$CategoryPageNextDtoCopyWith(
    _CategoryPageNextDto value,
    $Res Function(_CategoryPageNextDto) _then,
  ) = __$CategoryPageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? categoryId,
    String? categoryType,
    int? concurrentUserCount,
    int? openLiveCount,
  });
}

/// @nodoc
class __$CategoryPageNextDtoCopyWithImpl<$Res>
    implements _$CategoryPageNextDtoCopyWith<$Res> {
  __$CategoryPageNextDtoCopyWithImpl(this._self, this._then);

  final _CategoryPageNextDto _self;
  final $Res Function(_CategoryPageNextDto) _then;

  /// Create a copy of CategoryPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = freezed,
    Object? categoryType = freezed,
    Object? concurrentUserCount = freezed,
    Object? openLiveCount = freezed,
  }) {
    return _then(
      _CategoryPageNextDto(
        categoryId: freezed == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
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

/// @nodoc
mixin _$CategoryDto {
  String get categoryId;
  String get categoryType;
  String get categoryValue;
  int get concurrentUserCount;
  List<int> get dropsCampaignNos;
  bool get newCategory;
  int get openLiveCount;
  String? get posterImageUrl;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryDtoCopyWith<CategoryDto> get copyWith =>
      _$CategoryDtoCopyWithImpl<CategoryDto>(this as CategoryDto, _$identity);

  /// Serializes this CategoryDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryDto &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            const DeepCollectionEquality().equals(
              other.dropsCampaignNos,
              dropsCampaignNos,
            ) &&
            (identical(other.newCategory, newCategory) ||
                other.newCategory == newCategory) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.posterImageUrl, posterImageUrl) ||
                other.posterImageUrl == posterImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    categoryValue,
    concurrentUserCount,
    const DeepCollectionEquality().hash(dropsCampaignNos),
    newCategory,
    openLiveCount,
    posterImageUrl,
  );

  @override
  String toString() {
    return 'CategoryDto(categoryId: $categoryId, categoryType: $categoryType, categoryValue: $categoryValue, concurrentUserCount: $concurrentUserCount, dropsCampaignNos: $dropsCampaignNos, newCategory: $newCategory, openLiveCount: $openLiveCount, posterImageUrl: $posterImageUrl)';
  }
}

/// @nodoc
abstract mixin class $CategoryDtoCopyWith<$Res> {
  factory $CategoryDtoCopyWith(
    CategoryDto value,
    $Res Function(CategoryDto) _then,
  ) = _$CategoryDtoCopyWithImpl;
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String categoryValue,
    int concurrentUserCount,
    List<int> dropsCampaignNos,
    bool newCategory,
    int openLiveCount,
    String? posterImageUrl,
  });
}

/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res> implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._self, this._then);

  final CategoryDto _self;
  final $Res Function(CategoryDto) _then;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryType = null,
    Object? categoryValue = null,
    Object? concurrentUserCount = null,
    Object? dropsCampaignNos = null,
    Object? newCategory = null,
    Object? openLiveCount = null,
    Object? posterImageUrl = freezed,
  }) {
    return _then(
      _self.copyWith(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryValue: null == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        dropsCampaignNos: null == dropsCampaignNos
            ? _self.dropsCampaignNos
            : dropsCampaignNos // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        newCategory: null == newCategory
            ? _self.newCategory
            : newCategory // ignore: cast_nullable_to_non_nullable
                  as bool,
        openLiveCount: null == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        posterImageUrl: freezed == posterImageUrl
            ? _self.posterImageUrl
            : posterImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryDto].
extension CategoryDtoPatterns on CategoryDto {
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
    TResult Function(_CategoryDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDto() when $default != null:
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
    TResult Function(_CategoryDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDto():
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
    TResult? Function(_CategoryDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDto() when $default != null:
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
      String categoryType,
      String categoryValue,
      int concurrentUserCount,
      List<int> dropsCampaignNos,
      bool newCategory,
      int openLiveCount,
      String? posterImageUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDto() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.categoryValue,
          _that.concurrentUserCount,
          _that.dropsCampaignNos,
          _that.newCategory,
          _that.openLiveCount,
          _that.posterImageUrl,
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
      String categoryType,
      String categoryValue,
      int concurrentUserCount,
      List<int> dropsCampaignNos,
      bool newCategory,
      int openLiveCount,
      String? posterImageUrl,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDto():
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.categoryValue,
          _that.concurrentUserCount,
          _that.dropsCampaignNos,
          _that.newCategory,
          _that.openLiveCount,
          _that.posterImageUrl,
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
      String categoryType,
      String categoryValue,
      int concurrentUserCount,
      List<int> dropsCampaignNos,
      bool newCategory,
      int openLiveCount,
      String? posterImageUrl,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDto() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.categoryValue,
          _that.concurrentUserCount,
          _that.dropsCampaignNos,
          _that.newCategory,
          _that.openLiveCount,
          _that.posterImageUrl,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryDto implements CategoryDto {
  const _CategoryDto({
    required this.categoryId,
    required this.categoryType,
    required this.categoryValue,
    this.concurrentUserCount = 0,
    final List<int> dropsCampaignNos = const <int>[],
    this.newCategory = false,
    this.openLiveCount = 0,
    this.posterImageUrl,
  }) : _dropsCampaignNos = dropsCampaignNos;
  factory _CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  @override
  final String categoryId;
  @override
  final String categoryType;
  @override
  final String categoryValue;
  @override
  @JsonKey()
  final int concurrentUserCount;
  final List<int> _dropsCampaignNos;
  @override
  @JsonKey()
  List<int> get dropsCampaignNos {
    if (_dropsCampaignNos is EqualUnmodifiableListView)
      return _dropsCampaignNos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dropsCampaignNos);
  }

  @override
  @JsonKey()
  final bool newCategory;
  @override
  @JsonKey()
  final int openLiveCount;
  @override
  final String? posterImageUrl;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryDtoCopyWith<_CategoryDto> get copyWith =>
      __$CategoryDtoCopyWithImpl<_CategoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryDto &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            const DeepCollectionEquality().equals(
              other._dropsCampaignNos,
              _dropsCampaignNos,
            ) &&
            (identical(other.newCategory, newCategory) ||
                other.newCategory == newCategory) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.posterImageUrl, posterImageUrl) ||
                other.posterImageUrl == posterImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    categoryValue,
    concurrentUserCount,
    const DeepCollectionEquality().hash(_dropsCampaignNos),
    newCategory,
    openLiveCount,
    posterImageUrl,
  );

  @override
  String toString() {
    return 'CategoryDto(categoryId: $categoryId, categoryType: $categoryType, categoryValue: $categoryValue, concurrentUserCount: $concurrentUserCount, dropsCampaignNos: $dropsCampaignNos, newCategory: $newCategory, openLiveCount: $openLiveCount, posterImageUrl: $posterImageUrl)';
  }
}

/// @nodoc
abstract mixin class _$CategoryDtoCopyWith<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  factory _$CategoryDtoCopyWith(
    _CategoryDto value,
    $Res Function(_CategoryDto) _then,
  ) = __$CategoryDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String categoryValue,
    int concurrentUserCount,
    List<int> dropsCampaignNos,
    bool newCategory,
    int openLiveCount,
    String? posterImageUrl,
  });
}

/// @nodoc
class __$CategoryDtoCopyWithImpl<$Res> implements _$CategoryDtoCopyWith<$Res> {
  __$CategoryDtoCopyWithImpl(this._self, this._then);

  final _CategoryDto _self;
  final $Res Function(_CategoryDto) _then;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
    Object? categoryType = null,
    Object? categoryValue = null,
    Object? concurrentUserCount = null,
    Object? dropsCampaignNos = null,
    Object? newCategory = null,
    Object? openLiveCount = null,
    Object? posterImageUrl = freezed,
  }) {
    return _then(
      _CategoryDto(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryValue: null == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        dropsCampaignNos: null == dropsCampaignNos
            ? _self._dropsCampaignNos
            : dropsCampaignNos // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        newCategory: null == newCategory
            ? _self.newCategory
            : newCategory // ignore: cast_nullable_to_non_nullable
                  as bool,
        openLiveCount: null == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        posterImageUrl: freezed == posterImageUrl
            ? _self.posterImageUrl
            : posterImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$CategoryInfoDto {
  String get categoryId;
  String get categoryType;
  String get categoryValue;
  int get concurrentUserCount;
  bool get existLounge;
  bool get following;
  bool get newCategory;
  int get openLiveCount;
  String? get posterImageUrl;
  List<String> get tags;

  /// Create a copy of CategoryInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryInfoDtoCopyWith<CategoryInfoDto> get copyWith =>
      _$CategoryInfoDtoCopyWithImpl<CategoryInfoDto>(
        this as CategoryInfoDto,
        _$identity,
      );

  /// Serializes this CategoryInfoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryInfoDto &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.existLounge, existLounge) ||
                other.existLounge == existLounge) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.newCategory, newCategory) ||
                other.newCategory == newCategory) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.posterImageUrl, posterImageUrl) ||
                other.posterImageUrl == posterImageUrl) &&
            const DeepCollectionEquality().equals(other.tags, tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    categoryValue,
    concurrentUserCount,
    existLounge,
    following,
    newCategory,
    openLiveCount,
    posterImageUrl,
    const DeepCollectionEquality().hash(tags),
  );

  @override
  String toString() {
    return 'CategoryInfoDto(categoryId: $categoryId, categoryType: $categoryType, categoryValue: $categoryValue, concurrentUserCount: $concurrentUserCount, existLounge: $existLounge, following: $following, newCategory: $newCategory, openLiveCount: $openLiveCount, posterImageUrl: $posterImageUrl, tags: $tags)';
  }
}

/// @nodoc
abstract mixin class $CategoryInfoDtoCopyWith<$Res> {
  factory $CategoryInfoDtoCopyWith(
    CategoryInfoDto value,
    $Res Function(CategoryInfoDto) _then,
  ) = _$CategoryInfoDtoCopyWithImpl;
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String categoryValue,
    int concurrentUserCount,
    bool existLounge,
    bool following,
    bool newCategory,
    int openLiveCount,
    String? posterImageUrl,
    List<String> tags,
  });
}

/// @nodoc
class _$CategoryInfoDtoCopyWithImpl<$Res>
    implements $CategoryInfoDtoCopyWith<$Res> {
  _$CategoryInfoDtoCopyWithImpl(this._self, this._then);

  final CategoryInfoDto _self;
  final $Res Function(CategoryInfoDto) _then;

  /// Create a copy of CategoryInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryType = null,
    Object? categoryValue = null,
    Object? concurrentUserCount = null,
    Object? existLounge = null,
    Object? following = null,
    Object? newCategory = null,
    Object? openLiveCount = null,
    Object? posterImageUrl = freezed,
    Object? tags = null,
  }) {
    return _then(
      _self.copyWith(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryValue: null == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        existLounge: null == existLounge
            ? _self.existLounge
            : existLounge // ignore: cast_nullable_to_non_nullable
                  as bool,
        following: null == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as bool,
        newCategory: null == newCategory
            ? _self.newCategory
            : newCategory // ignore: cast_nullable_to_non_nullable
                  as bool,
        openLiveCount: null == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        posterImageUrl: freezed == posterImageUrl
            ? _self.posterImageUrl
            : posterImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _self.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryInfoDto].
extension CategoryInfoDtoPatterns on CategoryInfoDto {
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
    TResult Function(_CategoryInfoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryInfoDto() when $default != null:
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
    TResult Function(_CategoryInfoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryInfoDto():
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
    TResult? Function(_CategoryInfoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryInfoDto() when $default != null:
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
      String categoryType,
      String categoryValue,
      int concurrentUserCount,
      bool existLounge,
      bool following,
      bool newCategory,
      int openLiveCount,
      String? posterImageUrl,
      List<String> tags,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryInfoDto() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.categoryValue,
          _that.concurrentUserCount,
          _that.existLounge,
          _that.following,
          _that.newCategory,
          _that.openLiveCount,
          _that.posterImageUrl,
          _that.tags,
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
      String categoryType,
      String categoryValue,
      int concurrentUserCount,
      bool existLounge,
      bool following,
      bool newCategory,
      int openLiveCount,
      String? posterImageUrl,
      List<String> tags,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryInfoDto():
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.categoryValue,
          _that.concurrentUserCount,
          _that.existLounge,
          _that.following,
          _that.newCategory,
          _that.openLiveCount,
          _that.posterImageUrl,
          _that.tags,
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
      String categoryType,
      String categoryValue,
      int concurrentUserCount,
      bool existLounge,
      bool following,
      bool newCategory,
      int openLiveCount,
      String? posterImageUrl,
      List<String> tags,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryInfoDto() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.categoryValue,
          _that.concurrentUserCount,
          _that.existLounge,
          _that.following,
          _that.newCategory,
          _that.openLiveCount,
          _that.posterImageUrl,
          _that.tags,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryInfoDto implements CategoryInfoDto {
  const _CategoryInfoDto({
    required this.categoryId,
    required this.categoryType,
    required this.categoryValue,
    this.concurrentUserCount = 0,
    this.existLounge = false,
    this.following = false,
    this.newCategory = false,
    this.openLiveCount = 0,
    this.posterImageUrl,
    final List<String> tags = const <String>[],
  }) : _tags = tags;
  factory _CategoryInfoDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfoDtoFromJson(json);

  @override
  final String categoryId;
  @override
  final String categoryType;
  @override
  final String categoryValue;
  @override
  @JsonKey()
  final int concurrentUserCount;
  @override
  @JsonKey()
  final bool existLounge;
  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool newCategory;
  @override
  @JsonKey()
  final int openLiveCount;
  @override
  final String? posterImageUrl;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// Create a copy of CategoryInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryInfoDtoCopyWith<_CategoryInfoDto> get copyWith =>
      __$CategoryInfoDtoCopyWithImpl<_CategoryInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryInfoDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryInfoDto &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.existLounge, existLounge) ||
                other.existLounge == existLounge) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.newCategory, newCategory) ||
                other.newCategory == newCategory) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.posterImageUrl, posterImageUrl) ||
                other.posterImageUrl == posterImageUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    categoryValue,
    concurrentUserCount,
    existLounge,
    following,
    newCategory,
    openLiveCount,
    posterImageUrl,
    const DeepCollectionEquality().hash(_tags),
  );

  @override
  String toString() {
    return 'CategoryInfoDto(categoryId: $categoryId, categoryType: $categoryType, categoryValue: $categoryValue, concurrentUserCount: $concurrentUserCount, existLounge: $existLounge, following: $following, newCategory: $newCategory, openLiveCount: $openLiveCount, posterImageUrl: $posterImageUrl, tags: $tags)';
  }
}

/// @nodoc
abstract mixin class _$CategoryInfoDtoCopyWith<$Res>
    implements $CategoryInfoDtoCopyWith<$Res> {
  factory _$CategoryInfoDtoCopyWith(
    _CategoryInfoDto value,
    $Res Function(_CategoryInfoDto) _then,
  ) = __$CategoryInfoDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String categoryValue,
    int concurrentUserCount,
    bool existLounge,
    bool following,
    bool newCategory,
    int openLiveCount,
    String? posterImageUrl,
    List<String> tags,
  });
}

/// @nodoc
class __$CategoryInfoDtoCopyWithImpl<$Res>
    implements _$CategoryInfoDtoCopyWith<$Res> {
  __$CategoryInfoDtoCopyWithImpl(this._self, this._then);

  final _CategoryInfoDto _self;
  final $Res Function(_CategoryInfoDto) _then;

  /// Create a copy of CategoryInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
    Object? categoryType = null,
    Object? categoryValue = null,
    Object? concurrentUserCount = null,
    Object? existLounge = null,
    Object? following = null,
    Object? newCategory = null,
    Object? openLiveCount = null,
    Object? posterImageUrl = freezed,
    Object? tags = null,
  }) {
    return _then(
      _CategoryInfoDto(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryValue: null == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        existLounge: null == existLounge
            ? _self.existLounge
            : existLounge // ignore: cast_nullable_to_non_nullable
                  as bool,
        following: null == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as bool,
        newCategory: null == newCategory
            ? _self.newCategory
            : newCategory // ignore: cast_nullable_to_non_nullable
                  as bool,
        openLiveCount: null == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        posterImageUrl: freezed == posterImageUrl
            ? _self.posterImageUrl
            : posterImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingCategoryListDto {
  List<FollowingCategoryDto> get followingList;

  /// Create a copy of FollowingCategoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingCategoryListDtoCopyWith<FollowingCategoryListDto> get copyWith =>
      _$FollowingCategoryListDtoCopyWithImpl<FollowingCategoryListDto>(
        this as FollowingCategoryListDto,
        _$identity,
      );

  /// Serializes this FollowingCategoryListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingCategoryListDto &&
            const DeepCollectionEquality().equals(
              other.followingList,
              followingList,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(followingList),
  );

  @override
  String toString() {
    return 'FollowingCategoryListDto(followingList: $followingList)';
  }
}

/// @nodoc
abstract mixin class $FollowingCategoryListDtoCopyWith<$Res> {
  factory $FollowingCategoryListDtoCopyWith(
    FollowingCategoryListDto value,
    $Res Function(FollowingCategoryListDto) _then,
  ) = _$FollowingCategoryListDtoCopyWithImpl;
  @useResult
  $Res call({List<FollowingCategoryDto> followingList});
}

/// @nodoc
class _$FollowingCategoryListDtoCopyWithImpl<$Res>
    implements $FollowingCategoryListDtoCopyWith<$Res> {
  _$FollowingCategoryListDtoCopyWithImpl(this._self, this._then);

  final FollowingCategoryListDto _self;
  final $Res Function(FollowingCategoryListDto) _then;

  /// Create a copy of FollowingCategoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? followingList = null}) {
    return _then(
      _self.copyWith(
        followingList: null == followingList
            ? _self.followingList
            : followingList // ignore: cast_nullable_to_non_nullable
                  as List<FollowingCategoryDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingCategoryListDto].
extension FollowingCategoryListDtoPatterns on FollowingCategoryListDto {
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
    TResult Function(_FollowingCategoryListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryListDto() when $default != null:
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
    TResult Function(_FollowingCategoryListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryListDto():
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
    TResult? Function(_FollowingCategoryListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryListDto() when $default != null:
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
    TResult Function(List<FollowingCategoryDto> followingList)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryListDto() when $default != null:
        return $default(_that.followingList);
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
    TResult Function(List<FollowingCategoryDto> followingList) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryListDto():
        return $default(_that.followingList);
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
    TResult? Function(List<FollowingCategoryDto> followingList)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryListDto() when $default != null:
        return $default(_that.followingList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingCategoryListDto implements FollowingCategoryListDto {
  const _FollowingCategoryListDto({
    final List<FollowingCategoryDto> followingList =
        const <FollowingCategoryDto>[],
  }) : _followingList = followingList;
  factory _FollowingCategoryListDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingCategoryListDtoFromJson(json);

  final List<FollowingCategoryDto> _followingList;
  @override
  @JsonKey()
  List<FollowingCategoryDto> get followingList {
    if (_followingList is EqualUnmodifiableListView) return _followingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followingList);
  }

  /// Create a copy of FollowingCategoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingCategoryListDtoCopyWith<_FollowingCategoryListDto> get copyWith =>
      __$FollowingCategoryListDtoCopyWithImpl<_FollowingCategoryListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingCategoryListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingCategoryListDto &&
            const DeepCollectionEquality().equals(
              other._followingList,
              _followingList,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_followingList),
  );

  @override
  String toString() {
    return 'FollowingCategoryListDto(followingList: $followingList)';
  }
}

/// @nodoc
abstract mixin class _$FollowingCategoryListDtoCopyWith<$Res>
    implements $FollowingCategoryListDtoCopyWith<$Res> {
  factory _$FollowingCategoryListDtoCopyWith(
    _FollowingCategoryListDto value,
    $Res Function(_FollowingCategoryListDto) _then,
  ) = __$FollowingCategoryListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<FollowingCategoryDto> followingList});
}

/// @nodoc
class __$FollowingCategoryListDtoCopyWithImpl<$Res>
    implements _$FollowingCategoryListDtoCopyWith<$Res> {
  __$FollowingCategoryListDtoCopyWithImpl(this._self, this._then);

  final _FollowingCategoryListDto _self;
  final $Res Function(_FollowingCategoryListDto) _then;

  /// Create a copy of FollowingCategoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? followingList = null}) {
    return _then(
      _FollowingCategoryListDto(
        followingList: null == followingList
            ? _self._followingList
            : followingList // ignore: cast_nullable_to_non_nullable
                  as List<FollowingCategoryDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingCategoryDto {
  String get categoryId;
  String get categoryType;
  String get categoryValue;
  int get concurrentUserCount;
  List<int> get dropsCampaignNos;
  int get followerCount;
  bool get newCategory;
  int get openLiveCount;
  String? get posterImageUrl;

  /// Create a copy of FollowingCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingCategoryDtoCopyWith<FollowingCategoryDto> get copyWith =>
      _$FollowingCategoryDtoCopyWithImpl<FollowingCategoryDto>(
        this as FollowingCategoryDto,
        _$identity,
      );

  /// Serializes this FollowingCategoryDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingCategoryDto &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            const DeepCollectionEquality().equals(
              other.dropsCampaignNos,
              dropsCampaignNos,
            ) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.newCategory, newCategory) ||
                other.newCategory == newCategory) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.posterImageUrl, posterImageUrl) ||
                other.posterImageUrl == posterImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    categoryValue,
    concurrentUserCount,
    const DeepCollectionEquality().hash(dropsCampaignNos),
    followerCount,
    newCategory,
    openLiveCount,
    posterImageUrl,
  );

  @override
  String toString() {
    return 'FollowingCategoryDto(categoryId: $categoryId, categoryType: $categoryType, categoryValue: $categoryValue, concurrentUserCount: $concurrentUserCount, dropsCampaignNos: $dropsCampaignNos, followerCount: $followerCount, newCategory: $newCategory, openLiveCount: $openLiveCount, posterImageUrl: $posterImageUrl)';
  }
}

/// @nodoc
abstract mixin class $FollowingCategoryDtoCopyWith<$Res> {
  factory $FollowingCategoryDtoCopyWith(
    FollowingCategoryDto value,
    $Res Function(FollowingCategoryDto) _then,
  ) = _$FollowingCategoryDtoCopyWithImpl;
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String categoryValue,
    int concurrentUserCount,
    List<int> dropsCampaignNos,
    int followerCount,
    bool newCategory,
    int openLiveCount,
    String? posterImageUrl,
  });
}

/// @nodoc
class _$FollowingCategoryDtoCopyWithImpl<$Res>
    implements $FollowingCategoryDtoCopyWith<$Res> {
  _$FollowingCategoryDtoCopyWithImpl(this._self, this._then);

  final FollowingCategoryDto _self;
  final $Res Function(FollowingCategoryDto) _then;

  /// Create a copy of FollowingCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryType = null,
    Object? categoryValue = null,
    Object? concurrentUserCount = null,
    Object? dropsCampaignNos = null,
    Object? followerCount = null,
    Object? newCategory = null,
    Object? openLiveCount = null,
    Object? posterImageUrl = freezed,
  }) {
    return _then(
      _self.copyWith(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryValue: null == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        dropsCampaignNos: null == dropsCampaignNos
            ? _self.dropsCampaignNos
            : dropsCampaignNos // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        followerCount: null == followerCount
            ? _self.followerCount
            : followerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        newCategory: null == newCategory
            ? _self.newCategory
            : newCategory // ignore: cast_nullable_to_non_nullable
                  as bool,
        openLiveCount: null == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        posterImageUrl: freezed == posterImageUrl
            ? _self.posterImageUrl
            : posterImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingCategoryDto].
extension FollowingCategoryDtoPatterns on FollowingCategoryDto {
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
    TResult Function(_FollowingCategoryDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryDto() when $default != null:
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
    TResult Function(_FollowingCategoryDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryDto():
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
    TResult? Function(_FollowingCategoryDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryDto() when $default != null:
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
      String categoryType,
      String categoryValue,
      int concurrentUserCount,
      List<int> dropsCampaignNos,
      int followerCount,
      bool newCategory,
      int openLiveCount,
      String? posterImageUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryDto() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.categoryValue,
          _that.concurrentUserCount,
          _that.dropsCampaignNos,
          _that.followerCount,
          _that.newCategory,
          _that.openLiveCount,
          _that.posterImageUrl,
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
      String categoryType,
      String categoryValue,
      int concurrentUserCount,
      List<int> dropsCampaignNos,
      int followerCount,
      bool newCategory,
      int openLiveCount,
      String? posterImageUrl,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryDto():
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.categoryValue,
          _that.concurrentUserCount,
          _that.dropsCampaignNos,
          _that.followerCount,
          _that.newCategory,
          _that.openLiveCount,
          _that.posterImageUrl,
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
      String categoryType,
      String categoryValue,
      int concurrentUserCount,
      List<int> dropsCampaignNos,
      int followerCount,
      bool newCategory,
      int openLiveCount,
      String? posterImageUrl,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingCategoryDto() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.categoryValue,
          _that.concurrentUserCount,
          _that.dropsCampaignNos,
          _that.followerCount,
          _that.newCategory,
          _that.openLiveCount,
          _that.posterImageUrl,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingCategoryDto implements FollowingCategoryDto {
  const _FollowingCategoryDto({
    required this.categoryId,
    required this.categoryType,
    required this.categoryValue,
    this.concurrentUserCount = 0,
    final List<int> dropsCampaignNos = const <int>[],
    this.followerCount = 0,
    this.newCategory = false,
    this.openLiveCount = 0,
    this.posterImageUrl,
  }) : _dropsCampaignNos = dropsCampaignNos;
  factory _FollowingCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingCategoryDtoFromJson(json);

  @override
  final String categoryId;
  @override
  final String categoryType;
  @override
  final String categoryValue;
  @override
  @JsonKey()
  final int concurrentUserCount;
  final List<int> _dropsCampaignNos;
  @override
  @JsonKey()
  List<int> get dropsCampaignNos {
    if (_dropsCampaignNos is EqualUnmodifiableListView)
      return _dropsCampaignNos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dropsCampaignNos);
  }

  @override
  @JsonKey()
  final int followerCount;
  @override
  @JsonKey()
  final bool newCategory;
  @override
  @JsonKey()
  final int openLiveCount;
  @override
  final String? posterImageUrl;

  /// Create a copy of FollowingCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingCategoryDtoCopyWith<_FollowingCategoryDto> get copyWith =>
      __$FollowingCategoryDtoCopyWithImpl<_FollowingCategoryDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingCategoryDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingCategoryDto &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            const DeepCollectionEquality().equals(
              other._dropsCampaignNos,
              _dropsCampaignNos,
            ) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.newCategory, newCategory) ||
                other.newCategory == newCategory) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.posterImageUrl, posterImageUrl) ||
                other.posterImageUrl == posterImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    categoryValue,
    concurrentUserCount,
    const DeepCollectionEquality().hash(_dropsCampaignNos),
    followerCount,
    newCategory,
    openLiveCount,
    posterImageUrl,
  );

  @override
  String toString() {
    return 'FollowingCategoryDto(categoryId: $categoryId, categoryType: $categoryType, categoryValue: $categoryValue, concurrentUserCount: $concurrentUserCount, dropsCampaignNos: $dropsCampaignNos, followerCount: $followerCount, newCategory: $newCategory, openLiveCount: $openLiveCount, posterImageUrl: $posterImageUrl)';
  }
}

/// @nodoc
abstract mixin class _$FollowingCategoryDtoCopyWith<$Res>
    implements $FollowingCategoryDtoCopyWith<$Res> {
  factory _$FollowingCategoryDtoCopyWith(
    _FollowingCategoryDto value,
    $Res Function(_FollowingCategoryDto) _then,
  ) = __$FollowingCategoryDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String categoryValue,
    int concurrentUserCount,
    List<int> dropsCampaignNos,
    int followerCount,
    bool newCategory,
    int openLiveCount,
    String? posterImageUrl,
  });
}

/// @nodoc
class __$FollowingCategoryDtoCopyWithImpl<$Res>
    implements _$FollowingCategoryDtoCopyWith<$Res> {
  __$FollowingCategoryDtoCopyWithImpl(this._self, this._then);

  final _FollowingCategoryDto _self;
  final $Res Function(_FollowingCategoryDto) _then;

  /// Create a copy of FollowingCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
    Object? categoryType = null,
    Object? categoryValue = null,
    Object? concurrentUserCount = null,
    Object? dropsCampaignNos = null,
    Object? followerCount = null,
    Object? newCategory = null,
    Object? openLiveCount = null,
    Object? posterImageUrl = freezed,
  }) {
    return _then(
      _FollowingCategoryDto(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryValue: null == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        dropsCampaignNos: null == dropsCampaignNos
            ? _self._dropsCampaignNos
            : dropsCampaignNos // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        followerCount: null == followerCount
            ? _self.followerCount
            : followerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        newCategory: null == newCategory
            ? _self.newCategory
            : newCategory // ignore: cast_nullable_to_non_nullable
                  as bool,
        openLiveCount: null == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        posterImageUrl: freezed == posterImageUrl
            ? _self.posterImageUrl
            : posterImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$CategoryLiveListDto {
  List<CategoryLiveDto> get data;
  CategoryLivePageDto? get page;
  int get size;

  /// Create a copy of CategoryLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryLiveListDtoCopyWith<CategoryLiveListDto> get copyWith =>
      _$CategoryLiveListDtoCopyWithImpl<CategoryLiveListDto>(
        this as CategoryLiveListDto,
        _$identity,
      );

  /// Serializes this CategoryLiveListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryLiveListDto &&
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
    return 'CategoryLiveListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class $CategoryLiveListDtoCopyWith<$Res> {
  factory $CategoryLiveListDtoCopyWith(
    CategoryLiveListDto value,
    $Res Function(CategoryLiveListDto) _then,
  ) = _$CategoryLiveListDtoCopyWithImpl;
  @useResult
  $Res call({List<CategoryLiveDto> data, CategoryLivePageDto? page, int size});

  $CategoryLivePageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$CategoryLiveListDtoCopyWithImpl<$Res>
    implements $CategoryLiveListDtoCopyWith<$Res> {
  _$CategoryLiveListDtoCopyWithImpl(this._self, this._then);

  final CategoryLiveListDto _self;
  final $Res Function(CategoryLiveListDto) _then;

  /// Create a copy of CategoryLiveListDto
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
                  as List<CategoryLiveDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as CategoryLivePageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLivePageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $CategoryLivePageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryLiveListDto].
extension CategoryLiveListDtoPatterns on CategoryLiveListDto {
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
    TResult Function(_CategoryLiveListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveListDto() when $default != null:
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
    TResult Function(_CategoryLiveListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveListDto():
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
    TResult? Function(_CategoryLiveListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveListDto() when $default != null:
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
      List<CategoryLiveDto> data,
      CategoryLivePageDto? page,
      int size,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveListDto() when $default != null:
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
      List<CategoryLiveDto> data,
      CategoryLivePageDto? page,
      int size,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveListDto():
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
      List<CategoryLiveDto> data,
      CategoryLivePageDto? page,
      int size,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryLiveListDto implements CategoryLiveListDto {
  const _CategoryLiveListDto({
    final List<CategoryLiveDto> data = const <CategoryLiveDto>[],
    this.page,
    this.size = 0,
  }) : _data = data;
  factory _CategoryLiveListDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryLiveListDtoFromJson(json);

  final List<CategoryLiveDto> _data;
  @override
  @JsonKey()
  List<CategoryLiveDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final CategoryLivePageDto? page;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of CategoryLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryLiveListDtoCopyWith<_CategoryLiveListDto> get copyWith =>
      __$CategoryLiveListDtoCopyWithImpl<_CategoryLiveListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryLiveListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryLiveListDto &&
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
    return 'CategoryLiveListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$CategoryLiveListDtoCopyWith<$Res>
    implements $CategoryLiveListDtoCopyWith<$Res> {
  factory _$CategoryLiveListDtoCopyWith(
    _CategoryLiveListDto value,
    $Res Function(_CategoryLiveListDto) _then,
  ) = __$CategoryLiveListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<CategoryLiveDto> data, CategoryLivePageDto? page, int size});

  @override
  $CategoryLivePageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$CategoryLiveListDtoCopyWithImpl<$Res>
    implements _$CategoryLiveListDtoCopyWith<$Res> {
  __$CategoryLiveListDtoCopyWithImpl(this._self, this._then);

  final _CategoryLiveListDto _self;
  final $Res Function(_CategoryLiveListDto) _then;

  /// Create a copy of CategoryLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _CategoryLiveListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<CategoryLiveDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as CategoryLivePageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLivePageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $CategoryLivePageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$CategoryLivePageDto {
  CategoryLivePageNextDto? get next;

  /// Create a copy of CategoryLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryLivePageDtoCopyWith<CategoryLivePageDto> get copyWith =>
      _$CategoryLivePageDtoCopyWithImpl<CategoryLivePageDto>(
        this as CategoryLivePageDto,
        _$identity,
      );

  /// Serializes this CategoryLivePageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryLivePageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'CategoryLivePageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $CategoryLivePageDtoCopyWith<$Res> {
  factory $CategoryLivePageDtoCopyWith(
    CategoryLivePageDto value,
    $Res Function(CategoryLivePageDto) _then,
  ) = _$CategoryLivePageDtoCopyWithImpl;
  @useResult
  $Res call({CategoryLivePageNextDto? next});

  $CategoryLivePageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$CategoryLivePageDtoCopyWithImpl<$Res>
    implements $CategoryLivePageDtoCopyWith<$Res> {
  _$CategoryLivePageDtoCopyWithImpl(this._self, this._then);

  final CategoryLivePageDto _self;
  final $Res Function(CategoryLivePageDto) _then;

  /// Create a copy of CategoryLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as CategoryLivePageNextDto?,
      ),
    );
  }

  /// Create a copy of CategoryLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLivePageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $CategoryLivePageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryLivePageDto].
extension CategoryLivePageDtoPatterns on CategoryLivePageDto {
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
    TResult Function(_CategoryLivePageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePageDto() when $default != null:
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
    TResult Function(_CategoryLivePageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePageDto():
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
    TResult? Function(_CategoryLivePageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePageDto() when $default != null:
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
    TResult Function(CategoryLivePageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePageDto() when $default != null:
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
    TResult Function(CategoryLivePageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePageDto():
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
    TResult? Function(CategoryLivePageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryLivePageDto implements CategoryLivePageDto {
  const _CategoryLivePageDto({this.next});
  factory _CategoryLivePageDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryLivePageDtoFromJson(json);

  @override
  final CategoryLivePageNextDto? next;

  /// Create a copy of CategoryLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryLivePageDtoCopyWith<_CategoryLivePageDto> get copyWith =>
      __$CategoryLivePageDtoCopyWithImpl<_CategoryLivePageDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryLivePageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryLivePageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'CategoryLivePageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$CategoryLivePageDtoCopyWith<$Res>
    implements $CategoryLivePageDtoCopyWith<$Res> {
  factory _$CategoryLivePageDtoCopyWith(
    _CategoryLivePageDto value,
    $Res Function(_CategoryLivePageDto) _then,
  ) = __$CategoryLivePageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({CategoryLivePageNextDto? next});

  @override
  $CategoryLivePageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$CategoryLivePageDtoCopyWithImpl<$Res>
    implements _$CategoryLivePageDtoCopyWith<$Res> {
  __$CategoryLivePageDtoCopyWithImpl(this._self, this._then);

  final _CategoryLivePageDto _self;
  final $Res Function(_CategoryLivePageDto) _then;

  /// Create a copy of CategoryLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _CategoryLivePageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as CategoryLivePageNextDto?,
      ),
    );
  }

  /// Create a copy of CategoryLivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryLivePageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $CategoryLivePageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$CategoryLivePageNextDto {
  int? get concurrentUserCount;
  int? get liveId;

  /// Create a copy of CategoryLivePageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryLivePageNextDtoCopyWith<CategoryLivePageNextDto> get copyWith =>
      _$CategoryLivePageNextDtoCopyWithImpl<CategoryLivePageNextDto>(
        this as CategoryLivePageNextDto,
        _$identity,
      );

  /// Serializes this CategoryLivePageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryLivePageNextDto &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'CategoryLivePageNextDto(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class $CategoryLivePageNextDtoCopyWith<$Res> {
  factory $CategoryLivePageNextDtoCopyWith(
    CategoryLivePageNextDto value,
    $Res Function(CategoryLivePageNextDto) _then,
  ) = _$CategoryLivePageNextDtoCopyWithImpl;
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class _$CategoryLivePageNextDtoCopyWithImpl<$Res>
    implements $CategoryLivePageNextDtoCopyWith<$Res> {
  _$CategoryLivePageNextDtoCopyWithImpl(this._self, this._then);

  final CategoryLivePageNextDto _self;
  final $Res Function(CategoryLivePageNextDto) _then;

  /// Create a copy of CategoryLivePageNextDto
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

/// Adds pattern-matching-related methods to [CategoryLivePageNextDto].
extension CategoryLivePageNextDtoPatterns on CategoryLivePageNextDto {
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
    TResult Function(_CategoryLivePageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePageNextDto() when $default != null:
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
    TResult Function(_CategoryLivePageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePageNextDto():
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
    TResult? Function(_CategoryLivePageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLivePageNextDto() when $default != null:
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
      case _CategoryLivePageNextDto() when $default != null:
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
      case _CategoryLivePageNextDto():
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
      case _CategoryLivePageNextDto() when $default != null:
        return $default(_that.concurrentUserCount, _that.liveId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryLivePageNextDto implements CategoryLivePageNextDto {
  const _CategoryLivePageNextDto({this.concurrentUserCount, this.liveId});
  factory _CategoryLivePageNextDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryLivePageNextDtoFromJson(json);

  @override
  final int? concurrentUserCount;
  @override
  final int? liveId;

  /// Create a copy of CategoryLivePageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryLivePageNextDtoCopyWith<_CategoryLivePageNextDto> get copyWith =>
      __$CategoryLivePageNextDtoCopyWithImpl<_CategoryLivePageNextDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryLivePageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryLivePageNextDto &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'CategoryLivePageNextDto(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class _$CategoryLivePageNextDtoCopyWith<$Res>
    implements $CategoryLivePageNextDtoCopyWith<$Res> {
  factory _$CategoryLivePageNextDtoCopyWith(
    _CategoryLivePageNextDto value,
    $Res Function(_CategoryLivePageNextDto) _then,
  ) = __$CategoryLivePageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class __$CategoryLivePageNextDtoCopyWithImpl<$Res>
    implements _$CategoryLivePageNextDtoCopyWith<$Res> {
  __$CategoryLivePageNextDtoCopyWithImpl(this._self, this._then);

  final _CategoryLivePageNextDto _self;
  final $Res Function(_CategoryLivePageNextDto) _then;

  /// Create a copy of CategoryLivePageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? concurrentUserCount = freezed, Object? liveId = freezed}) {
    return _then(
      _CategoryLivePageNextDto(
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
mixin _$CategoryLiveDto {
  int get liveId;
  String get liveTitle;
  String? get liveImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  String? get openDate;
  bool get adult;
  List<String> get tags;
  String? get liveCategoryValue;
  CategoryChannelDto? get channel;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;
  Map<String, dynamic>? get party;

  /// Create a copy of CategoryLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryLiveDtoCopyWith<CategoryLiveDto> get copyWith =>
      _$CategoryLiveDtoCopyWithImpl<CategoryLiveDto>(
        this as CategoryLiveDto,
        _$identity,
      );

  /// Serializes this CategoryLiveDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryLiveDto &&
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
    return 'CategoryLiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, liveCategoryValue: $liveCategoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, party: $party)';
  }
}

/// @nodoc
abstract mixin class $CategoryLiveDtoCopyWith<$Res> {
  factory $CategoryLiveDtoCopyWith(
    CategoryLiveDto value,
    $Res Function(CategoryLiveDto) _then,
  ) = _$CategoryLiveDtoCopyWithImpl;
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
    CategoryChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    Map<String, dynamic>? party,
  });

  $CategoryChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$CategoryLiveDtoCopyWithImpl<$Res>
    implements $CategoryLiveDtoCopyWith<$Res> {
  _$CategoryLiveDtoCopyWithImpl(this._self, this._then);

  final CategoryLiveDto _self;
  final $Res Function(CategoryLiveDto) _then;

  /// Create a copy of CategoryLiveDto
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
                  as CategoryChannelDto?,
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

  /// Create a copy of CategoryLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $CategoryChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryLiveDto].
extension CategoryLiveDtoPatterns on CategoryLiveDto {
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
    TResult Function(_CategoryLiveDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveDto() when $default != null:
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
    TResult Function(_CategoryLiveDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveDto():
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
    TResult? Function(_CategoryLiveDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveDto() when $default != null:
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
      CategoryChannelDto? channel,
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
      case _CategoryLiveDto() when $default != null:
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
      CategoryChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      Map<String, dynamic>? party,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveDto():
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
      CategoryChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      Map<String, dynamic>? party,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryLiveDto() when $default != null:
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
class _CategoryLiveDto implements CategoryLiveDto {
  const _CategoryLiveDto({
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
  factory _CategoryLiveDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryLiveDtoFromJson(json);

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
  final CategoryChannelDto? channel;
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

  /// Create a copy of CategoryLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryLiveDtoCopyWith<_CategoryLiveDto> get copyWith =>
      __$CategoryLiveDtoCopyWithImpl<_CategoryLiveDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryLiveDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryLiveDto &&
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
    return 'CategoryLiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, liveCategoryValue: $liveCategoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, party: $party)';
  }
}

/// @nodoc
abstract mixin class _$CategoryLiveDtoCopyWith<$Res>
    implements $CategoryLiveDtoCopyWith<$Res> {
  factory _$CategoryLiveDtoCopyWith(
    _CategoryLiveDto value,
    $Res Function(_CategoryLiveDto) _then,
  ) = __$CategoryLiveDtoCopyWithImpl;
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
    CategoryChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    Map<String, dynamic>? party,
  });

  @override
  $CategoryChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$CategoryLiveDtoCopyWithImpl<$Res>
    implements _$CategoryLiveDtoCopyWith<$Res> {
  __$CategoryLiveDtoCopyWithImpl(this._self, this._then);

  final _CategoryLiveDto _self;
  final $Res Function(_CategoryLiveDto) _then;

  /// Create a copy of CategoryLiveDto
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
      _CategoryLiveDto(
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
                  as CategoryChannelDto?,
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

  /// Create a copy of CategoryLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $CategoryChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$CategoryVideoListDto {
  List<CategoryVideoDto> get data;
  CategoryVideoPageDto? get page;
  int get size;

  /// Create a copy of CategoryVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVideoListDtoCopyWith<CategoryVideoListDto> get copyWith =>
      _$CategoryVideoListDtoCopyWithImpl<CategoryVideoListDto>(
        this as CategoryVideoListDto,
        _$identity,
      );

  /// Serializes this CategoryVideoListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVideoListDto &&
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
    return 'CategoryVideoListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class $CategoryVideoListDtoCopyWith<$Res> {
  factory $CategoryVideoListDtoCopyWith(
    CategoryVideoListDto value,
    $Res Function(CategoryVideoListDto) _then,
  ) = _$CategoryVideoListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<CategoryVideoDto> data,
    CategoryVideoPageDto? page,
    int size,
  });

  $CategoryVideoPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$CategoryVideoListDtoCopyWithImpl<$Res>
    implements $CategoryVideoListDtoCopyWith<$Res> {
  _$CategoryVideoListDtoCopyWithImpl(this._self, this._then);

  final CategoryVideoListDto _self;
  final $Res Function(CategoryVideoListDto) _then;

  /// Create a copy of CategoryVideoListDto
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
                  as List<CategoryVideoDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as CategoryVideoPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVideoPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $CategoryVideoPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryVideoListDto].
extension CategoryVideoListDtoPatterns on CategoryVideoListDto {
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
    TResult Function(_CategoryVideoListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoListDto() when $default != null:
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
    TResult Function(_CategoryVideoListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoListDto():
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
    TResult? Function(_CategoryVideoListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoListDto() when $default != null:
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
      List<CategoryVideoDto> data,
      CategoryVideoPageDto? page,
      int size,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoListDto() when $default != null:
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
      List<CategoryVideoDto> data,
      CategoryVideoPageDto? page,
      int size,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoListDto():
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
      List<CategoryVideoDto> data,
      CategoryVideoPageDto? page,
      int size,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryVideoListDto implements CategoryVideoListDto {
  const _CategoryVideoListDto({
    final List<CategoryVideoDto> data = const <CategoryVideoDto>[],
    this.page,
    this.size = 0,
  }) : _data = data;
  factory _CategoryVideoListDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryVideoListDtoFromJson(json);

  final List<CategoryVideoDto> _data;
  @override
  @JsonKey()
  List<CategoryVideoDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final CategoryVideoPageDto? page;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of CategoryVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryVideoListDtoCopyWith<_CategoryVideoListDto> get copyWith =>
      __$CategoryVideoListDtoCopyWithImpl<_CategoryVideoListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryVideoListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryVideoListDto &&
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
    return 'CategoryVideoListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$CategoryVideoListDtoCopyWith<$Res>
    implements $CategoryVideoListDtoCopyWith<$Res> {
  factory _$CategoryVideoListDtoCopyWith(
    _CategoryVideoListDto value,
    $Res Function(_CategoryVideoListDto) _then,
  ) = __$CategoryVideoListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<CategoryVideoDto> data,
    CategoryVideoPageDto? page,
    int size,
  });

  @override
  $CategoryVideoPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$CategoryVideoListDtoCopyWithImpl<$Res>
    implements _$CategoryVideoListDtoCopyWith<$Res> {
  __$CategoryVideoListDtoCopyWithImpl(this._self, this._then);

  final _CategoryVideoListDto _self;
  final $Res Function(_CategoryVideoListDto) _then;

  /// Create a copy of CategoryVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _CategoryVideoListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<CategoryVideoDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as CategoryVideoPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVideoPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $CategoryVideoPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$CategoryVideoPageDto {
  CategoryVideoPageNextDto? get next;

  /// Create a copy of CategoryVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVideoPageDtoCopyWith<CategoryVideoPageDto> get copyWith =>
      _$CategoryVideoPageDtoCopyWithImpl<CategoryVideoPageDto>(
        this as CategoryVideoPageDto,
        _$identity,
      );

  /// Serializes this CategoryVideoPageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVideoPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'CategoryVideoPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $CategoryVideoPageDtoCopyWith<$Res> {
  factory $CategoryVideoPageDtoCopyWith(
    CategoryVideoPageDto value,
    $Res Function(CategoryVideoPageDto) _then,
  ) = _$CategoryVideoPageDtoCopyWithImpl;
  @useResult
  $Res call({CategoryVideoPageNextDto? next});

  $CategoryVideoPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$CategoryVideoPageDtoCopyWithImpl<$Res>
    implements $CategoryVideoPageDtoCopyWith<$Res> {
  _$CategoryVideoPageDtoCopyWithImpl(this._self, this._then);

  final CategoryVideoPageDto _self;
  final $Res Function(CategoryVideoPageDto) _then;

  /// Create a copy of CategoryVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as CategoryVideoPageNextDto?,
      ),
    );
  }

  /// Create a copy of CategoryVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVideoPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $CategoryVideoPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryVideoPageDto].
extension CategoryVideoPageDtoPatterns on CategoryVideoPageDto {
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
    TResult Function(_CategoryVideoPageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPageDto() when $default != null:
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
    TResult Function(_CategoryVideoPageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPageDto():
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
    TResult? Function(_CategoryVideoPageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPageDto() when $default != null:
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
    TResult Function(CategoryVideoPageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPageDto() when $default != null:
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
    TResult Function(CategoryVideoPageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPageDto():
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
    TResult? Function(CategoryVideoPageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryVideoPageDto implements CategoryVideoPageDto {
  const _CategoryVideoPageDto({this.next});
  factory _CategoryVideoPageDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryVideoPageDtoFromJson(json);

  @override
  final CategoryVideoPageNextDto? next;

  /// Create a copy of CategoryVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryVideoPageDtoCopyWith<_CategoryVideoPageDto> get copyWith =>
      __$CategoryVideoPageDtoCopyWithImpl<_CategoryVideoPageDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryVideoPageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryVideoPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'CategoryVideoPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$CategoryVideoPageDtoCopyWith<$Res>
    implements $CategoryVideoPageDtoCopyWith<$Res> {
  factory _$CategoryVideoPageDtoCopyWith(
    _CategoryVideoPageDto value,
    $Res Function(_CategoryVideoPageDto) _then,
  ) = __$CategoryVideoPageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({CategoryVideoPageNextDto? next});

  @override
  $CategoryVideoPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$CategoryVideoPageDtoCopyWithImpl<$Res>
    implements _$CategoryVideoPageDtoCopyWith<$Res> {
  __$CategoryVideoPageDtoCopyWithImpl(this._self, this._then);

  final _CategoryVideoPageDto _self;
  final $Res Function(_CategoryVideoPageDto) _then;

  /// Create a copy of CategoryVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _CategoryVideoPageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as CategoryVideoPageNextDto?,
      ),
    );
  }

  /// Create a copy of CategoryVideoPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVideoPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $CategoryVideoPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$CategoryVideoPageNextDto {
  int? get publishDateAt;
  int? get readCount;

  /// Create a copy of CategoryVideoPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVideoPageNextDtoCopyWith<CategoryVideoPageNextDto> get copyWith =>
      _$CategoryVideoPageNextDtoCopyWithImpl<CategoryVideoPageNextDto>(
        this as CategoryVideoPageNextDto,
        _$identity,
      );

  /// Serializes this CategoryVideoPageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVideoPageNextDto &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publishDateAt, readCount);

  @override
  String toString() {
    return 'CategoryVideoPageNextDto(publishDateAt: $publishDateAt, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class $CategoryVideoPageNextDtoCopyWith<$Res> {
  factory $CategoryVideoPageNextDtoCopyWith(
    CategoryVideoPageNextDto value,
    $Res Function(CategoryVideoPageNextDto) _then,
  ) = _$CategoryVideoPageNextDtoCopyWithImpl;
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class _$CategoryVideoPageNextDtoCopyWithImpl<$Res>
    implements $CategoryVideoPageNextDtoCopyWith<$Res> {
  _$CategoryVideoPageNextDtoCopyWithImpl(this._self, this._then);

  final CategoryVideoPageNextDto _self;
  final $Res Function(CategoryVideoPageNextDto) _then;

  /// Create a copy of CategoryVideoPageNextDto
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

/// Adds pattern-matching-related methods to [CategoryVideoPageNextDto].
extension CategoryVideoPageNextDtoPatterns on CategoryVideoPageNextDto {
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
    TResult Function(_CategoryVideoPageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPageNextDto() when $default != null:
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
    TResult Function(_CategoryVideoPageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPageNextDto():
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
    TResult? Function(_CategoryVideoPageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoPageNextDto() when $default != null:
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
      case _CategoryVideoPageNextDto() when $default != null:
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
      case _CategoryVideoPageNextDto():
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
      case _CategoryVideoPageNextDto() when $default != null:
        return $default(_that.publishDateAt, _that.readCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryVideoPageNextDto implements CategoryVideoPageNextDto {
  const _CategoryVideoPageNextDto({this.publishDateAt, this.readCount});
  factory _CategoryVideoPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryVideoPageNextDtoFromJson(json);

  @override
  final int? publishDateAt;
  @override
  final int? readCount;

  /// Create a copy of CategoryVideoPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryVideoPageNextDtoCopyWith<_CategoryVideoPageNextDto> get copyWith =>
      __$CategoryVideoPageNextDtoCopyWithImpl<_CategoryVideoPageNextDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryVideoPageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryVideoPageNextDto &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publishDateAt, readCount);

  @override
  String toString() {
    return 'CategoryVideoPageNextDto(publishDateAt: $publishDateAt, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class _$CategoryVideoPageNextDtoCopyWith<$Res>
    implements $CategoryVideoPageNextDtoCopyWith<$Res> {
  factory _$CategoryVideoPageNextDtoCopyWith(
    _CategoryVideoPageNextDto value,
    $Res Function(_CategoryVideoPageNextDto) _then,
  ) = __$CategoryVideoPageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class __$CategoryVideoPageNextDtoCopyWithImpl<$Res>
    implements _$CategoryVideoPageNextDtoCopyWith<$Res> {
  __$CategoryVideoPageNextDtoCopyWithImpl(this._self, this._then);

  final _CategoryVideoPageNextDto _self;
  final $Res Function(_CategoryVideoPageNextDto) _then;

  /// Create a copy of CategoryVideoPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? publishDateAt = freezed, Object? readCount = freezed}) {
    return _then(
      _CategoryVideoPageNextDto(
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
mixin _$CategoryVideoDto {
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
  CategoryChannelDto? get channel;
  String? get blindType;
  int? get watchTimeline;

  /// Create a copy of CategoryVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVideoDtoCopyWith<CategoryVideoDto> get copyWith =>
      _$CategoryVideoDtoCopyWithImpl<CategoryVideoDto>(
        this as CategoryVideoDto,
        _$identity,
      );

  /// Serializes this CategoryVideoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVideoDto &&
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
    return 'CategoryVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class $CategoryVideoDtoCopyWith<$Res> {
  factory $CategoryVideoDtoCopyWith(
    CategoryVideoDto value,
    $Res Function(CategoryVideoDto) _then,
  ) = _$CategoryVideoDtoCopyWithImpl;
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
    CategoryChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  $CategoryChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$CategoryVideoDtoCopyWithImpl<$Res>
    implements $CategoryVideoDtoCopyWith<$Res> {
  _$CategoryVideoDtoCopyWithImpl(this._self, this._then);

  final CategoryVideoDto _self;
  final $Res Function(CategoryVideoDto) _then;

  /// Create a copy of CategoryVideoDto
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
                  as CategoryChannelDto?,
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

  /// Create a copy of CategoryVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $CategoryChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryVideoDto].
extension CategoryVideoDtoPatterns on CategoryVideoDto {
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
    TResult Function(_CategoryVideoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoDto() when $default != null:
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
    TResult Function(_CategoryVideoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoDto():
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
    TResult? Function(_CategoryVideoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoDto() when $default != null:
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
      CategoryChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoDto() when $default != null:
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
      CategoryChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoDto():
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
      CategoryChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryVideoDto() when $default != null:
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
class _CategoryVideoDto implements CategoryVideoDto {
  const _CategoryVideoDto({
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
  factory _CategoryVideoDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryVideoDtoFromJson(json);

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
  final CategoryChannelDto? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;

  /// Create a copy of CategoryVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryVideoDtoCopyWith<_CategoryVideoDto> get copyWith =>
      __$CategoryVideoDtoCopyWithImpl<_CategoryVideoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryVideoDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryVideoDto &&
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
    return 'CategoryVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class _$CategoryVideoDtoCopyWith<$Res>
    implements $CategoryVideoDtoCopyWith<$Res> {
  factory _$CategoryVideoDtoCopyWith(
    _CategoryVideoDto value,
    $Res Function(_CategoryVideoDto) _then,
  ) = __$CategoryVideoDtoCopyWithImpl;
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
    CategoryChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  @override
  $CategoryChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$CategoryVideoDtoCopyWithImpl<$Res>
    implements _$CategoryVideoDtoCopyWith<$Res> {
  __$CategoryVideoDtoCopyWithImpl(this._self, this._then);

  final _CategoryVideoDto _self;
  final $Res Function(_CategoryVideoDto) _then;

  /// Create a copy of CategoryVideoDto
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
      _CategoryVideoDto(
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
                  as CategoryChannelDto?,
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

  /// Create a copy of CategoryVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $CategoryChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$CategoryChannelDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  CategoryChannelPersonalDataDto? get personalData;

  /// Create a copy of CategoryChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryChannelDtoCopyWith<CategoryChannelDto> get copyWith =>
      _$CategoryChannelDtoCopyWithImpl<CategoryChannelDto>(
        this as CategoryChannelDto,
        _$identity,
      );

  /// Serializes this CategoryChannelDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryChannelDto &&
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
    return 'CategoryChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $CategoryChannelDtoCopyWith<$Res> {
  factory $CategoryChannelDtoCopyWith(
    CategoryChannelDto value,
    $Res Function(CategoryChannelDto) _then,
  ) = _$CategoryChannelDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    CategoryChannelPersonalDataDto? personalData,
  });

  $CategoryChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$CategoryChannelDtoCopyWithImpl<$Res>
    implements $CategoryChannelDtoCopyWith<$Res> {
  _$CategoryChannelDtoCopyWithImpl(this._self, this._then);

  final CategoryChannelDto _self;
  final $Res Function(CategoryChannelDto) _then;

  /// Create a copy of CategoryChannelDto
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
                  as CategoryChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of CategoryChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $CategoryChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryChannelDto].
extension CategoryChannelDtoPatterns on CategoryChannelDto {
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
    TResult Function(_CategoryChannelDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelDto() when $default != null:
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
    TResult Function(_CategoryChannelDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelDto():
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
    TResult? Function(_CategoryChannelDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelDto() when $default != null:
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
      CategoryChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelDto() when $default != null:
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
      CategoryChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelDto():
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
      CategoryChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelDto() when $default != null:
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
class _CategoryChannelDto implements CategoryChannelDto {
  const _CategoryChannelDto({
    this.channelId = '',
    this.channelName = '',
    this.channelImageUrl,
    this.verifiedMark = false,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _CategoryChannelDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryChannelDtoFromJson(json);

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
  final CategoryChannelPersonalDataDto? personalData;

  /// Create a copy of CategoryChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryChannelDtoCopyWith<_CategoryChannelDto> get copyWith =>
      __$CategoryChannelDtoCopyWithImpl<_CategoryChannelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryChannelDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryChannelDto &&
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
    return 'CategoryChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$CategoryChannelDtoCopyWith<$Res>
    implements $CategoryChannelDtoCopyWith<$Res> {
  factory _$CategoryChannelDtoCopyWith(
    _CategoryChannelDto value,
    $Res Function(_CategoryChannelDto) _then,
  ) = __$CategoryChannelDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    CategoryChannelPersonalDataDto? personalData,
  });

  @override
  $CategoryChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$CategoryChannelDtoCopyWithImpl<$Res>
    implements _$CategoryChannelDtoCopyWith<$Res> {
  __$CategoryChannelDtoCopyWithImpl(this._self, this._then);

  final _CategoryChannelDto _self;
  final $Res Function(_CategoryChannelDto) _then;

  /// Create a copy of CategoryChannelDto
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
      _CategoryChannelDto(
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
                  as CategoryChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of CategoryChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $CategoryChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$CategoryChannelPersonalDataDto {
  CategoryChannelPersonalFollowingDto? get following;
  bool get privateUserBlock;

  /// Create a copy of CategoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryChannelPersonalDataDtoCopyWith<CategoryChannelPersonalDataDto>
  get copyWith =>
      _$CategoryChannelPersonalDataDtoCopyWithImpl<
        CategoryChannelPersonalDataDto
      >(this as CategoryChannelPersonalDataDto, _$identity);

  /// Serializes this CategoryChannelPersonalDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryChannelPersonalDataDto &&
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
    return 'CategoryChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $CategoryChannelPersonalDataDtoCopyWith<$Res> {
  factory $CategoryChannelPersonalDataDtoCopyWith(
    CategoryChannelPersonalDataDto value,
    $Res Function(CategoryChannelPersonalDataDto) _then,
  ) = _$CategoryChannelPersonalDataDtoCopyWithImpl;
  @useResult
  $Res call({
    CategoryChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  $CategoryChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$CategoryChannelPersonalDataDtoCopyWithImpl<$Res>
    implements $CategoryChannelPersonalDataDtoCopyWith<$Res> {
  _$CategoryChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final CategoryChannelPersonalDataDto _self;
  final $Res Function(CategoryChannelPersonalDataDto) _then;

  /// Create a copy of CategoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as CategoryChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of CategoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $CategoryChannelPersonalFollowingDtoCopyWith<$Res>(
      _self.following!,
      (value) {
        return _then(_self.copyWith(following: value));
      },
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryChannelPersonalDataDto].
extension CategoryChannelPersonalDataDtoPatterns
    on CategoryChannelPersonalDataDto {
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
    TResult Function(_CategoryChannelPersonalDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelPersonalDataDto() when $default != null:
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
    TResult Function(_CategoryChannelPersonalDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelPersonalDataDto():
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
    TResult? Function(_CategoryChannelPersonalDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelPersonalDataDto() when $default != null:
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
      CategoryChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelPersonalDataDto() when $default != null:
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
      CategoryChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelPersonalDataDto():
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
      CategoryChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryChannelPersonalDataDto
    implements CategoryChannelPersonalDataDto {
  const _CategoryChannelPersonalDataDto({
    this.following,
    this.privateUserBlock = false,
  });
  factory _CategoryChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryChannelPersonalDataDtoFromJson(json);

  @override
  final CategoryChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool privateUserBlock;

  /// Create a copy of CategoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryChannelPersonalDataDtoCopyWith<_CategoryChannelPersonalDataDto>
  get copyWith =>
      __$CategoryChannelPersonalDataDtoCopyWithImpl<
        _CategoryChannelPersonalDataDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryChannelPersonalDataDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryChannelPersonalDataDto &&
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
    return 'CategoryChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$CategoryChannelPersonalDataDtoCopyWith<$Res>
    implements $CategoryChannelPersonalDataDtoCopyWith<$Res> {
  factory _$CategoryChannelPersonalDataDtoCopyWith(
    _CategoryChannelPersonalDataDto value,
    $Res Function(_CategoryChannelPersonalDataDto) _then,
  ) = __$CategoryChannelPersonalDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    CategoryChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  @override
  $CategoryChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$CategoryChannelPersonalDataDtoCopyWithImpl<$Res>
    implements _$CategoryChannelPersonalDataDtoCopyWith<$Res> {
  __$CategoryChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final _CategoryChannelPersonalDataDto _self;
  final $Res Function(_CategoryChannelPersonalDataDto) _then;

  /// Create a copy of CategoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _CategoryChannelPersonalDataDto(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as CategoryChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of CategoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $CategoryChannelPersonalFollowingDtoCopyWith<$Res>(
      _self.following!,
      (value) {
        return _then(_self.copyWith(following: value));
      },
    );
  }
}

/// @nodoc
mixin _$CategoryChannelPersonalFollowingDto {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of CategoryChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryChannelPersonalFollowingDtoCopyWith<
    CategoryChannelPersonalFollowingDto
  >
  get copyWith =>
      _$CategoryChannelPersonalFollowingDtoCopyWithImpl<
        CategoryChannelPersonalFollowingDto
      >(this as CategoryChannelPersonalFollowingDto, _$identity);

  /// Serializes this CategoryChannelPersonalFollowingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryChannelPersonalFollowingDto &&
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
    return 'CategoryChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $CategoryChannelPersonalFollowingDtoCopyWith<$Res> {
  factory $CategoryChannelPersonalFollowingDtoCopyWith(
    CategoryChannelPersonalFollowingDto value,
    $Res Function(CategoryChannelPersonalFollowingDto) _then,
  ) = _$CategoryChannelPersonalFollowingDtoCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$CategoryChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements $CategoryChannelPersonalFollowingDtoCopyWith<$Res> {
  _$CategoryChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final CategoryChannelPersonalFollowingDto _self;
  final $Res Function(CategoryChannelPersonalFollowingDto) _then;

  /// Create a copy of CategoryChannelPersonalFollowingDto
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

/// Adds pattern-matching-related methods to [CategoryChannelPersonalFollowingDto].
extension CategoryChannelPersonalFollowingDtoPatterns
    on CategoryChannelPersonalFollowingDto {
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
    TResult Function(_CategoryChannelPersonalFollowingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelPersonalFollowingDto() when $default != null:
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
    TResult Function(_CategoryChannelPersonalFollowingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelPersonalFollowingDto():
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
    TResult? Function(_CategoryChannelPersonalFollowingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryChannelPersonalFollowingDto() when $default != null:
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
      case _CategoryChannelPersonalFollowingDto() when $default != null:
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
      case _CategoryChannelPersonalFollowingDto():
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
      case _CategoryChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryChannelPersonalFollowingDto
    implements CategoryChannelPersonalFollowingDto {
  const _CategoryChannelPersonalFollowingDto({
    this.following = false,
    this.notification = false,
    this.followDate,
  });
  factory _CategoryChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$CategoryChannelPersonalFollowingDtoFromJson(json);

  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of CategoryChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryChannelPersonalFollowingDtoCopyWith<
    _CategoryChannelPersonalFollowingDto
  >
  get copyWith =>
      __$CategoryChannelPersonalFollowingDtoCopyWithImpl<
        _CategoryChannelPersonalFollowingDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryChannelPersonalFollowingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryChannelPersonalFollowingDto &&
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
    return 'CategoryChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$CategoryChannelPersonalFollowingDtoCopyWith<$Res>
    implements $CategoryChannelPersonalFollowingDtoCopyWith<$Res> {
  factory _$CategoryChannelPersonalFollowingDtoCopyWith(
    _CategoryChannelPersonalFollowingDto value,
    $Res Function(_CategoryChannelPersonalFollowingDto) _then,
  ) = __$CategoryChannelPersonalFollowingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$CategoryChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements _$CategoryChannelPersonalFollowingDtoCopyWith<$Res> {
  __$CategoryChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final _CategoryChannelPersonalFollowingDto _self;
  final $Res Function(_CategoryChannelPersonalFollowingDto) _then;

  /// Create a copy of CategoryChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _CategoryChannelPersonalFollowingDto(
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
