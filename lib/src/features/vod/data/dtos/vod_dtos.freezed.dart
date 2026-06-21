// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodListDto {
  List<VodDto> get data;
  VodPageDto? get page;
  int get size;

  /// Create a copy of VodListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodListDtoCopyWith<VodListDto> get copyWith =>
      _$VodListDtoCopyWithImpl<VodListDto>(this as VodListDto, _$identity);

  /// Serializes this VodListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodListDto &&
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
    return 'VodListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class $VodListDtoCopyWith<$Res> {
  factory $VodListDtoCopyWith(
    VodListDto value,
    $Res Function(VodListDto) _then,
  ) = _$VodListDtoCopyWithImpl;
  @useResult
  $Res call({List<VodDto> data, VodPageDto? page, int size});

  $VodPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$VodListDtoCopyWithImpl<$Res> implements $VodListDtoCopyWith<$Res> {
  _$VodListDtoCopyWithImpl(this._self, this._then);

  final VodListDto _self;
  final $Res Function(VodListDto) _then;

  /// Create a copy of VodListDto
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
                  as List<VodDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as VodPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of VodListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $VodPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodListDto].
extension VodListDtoPatterns on VodListDto {
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
    TResult Function(_VodListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodListDto() when $default != null:
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
    TResult Function(_VodListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodListDto():
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
    TResult? Function(_VodListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodListDto() when $default != null:
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
    TResult Function(List<VodDto> data, VodPageDto? page, int size)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodListDto() when $default != null:
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
    TResult Function(List<VodDto> data, VodPageDto? page, int size) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodListDto():
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
    TResult? Function(List<VodDto> data, VodPageDto? page, int size)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodListDto implements VodListDto {
  const _VodListDto({
    final List<VodDto> data = const <VodDto>[],
    this.page,
    this.size = 0,
  }) : _data = data;
  factory _VodListDto.fromJson(Map<String, dynamic> json) =>
      _$VodListDtoFromJson(json);

  final List<VodDto> _data;
  @override
  @JsonKey()
  List<VodDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final VodPageDto? page;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of VodListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodListDtoCopyWith<_VodListDto> get copyWith =>
      __$VodListDtoCopyWithImpl<_VodListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodListDto &&
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
    return 'VodListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$VodListDtoCopyWith<$Res>
    implements $VodListDtoCopyWith<$Res> {
  factory _$VodListDtoCopyWith(
    _VodListDto value,
    $Res Function(_VodListDto) _then,
  ) = __$VodListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<VodDto> data, VodPageDto? page, int size});

  @override
  $VodPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$VodListDtoCopyWithImpl<$Res> implements _$VodListDtoCopyWith<$Res> {
  __$VodListDtoCopyWithImpl(this._self, this._then);

  final _VodListDto _self;
  final $Res Function(_VodListDto) _then;

  /// Create a copy of VodListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _VodListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<VodDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as VodPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of VodListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $VodPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$FollowingVodListDto {
  List<VodDto> get data;
  FollowingVodPageDto? get page;
  int get size;

  /// Create a copy of FollowingVodListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingVodListDtoCopyWith<FollowingVodListDto> get copyWith =>
      _$FollowingVodListDtoCopyWithImpl<FollowingVodListDto>(
        this as FollowingVodListDto,
        _$identity,
      );

  /// Serializes this FollowingVodListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingVodListDto &&
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
    return 'FollowingVodListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class $FollowingVodListDtoCopyWith<$Res> {
  factory $FollowingVodListDtoCopyWith(
    FollowingVodListDto value,
    $Res Function(FollowingVodListDto) _then,
  ) = _$FollowingVodListDtoCopyWithImpl;
  @useResult
  $Res call({List<VodDto> data, FollowingVodPageDto? page, int size});

  $FollowingVodPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$FollowingVodListDtoCopyWithImpl<$Res>
    implements $FollowingVodListDtoCopyWith<$Res> {
  _$FollowingVodListDtoCopyWithImpl(this._self, this._then);

  final FollowingVodListDto _self;
  final $Res Function(FollowingVodListDto) _then;

  /// Create a copy of FollowingVodListDto
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
                  as List<VodDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as FollowingVodPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of FollowingVodListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $FollowingVodPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FollowingVodListDto].
extension FollowingVodListDtoPatterns on FollowingVodListDto {
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
    TResult Function(_FollowingVodListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingVodListDto() when $default != null:
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
    TResult Function(_FollowingVodListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodListDto():
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
    TResult? Function(_FollowingVodListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodListDto() when $default != null:
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
    TResult Function(List<VodDto> data, FollowingVodPageDto? page, int size)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingVodListDto() when $default != null:
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
    TResult Function(List<VodDto> data, FollowingVodPageDto? page, int size)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodListDto():
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
    TResult? Function(List<VodDto> data, FollowingVodPageDto? page, int size)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingVodListDto implements FollowingVodListDto {
  const _FollowingVodListDto({
    final List<VodDto> data = const <VodDto>[],
    this.page,
    this.size = 0,
  }) : _data = data;
  factory _FollowingVodListDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodListDtoFromJson(json);

  final List<VodDto> _data;
  @override
  @JsonKey()
  List<VodDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final FollowingVodPageDto? page;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of FollowingVodListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingVodListDtoCopyWith<_FollowingVodListDto> get copyWith =>
      __$FollowingVodListDtoCopyWithImpl<_FollowingVodListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingVodListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingVodListDto &&
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
    return 'FollowingVodListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$FollowingVodListDtoCopyWith<$Res>
    implements $FollowingVodListDtoCopyWith<$Res> {
  factory _$FollowingVodListDtoCopyWith(
    _FollowingVodListDto value,
    $Res Function(_FollowingVodListDto) _then,
  ) = __$FollowingVodListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<VodDto> data, FollowingVodPageDto? page, int size});

  @override
  $FollowingVodPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$FollowingVodListDtoCopyWithImpl<$Res>
    implements _$FollowingVodListDtoCopyWith<$Res> {
  __$FollowingVodListDtoCopyWithImpl(this._self, this._then);

  final _FollowingVodListDto _self;
  final $Res Function(_FollowingVodListDto) _then;

  /// Create a copy of FollowingVodListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _FollowingVodListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<VodDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as FollowingVodPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of FollowingVodListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $FollowingVodPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$VodPageDto {
  VodPageNextDto? get next;

  /// Create a copy of VodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPageDtoCopyWith<VodPageDto> get copyWith =>
      _$VodPageDtoCopyWithImpl<VodPageDto>(this as VodPageDto, _$identity);

  /// Serializes this VodPageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'VodPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $VodPageDtoCopyWith<$Res> {
  factory $VodPageDtoCopyWith(
    VodPageDto value,
    $Res Function(VodPageDto) _then,
  ) = _$VodPageDtoCopyWithImpl;
  @useResult
  $Res call({VodPageNextDto? next});

  $VodPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$VodPageDtoCopyWithImpl<$Res> implements $VodPageDtoCopyWith<$Res> {
  _$VodPageDtoCopyWithImpl(this._self, this._then);

  final VodPageDto _self;
  final $Res Function(VodPageDto) _then;

  /// Create a copy of VodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as VodPageNextDto?,
      ),
    );
  }

  /// Create a copy of VodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $VodPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodPageDto].
extension VodPageDtoPatterns on VodPageDto {
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
    TResult Function(_VodPageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPageDto() when $default != null:
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
    TResult Function(_VodPageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPageDto():
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
    TResult? Function(_VodPageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPageDto() when $default != null:
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
    TResult Function(VodPageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPageDto() when $default != null:
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
    TResult Function(VodPageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPageDto():
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
    TResult? Function(VodPageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPageDto implements VodPageDto {
  const _VodPageDto({this.next});
  factory _VodPageDto.fromJson(Map<String, dynamic> json) =>
      _$VodPageDtoFromJson(json);

  @override
  final VodPageNextDto? next;

  /// Create a copy of VodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPageDtoCopyWith<_VodPageDto> get copyWith =>
      __$VodPageDtoCopyWithImpl<_VodPageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodPageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'VodPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$VodPageDtoCopyWith<$Res>
    implements $VodPageDtoCopyWith<$Res> {
  factory _$VodPageDtoCopyWith(
    _VodPageDto value,
    $Res Function(_VodPageDto) _then,
  ) = __$VodPageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({VodPageNextDto? next});

  @override
  $VodPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$VodPageDtoCopyWithImpl<$Res> implements _$VodPageDtoCopyWith<$Res> {
  __$VodPageDtoCopyWithImpl(this._self, this._then);

  final _VodPageDto _self;
  final $Res Function(_VodPageDto) _then;

  /// Create a copy of VodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _VodPageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as VodPageNextDto?,
      ),
    );
  }

  /// Create a copy of VodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $VodPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$VodPageNextDto {
  int? get publishDateAt;
  int? get readCount;

  /// Create a copy of VodPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPageNextDtoCopyWith<VodPageNextDto> get copyWith =>
      _$VodPageNextDtoCopyWithImpl<VodPageNextDto>(
        this as VodPageNextDto,
        _$identity,
      );

  /// Serializes this VodPageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPageNextDto &&
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
    return 'VodPageNextDto(publishDateAt: $publishDateAt, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class $VodPageNextDtoCopyWith<$Res> {
  factory $VodPageNextDtoCopyWith(
    VodPageNextDto value,
    $Res Function(VodPageNextDto) _then,
  ) = _$VodPageNextDtoCopyWithImpl;
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class _$VodPageNextDtoCopyWithImpl<$Res>
    implements $VodPageNextDtoCopyWith<$Res> {
  _$VodPageNextDtoCopyWithImpl(this._self, this._then);

  final VodPageNextDto _self;
  final $Res Function(VodPageNextDto) _then;

  /// Create a copy of VodPageNextDto
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

/// Adds pattern-matching-related methods to [VodPageNextDto].
extension VodPageNextDtoPatterns on VodPageNextDto {
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
    TResult Function(_VodPageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPageNextDto() when $default != null:
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
    TResult Function(_VodPageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPageNextDto():
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
    TResult? Function(_VodPageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPageNextDto() when $default != null:
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
      case _VodPageNextDto() when $default != null:
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
      case _VodPageNextDto():
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
      case _VodPageNextDto() when $default != null:
        return $default(_that.publishDateAt, _that.readCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPageNextDto implements VodPageNextDto {
  const _VodPageNextDto({this.publishDateAt, this.readCount});
  factory _VodPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$VodPageNextDtoFromJson(json);

  @override
  final int? publishDateAt;
  @override
  final int? readCount;

  /// Create a copy of VodPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPageNextDtoCopyWith<_VodPageNextDto> get copyWith =>
      __$VodPageNextDtoCopyWithImpl<_VodPageNextDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodPageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPageNextDto &&
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
    return 'VodPageNextDto(publishDateAt: $publishDateAt, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class _$VodPageNextDtoCopyWith<$Res>
    implements $VodPageNextDtoCopyWith<$Res> {
  factory _$VodPageNextDtoCopyWith(
    _VodPageNextDto value,
    $Res Function(_VodPageNextDto) _then,
  ) = __$VodPageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class __$VodPageNextDtoCopyWithImpl<$Res>
    implements _$VodPageNextDtoCopyWith<$Res> {
  __$VodPageNextDtoCopyWithImpl(this._self, this._then);

  final _VodPageNextDto _self;
  final $Res Function(_VodPageNextDto) _then;

  /// Create a copy of VodPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? publishDateAt = freezed, Object? readCount = freezed}) {
    return _then(
      _VodPageNextDto(
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
mixin _$FollowingVodPageDto {
  FollowingVodPageNextDto? get next;

  /// Create a copy of FollowingVodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingVodPageDtoCopyWith<FollowingVodPageDto> get copyWith =>
      _$FollowingVodPageDtoCopyWithImpl<FollowingVodPageDto>(
        this as FollowingVodPageDto,
        _$identity,
      );

  /// Serializes this FollowingVodPageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingVodPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'FollowingVodPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $FollowingVodPageDtoCopyWith<$Res> {
  factory $FollowingVodPageDtoCopyWith(
    FollowingVodPageDto value,
    $Res Function(FollowingVodPageDto) _then,
  ) = _$FollowingVodPageDtoCopyWithImpl;
  @useResult
  $Res call({FollowingVodPageNextDto? next});

  $FollowingVodPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$FollowingVodPageDtoCopyWithImpl<$Res>
    implements $FollowingVodPageDtoCopyWith<$Res> {
  _$FollowingVodPageDtoCopyWithImpl(this._self, this._then);

  final FollowingVodPageDto _self;
  final $Res Function(FollowingVodPageDto) _then;

  /// Create a copy of FollowingVodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as FollowingVodPageNextDto?,
      ),
    );
  }

  /// Create a copy of FollowingVodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $FollowingVodPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FollowingVodPageDto].
extension FollowingVodPageDtoPatterns on FollowingVodPageDto {
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
    TResult Function(_FollowingVodPageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageDto() when $default != null:
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
    TResult Function(_FollowingVodPageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageDto():
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
    TResult? Function(_FollowingVodPageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageDto() when $default != null:
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
    TResult Function(FollowingVodPageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageDto() when $default != null:
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
    TResult Function(FollowingVodPageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageDto():
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
    TResult? Function(FollowingVodPageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingVodPageDto implements FollowingVodPageDto {
  const _FollowingVodPageDto({this.next});
  factory _FollowingVodPageDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodPageDtoFromJson(json);

  @override
  final FollowingVodPageNextDto? next;

  /// Create a copy of FollowingVodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingVodPageDtoCopyWith<_FollowingVodPageDto> get copyWith =>
      __$FollowingVodPageDtoCopyWithImpl<_FollowingVodPageDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingVodPageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingVodPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'FollowingVodPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$FollowingVodPageDtoCopyWith<$Res>
    implements $FollowingVodPageDtoCopyWith<$Res> {
  factory _$FollowingVodPageDtoCopyWith(
    _FollowingVodPageDto value,
    $Res Function(_FollowingVodPageDto) _then,
  ) = __$FollowingVodPageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({FollowingVodPageNextDto? next});

  @override
  $FollowingVodPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$FollowingVodPageDtoCopyWithImpl<$Res>
    implements _$FollowingVodPageDtoCopyWith<$Res> {
  __$FollowingVodPageDtoCopyWithImpl(this._self, this._then);

  final _FollowingVodPageDto _self;
  final $Res Function(_FollowingVodPageDto) _then;

  /// Create a copy of FollowingVodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _FollowingVodPageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as FollowingVodPageNextDto?,
      ),
    );
  }

  /// Create a copy of FollowingVodPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $FollowingVodPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$FollowingVodPageNextDto {
  String? get nextNo;

  /// Create a copy of FollowingVodPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingVodPageNextDtoCopyWith<FollowingVodPageNextDto> get copyWith =>
      _$FollowingVodPageNextDtoCopyWithImpl<FollowingVodPageNextDto>(
        this as FollowingVodPageNextDto,
        _$identity,
      );

  /// Serializes this FollowingVodPageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingVodPageNextDto &&
            (identical(other.nextNo, nextNo) || other.nextNo == nextNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nextNo);

  @override
  String toString() {
    return 'FollowingVodPageNextDto(nextNo: $nextNo)';
  }
}

/// @nodoc
abstract mixin class $FollowingVodPageNextDtoCopyWith<$Res> {
  factory $FollowingVodPageNextDtoCopyWith(
    FollowingVodPageNextDto value,
    $Res Function(FollowingVodPageNextDto) _then,
  ) = _$FollowingVodPageNextDtoCopyWithImpl;
  @useResult
  $Res call({String? nextNo});
}

/// @nodoc
class _$FollowingVodPageNextDtoCopyWithImpl<$Res>
    implements $FollowingVodPageNextDtoCopyWith<$Res> {
  _$FollowingVodPageNextDtoCopyWithImpl(this._self, this._then);

  final FollowingVodPageNextDto _self;
  final $Res Function(FollowingVodPageNextDto) _then;

  /// Create a copy of FollowingVodPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nextNo = freezed}) {
    return _then(
      _self.copyWith(
        nextNo: freezed == nextNo
            ? _self.nextNo
            : nextNo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingVodPageNextDto].
extension FollowingVodPageNextDtoPatterns on FollowingVodPageNextDto {
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
    TResult Function(_FollowingVodPageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageNextDto() when $default != null:
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
    TResult Function(_FollowingVodPageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageNextDto():
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
    TResult? Function(_FollowingVodPageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageNextDto() when $default != null:
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
    TResult Function(String? nextNo)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageNextDto() when $default != null:
        return $default(_that.nextNo);
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
    TResult Function(String? nextNo) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageNextDto():
        return $default(_that.nextNo);
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
    TResult? Function(String? nextNo)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodPageNextDto() when $default != null:
        return $default(_that.nextNo);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingVodPageNextDto implements FollowingVodPageNextDto {
  const _FollowingVodPageNextDto({this.nextNo});
  factory _FollowingVodPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodPageNextDtoFromJson(json);

  @override
  final String? nextNo;

  /// Create a copy of FollowingVodPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingVodPageNextDtoCopyWith<_FollowingVodPageNextDto> get copyWith =>
      __$FollowingVodPageNextDtoCopyWithImpl<_FollowingVodPageNextDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingVodPageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingVodPageNextDto &&
            (identical(other.nextNo, nextNo) || other.nextNo == nextNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nextNo);

  @override
  String toString() {
    return 'FollowingVodPageNextDto(nextNo: $nextNo)';
  }
}

/// @nodoc
abstract mixin class _$FollowingVodPageNextDtoCopyWith<$Res>
    implements $FollowingVodPageNextDtoCopyWith<$Res> {
  factory _$FollowingVodPageNextDtoCopyWith(
    _FollowingVodPageNextDto value,
    $Res Function(_FollowingVodPageNextDto) _then,
  ) = __$FollowingVodPageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String? nextNo});
}

/// @nodoc
class __$FollowingVodPageNextDtoCopyWithImpl<$Res>
    implements _$FollowingVodPageNextDtoCopyWith<$Res> {
  __$FollowingVodPageNextDtoCopyWithImpl(this._self, this._then);

  final _FollowingVodPageNextDto _self;
  final $Res Function(_FollowingVodPageNextDto) _then;

  /// Create a copy of FollowingVodPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? nextNo = freezed}) {
    return _then(
      _FollowingVodPageNextDto(
        nextNo: freezed == nextNo
            ? _self.nextNo
            : nextNo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$VodDto {
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
  VodChannelDto? get channel;
  String? get blindType;
  int? get watchTimeline;
  String? get userAdultStatus;
  String? get membershipBenefitType;

  /// Create a copy of VodDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodDtoCopyWith<VodDto> get copyWith =>
      _$VodDtoCopyWithImpl<VodDto>(this as VodDto, _$identity);

  /// Serializes this VodDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodDto &&
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
                other.watchTimeline == watchTimeline) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType));
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
    userAdultStatus,
    membershipBenefitType,
  );

  @override
  String toString() {
    return 'VodDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline, userAdultStatus: $userAdultStatus, membershipBenefitType: $membershipBenefitType)';
  }
}

/// @nodoc
abstract mixin class $VodDtoCopyWith<$Res> {
  factory $VodDtoCopyWith(VodDto value, $Res Function(VodDto) _then) =
      _$VodDtoCopyWithImpl;
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
    VodChannelDto? channel,
    String? blindType,
    int? watchTimeline,
    String? userAdultStatus,
    String? membershipBenefitType,
  });

  $VodChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$VodDtoCopyWithImpl<$Res> implements $VodDtoCopyWith<$Res> {
  _$VodDtoCopyWithImpl(this._self, this._then);

  final VodDto _self;
  final $Res Function(VodDto) _then;

  /// Create a copy of VodDto
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
    Object? userAdultStatus = freezed,
    Object? membershipBenefitType = freezed,
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
                  as VodChannelDto?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of VodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $VodChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodDto].
extension VodDtoPatterns on VodDto {
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
    TResult Function(_VodDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodDto() when $default != null:
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
    TResult Function(_VodDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDto():
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
    TResult? Function(_VodDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDto() when $default != null:
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
      VodChannelDto? channel,
      String? blindType,
      int? watchTimeline,
      String? userAdultStatus,
      String? membershipBenefitType,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodDto() when $default != null:
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
          _that.userAdultStatus,
          _that.membershipBenefitType,
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
      VodChannelDto? channel,
      String? blindType,
      int? watchTimeline,
      String? userAdultStatus,
      String? membershipBenefitType,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDto():
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
          _that.userAdultStatus,
          _that.membershipBenefitType,
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
      VodChannelDto? channel,
      String? blindType,
      int? watchTimeline,
      String? userAdultStatus,
      String? membershipBenefitType,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDto() when $default != null:
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
          _that.userAdultStatus,
          _that.membershipBenefitType,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodDto implements VodDto {
  const _VodDto({
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
    this.userAdultStatus,
    this.membershipBenefitType,
  }) : _tags = tags;
  factory _VodDto.fromJson(Map<String, dynamic> json) => _$VodDtoFromJson(json);

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
  final VodChannelDto? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;
  @override
  final String? userAdultStatus;
  @override
  final String? membershipBenefitType;

  /// Create a copy of VodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodDtoCopyWith<_VodDto> get copyWith =>
      __$VodDtoCopyWithImpl<_VodDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodDto &&
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
                other.watchTimeline == watchTimeline) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType));
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
    userAdultStatus,
    membershipBenefitType,
  );

  @override
  String toString() {
    return 'VodDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline, userAdultStatus: $userAdultStatus, membershipBenefitType: $membershipBenefitType)';
  }
}

/// @nodoc
abstract mixin class _$VodDtoCopyWith<$Res> implements $VodDtoCopyWith<$Res> {
  factory _$VodDtoCopyWith(_VodDto value, $Res Function(_VodDto) _then) =
      __$VodDtoCopyWithImpl;
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
    VodChannelDto? channel,
    String? blindType,
    int? watchTimeline,
    String? userAdultStatus,
    String? membershipBenefitType,
  });

  @override
  $VodChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$VodDtoCopyWithImpl<$Res> implements _$VodDtoCopyWith<$Res> {
  __$VodDtoCopyWithImpl(this._self, this._then);

  final _VodDto _self;
  final $Res Function(_VodDto) _then;

  /// Create a copy of VodDto
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
    Object? userAdultStatus = freezed,
    Object? membershipBenefitType = freezed,
  }) {
    return _then(
      _VodDto(
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
                  as VodChannelDto?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of VodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $VodChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$VodDetailDto {
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
  bool get chapterActive;
  List<VodChapterDto> get chapters;
  VodChannelDto? get channel;
  String? get blindType;
  int? get watchTimeline;
  String? get inKey;
  String? get liveOpenDate;
  String? get liveRewindPlaybackJson;
  String? get userAdultStatus;
  bool get videoChatEnabled;
  String? get videoChatChannelId;
  String? get membershipBenefitType;

  /// Create a copy of VodDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodDetailDtoCopyWith<VodDetailDto> get copyWith =>
      _$VodDetailDtoCopyWithImpl<VodDetailDto>(
        this as VodDetailDto,
        _$identity,
      );

  /// Serializes this VodDetailDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodDetailDto &&
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
            (identical(other.chapterActive, chapterActive) ||
                other.chapterActive == chapterActive) &&
            const DeepCollectionEquality().equals(other.chapters, chapters) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline) &&
            (identical(other.inKey, inKey) || other.inKey == inKey) &&
            (identical(other.liveOpenDate, liveOpenDate) ||
                other.liveOpenDate == liveOpenDate) &&
            (identical(other.liveRewindPlaybackJson, liveRewindPlaybackJson) ||
                other.liveRewindPlaybackJson == liveRewindPlaybackJson) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.videoChatEnabled, videoChatEnabled) ||
                other.videoChatEnabled == videoChatEnabled) &&
            (identical(other.videoChatChannelId, videoChatChannelId) ||
                other.videoChatChannelId == videoChatChannelId) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
    chapterActive,
    const DeepCollectionEquality().hash(chapters),
    channel,
    blindType,
    watchTimeline,
    inKey,
    liveOpenDate,
    liveRewindPlaybackJson,
    userAdultStatus,
    videoChatEnabled,
    videoChatChannelId,
    membershipBenefitType,
  ]);

  @override
  String toString() {
    return 'VodDetailDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, chapterActive: $chapterActive, chapters: $chapters, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline, inKey: $inKey, liveOpenDate: $liveOpenDate, liveRewindPlaybackJson: $liveRewindPlaybackJson, userAdultStatus: $userAdultStatus, videoChatEnabled: $videoChatEnabled, videoChatChannelId: $videoChatChannelId, membershipBenefitType: $membershipBenefitType)';
  }
}

/// @nodoc
abstract mixin class $VodDetailDtoCopyWith<$Res> {
  factory $VodDetailDtoCopyWith(
    VodDetailDto value,
    $Res Function(VodDetailDto) _then,
  ) = _$VodDetailDtoCopyWithImpl;
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
    bool chapterActive,
    List<VodChapterDto> chapters,
    VodChannelDto? channel,
    String? blindType,
    int? watchTimeline,
    String? inKey,
    String? liveOpenDate,
    String? liveRewindPlaybackJson,
    String? userAdultStatus,
    bool videoChatEnabled,
    String? videoChatChannelId,
    String? membershipBenefitType,
  });

  $VodChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$VodDetailDtoCopyWithImpl<$Res> implements $VodDetailDtoCopyWith<$Res> {
  _$VodDetailDtoCopyWithImpl(this._self, this._then);

  final VodDetailDto _self;
  final $Res Function(VodDetailDto) _then;

  /// Create a copy of VodDetailDto
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
    Object? chapterActive = null,
    Object? chapters = null,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
    Object? inKey = freezed,
    Object? liveOpenDate = freezed,
    Object? liveRewindPlaybackJson = freezed,
    Object? userAdultStatus = freezed,
    Object? videoChatEnabled = null,
    Object? videoChatChannelId = freezed,
    Object? membershipBenefitType = freezed,
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
        chapterActive: null == chapterActive
            ? _self.chapterActive
            : chapterActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        chapters: null == chapters
            ? _self.chapters
            : chapters // ignore: cast_nullable_to_non_nullable
                  as List<VodChapterDto>,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as VodChannelDto?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
        inKey: freezed == inKey
            ? _self.inKey
            : inKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveOpenDate: freezed == liveOpenDate
            ? _self.liveOpenDate
            : liveOpenDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveRewindPlaybackJson: freezed == liveRewindPlaybackJson
            ? _self.liveRewindPlaybackJson
            : liveRewindPlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoChatEnabled: null == videoChatEnabled
            ? _self.videoChatEnabled
            : videoChatEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        videoChatChannelId: freezed == videoChatChannelId
            ? _self.videoChatChannelId
            : videoChatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of VodDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $VodChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodDetailDto].
extension VodDetailDtoPatterns on VodDetailDto {
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
    TResult Function(_VodDetailDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodDetailDto() when $default != null:
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
    TResult Function(_VodDetailDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDetailDto():
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
    TResult? Function(_VodDetailDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDetailDto() when $default != null:
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
      bool chapterActive,
      List<VodChapterDto> chapters,
      VodChannelDto? channel,
      String? blindType,
      int? watchTimeline,
      String? inKey,
      String? liveOpenDate,
      String? liveRewindPlaybackJson,
      String? userAdultStatus,
      bool videoChatEnabled,
      String? videoChatChannelId,
      String? membershipBenefitType,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodDetailDto() when $default != null:
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
          _that.chapterActive,
          _that.chapters,
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
          _that.inKey,
          _that.liveOpenDate,
          _that.liveRewindPlaybackJson,
          _that.userAdultStatus,
          _that.videoChatEnabled,
          _that.videoChatChannelId,
          _that.membershipBenefitType,
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
      bool chapterActive,
      List<VodChapterDto> chapters,
      VodChannelDto? channel,
      String? blindType,
      int? watchTimeline,
      String? inKey,
      String? liveOpenDate,
      String? liveRewindPlaybackJson,
      String? userAdultStatus,
      bool videoChatEnabled,
      String? videoChatChannelId,
      String? membershipBenefitType,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDetailDto():
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
          _that.chapterActive,
          _that.chapters,
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
          _that.inKey,
          _that.liveOpenDate,
          _that.liveRewindPlaybackJson,
          _that.userAdultStatus,
          _that.videoChatEnabled,
          _that.videoChatChannelId,
          _that.membershipBenefitType,
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
      bool chapterActive,
      List<VodChapterDto> chapters,
      VodChannelDto? channel,
      String? blindType,
      int? watchTimeline,
      String? inKey,
      String? liveOpenDate,
      String? liveRewindPlaybackJson,
      String? userAdultStatus,
      bool videoChatEnabled,
      String? videoChatChannelId,
      String? membershipBenefitType,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodDetailDto() when $default != null:
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
          _that.chapterActive,
          _that.chapters,
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
          _that.inKey,
          _that.liveOpenDate,
          _that.liveRewindPlaybackJson,
          _that.userAdultStatus,
          _that.videoChatEnabled,
          _that.videoChatChannelId,
          _that.membershipBenefitType,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodDetailDto implements VodDetailDto {
  const _VodDetailDto({
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
    this.chapterActive = false,
    final List<VodChapterDto> chapters = const <VodChapterDto>[],
    this.channel,
    this.blindType,
    this.watchTimeline,
    this.inKey,
    this.liveOpenDate,
    this.liveRewindPlaybackJson,
    this.userAdultStatus,
    this.videoChatEnabled = false,
    this.videoChatChannelId,
    this.membershipBenefitType,
  }) : _tags = tags,
       _chapters = chapters;
  factory _VodDetailDto.fromJson(Map<String, dynamic> json) =>
      _$VodDetailDtoFromJson(json);

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
  @JsonKey()
  final bool chapterActive;
  final List<VodChapterDto> _chapters;
  @override
  @JsonKey()
  List<VodChapterDto> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  final VodChannelDto? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;
  @override
  final String? inKey;
  @override
  final String? liveOpenDate;
  @override
  final String? liveRewindPlaybackJson;
  @override
  final String? userAdultStatus;
  @override
  @JsonKey()
  final bool videoChatEnabled;
  @override
  final String? videoChatChannelId;
  @override
  final String? membershipBenefitType;

  /// Create a copy of VodDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodDetailDtoCopyWith<_VodDetailDto> get copyWith =>
      __$VodDetailDtoCopyWithImpl<_VodDetailDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodDetailDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodDetailDto &&
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
            (identical(other.chapterActive, chapterActive) ||
                other.chapterActive == chapterActive) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline) &&
            (identical(other.inKey, inKey) || other.inKey == inKey) &&
            (identical(other.liveOpenDate, liveOpenDate) ||
                other.liveOpenDate == liveOpenDate) &&
            (identical(other.liveRewindPlaybackJson, liveRewindPlaybackJson) ||
                other.liveRewindPlaybackJson == liveRewindPlaybackJson) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.videoChatEnabled, videoChatEnabled) ||
                other.videoChatEnabled == videoChatEnabled) &&
            (identical(other.videoChatChannelId, videoChatChannelId) ||
                other.videoChatChannelId == videoChatChannelId) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
    chapterActive,
    const DeepCollectionEquality().hash(_chapters),
    channel,
    blindType,
    watchTimeline,
    inKey,
    liveOpenDate,
    liveRewindPlaybackJson,
    userAdultStatus,
    videoChatEnabled,
    videoChatChannelId,
    membershipBenefitType,
  ]);

  @override
  String toString() {
    return 'VodDetailDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, chapterActive: $chapterActive, chapters: $chapters, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline, inKey: $inKey, liveOpenDate: $liveOpenDate, liveRewindPlaybackJson: $liveRewindPlaybackJson, userAdultStatus: $userAdultStatus, videoChatEnabled: $videoChatEnabled, videoChatChannelId: $videoChatChannelId, membershipBenefitType: $membershipBenefitType)';
  }
}

/// @nodoc
abstract mixin class _$VodDetailDtoCopyWith<$Res>
    implements $VodDetailDtoCopyWith<$Res> {
  factory _$VodDetailDtoCopyWith(
    _VodDetailDto value,
    $Res Function(_VodDetailDto) _then,
  ) = __$VodDetailDtoCopyWithImpl;
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
    bool chapterActive,
    List<VodChapterDto> chapters,
    VodChannelDto? channel,
    String? blindType,
    int? watchTimeline,
    String? inKey,
    String? liveOpenDate,
    String? liveRewindPlaybackJson,
    String? userAdultStatus,
    bool videoChatEnabled,
    String? videoChatChannelId,
    String? membershipBenefitType,
  });

  @override
  $VodChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$VodDetailDtoCopyWithImpl<$Res>
    implements _$VodDetailDtoCopyWith<$Res> {
  __$VodDetailDtoCopyWithImpl(this._self, this._then);

  final _VodDetailDto _self;
  final $Res Function(_VodDetailDto) _then;

  /// Create a copy of VodDetailDto
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
    Object? chapterActive = null,
    Object? chapters = null,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
    Object? inKey = freezed,
    Object? liveOpenDate = freezed,
    Object? liveRewindPlaybackJson = freezed,
    Object? userAdultStatus = freezed,
    Object? videoChatEnabled = null,
    Object? videoChatChannelId = freezed,
    Object? membershipBenefitType = freezed,
  }) {
    return _then(
      _VodDetailDto(
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
        chapterActive: null == chapterActive
            ? _self.chapterActive
            : chapterActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        chapters: null == chapters
            ? _self._chapters
            : chapters // ignore: cast_nullable_to_non_nullable
                  as List<VodChapterDto>,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as VodChannelDto?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
        inKey: freezed == inKey
            ? _self.inKey
            : inKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveOpenDate: freezed == liveOpenDate
            ? _self.liveOpenDate
            : liveOpenDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveRewindPlaybackJson: freezed == liveRewindPlaybackJson
            ? _self.liveRewindPlaybackJson
            : liveRewindPlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoChatEnabled: null == videoChatEnabled
            ? _self.videoChatEnabled
            : videoChatEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        videoChatChannelId: freezed == videoChatChannelId
            ? _self.videoChatChannelId
            : videoChatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of VodDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $VodChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$VodChapterDto {
  String get title;
  int get startTime;
  int get endTime;
  String? get thumbnailUrl;

  /// Create a copy of VodChapterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodChapterDtoCopyWith<VodChapterDto> get copyWith =>
      _$VodChapterDtoCopyWithImpl<VodChapterDto>(
        this as VodChapterDto,
        _$identity,
      );

  /// Serializes this VodChapterDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodChapterDto &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, startTime, endTime, thumbnailUrl);

  @override
  String toString() {
    return 'VodChapterDto(title: $title, startTime: $startTime, endTime: $endTime, thumbnailUrl: $thumbnailUrl)';
  }
}

/// @nodoc
abstract mixin class $VodChapterDtoCopyWith<$Res> {
  factory $VodChapterDtoCopyWith(
    VodChapterDto value,
    $Res Function(VodChapterDto) _then,
  ) = _$VodChapterDtoCopyWithImpl;
  @useResult
  $Res call({String title, int startTime, int endTime, String? thumbnailUrl});
}

/// @nodoc
class _$VodChapterDtoCopyWithImpl<$Res>
    implements $VodChapterDtoCopyWith<$Res> {
  _$VodChapterDtoCopyWithImpl(this._self, this._then);

  final VodChapterDto _self;
  final $Res Function(VodChapterDto) _then;

  /// Create a copy of VodChapterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _self.copyWith(
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as int,
        endTime: null == endTime
            ? _self.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailUrl: freezed == thumbnailUrl
            ? _self.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodChapterDto].
extension VodChapterDtoPatterns on VodChapterDto {
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
    TResult Function(_VodChapterDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodChapterDto() when $default != null:
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
    TResult Function(_VodChapterDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChapterDto():
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
    TResult? Function(_VodChapterDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChapterDto() when $default != null:
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
      String title,
      int startTime,
      int endTime,
      String? thumbnailUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodChapterDto() when $default != null:
        return $default(
          _that.title,
          _that.startTime,
          _that.endTime,
          _that.thumbnailUrl,
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
      String title,
      int startTime,
      int endTime,
      String? thumbnailUrl,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChapterDto():
        return $default(
          _that.title,
          _that.startTime,
          _that.endTime,
          _that.thumbnailUrl,
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
      String title,
      int startTime,
      int endTime,
      String? thumbnailUrl,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChapterDto() when $default != null:
        return $default(
          _that.title,
          _that.startTime,
          _that.endTime,
          _that.thumbnailUrl,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodChapterDto implements VodChapterDto {
  const _VodChapterDto({
    this.title = '',
    this.startTime = 0,
    this.endTime = 0,
    this.thumbnailUrl,
  });
  factory _VodChapterDto.fromJson(Map<String, dynamic> json) =>
      _$VodChapterDtoFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int startTime;
  @override
  @JsonKey()
  final int endTime;
  @override
  final String? thumbnailUrl;

  /// Create a copy of VodChapterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodChapterDtoCopyWith<_VodChapterDto> get copyWith =>
      __$VodChapterDtoCopyWithImpl<_VodChapterDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodChapterDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodChapterDto &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, startTime, endTime, thumbnailUrl);

  @override
  String toString() {
    return 'VodChapterDto(title: $title, startTime: $startTime, endTime: $endTime, thumbnailUrl: $thumbnailUrl)';
  }
}

/// @nodoc
abstract mixin class _$VodChapterDtoCopyWith<$Res>
    implements $VodChapterDtoCopyWith<$Res> {
  factory _$VodChapterDtoCopyWith(
    _VodChapterDto value,
    $Res Function(_VodChapterDto) _then,
  ) = __$VodChapterDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String title, int startTime, int endTime, String? thumbnailUrl});
}

/// @nodoc
class __$VodChapterDtoCopyWithImpl<$Res>
    implements _$VodChapterDtoCopyWith<$Res> {
  __$VodChapterDtoCopyWithImpl(this._self, this._then);

  final _VodChapterDto _self;
  final $Res Function(_VodChapterDto) _then;

  /// Create a copy of VodChapterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _VodChapterDto(
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as int,
        endTime: null == endTime
            ? _self.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailUrl: freezed == thumbnailUrl
            ? _self.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$VodChannelDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  VodChannelPersonalDataDto? get personalData;

  /// Create a copy of VodChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodChannelDtoCopyWith<VodChannelDto> get copyWith =>
      _$VodChannelDtoCopyWithImpl<VodChannelDto>(
        this as VodChannelDto,
        _$identity,
      );

  /// Serializes this VodChannelDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodChannelDto &&
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
    return 'VodChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $VodChannelDtoCopyWith<$Res> {
  factory $VodChannelDtoCopyWith(
    VodChannelDto value,
    $Res Function(VodChannelDto) _then,
  ) = _$VodChannelDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    VodChannelPersonalDataDto? personalData,
  });

  $VodChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$VodChannelDtoCopyWithImpl<$Res>
    implements $VodChannelDtoCopyWith<$Res> {
  _$VodChannelDtoCopyWithImpl(this._self, this._then);

  final VodChannelDto _self;
  final $Res Function(VodChannelDto) _then;

  /// Create a copy of VodChannelDto
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
                  as VodChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of VodChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $VodChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodChannelDto].
extension VodChannelDtoPatterns on VodChannelDto {
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
    TResult Function(_VodChannelDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodChannelDto() when $default != null:
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
    TResult Function(_VodChannelDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelDto():
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
    TResult? Function(_VodChannelDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelDto() when $default != null:
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
      VodChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodChannelDto() when $default != null:
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
      VodChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelDto():
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
      VodChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelDto() when $default != null:
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
class _VodChannelDto implements VodChannelDto {
  const _VodChannelDto({
    this.channelId = '',
    this.channelName = '',
    this.channelImageUrl,
    this.verifiedMark = false,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _VodChannelDto.fromJson(Map<String, dynamic> json) =>
      _$VodChannelDtoFromJson(json);

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
  final VodChannelPersonalDataDto? personalData;

  /// Create a copy of VodChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodChannelDtoCopyWith<_VodChannelDto> get copyWith =>
      __$VodChannelDtoCopyWithImpl<_VodChannelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodChannelDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodChannelDto &&
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
    return 'VodChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$VodChannelDtoCopyWith<$Res>
    implements $VodChannelDtoCopyWith<$Res> {
  factory _$VodChannelDtoCopyWith(
    _VodChannelDto value,
    $Res Function(_VodChannelDto) _then,
  ) = __$VodChannelDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    VodChannelPersonalDataDto? personalData,
  });

  @override
  $VodChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$VodChannelDtoCopyWithImpl<$Res>
    implements _$VodChannelDtoCopyWith<$Res> {
  __$VodChannelDtoCopyWithImpl(this._self, this._then);

  final _VodChannelDto _self;
  final $Res Function(_VodChannelDto) _then;

  /// Create a copy of VodChannelDto
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
      _VodChannelDto(
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
                  as VodChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of VodChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $VodChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$VodChannelPersonalDataDto {
  VodChannelPersonalFollowingDto? get following;
  bool get privateUserBlock;

  /// Create a copy of VodChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodChannelPersonalDataDtoCopyWith<VodChannelPersonalDataDto> get copyWith =>
      _$VodChannelPersonalDataDtoCopyWithImpl<VodChannelPersonalDataDto>(
        this as VodChannelPersonalDataDto,
        _$identity,
      );

  /// Serializes this VodChannelPersonalDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodChannelPersonalDataDto &&
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
    return 'VodChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $VodChannelPersonalDataDtoCopyWith<$Res> {
  factory $VodChannelPersonalDataDtoCopyWith(
    VodChannelPersonalDataDto value,
    $Res Function(VodChannelPersonalDataDto) _then,
  ) = _$VodChannelPersonalDataDtoCopyWithImpl;
  @useResult
  $Res call({VodChannelPersonalFollowingDto? following, bool privateUserBlock});

  $VodChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$VodChannelPersonalDataDtoCopyWithImpl<$Res>
    implements $VodChannelPersonalDataDtoCopyWith<$Res> {
  _$VodChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final VodChannelPersonalDataDto _self;
  final $Res Function(VodChannelPersonalDataDto) _then;

  /// Create a copy of VodChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as VodChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of VodChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $VodChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodChannelPersonalDataDto].
extension VodChannelPersonalDataDtoPatterns on VodChannelPersonalDataDto {
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
    TResult Function(_VodChannelPersonalDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodChannelPersonalDataDto() when $default != null:
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
    TResult Function(_VodChannelPersonalDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelPersonalDataDto():
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
    TResult? Function(_VodChannelPersonalDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelPersonalDataDto() when $default != null:
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
      VodChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodChannelPersonalDataDto() when $default != null:
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
      VodChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelPersonalDataDto():
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
      VodChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodChannelPersonalDataDto implements VodChannelPersonalDataDto {
  const _VodChannelPersonalDataDto({
    this.following,
    this.privateUserBlock = false,
  });
  factory _VodChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$VodChannelPersonalDataDtoFromJson(json);

  @override
  final VodChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool privateUserBlock;

  /// Create a copy of VodChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodChannelPersonalDataDtoCopyWith<_VodChannelPersonalDataDto>
  get copyWith =>
      __$VodChannelPersonalDataDtoCopyWithImpl<_VodChannelPersonalDataDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$VodChannelPersonalDataDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodChannelPersonalDataDto &&
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
    return 'VodChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$VodChannelPersonalDataDtoCopyWith<$Res>
    implements $VodChannelPersonalDataDtoCopyWith<$Res> {
  factory _$VodChannelPersonalDataDtoCopyWith(
    _VodChannelPersonalDataDto value,
    $Res Function(_VodChannelPersonalDataDto) _then,
  ) = __$VodChannelPersonalDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({VodChannelPersonalFollowingDto? following, bool privateUserBlock});

  @override
  $VodChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$VodChannelPersonalDataDtoCopyWithImpl<$Res>
    implements _$VodChannelPersonalDataDtoCopyWith<$Res> {
  __$VodChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final _VodChannelPersonalDataDto _self;
  final $Res Function(_VodChannelPersonalDataDto) _then;

  /// Create a copy of VodChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _VodChannelPersonalDataDto(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as VodChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of VodChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $VodChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// @nodoc
mixin _$VodChannelPersonalFollowingDto {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of VodChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodChannelPersonalFollowingDtoCopyWith<VodChannelPersonalFollowingDto>
  get copyWith =>
      _$VodChannelPersonalFollowingDtoCopyWithImpl<
        VodChannelPersonalFollowingDto
      >(this as VodChannelPersonalFollowingDto, _$identity);

  /// Serializes this VodChannelPersonalFollowingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodChannelPersonalFollowingDto &&
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
    return 'VodChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $VodChannelPersonalFollowingDtoCopyWith<$Res> {
  factory $VodChannelPersonalFollowingDtoCopyWith(
    VodChannelPersonalFollowingDto value,
    $Res Function(VodChannelPersonalFollowingDto) _then,
  ) = _$VodChannelPersonalFollowingDtoCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$VodChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements $VodChannelPersonalFollowingDtoCopyWith<$Res> {
  _$VodChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final VodChannelPersonalFollowingDto _self;
  final $Res Function(VodChannelPersonalFollowingDto) _then;

  /// Create a copy of VodChannelPersonalFollowingDto
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

/// Adds pattern-matching-related methods to [VodChannelPersonalFollowingDto].
extension VodChannelPersonalFollowingDtoPatterns
    on VodChannelPersonalFollowingDto {
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
    TResult Function(_VodChannelPersonalFollowingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodChannelPersonalFollowingDto() when $default != null:
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
    TResult Function(_VodChannelPersonalFollowingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelPersonalFollowingDto():
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
    TResult? Function(_VodChannelPersonalFollowingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodChannelPersonalFollowingDto() when $default != null:
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
      case _VodChannelPersonalFollowingDto() when $default != null:
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
      case _VodChannelPersonalFollowingDto():
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
      case _VodChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodChannelPersonalFollowingDto
    implements VodChannelPersonalFollowingDto {
  const _VodChannelPersonalFollowingDto({
    this.following = false,
    this.notification = false,
    this.followDate,
  });
  factory _VodChannelPersonalFollowingDto.fromJson(Map<String, dynamic> json) =>
      _$VodChannelPersonalFollowingDtoFromJson(json);

  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of VodChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodChannelPersonalFollowingDtoCopyWith<_VodChannelPersonalFollowingDto>
  get copyWith =>
      __$VodChannelPersonalFollowingDtoCopyWithImpl<
        _VodChannelPersonalFollowingDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodChannelPersonalFollowingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodChannelPersonalFollowingDto &&
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
    return 'VodChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$VodChannelPersonalFollowingDtoCopyWith<$Res>
    implements $VodChannelPersonalFollowingDtoCopyWith<$Res> {
  factory _$VodChannelPersonalFollowingDtoCopyWith(
    _VodChannelPersonalFollowingDto value,
    $Res Function(_VodChannelPersonalFollowingDto) _then,
  ) = __$VodChannelPersonalFollowingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$VodChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements _$VodChannelPersonalFollowingDtoCopyWith<$Res> {
  __$VodChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final _VodChannelPersonalFollowingDto _self;
  final $Res Function(_VodChannelPersonalFollowingDto) _then;

  /// Create a copy of VodChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _VodChannelPersonalFollowingDto(
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

/// @nodoc
mixin _$VodPlaybackDto {
  @JsonKey(name: r'$version')
  String? get version;
  @JsonKey(name: 'MPD')
  List<VodPlaybackMpdDto> get mpd;

  /// Create a copy of VodPlaybackDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackDtoCopyWith<VodPlaybackDto> get copyWith =>
      _$VodPlaybackDtoCopyWithImpl<VodPlaybackDto>(
        this as VodPlaybackDto,
        _$identity,
      );

  /// Serializes this VodPlaybackDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackDto &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other.mpd, mpd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    version,
    const DeepCollectionEquality().hash(mpd),
  );

  @override
  String toString() {
    return 'VodPlaybackDto(version: $version, mpd: $mpd)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackDtoCopyWith<$Res> {
  factory $VodPlaybackDtoCopyWith(
    VodPlaybackDto value,
    $Res Function(VodPlaybackDto) _then,
  ) = _$VodPlaybackDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: r'$version') String? version,
    @JsonKey(name: 'MPD') List<VodPlaybackMpdDto> mpd,
  });
}

/// @nodoc
class _$VodPlaybackDtoCopyWithImpl<$Res>
    implements $VodPlaybackDtoCopyWith<$Res> {
  _$VodPlaybackDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackDto _self;
  final $Res Function(VodPlaybackDto) _then;

  /// Create a copy of VodPlaybackDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = freezed, Object? mpd = null}) {
    return _then(
      _self.copyWith(
        version: freezed == version
            ? _self.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String?,
        mpd: null == mpd
            ? _self.mpd
            : mpd // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackMpdDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackDto].
extension VodPlaybackDtoPatterns on VodPlaybackDto {
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
    TResult Function(_VodPlaybackDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackDto() when $default != null:
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
    TResult Function(_VodPlaybackDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackDto():
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
    TResult? Function(_VodPlaybackDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackDto() when $default != null:
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
      @JsonKey(name: r'$version') String? version,
      @JsonKey(name: 'MPD') List<VodPlaybackMpdDto> mpd,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackDto() when $default != null:
        return $default(_that.version, _that.mpd);
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
      @JsonKey(name: r'$version') String? version,
      @JsonKey(name: 'MPD') List<VodPlaybackMpdDto> mpd,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackDto():
        return $default(_that.version, _that.mpd);
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
      @JsonKey(name: r'$version') String? version,
      @JsonKey(name: 'MPD') List<VodPlaybackMpdDto> mpd,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackDto() when $default != null:
        return $default(_that.version, _that.mpd);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackDto implements VodPlaybackDto {
  const _VodPlaybackDto({
    @JsonKey(name: r'$version') this.version,
    @JsonKey(name: 'MPD')
    final List<VodPlaybackMpdDto> mpd = const <VodPlaybackMpdDto>[],
  }) : _mpd = mpd;
  factory _VodPlaybackDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackDtoFromJson(json);

  @override
  @JsonKey(name: r'$version')
  final String? version;
  final List<VodPlaybackMpdDto> _mpd;
  @override
  @JsonKey(name: 'MPD')
  List<VodPlaybackMpdDto> get mpd {
    if (_mpd is EqualUnmodifiableListView) return _mpd;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mpd);
  }

  /// Create a copy of VodPlaybackDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackDtoCopyWith<_VodPlaybackDto> get copyWith =>
      __$VodPlaybackDtoCopyWithImpl<_VodPlaybackDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackDto &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._mpd, _mpd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    version,
    const DeepCollectionEquality().hash(_mpd),
  );

  @override
  String toString() {
    return 'VodPlaybackDto(version: $version, mpd: $mpd)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackDtoCopyWith<$Res>
    implements $VodPlaybackDtoCopyWith<$Res> {
  factory _$VodPlaybackDtoCopyWith(
    _VodPlaybackDto value,
    $Res Function(_VodPlaybackDto) _then,
  ) = __$VodPlaybackDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: r'$version') String? version,
    @JsonKey(name: 'MPD') List<VodPlaybackMpdDto> mpd,
  });
}

/// @nodoc
class __$VodPlaybackDtoCopyWithImpl<$Res>
    implements _$VodPlaybackDtoCopyWith<$Res> {
  __$VodPlaybackDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackDto _self;
  final $Res Function(_VodPlaybackDto) _then;

  /// Create a copy of VodPlaybackDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? version = freezed, Object? mpd = null}) {
    return _then(
      _VodPlaybackDto(
        version: freezed == version
            ? _self.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String?,
        mpd: null == mpd
            ? _self._mpd
            : mpd // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackMpdDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlaybackMpdDto {
  @JsonKey(name: 'Period')
  List<VodPlaybackPeriodDto> get period;

  /// Create a copy of VodPlaybackMpdDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackMpdDtoCopyWith<VodPlaybackMpdDto> get copyWith =>
      _$VodPlaybackMpdDtoCopyWithImpl<VodPlaybackMpdDto>(
        this as VodPlaybackMpdDto,
        _$identity,
      );

  /// Serializes this VodPlaybackMpdDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackMpdDto &&
            const DeepCollectionEquality().equals(other.period, period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(period));

  @override
  String toString() {
    return 'VodPlaybackMpdDto(period: $period)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackMpdDtoCopyWith<$Res> {
  factory $VodPlaybackMpdDtoCopyWith(
    VodPlaybackMpdDto value,
    $Res Function(VodPlaybackMpdDto) _then,
  ) = _$VodPlaybackMpdDtoCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'Period') List<VodPlaybackPeriodDto> period});
}

/// @nodoc
class _$VodPlaybackMpdDtoCopyWithImpl<$Res>
    implements $VodPlaybackMpdDtoCopyWith<$Res> {
  _$VodPlaybackMpdDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackMpdDto _self;
  final $Res Function(VodPlaybackMpdDto) _then;

  /// Create a copy of VodPlaybackMpdDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? period = null}) {
    return _then(
      _self.copyWith(
        period: null == period
            ? _self.period
            : period // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackPeriodDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackMpdDto].
extension VodPlaybackMpdDtoPatterns on VodPlaybackMpdDto {
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
    TResult Function(_VodPlaybackMpdDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackMpdDto() when $default != null:
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
    TResult Function(_VodPlaybackMpdDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackMpdDto():
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
    TResult? Function(_VodPlaybackMpdDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackMpdDto() when $default != null:
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
      @JsonKey(name: 'Period') List<VodPlaybackPeriodDto> period,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackMpdDto() when $default != null:
        return $default(_that.period);
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
    TResult Function(@JsonKey(name: 'Period') List<VodPlaybackPeriodDto> period)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackMpdDto():
        return $default(_that.period);
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
      @JsonKey(name: 'Period') List<VodPlaybackPeriodDto> period,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackMpdDto() when $default != null:
        return $default(_that.period);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackMpdDto implements VodPlaybackMpdDto {
  const _VodPlaybackMpdDto({
    @JsonKey(name: 'Period')
    final List<VodPlaybackPeriodDto> period = const <VodPlaybackPeriodDto>[],
  }) : _period = period;
  factory _VodPlaybackMpdDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackMpdDtoFromJson(json);

  final List<VodPlaybackPeriodDto> _period;
  @override
  @JsonKey(name: 'Period')
  List<VodPlaybackPeriodDto> get period {
    if (_period is EqualUnmodifiableListView) return _period;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_period);
  }

  /// Create a copy of VodPlaybackMpdDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackMpdDtoCopyWith<_VodPlaybackMpdDto> get copyWith =>
      __$VodPlaybackMpdDtoCopyWithImpl<_VodPlaybackMpdDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackMpdDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackMpdDto &&
            const DeepCollectionEquality().equals(other._period, _period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_period));

  @override
  String toString() {
    return 'VodPlaybackMpdDto(period: $period)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackMpdDtoCopyWith<$Res>
    implements $VodPlaybackMpdDtoCopyWith<$Res> {
  factory _$VodPlaybackMpdDtoCopyWith(
    _VodPlaybackMpdDto value,
    $Res Function(_VodPlaybackMpdDto) _then,
  ) = __$VodPlaybackMpdDtoCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'Period') List<VodPlaybackPeriodDto> period});
}

/// @nodoc
class __$VodPlaybackMpdDtoCopyWithImpl<$Res>
    implements _$VodPlaybackMpdDtoCopyWith<$Res> {
  __$VodPlaybackMpdDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackMpdDto _self;
  final $Res Function(_VodPlaybackMpdDto) _then;

  /// Create a copy of VodPlaybackMpdDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? period = null}) {
    return _then(
      _VodPlaybackMpdDto(
        period: null == period
            ? _self._period
            : period // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackPeriodDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlaybackPeriodDto {
  @JsonKey(name: 'AdaptationSet')
  List<VodPlaybackAdaptationSetDto> get adaptationSet;
  @JsonKey(name: 'SupplementalProperty')
  List<VodPlaybackSupplementalPropertyDto> get supplementalProperty;

  /// Create a copy of VodPlaybackPeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackPeriodDtoCopyWith<VodPlaybackPeriodDto> get copyWith =>
      _$VodPlaybackPeriodDtoCopyWithImpl<VodPlaybackPeriodDto>(
        this as VodPlaybackPeriodDto,
        _$identity,
      );

  /// Serializes this VodPlaybackPeriodDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackPeriodDto &&
            const DeepCollectionEquality().equals(
              other.adaptationSet,
              adaptationSet,
            ) &&
            const DeepCollectionEquality().equals(
              other.supplementalProperty,
              supplementalProperty,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(adaptationSet),
    const DeepCollectionEquality().hash(supplementalProperty),
  );

  @override
  String toString() {
    return 'VodPlaybackPeriodDto(adaptationSet: $adaptationSet, supplementalProperty: $supplementalProperty)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackPeriodDtoCopyWith<$Res> {
  factory $VodPlaybackPeriodDtoCopyWith(
    VodPlaybackPeriodDto value,
    $Res Function(VodPlaybackPeriodDto) _then,
  ) = _$VodPlaybackPeriodDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'AdaptationSet')
    List<VodPlaybackAdaptationSetDto> adaptationSet,
    @JsonKey(name: 'SupplementalProperty')
    List<VodPlaybackSupplementalPropertyDto> supplementalProperty,
  });
}

/// @nodoc
class _$VodPlaybackPeriodDtoCopyWithImpl<$Res>
    implements $VodPlaybackPeriodDtoCopyWith<$Res> {
  _$VodPlaybackPeriodDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackPeriodDto _self;
  final $Res Function(VodPlaybackPeriodDto) _then;

  /// Create a copy of VodPlaybackPeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adaptationSet = null,
    Object? supplementalProperty = null,
  }) {
    return _then(
      _self.copyWith(
        adaptationSet: null == adaptationSet
            ? _self.adaptationSet
            : adaptationSet // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackAdaptationSetDto>,
        supplementalProperty: null == supplementalProperty
            ? _self.supplementalProperty
            : supplementalProperty // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackSupplementalPropertyDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackPeriodDto].
extension VodPlaybackPeriodDtoPatterns on VodPlaybackPeriodDto {
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
    TResult Function(_VodPlaybackPeriodDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackPeriodDto() when $default != null:
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
    TResult Function(_VodPlaybackPeriodDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackPeriodDto():
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
    TResult? Function(_VodPlaybackPeriodDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackPeriodDto() when $default != null:
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
      @JsonKey(name: 'AdaptationSet')
      List<VodPlaybackAdaptationSetDto> adaptationSet,
      @JsonKey(name: 'SupplementalProperty')
      List<VodPlaybackSupplementalPropertyDto> supplementalProperty,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackPeriodDto() when $default != null:
        return $default(_that.adaptationSet, _that.supplementalProperty);
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
      @JsonKey(name: 'AdaptationSet')
      List<VodPlaybackAdaptationSetDto> adaptationSet,
      @JsonKey(name: 'SupplementalProperty')
      List<VodPlaybackSupplementalPropertyDto> supplementalProperty,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackPeriodDto():
        return $default(_that.adaptationSet, _that.supplementalProperty);
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
      @JsonKey(name: 'AdaptationSet')
      List<VodPlaybackAdaptationSetDto> adaptationSet,
      @JsonKey(name: 'SupplementalProperty')
      List<VodPlaybackSupplementalPropertyDto> supplementalProperty,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackPeriodDto() when $default != null:
        return $default(_that.adaptationSet, _that.supplementalProperty);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackPeriodDto implements VodPlaybackPeriodDto {
  const _VodPlaybackPeriodDto({
    @JsonKey(name: 'AdaptationSet')
    final List<VodPlaybackAdaptationSetDto> adaptationSet =
        const <VodPlaybackAdaptationSetDto>[],
    @JsonKey(name: 'SupplementalProperty')
    final List<VodPlaybackSupplementalPropertyDto> supplementalProperty =
        const <VodPlaybackSupplementalPropertyDto>[],
  }) : _adaptationSet = adaptationSet,
       _supplementalProperty = supplementalProperty;
  factory _VodPlaybackPeriodDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackPeriodDtoFromJson(json);

  final List<VodPlaybackAdaptationSetDto> _adaptationSet;
  @override
  @JsonKey(name: 'AdaptationSet')
  List<VodPlaybackAdaptationSetDto> get adaptationSet {
    if (_adaptationSet is EqualUnmodifiableListView) return _adaptationSet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adaptationSet);
  }

  final List<VodPlaybackSupplementalPropertyDto> _supplementalProperty;
  @override
  @JsonKey(name: 'SupplementalProperty')
  List<VodPlaybackSupplementalPropertyDto> get supplementalProperty {
    if (_supplementalProperty is EqualUnmodifiableListView)
      return _supplementalProperty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supplementalProperty);
  }

  /// Create a copy of VodPlaybackPeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackPeriodDtoCopyWith<_VodPlaybackPeriodDto> get copyWith =>
      __$VodPlaybackPeriodDtoCopyWithImpl<_VodPlaybackPeriodDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackPeriodDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackPeriodDto &&
            const DeepCollectionEquality().equals(
              other._adaptationSet,
              _adaptationSet,
            ) &&
            const DeepCollectionEquality().equals(
              other._supplementalProperty,
              _supplementalProperty,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_adaptationSet),
    const DeepCollectionEquality().hash(_supplementalProperty),
  );

  @override
  String toString() {
    return 'VodPlaybackPeriodDto(adaptationSet: $adaptationSet, supplementalProperty: $supplementalProperty)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackPeriodDtoCopyWith<$Res>
    implements $VodPlaybackPeriodDtoCopyWith<$Res> {
  factory _$VodPlaybackPeriodDtoCopyWith(
    _VodPlaybackPeriodDto value,
    $Res Function(_VodPlaybackPeriodDto) _then,
  ) = __$VodPlaybackPeriodDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'AdaptationSet')
    List<VodPlaybackAdaptationSetDto> adaptationSet,
    @JsonKey(name: 'SupplementalProperty')
    List<VodPlaybackSupplementalPropertyDto> supplementalProperty,
  });
}

/// @nodoc
class __$VodPlaybackPeriodDtoCopyWithImpl<$Res>
    implements _$VodPlaybackPeriodDtoCopyWith<$Res> {
  __$VodPlaybackPeriodDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackPeriodDto _self;
  final $Res Function(_VodPlaybackPeriodDto) _then;

  /// Create a copy of VodPlaybackPeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? adaptationSet = null,
    Object? supplementalProperty = null,
  }) {
    return _then(
      _VodPlaybackPeriodDto(
        adaptationSet: null == adaptationSet
            ? _self._adaptationSet
            : adaptationSet // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackAdaptationSetDto>,
        supplementalProperty: null == supplementalProperty
            ? _self._supplementalProperty
            : supplementalProperty // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackSupplementalPropertyDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlaybackSupplementalPropertyDto {
  @JsonKey(name: 'nvod:Thumbnails')
  List<VodPlaybackThumbnailsDto> get thumbnails;

  /// Create a copy of VodPlaybackSupplementalPropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackSupplementalPropertyDtoCopyWith<
    VodPlaybackSupplementalPropertyDto
  >
  get copyWith =>
      _$VodPlaybackSupplementalPropertyDtoCopyWithImpl<
        VodPlaybackSupplementalPropertyDto
      >(this as VodPlaybackSupplementalPropertyDto, _$identity);

  /// Serializes this VodPlaybackSupplementalPropertyDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackSupplementalPropertyDto &&
            const DeepCollectionEquality().equals(
              other.thumbnails,
              thumbnails,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(thumbnails));

  @override
  String toString() {
    return 'VodPlaybackSupplementalPropertyDto(thumbnails: $thumbnails)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackSupplementalPropertyDtoCopyWith<$Res> {
  factory $VodPlaybackSupplementalPropertyDtoCopyWith(
    VodPlaybackSupplementalPropertyDto value,
    $Res Function(VodPlaybackSupplementalPropertyDto) _then,
  ) = _$VodPlaybackSupplementalPropertyDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'nvod:Thumbnails') List<VodPlaybackThumbnailsDto> thumbnails,
  });
}

/// @nodoc
class _$VodPlaybackSupplementalPropertyDtoCopyWithImpl<$Res>
    implements $VodPlaybackSupplementalPropertyDtoCopyWith<$Res> {
  _$VodPlaybackSupplementalPropertyDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackSupplementalPropertyDto _self;
  final $Res Function(VodPlaybackSupplementalPropertyDto) _then;

  /// Create a copy of VodPlaybackSupplementalPropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? thumbnails = null}) {
    return _then(
      _self.copyWith(
        thumbnails: null == thumbnails
            ? _self.thumbnails
            : thumbnails // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackThumbnailsDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackSupplementalPropertyDto].
extension VodPlaybackSupplementalPropertyDtoPatterns
    on VodPlaybackSupplementalPropertyDto {
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
    TResult Function(_VodPlaybackSupplementalPropertyDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSupplementalPropertyDto() when $default != null:
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
    TResult Function(_VodPlaybackSupplementalPropertyDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSupplementalPropertyDto():
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
    TResult? Function(_VodPlaybackSupplementalPropertyDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSupplementalPropertyDto() when $default != null:
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
      @JsonKey(name: 'nvod:Thumbnails')
      List<VodPlaybackThumbnailsDto> thumbnails,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSupplementalPropertyDto() when $default != null:
        return $default(_that.thumbnails);
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
      @JsonKey(name: 'nvod:Thumbnails')
      List<VodPlaybackThumbnailsDto> thumbnails,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSupplementalPropertyDto():
        return $default(_that.thumbnails);
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
      @JsonKey(name: 'nvod:Thumbnails')
      List<VodPlaybackThumbnailsDto> thumbnails,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSupplementalPropertyDto() when $default != null:
        return $default(_that.thumbnails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackSupplementalPropertyDto
    implements VodPlaybackSupplementalPropertyDto {
  const _VodPlaybackSupplementalPropertyDto({
    @JsonKey(name: 'nvod:Thumbnails')
    final List<VodPlaybackThumbnailsDto> thumbnails =
        const <VodPlaybackThumbnailsDto>[],
  }) : _thumbnails = thumbnails;
  factory _VodPlaybackSupplementalPropertyDto.fromJson(
    Map<String, dynamic> json,
  ) => _$VodPlaybackSupplementalPropertyDtoFromJson(json);

  final List<VodPlaybackThumbnailsDto> _thumbnails;
  @override
  @JsonKey(name: 'nvod:Thumbnails')
  List<VodPlaybackThumbnailsDto> get thumbnails {
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnails);
  }

  /// Create a copy of VodPlaybackSupplementalPropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackSupplementalPropertyDtoCopyWith<
    _VodPlaybackSupplementalPropertyDto
  >
  get copyWith =>
      __$VodPlaybackSupplementalPropertyDtoCopyWithImpl<
        _VodPlaybackSupplementalPropertyDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackSupplementalPropertyDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackSupplementalPropertyDto &&
            const DeepCollectionEquality().equals(
              other._thumbnails,
              _thumbnails,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_thumbnails),
  );

  @override
  String toString() {
    return 'VodPlaybackSupplementalPropertyDto(thumbnails: $thumbnails)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackSupplementalPropertyDtoCopyWith<$Res>
    implements $VodPlaybackSupplementalPropertyDtoCopyWith<$Res> {
  factory _$VodPlaybackSupplementalPropertyDtoCopyWith(
    _VodPlaybackSupplementalPropertyDto value,
    $Res Function(_VodPlaybackSupplementalPropertyDto) _then,
  ) = __$VodPlaybackSupplementalPropertyDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'nvod:Thumbnails') List<VodPlaybackThumbnailsDto> thumbnails,
  });
}

/// @nodoc
class __$VodPlaybackSupplementalPropertyDtoCopyWithImpl<$Res>
    implements _$VodPlaybackSupplementalPropertyDtoCopyWith<$Res> {
  __$VodPlaybackSupplementalPropertyDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackSupplementalPropertyDto _self;
  final $Res Function(_VodPlaybackSupplementalPropertyDto) _then;

  /// Create a copy of VodPlaybackSupplementalPropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? thumbnails = null}) {
    return _then(
      _VodPlaybackSupplementalPropertyDto(
        thumbnails: null == thumbnails
            ? _self._thumbnails
            : thumbnails // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackThumbnailsDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlaybackThumbnailsDto {
  @JsonKey(name: 'nvod:SeekingThumbnail')
  List<VodPlaybackSeekingThumbnailDto> get seekingThumbnail;

  /// Create a copy of VodPlaybackThumbnailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackThumbnailsDtoCopyWith<VodPlaybackThumbnailsDto> get copyWith =>
      _$VodPlaybackThumbnailsDtoCopyWithImpl<VodPlaybackThumbnailsDto>(
        this as VodPlaybackThumbnailsDto,
        _$identity,
      );

  /// Serializes this VodPlaybackThumbnailsDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackThumbnailsDto &&
            const DeepCollectionEquality().equals(
              other.seekingThumbnail,
              seekingThumbnail,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(seekingThumbnail),
  );

  @override
  String toString() {
    return 'VodPlaybackThumbnailsDto(seekingThumbnail: $seekingThumbnail)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackThumbnailsDtoCopyWith<$Res> {
  factory $VodPlaybackThumbnailsDtoCopyWith(
    VodPlaybackThumbnailsDto value,
    $Res Function(VodPlaybackThumbnailsDto) _then,
  ) = _$VodPlaybackThumbnailsDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'nvod:SeekingThumbnail')
    List<VodPlaybackSeekingThumbnailDto> seekingThumbnail,
  });
}

/// @nodoc
class _$VodPlaybackThumbnailsDtoCopyWithImpl<$Res>
    implements $VodPlaybackThumbnailsDtoCopyWith<$Res> {
  _$VodPlaybackThumbnailsDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackThumbnailsDto _self;
  final $Res Function(VodPlaybackThumbnailsDto) _then;

  /// Create a copy of VodPlaybackThumbnailsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? seekingThumbnail = null}) {
    return _then(
      _self.copyWith(
        seekingThumbnail: null == seekingThumbnail
            ? _self.seekingThumbnail
            : seekingThumbnail // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackSeekingThumbnailDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackThumbnailsDto].
extension VodPlaybackThumbnailsDtoPatterns on VodPlaybackThumbnailsDto {
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
    TResult Function(_VodPlaybackThumbnailsDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailsDto() when $default != null:
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
    TResult Function(_VodPlaybackThumbnailsDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailsDto():
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
    TResult? Function(_VodPlaybackThumbnailsDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailsDto() when $default != null:
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
      @JsonKey(name: 'nvod:SeekingThumbnail')
      List<VodPlaybackSeekingThumbnailDto> seekingThumbnail,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailsDto() when $default != null:
        return $default(_that.seekingThumbnail);
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
      @JsonKey(name: 'nvod:SeekingThumbnail')
      List<VodPlaybackSeekingThumbnailDto> seekingThumbnail,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailsDto():
        return $default(_that.seekingThumbnail);
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
      @JsonKey(name: 'nvod:SeekingThumbnail')
      List<VodPlaybackSeekingThumbnailDto> seekingThumbnail,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailsDto() when $default != null:
        return $default(_that.seekingThumbnail);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackThumbnailsDto implements VodPlaybackThumbnailsDto {
  const _VodPlaybackThumbnailsDto({
    @JsonKey(name: 'nvod:SeekingThumbnail')
    final List<VodPlaybackSeekingThumbnailDto> seekingThumbnail =
        const <VodPlaybackSeekingThumbnailDto>[],
  }) : _seekingThumbnail = seekingThumbnail;
  factory _VodPlaybackThumbnailsDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackThumbnailsDtoFromJson(json);

  final List<VodPlaybackSeekingThumbnailDto> _seekingThumbnail;
  @override
  @JsonKey(name: 'nvod:SeekingThumbnail')
  List<VodPlaybackSeekingThumbnailDto> get seekingThumbnail {
    if (_seekingThumbnail is EqualUnmodifiableListView)
      return _seekingThumbnail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seekingThumbnail);
  }

  /// Create a copy of VodPlaybackThumbnailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackThumbnailsDtoCopyWith<_VodPlaybackThumbnailsDto> get copyWith =>
      __$VodPlaybackThumbnailsDtoCopyWithImpl<_VodPlaybackThumbnailsDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackThumbnailsDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackThumbnailsDto &&
            const DeepCollectionEquality().equals(
              other._seekingThumbnail,
              _seekingThumbnail,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_seekingThumbnail),
  );

  @override
  String toString() {
    return 'VodPlaybackThumbnailsDto(seekingThumbnail: $seekingThumbnail)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackThumbnailsDtoCopyWith<$Res>
    implements $VodPlaybackThumbnailsDtoCopyWith<$Res> {
  factory _$VodPlaybackThumbnailsDtoCopyWith(
    _VodPlaybackThumbnailsDto value,
    $Res Function(_VodPlaybackThumbnailsDto) _then,
  ) = __$VodPlaybackThumbnailsDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'nvod:SeekingThumbnail')
    List<VodPlaybackSeekingThumbnailDto> seekingThumbnail,
  });
}

/// @nodoc
class __$VodPlaybackThumbnailsDtoCopyWithImpl<$Res>
    implements _$VodPlaybackThumbnailsDtoCopyWith<$Res> {
  __$VodPlaybackThumbnailsDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackThumbnailsDto _self;
  final $Res Function(_VodPlaybackThumbnailsDto) _then;

  /// Create a copy of VodPlaybackThumbnailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? seekingThumbnail = null}) {
    return _then(
      _VodPlaybackThumbnailsDto(
        seekingThumbnail: null == seekingThumbnail
            ? _self._seekingThumbnail
            : seekingThumbnail // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackSeekingThumbnailDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlaybackSeekingThumbnailDto {
  @JsonKey(name: '@type')
  String? get type;
  @JsonKey(name: 'nvod:Page')
  List<VodPlaybackThumbnailPageDto> get page;
  @JsonKey(name: 'nvod:Piece')
  List<VodPlaybackThumbnailPieceDto> get piece;
  @JsonKey(name: 'nvod:Source')
  List<VodPlaybackThumbnailSourceDto> get source;

  /// Create a copy of VodPlaybackSeekingThumbnailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackSeekingThumbnailDtoCopyWith<VodPlaybackSeekingThumbnailDto>
  get copyWith =>
      _$VodPlaybackSeekingThumbnailDtoCopyWithImpl<
        VodPlaybackSeekingThumbnailDto
      >(this as VodPlaybackSeekingThumbnailDto, _$identity);

  /// Serializes this VodPlaybackSeekingThumbnailDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackSeekingThumbnailDto &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.piece, piece) &&
            const DeepCollectionEquality().equals(other.source, source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    const DeepCollectionEquality().hash(page),
    const DeepCollectionEquality().hash(piece),
    const DeepCollectionEquality().hash(source),
  );

  @override
  String toString() {
    return 'VodPlaybackSeekingThumbnailDto(type: $type, page: $page, piece: $piece, source: $source)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackSeekingThumbnailDtoCopyWith<$Res> {
  factory $VodPlaybackSeekingThumbnailDtoCopyWith(
    VodPlaybackSeekingThumbnailDto value,
    $Res Function(VodPlaybackSeekingThumbnailDto) _then,
  ) = _$VodPlaybackSeekingThumbnailDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: '@type') String? type,
    @JsonKey(name: 'nvod:Page') List<VodPlaybackThumbnailPageDto> page,
    @JsonKey(name: 'nvod:Piece') List<VodPlaybackThumbnailPieceDto> piece,
    @JsonKey(name: 'nvod:Source') List<VodPlaybackThumbnailSourceDto> source,
  });
}

/// @nodoc
class _$VodPlaybackSeekingThumbnailDtoCopyWithImpl<$Res>
    implements $VodPlaybackSeekingThumbnailDtoCopyWith<$Res> {
  _$VodPlaybackSeekingThumbnailDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackSeekingThumbnailDto _self;
  final $Res Function(VodPlaybackSeekingThumbnailDto) _then;

  /// Create a copy of VodPlaybackSeekingThumbnailDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? page = null,
    Object? piece = null,
    Object? source = null,
  }) {
    return _then(
      _self.copyWith(
        type: freezed == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        page: null == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackThumbnailPageDto>,
        piece: null == piece
            ? _self.piece
            : piece // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackThumbnailPieceDto>,
        source: null == source
            ? _self.source
            : source // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackThumbnailSourceDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackSeekingThumbnailDto].
extension VodPlaybackSeekingThumbnailDtoPatterns
    on VodPlaybackSeekingThumbnailDto {
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
    TResult Function(_VodPlaybackSeekingThumbnailDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSeekingThumbnailDto() when $default != null:
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
    TResult Function(_VodPlaybackSeekingThumbnailDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSeekingThumbnailDto():
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
    TResult? Function(_VodPlaybackSeekingThumbnailDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSeekingThumbnailDto() when $default != null:
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
      @JsonKey(name: '@type') String? type,
      @JsonKey(name: 'nvod:Page') List<VodPlaybackThumbnailPageDto> page,
      @JsonKey(name: 'nvod:Piece') List<VodPlaybackThumbnailPieceDto> piece,
      @JsonKey(name: 'nvod:Source') List<VodPlaybackThumbnailSourceDto> source,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSeekingThumbnailDto() when $default != null:
        return $default(_that.type, _that.page, _that.piece, _that.source);
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
      @JsonKey(name: '@type') String? type,
      @JsonKey(name: 'nvod:Page') List<VodPlaybackThumbnailPageDto> page,
      @JsonKey(name: 'nvod:Piece') List<VodPlaybackThumbnailPieceDto> piece,
      @JsonKey(name: 'nvod:Source') List<VodPlaybackThumbnailSourceDto> source,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSeekingThumbnailDto():
        return $default(_that.type, _that.page, _that.piece, _that.source);
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
      @JsonKey(name: '@type') String? type,
      @JsonKey(name: 'nvod:Page') List<VodPlaybackThumbnailPageDto> page,
      @JsonKey(name: 'nvod:Piece') List<VodPlaybackThumbnailPieceDto> piece,
      @JsonKey(name: 'nvod:Source') List<VodPlaybackThumbnailSourceDto> source,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackSeekingThumbnailDto() when $default != null:
        return $default(_that.type, _that.page, _that.piece, _that.source);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackSeekingThumbnailDto
    implements VodPlaybackSeekingThumbnailDto {
  const _VodPlaybackSeekingThumbnailDto({
    @JsonKey(name: '@type') this.type,
    @JsonKey(name: 'nvod:Page')
    final List<VodPlaybackThumbnailPageDto> page =
        const <VodPlaybackThumbnailPageDto>[],
    @JsonKey(name: 'nvod:Piece')
    final List<VodPlaybackThumbnailPieceDto> piece =
        const <VodPlaybackThumbnailPieceDto>[],
    @JsonKey(name: 'nvod:Source')
    final List<VodPlaybackThumbnailSourceDto> source =
        const <VodPlaybackThumbnailSourceDto>[],
  }) : _page = page,
       _piece = piece,
       _source = source;
  factory _VodPlaybackSeekingThumbnailDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackSeekingThumbnailDtoFromJson(json);

  @override
  @JsonKey(name: '@type')
  final String? type;
  final List<VodPlaybackThumbnailPageDto> _page;
  @override
  @JsonKey(name: 'nvod:Page')
  List<VodPlaybackThumbnailPageDto> get page {
    if (_page is EqualUnmodifiableListView) return _page;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_page);
  }

  final List<VodPlaybackThumbnailPieceDto> _piece;
  @override
  @JsonKey(name: 'nvod:Piece')
  List<VodPlaybackThumbnailPieceDto> get piece {
    if (_piece is EqualUnmodifiableListView) return _piece;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_piece);
  }

  final List<VodPlaybackThumbnailSourceDto> _source;
  @override
  @JsonKey(name: 'nvod:Source')
  List<VodPlaybackThumbnailSourceDto> get source {
    if (_source is EqualUnmodifiableListView) return _source;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_source);
  }

  /// Create a copy of VodPlaybackSeekingThumbnailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackSeekingThumbnailDtoCopyWith<_VodPlaybackSeekingThumbnailDto>
  get copyWith =>
      __$VodPlaybackSeekingThumbnailDtoCopyWithImpl<
        _VodPlaybackSeekingThumbnailDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackSeekingThumbnailDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackSeekingThumbnailDto &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._page, _page) &&
            const DeepCollectionEquality().equals(other._piece, _piece) &&
            const DeepCollectionEquality().equals(other._source, _source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    const DeepCollectionEquality().hash(_page),
    const DeepCollectionEquality().hash(_piece),
    const DeepCollectionEquality().hash(_source),
  );

  @override
  String toString() {
    return 'VodPlaybackSeekingThumbnailDto(type: $type, page: $page, piece: $piece, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackSeekingThumbnailDtoCopyWith<$Res>
    implements $VodPlaybackSeekingThumbnailDtoCopyWith<$Res> {
  factory _$VodPlaybackSeekingThumbnailDtoCopyWith(
    _VodPlaybackSeekingThumbnailDto value,
    $Res Function(_VodPlaybackSeekingThumbnailDto) _then,
  ) = __$VodPlaybackSeekingThumbnailDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '@type') String? type,
    @JsonKey(name: 'nvod:Page') List<VodPlaybackThumbnailPageDto> page,
    @JsonKey(name: 'nvod:Piece') List<VodPlaybackThumbnailPieceDto> piece,
    @JsonKey(name: 'nvod:Source') List<VodPlaybackThumbnailSourceDto> source,
  });
}

/// @nodoc
class __$VodPlaybackSeekingThumbnailDtoCopyWithImpl<$Res>
    implements _$VodPlaybackSeekingThumbnailDtoCopyWith<$Res> {
  __$VodPlaybackSeekingThumbnailDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackSeekingThumbnailDto _self;
  final $Res Function(_VodPlaybackSeekingThumbnailDto) _then;

  /// Create a copy of VodPlaybackSeekingThumbnailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
    Object? page = null,
    Object? piece = null,
    Object? source = null,
  }) {
    return _then(
      _VodPlaybackSeekingThumbnailDto(
        type: freezed == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        page: null == page
            ? _self._page
            : page // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackThumbnailPageDto>,
        piece: null == piece
            ? _self._piece
            : piece // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackThumbnailPieceDto>,
        source: null == source
            ? _self._source
            : source // ignore: cast_nullable_to_non_nullable
                  as List<VodPlaybackThumbnailSourceDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlaybackThumbnailPageDto {
  @JsonKey(name: '@total')
  String? get total;
  @JsonKey(name: '@row')
  String? get row;
  @JsonKey(name: '@column')
  String? get column;
  @JsonKey(name: '@totalPieceSize')
  String? get totalPieceSize;

  /// Create a copy of VodPlaybackThumbnailPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackThumbnailPageDtoCopyWith<VodPlaybackThumbnailPageDto>
  get copyWith =>
      _$VodPlaybackThumbnailPageDtoCopyWithImpl<VodPlaybackThumbnailPageDto>(
        this as VodPlaybackThumbnailPageDto,
        _$identity,
      );

  /// Serializes this VodPlaybackThumbnailPageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackThumbnailPageDto &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.column, column) || other.column == column) &&
            (identical(other.totalPieceSize, totalPieceSize) ||
                other.totalPieceSize == totalPieceSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, row, column, totalPieceSize);

  @override
  String toString() {
    return 'VodPlaybackThumbnailPageDto(total: $total, row: $row, column: $column, totalPieceSize: $totalPieceSize)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackThumbnailPageDtoCopyWith<$Res> {
  factory $VodPlaybackThumbnailPageDtoCopyWith(
    VodPlaybackThumbnailPageDto value,
    $Res Function(VodPlaybackThumbnailPageDto) _then,
  ) = _$VodPlaybackThumbnailPageDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: '@total') String? total,
    @JsonKey(name: '@row') String? row,
    @JsonKey(name: '@column') String? column,
    @JsonKey(name: '@totalPieceSize') String? totalPieceSize,
  });
}

/// @nodoc
class _$VodPlaybackThumbnailPageDtoCopyWithImpl<$Res>
    implements $VodPlaybackThumbnailPageDtoCopyWith<$Res> {
  _$VodPlaybackThumbnailPageDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackThumbnailPageDto _self;
  final $Res Function(VodPlaybackThumbnailPageDto) _then;

  /// Create a copy of VodPlaybackThumbnailPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? row = freezed,
    Object? column = freezed,
    Object? totalPieceSize = freezed,
  }) {
    return _then(
      _self.copyWith(
        total: freezed == total
            ? _self.total
            : total // ignore: cast_nullable_to_non_nullable
                  as String?,
        row: freezed == row
            ? _self.row
            : row // ignore: cast_nullable_to_non_nullable
                  as String?,
        column: freezed == column
            ? _self.column
            : column // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalPieceSize: freezed == totalPieceSize
            ? _self.totalPieceSize
            : totalPieceSize // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackThumbnailPageDto].
extension VodPlaybackThumbnailPageDtoPatterns on VodPlaybackThumbnailPageDto {
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
    TResult Function(_VodPlaybackThumbnailPageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPageDto() when $default != null:
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
    TResult Function(_VodPlaybackThumbnailPageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPageDto():
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
    TResult? Function(_VodPlaybackThumbnailPageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPageDto() when $default != null:
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
      @JsonKey(name: '@total') String? total,
      @JsonKey(name: '@row') String? row,
      @JsonKey(name: '@column') String? column,
      @JsonKey(name: '@totalPieceSize') String? totalPieceSize,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPageDto() when $default != null:
        return $default(
          _that.total,
          _that.row,
          _that.column,
          _that.totalPieceSize,
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
      @JsonKey(name: '@total') String? total,
      @JsonKey(name: '@row') String? row,
      @JsonKey(name: '@column') String? column,
      @JsonKey(name: '@totalPieceSize') String? totalPieceSize,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPageDto():
        return $default(
          _that.total,
          _that.row,
          _that.column,
          _that.totalPieceSize,
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
      @JsonKey(name: '@total') String? total,
      @JsonKey(name: '@row') String? row,
      @JsonKey(name: '@column') String? column,
      @JsonKey(name: '@totalPieceSize') String? totalPieceSize,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPageDto() when $default != null:
        return $default(
          _that.total,
          _that.row,
          _that.column,
          _that.totalPieceSize,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackThumbnailPageDto implements VodPlaybackThumbnailPageDto {
  const _VodPlaybackThumbnailPageDto({
    @JsonKey(name: '@total') this.total,
    @JsonKey(name: '@row') this.row,
    @JsonKey(name: '@column') this.column,
    @JsonKey(name: '@totalPieceSize') this.totalPieceSize,
  });
  factory _VodPlaybackThumbnailPageDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackThumbnailPageDtoFromJson(json);

  @override
  @JsonKey(name: '@total')
  final String? total;
  @override
  @JsonKey(name: '@row')
  final String? row;
  @override
  @JsonKey(name: '@column')
  final String? column;
  @override
  @JsonKey(name: '@totalPieceSize')
  final String? totalPieceSize;

  /// Create a copy of VodPlaybackThumbnailPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackThumbnailPageDtoCopyWith<_VodPlaybackThumbnailPageDto>
  get copyWith =>
      __$VodPlaybackThumbnailPageDtoCopyWithImpl<_VodPlaybackThumbnailPageDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackThumbnailPageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackThumbnailPageDto &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.column, column) || other.column == column) &&
            (identical(other.totalPieceSize, totalPieceSize) ||
                other.totalPieceSize == totalPieceSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, row, column, totalPieceSize);

  @override
  String toString() {
    return 'VodPlaybackThumbnailPageDto(total: $total, row: $row, column: $column, totalPieceSize: $totalPieceSize)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackThumbnailPageDtoCopyWith<$Res>
    implements $VodPlaybackThumbnailPageDtoCopyWith<$Res> {
  factory _$VodPlaybackThumbnailPageDtoCopyWith(
    _VodPlaybackThumbnailPageDto value,
    $Res Function(_VodPlaybackThumbnailPageDto) _then,
  ) = __$VodPlaybackThumbnailPageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '@total') String? total,
    @JsonKey(name: '@row') String? row,
    @JsonKey(name: '@column') String? column,
    @JsonKey(name: '@totalPieceSize') String? totalPieceSize,
  });
}

/// @nodoc
class __$VodPlaybackThumbnailPageDtoCopyWithImpl<$Res>
    implements _$VodPlaybackThumbnailPageDtoCopyWith<$Res> {
  __$VodPlaybackThumbnailPageDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackThumbnailPageDto _self;
  final $Res Function(_VodPlaybackThumbnailPageDto) _then;

  /// Create a copy of VodPlaybackThumbnailPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = freezed,
    Object? row = freezed,
    Object? column = freezed,
    Object? totalPieceSize = freezed,
  }) {
    return _then(
      _VodPlaybackThumbnailPageDto(
        total: freezed == total
            ? _self.total
            : total // ignore: cast_nullable_to_non_nullable
                  as String?,
        row: freezed == row
            ? _self.row
            : row // ignore: cast_nullable_to_non_nullable
                  as String?,
        column: freezed == column
            ? _self.column
            : column // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalPieceSize: freezed == totalPieceSize
            ? _self.totalPieceSize
            : totalPieceSize // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlaybackThumbnailPieceDto {
  @JsonKey(name: '@intervalType')
  String? get intervalType;
  @JsonKey(name: '@interval')
  String? get interval;
  @JsonKey(name: '@width')
  String? get width;
  @JsonKey(name: '@height')
  String? get height;

  /// Create a copy of VodPlaybackThumbnailPieceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackThumbnailPieceDtoCopyWith<VodPlaybackThumbnailPieceDto>
  get copyWith =>
      _$VodPlaybackThumbnailPieceDtoCopyWithImpl<VodPlaybackThumbnailPieceDto>(
        this as VodPlaybackThumbnailPieceDto,
        _$identity,
      );

  /// Serializes this VodPlaybackThumbnailPieceDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackThumbnailPieceDto &&
            (identical(other.intervalType, intervalType) ||
                other.intervalType == intervalType) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, intervalType, interval, width, height);

  @override
  String toString() {
    return 'VodPlaybackThumbnailPieceDto(intervalType: $intervalType, interval: $interval, width: $width, height: $height)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackThumbnailPieceDtoCopyWith<$Res> {
  factory $VodPlaybackThumbnailPieceDtoCopyWith(
    VodPlaybackThumbnailPieceDto value,
    $Res Function(VodPlaybackThumbnailPieceDto) _then,
  ) = _$VodPlaybackThumbnailPieceDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: '@intervalType') String? intervalType,
    @JsonKey(name: '@interval') String? interval,
    @JsonKey(name: '@width') String? width,
    @JsonKey(name: '@height') String? height,
  });
}

/// @nodoc
class _$VodPlaybackThumbnailPieceDtoCopyWithImpl<$Res>
    implements $VodPlaybackThumbnailPieceDtoCopyWith<$Res> {
  _$VodPlaybackThumbnailPieceDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackThumbnailPieceDto _self;
  final $Res Function(VodPlaybackThumbnailPieceDto) _then;

  /// Create a copy of VodPlaybackThumbnailPieceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intervalType = freezed,
    Object? interval = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(
      _self.copyWith(
        intervalType: freezed == intervalType
            ? _self.intervalType
            : intervalType // ignore: cast_nullable_to_non_nullable
                  as String?,
        interval: freezed == interval
            ? _self.interval
            : interval // ignore: cast_nullable_to_non_nullable
                  as String?,
        width: freezed == width
            ? _self.width
            : width // ignore: cast_nullable_to_non_nullable
                  as String?,
        height: freezed == height
            ? _self.height
            : height // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackThumbnailPieceDto].
extension VodPlaybackThumbnailPieceDtoPatterns on VodPlaybackThumbnailPieceDto {
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
    TResult Function(_VodPlaybackThumbnailPieceDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPieceDto() when $default != null:
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
    TResult Function(_VodPlaybackThumbnailPieceDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPieceDto():
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
    TResult? Function(_VodPlaybackThumbnailPieceDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPieceDto() when $default != null:
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
      @JsonKey(name: '@intervalType') String? intervalType,
      @JsonKey(name: '@interval') String? interval,
      @JsonKey(name: '@width') String? width,
      @JsonKey(name: '@height') String? height,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPieceDto() when $default != null:
        return $default(
          _that.intervalType,
          _that.interval,
          _that.width,
          _that.height,
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
      @JsonKey(name: '@intervalType') String? intervalType,
      @JsonKey(name: '@interval') String? interval,
      @JsonKey(name: '@width') String? width,
      @JsonKey(name: '@height') String? height,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPieceDto():
        return $default(
          _that.intervalType,
          _that.interval,
          _that.width,
          _that.height,
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
      @JsonKey(name: '@intervalType') String? intervalType,
      @JsonKey(name: '@interval') String? interval,
      @JsonKey(name: '@width') String? width,
      @JsonKey(name: '@height') String? height,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailPieceDto() when $default != null:
        return $default(
          _that.intervalType,
          _that.interval,
          _that.width,
          _that.height,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackThumbnailPieceDto implements VodPlaybackThumbnailPieceDto {
  const _VodPlaybackThumbnailPieceDto({
    @JsonKey(name: '@intervalType') this.intervalType,
    @JsonKey(name: '@interval') this.interval,
    @JsonKey(name: '@width') this.width,
    @JsonKey(name: '@height') this.height,
  });
  factory _VodPlaybackThumbnailPieceDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackThumbnailPieceDtoFromJson(json);

  @override
  @JsonKey(name: '@intervalType')
  final String? intervalType;
  @override
  @JsonKey(name: '@interval')
  final String? interval;
  @override
  @JsonKey(name: '@width')
  final String? width;
  @override
  @JsonKey(name: '@height')
  final String? height;

  /// Create a copy of VodPlaybackThumbnailPieceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackThumbnailPieceDtoCopyWith<_VodPlaybackThumbnailPieceDto>
  get copyWith =>
      __$VodPlaybackThumbnailPieceDtoCopyWithImpl<
        _VodPlaybackThumbnailPieceDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackThumbnailPieceDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackThumbnailPieceDto &&
            (identical(other.intervalType, intervalType) ||
                other.intervalType == intervalType) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, intervalType, interval, width, height);

  @override
  String toString() {
    return 'VodPlaybackThumbnailPieceDto(intervalType: $intervalType, interval: $interval, width: $width, height: $height)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackThumbnailPieceDtoCopyWith<$Res>
    implements $VodPlaybackThumbnailPieceDtoCopyWith<$Res> {
  factory _$VodPlaybackThumbnailPieceDtoCopyWith(
    _VodPlaybackThumbnailPieceDto value,
    $Res Function(_VodPlaybackThumbnailPieceDto) _then,
  ) = __$VodPlaybackThumbnailPieceDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '@intervalType') String? intervalType,
    @JsonKey(name: '@interval') String? interval,
    @JsonKey(name: '@width') String? width,
    @JsonKey(name: '@height') String? height,
  });
}

/// @nodoc
class __$VodPlaybackThumbnailPieceDtoCopyWithImpl<$Res>
    implements _$VodPlaybackThumbnailPieceDtoCopyWith<$Res> {
  __$VodPlaybackThumbnailPieceDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackThumbnailPieceDto _self;
  final $Res Function(_VodPlaybackThumbnailPieceDto) _then;

  /// Create a copy of VodPlaybackThumbnailPieceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? intervalType = freezed,
    Object? interval = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(
      _VodPlaybackThumbnailPieceDto(
        intervalType: freezed == intervalType
            ? _self.intervalType
            : intervalType // ignore: cast_nullable_to_non_nullable
                  as String?,
        interval: freezed == interval
            ? _self.interval
            : interval // ignore: cast_nullable_to_non_nullable
                  as String?,
        width: freezed == width
            ? _self.width
            : width // ignore: cast_nullable_to_non_nullable
                  as String?,
        height: freezed == height
            ? _self.height
            : height // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlaybackThumbnailSourceDto {
  @JsonKey(name: '@patternType')
  String? get patternType;
  @JsonKey(name: '#text')
  String? get text;

  /// Create a copy of VodPlaybackThumbnailSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackThumbnailSourceDtoCopyWith<VodPlaybackThumbnailSourceDto>
  get copyWith =>
      _$VodPlaybackThumbnailSourceDtoCopyWithImpl<
        VodPlaybackThumbnailSourceDto
      >(this as VodPlaybackThumbnailSourceDto, _$identity);

  /// Serializes this VodPlaybackThumbnailSourceDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackThumbnailSourceDto &&
            (identical(other.patternType, patternType) ||
                other.patternType == patternType) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, patternType, text);

  @override
  String toString() {
    return 'VodPlaybackThumbnailSourceDto(patternType: $patternType, text: $text)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackThumbnailSourceDtoCopyWith<$Res> {
  factory $VodPlaybackThumbnailSourceDtoCopyWith(
    VodPlaybackThumbnailSourceDto value,
    $Res Function(VodPlaybackThumbnailSourceDto) _then,
  ) = _$VodPlaybackThumbnailSourceDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: '@patternType') String? patternType,
    @JsonKey(name: '#text') String? text,
  });
}

/// @nodoc
class _$VodPlaybackThumbnailSourceDtoCopyWithImpl<$Res>
    implements $VodPlaybackThumbnailSourceDtoCopyWith<$Res> {
  _$VodPlaybackThumbnailSourceDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackThumbnailSourceDto _self;
  final $Res Function(VodPlaybackThumbnailSourceDto) _then;

  /// Create a copy of VodPlaybackThumbnailSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? patternType = freezed, Object? text = freezed}) {
    return _then(
      _self.copyWith(
        patternType: freezed == patternType
            ? _self.patternType
            : patternType // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackThumbnailSourceDto].
extension VodPlaybackThumbnailSourceDtoPatterns
    on VodPlaybackThumbnailSourceDto {
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
    TResult Function(_VodPlaybackThumbnailSourceDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailSourceDto() when $default != null:
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
    TResult Function(_VodPlaybackThumbnailSourceDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailSourceDto():
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
    TResult? Function(_VodPlaybackThumbnailSourceDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailSourceDto() when $default != null:
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
      @JsonKey(name: '@patternType') String? patternType,
      @JsonKey(name: '#text') String? text,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailSourceDto() when $default != null:
        return $default(_that.patternType, _that.text);
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
      @JsonKey(name: '@patternType') String? patternType,
      @JsonKey(name: '#text') String? text,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailSourceDto():
        return $default(_that.patternType, _that.text);
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
      @JsonKey(name: '@patternType') String? patternType,
      @JsonKey(name: '#text') String? text,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackThumbnailSourceDto() when $default != null:
        return $default(_that.patternType, _that.text);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackThumbnailSourceDto implements VodPlaybackThumbnailSourceDto {
  const _VodPlaybackThumbnailSourceDto({
    @JsonKey(name: '@patternType') this.patternType,
    @JsonKey(name: '#text') this.text,
  });
  factory _VodPlaybackThumbnailSourceDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackThumbnailSourceDtoFromJson(json);

  @override
  @JsonKey(name: '@patternType')
  final String? patternType;
  @override
  @JsonKey(name: '#text')
  final String? text;

  /// Create a copy of VodPlaybackThumbnailSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackThumbnailSourceDtoCopyWith<_VodPlaybackThumbnailSourceDto>
  get copyWith =>
      __$VodPlaybackThumbnailSourceDtoCopyWithImpl<
        _VodPlaybackThumbnailSourceDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackThumbnailSourceDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackThumbnailSourceDto &&
            (identical(other.patternType, patternType) ||
                other.patternType == patternType) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, patternType, text);

  @override
  String toString() {
    return 'VodPlaybackThumbnailSourceDto(patternType: $patternType, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackThumbnailSourceDtoCopyWith<$Res>
    implements $VodPlaybackThumbnailSourceDtoCopyWith<$Res> {
  factory _$VodPlaybackThumbnailSourceDtoCopyWith(
    _VodPlaybackThumbnailSourceDto value,
    $Res Function(_VodPlaybackThumbnailSourceDto) _then,
  ) = __$VodPlaybackThumbnailSourceDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '@patternType') String? patternType,
    @JsonKey(name: '#text') String? text,
  });
}

/// @nodoc
class __$VodPlaybackThumbnailSourceDtoCopyWithImpl<$Res>
    implements _$VodPlaybackThumbnailSourceDtoCopyWith<$Res> {
  __$VodPlaybackThumbnailSourceDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackThumbnailSourceDto _self;
  final $Res Function(_VodPlaybackThumbnailSourceDto) _then;

  /// Create a copy of VodPlaybackThumbnailSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? patternType = freezed, Object? text = freezed}) {
    return _then(
      _VodPlaybackThumbnailSourceDto(
        patternType: freezed == patternType
            ? _self.patternType
            : patternType // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlaybackAdaptationSetDto {
  @JsonKey(name: '@nvod:m3u')
  String? get naverVodM3u;

  /// Create a copy of VodPlaybackAdaptationSetDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackAdaptationSetDtoCopyWith<VodPlaybackAdaptationSetDto>
  get copyWith =>
      _$VodPlaybackAdaptationSetDtoCopyWithImpl<VodPlaybackAdaptationSetDto>(
        this as VodPlaybackAdaptationSetDto,
        _$identity,
      );

  /// Serializes this VodPlaybackAdaptationSetDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlaybackAdaptationSetDto &&
            (identical(other.naverVodM3u, naverVodM3u) ||
                other.naverVodM3u == naverVodM3u));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, naverVodM3u);

  @override
  String toString() {
    return 'VodPlaybackAdaptationSetDto(naverVodM3u: $naverVodM3u)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackAdaptationSetDtoCopyWith<$Res> {
  factory $VodPlaybackAdaptationSetDtoCopyWith(
    VodPlaybackAdaptationSetDto value,
    $Res Function(VodPlaybackAdaptationSetDto) _then,
  ) = _$VodPlaybackAdaptationSetDtoCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: '@nvod:m3u') String? naverVodM3u});
}

/// @nodoc
class _$VodPlaybackAdaptationSetDtoCopyWithImpl<$Res>
    implements $VodPlaybackAdaptationSetDtoCopyWith<$Res> {
  _$VodPlaybackAdaptationSetDtoCopyWithImpl(this._self, this._then);

  final VodPlaybackAdaptationSetDto _self;
  final $Res Function(VodPlaybackAdaptationSetDto) _then;

  /// Create a copy of VodPlaybackAdaptationSetDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? naverVodM3u = freezed}) {
    return _then(
      _self.copyWith(
        naverVodM3u: freezed == naverVodM3u
            ? _self.naverVodM3u
            : naverVodM3u // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodPlaybackAdaptationSetDto].
extension VodPlaybackAdaptationSetDtoPatterns on VodPlaybackAdaptationSetDto {
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
    TResult Function(_VodPlaybackAdaptationSetDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackAdaptationSetDto() when $default != null:
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
    TResult Function(_VodPlaybackAdaptationSetDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackAdaptationSetDto():
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
    TResult? Function(_VodPlaybackAdaptationSetDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackAdaptationSetDto() when $default != null:
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
    TResult Function(@JsonKey(name: '@nvod:m3u') String? naverVodM3u)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackAdaptationSetDto() when $default != null:
        return $default(_that.naverVodM3u);
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
    TResult Function(@JsonKey(name: '@nvod:m3u') String? naverVodM3u) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackAdaptationSetDto():
        return $default(_that.naverVodM3u);
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
    TResult? Function(@JsonKey(name: '@nvod:m3u') String? naverVodM3u)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlaybackAdaptationSetDto() when $default != null:
        return $default(_that.naverVodM3u);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodPlaybackAdaptationSetDto implements VodPlaybackAdaptationSetDto {
  const _VodPlaybackAdaptationSetDto({
    @JsonKey(name: '@nvod:m3u') this.naverVodM3u,
  });
  factory _VodPlaybackAdaptationSetDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackAdaptationSetDtoFromJson(json);

  @override
  @JsonKey(name: '@nvod:m3u')
  final String? naverVodM3u;

  /// Create a copy of VodPlaybackAdaptationSetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackAdaptationSetDtoCopyWith<_VodPlaybackAdaptationSetDto>
  get copyWith =>
      __$VodPlaybackAdaptationSetDtoCopyWithImpl<_VodPlaybackAdaptationSetDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$VodPlaybackAdaptationSetDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlaybackAdaptationSetDto &&
            (identical(other.naverVodM3u, naverVodM3u) ||
                other.naverVodM3u == naverVodM3u));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, naverVodM3u);

  @override
  String toString() {
    return 'VodPlaybackAdaptationSetDto(naverVodM3u: $naverVodM3u)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackAdaptationSetDtoCopyWith<$Res>
    implements $VodPlaybackAdaptationSetDtoCopyWith<$Res> {
  factory _$VodPlaybackAdaptationSetDtoCopyWith(
    _VodPlaybackAdaptationSetDto value,
    $Res Function(_VodPlaybackAdaptationSetDto) _then,
  ) = __$VodPlaybackAdaptationSetDtoCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: '@nvod:m3u') String? naverVodM3u});
}

/// @nodoc
class __$VodPlaybackAdaptationSetDtoCopyWithImpl<$Res>
    implements _$VodPlaybackAdaptationSetDtoCopyWith<$Res> {
  __$VodPlaybackAdaptationSetDtoCopyWithImpl(this._self, this._then);

  final _VodPlaybackAdaptationSetDto _self;
  final $Res Function(_VodPlaybackAdaptationSetDto) _then;

  /// Create a copy of VodPlaybackAdaptationSetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? naverVodM3u = freezed}) {
    return _then(
      _VodPlaybackAdaptationSetDto(
        naverVodM3u: freezed == naverVodM3u
            ? _self.naverVodM3u
            : naverVodM3u // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
