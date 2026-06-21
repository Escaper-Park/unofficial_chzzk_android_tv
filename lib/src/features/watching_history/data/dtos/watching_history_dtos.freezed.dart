// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watching_history_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchingHistoryListDto {
  List<WatchingHistoryDto> get data;
  WatchingHistoryPageDto? get page;
  int get size;

  /// Create a copy of WatchingHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryListDtoCopyWith<WatchingHistoryListDto> get copyWith =>
      _$WatchingHistoryListDtoCopyWithImpl<WatchingHistoryListDto>(
        this as WatchingHistoryListDto,
        _$identity,
      );

  /// Serializes this WatchingHistoryListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryListDto &&
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
    return 'WatchingHistoryListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryListDtoCopyWith<$Res> {
  factory $WatchingHistoryListDtoCopyWith(
    WatchingHistoryListDto value,
    $Res Function(WatchingHistoryListDto) _then,
  ) = _$WatchingHistoryListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<WatchingHistoryDto> data,
    WatchingHistoryPageDto? page,
    int size,
  });

  $WatchingHistoryPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$WatchingHistoryListDtoCopyWithImpl<$Res>
    implements $WatchingHistoryListDtoCopyWith<$Res> {
  _$WatchingHistoryListDtoCopyWithImpl(this._self, this._then);

  final WatchingHistoryListDto _self;
  final $Res Function(WatchingHistoryListDto) _then;

  /// Create a copy of WatchingHistoryListDto
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
                  as List<WatchingHistoryDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of WatchingHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $WatchingHistoryPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryListDto].
extension WatchingHistoryListDtoPatterns on WatchingHistoryListDto {
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
    TResult Function(_WatchingHistoryListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryListDto() when $default != null:
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
    TResult Function(_WatchingHistoryListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryListDto():
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
    TResult? Function(_WatchingHistoryListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryListDto() when $default != null:
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
      List<WatchingHistoryDto> data,
      WatchingHistoryPageDto? page,
      int size,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryListDto() when $default != null:
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
      List<WatchingHistoryDto> data,
      WatchingHistoryPageDto? page,
      int size,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryListDto():
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
      List<WatchingHistoryDto> data,
      WatchingHistoryPageDto? page,
      int size,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WatchingHistoryListDto implements WatchingHistoryListDto {
  const _WatchingHistoryListDto({
    final List<WatchingHistoryDto> data = const <WatchingHistoryDto>[],
    this.page,
    this.size = 0,
  }) : _data = data;
  factory _WatchingHistoryListDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryListDtoFromJson(json);

  final List<WatchingHistoryDto> _data;
  @override
  @JsonKey()
  List<WatchingHistoryDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final WatchingHistoryPageDto? page;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of WatchingHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryListDtoCopyWith<_WatchingHistoryListDto> get copyWith =>
      __$WatchingHistoryListDtoCopyWithImpl<_WatchingHistoryListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$WatchingHistoryListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryListDto &&
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
    return 'WatchingHistoryListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryListDtoCopyWith<$Res>
    implements $WatchingHistoryListDtoCopyWith<$Res> {
  factory _$WatchingHistoryListDtoCopyWith(
    _WatchingHistoryListDto value,
    $Res Function(_WatchingHistoryListDto) _then,
  ) = __$WatchingHistoryListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<WatchingHistoryDto> data,
    WatchingHistoryPageDto? page,
    int size,
  });

  @override
  $WatchingHistoryPageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$WatchingHistoryListDtoCopyWithImpl<$Res>
    implements _$WatchingHistoryListDtoCopyWith<$Res> {
  __$WatchingHistoryListDtoCopyWithImpl(this._self, this._then);

  final _WatchingHistoryListDto _self;
  final $Res Function(_WatchingHistoryListDto) _then;

  /// Create a copy of WatchingHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _WatchingHistoryListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<WatchingHistoryDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryPageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of WatchingHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryPageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $WatchingHistoryPageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$WatchingHistoryPageDto {
  WatchingHistoryPageNextDto? get next;

  /// Create a copy of WatchingHistoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryPageDtoCopyWith<WatchingHistoryPageDto> get copyWith =>
      _$WatchingHistoryPageDtoCopyWithImpl<WatchingHistoryPageDto>(
        this as WatchingHistoryPageDto,
        _$identity,
      );

  /// Serializes this WatchingHistoryPageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'WatchingHistoryPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryPageDtoCopyWith<$Res> {
  factory $WatchingHistoryPageDtoCopyWith(
    WatchingHistoryPageDto value,
    $Res Function(WatchingHistoryPageDto) _then,
  ) = _$WatchingHistoryPageDtoCopyWithImpl;
  @useResult
  $Res call({WatchingHistoryPageNextDto? next});

  $WatchingHistoryPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$WatchingHistoryPageDtoCopyWithImpl<$Res>
    implements $WatchingHistoryPageDtoCopyWith<$Res> {
  _$WatchingHistoryPageDtoCopyWithImpl(this._self, this._then);

  final WatchingHistoryPageDto _self;
  final $Res Function(WatchingHistoryPageDto) _then;

  /// Create a copy of WatchingHistoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryPageNextDto?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $WatchingHistoryPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryPageDto].
extension WatchingHistoryPageDtoPatterns on WatchingHistoryPageDto {
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
    TResult Function(_WatchingHistoryPageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPageDto() when $default != null:
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
    TResult Function(_WatchingHistoryPageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPageDto():
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
    TResult? Function(_WatchingHistoryPageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPageDto() when $default != null:
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
    TResult Function(WatchingHistoryPageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPageDto() when $default != null:
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
    TResult Function(WatchingHistoryPageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPageDto():
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
    TResult? Function(WatchingHistoryPageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WatchingHistoryPageDto implements WatchingHistoryPageDto {
  const _WatchingHistoryPageDto({this.next});
  factory _WatchingHistoryPageDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryPageDtoFromJson(json);

  @override
  final WatchingHistoryPageNextDto? next;

  /// Create a copy of WatchingHistoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryPageDtoCopyWith<_WatchingHistoryPageDto> get copyWith =>
      __$WatchingHistoryPageDtoCopyWithImpl<_WatchingHistoryPageDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$WatchingHistoryPageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryPageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'WatchingHistoryPageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryPageDtoCopyWith<$Res>
    implements $WatchingHistoryPageDtoCopyWith<$Res> {
  factory _$WatchingHistoryPageDtoCopyWith(
    _WatchingHistoryPageDto value,
    $Res Function(_WatchingHistoryPageDto) _then,
  ) = __$WatchingHistoryPageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({WatchingHistoryPageNextDto? next});

  @override
  $WatchingHistoryPageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$WatchingHistoryPageDtoCopyWithImpl<$Res>
    implements _$WatchingHistoryPageDtoCopyWith<$Res> {
  __$WatchingHistoryPageDtoCopyWithImpl(this._self, this._then);

  final _WatchingHistoryPageDto _self;
  final $Res Function(_WatchingHistoryPageDto) _then;

  /// Create a copy of WatchingHistoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _WatchingHistoryPageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryPageNextDto?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryPageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $WatchingHistoryPageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$WatchingHistoryPageNextDto {
  int? get lastTime;

  /// Create a copy of WatchingHistoryPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryPageNextDtoCopyWith<WatchingHistoryPageNextDto>
  get copyWith =>
      _$WatchingHistoryPageNextDtoCopyWithImpl<WatchingHistoryPageNextDto>(
        this as WatchingHistoryPageNextDto,
        _$identity,
      );

  /// Serializes this WatchingHistoryPageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryPageNextDto &&
            (identical(other.lastTime, lastTime) ||
                other.lastTime == lastTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lastTime);

  @override
  String toString() {
    return 'WatchingHistoryPageNextDto(lastTime: $lastTime)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryPageNextDtoCopyWith<$Res> {
  factory $WatchingHistoryPageNextDtoCopyWith(
    WatchingHistoryPageNextDto value,
    $Res Function(WatchingHistoryPageNextDto) _then,
  ) = _$WatchingHistoryPageNextDtoCopyWithImpl;
  @useResult
  $Res call({int? lastTime});
}

/// @nodoc
class _$WatchingHistoryPageNextDtoCopyWithImpl<$Res>
    implements $WatchingHistoryPageNextDtoCopyWith<$Res> {
  _$WatchingHistoryPageNextDtoCopyWithImpl(this._self, this._then);

  final WatchingHistoryPageNextDto _self;
  final $Res Function(WatchingHistoryPageNextDto) _then;

  /// Create a copy of WatchingHistoryPageNextDto
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

/// Adds pattern-matching-related methods to [WatchingHistoryPageNextDto].
extension WatchingHistoryPageNextDtoPatterns on WatchingHistoryPageNextDto {
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
    TResult Function(_WatchingHistoryPageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPageNextDto() when $default != null:
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
    TResult Function(_WatchingHistoryPageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPageNextDto():
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
    TResult? Function(_WatchingHistoryPageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryPageNextDto() when $default != null:
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
      case _WatchingHistoryPageNextDto() when $default != null:
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
      case _WatchingHistoryPageNextDto():
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
      case _WatchingHistoryPageNextDto() when $default != null:
        return $default(_that.lastTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WatchingHistoryPageNextDto implements WatchingHistoryPageNextDto {
  const _WatchingHistoryPageNextDto({this.lastTime});
  factory _WatchingHistoryPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryPageNextDtoFromJson(json);

  @override
  final int? lastTime;

  /// Create a copy of WatchingHistoryPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryPageNextDtoCopyWith<_WatchingHistoryPageNextDto>
  get copyWith =>
      __$WatchingHistoryPageNextDtoCopyWithImpl<_WatchingHistoryPageNextDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$WatchingHistoryPageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryPageNextDto &&
            (identical(other.lastTime, lastTime) ||
                other.lastTime == lastTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lastTime);

  @override
  String toString() {
    return 'WatchingHistoryPageNextDto(lastTime: $lastTime)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryPageNextDtoCopyWith<$Res>
    implements $WatchingHistoryPageNextDtoCopyWith<$Res> {
  factory _$WatchingHistoryPageNextDtoCopyWith(
    _WatchingHistoryPageNextDto value,
    $Res Function(_WatchingHistoryPageNextDto) _then,
  ) = __$WatchingHistoryPageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? lastTime});
}

/// @nodoc
class __$WatchingHistoryPageNextDtoCopyWithImpl<$Res>
    implements _$WatchingHistoryPageNextDtoCopyWith<$Res> {
  __$WatchingHistoryPageNextDtoCopyWithImpl(this._self, this._then);

  final _WatchingHistoryPageNextDto _self;
  final $Res Function(_WatchingHistoryPageNextDto) _then;

  /// Create a copy of WatchingHistoryPageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? lastTime = freezed}) {
    return _then(
      _WatchingHistoryPageNextDto(
        lastTime: freezed == lastTime
            ? _self.lastTime
            : lastTime // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$WatchingHistoryDto {
  String get historyNo;
  String get channelId;
  int get videoNo;
  int get timeline;
  String get contentType;
  String? get date;
  WatchingHistoryVideoDto? get videoResponse;

  /// Create a copy of WatchingHistoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryDtoCopyWith<WatchingHistoryDto> get copyWith =>
      _$WatchingHistoryDtoCopyWithImpl<WatchingHistoryDto>(
        this as WatchingHistoryDto,
        _$identity,
      );

  /// Serializes this WatchingHistoryDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryDto &&
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
            (identical(other.videoResponse, videoResponse) ||
                other.videoResponse == videoResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    historyNo,
    channelId,
    videoNo,
    timeline,
    contentType,
    date,
    videoResponse,
  );

  @override
  String toString() {
    return 'WatchingHistoryDto(historyNo: $historyNo, channelId: $channelId, videoNo: $videoNo, timeline: $timeline, contentType: $contentType, date: $date, videoResponse: $videoResponse)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryDtoCopyWith<$Res> {
  factory $WatchingHistoryDtoCopyWith(
    WatchingHistoryDto value,
    $Res Function(WatchingHistoryDto) _then,
  ) = _$WatchingHistoryDtoCopyWithImpl;
  @useResult
  $Res call({
    String historyNo,
    String channelId,
    int videoNo,
    int timeline,
    String contentType,
    String? date,
    WatchingHistoryVideoDto? videoResponse,
  });

  $WatchingHistoryVideoDtoCopyWith<$Res>? get videoResponse;
}

/// @nodoc
class _$WatchingHistoryDtoCopyWithImpl<$Res>
    implements $WatchingHistoryDtoCopyWith<$Res> {
  _$WatchingHistoryDtoCopyWithImpl(this._self, this._then);

  final WatchingHistoryDto _self;
  final $Res Function(WatchingHistoryDto) _then;

  /// Create a copy of WatchingHistoryDto
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
    Object? videoResponse = freezed,
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
        videoResponse: freezed == videoResponse
            ? _self.videoResponse
            : videoResponse // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryVideoDto?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryVideoDtoCopyWith<$Res>? get videoResponse {
    if (_self.videoResponse == null) {
      return null;
    }

    return $WatchingHistoryVideoDtoCopyWith<$Res>(_self.videoResponse!, (
      value,
    ) {
      return _then(_self.copyWith(videoResponse: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryDto].
extension WatchingHistoryDtoPatterns on WatchingHistoryDto {
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
    TResult Function(_WatchingHistoryDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryDto() when $default != null:
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
    TResult Function(_WatchingHistoryDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryDto():
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
    TResult? Function(_WatchingHistoryDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryDto() when $default != null:
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
      WatchingHistoryVideoDto? videoResponse,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryDto() when $default != null:
        return $default(
          _that.historyNo,
          _that.channelId,
          _that.videoNo,
          _that.timeline,
          _that.contentType,
          _that.date,
          _that.videoResponse,
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
      WatchingHistoryVideoDto? videoResponse,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryDto():
        return $default(
          _that.historyNo,
          _that.channelId,
          _that.videoNo,
          _that.timeline,
          _that.contentType,
          _that.date,
          _that.videoResponse,
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
      WatchingHistoryVideoDto? videoResponse,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryDto() when $default != null:
        return $default(
          _that.historyNo,
          _that.channelId,
          _that.videoNo,
          _that.timeline,
          _that.contentType,
          _that.date,
          _that.videoResponse,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WatchingHistoryDto implements WatchingHistoryDto {
  const _WatchingHistoryDto({
    this.historyNo = '',
    this.channelId = '',
    this.videoNo = 0,
    this.timeline = 0,
    this.contentType = '',
    this.date,
    this.videoResponse,
  });
  factory _WatchingHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryDtoFromJson(json);

  @override
  @JsonKey()
  final String historyNo;
  @override
  @JsonKey()
  final String channelId;
  @override
  @JsonKey()
  final int videoNo;
  @override
  @JsonKey()
  final int timeline;
  @override
  @JsonKey()
  final String contentType;
  @override
  final String? date;
  @override
  final WatchingHistoryVideoDto? videoResponse;

  /// Create a copy of WatchingHistoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryDtoCopyWith<_WatchingHistoryDto> get copyWith =>
      __$WatchingHistoryDtoCopyWithImpl<_WatchingHistoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WatchingHistoryDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryDto &&
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
            (identical(other.videoResponse, videoResponse) ||
                other.videoResponse == videoResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    historyNo,
    channelId,
    videoNo,
    timeline,
    contentType,
    date,
    videoResponse,
  );

  @override
  String toString() {
    return 'WatchingHistoryDto(historyNo: $historyNo, channelId: $channelId, videoNo: $videoNo, timeline: $timeline, contentType: $contentType, date: $date, videoResponse: $videoResponse)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryDtoCopyWith<$Res>
    implements $WatchingHistoryDtoCopyWith<$Res> {
  factory _$WatchingHistoryDtoCopyWith(
    _WatchingHistoryDto value,
    $Res Function(_WatchingHistoryDto) _then,
  ) = __$WatchingHistoryDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String historyNo,
    String channelId,
    int videoNo,
    int timeline,
    String contentType,
    String? date,
    WatchingHistoryVideoDto? videoResponse,
  });

  @override
  $WatchingHistoryVideoDtoCopyWith<$Res>? get videoResponse;
}

/// @nodoc
class __$WatchingHistoryDtoCopyWithImpl<$Res>
    implements _$WatchingHistoryDtoCopyWith<$Res> {
  __$WatchingHistoryDtoCopyWithImpl(this._self, this._then);

  final _WatchingHistoryDto _self;
  final $Res Function(_WatchingHistoryDto) _then;

  /// Create a copy of WatchingHistoryDto
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
    Object? videoResponse = freezed,
  }) {
    return _then(
      _WatchingHistoryDto(
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
        videoResponse: freezed == videoResponse
            ? _self.videoResponse
            : videoResponse // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryVideoDto?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryVideoDtoCopyWith<$Res>? get videoResponse {
    if (_self.videoResponse == null) {
      return null;
    }

    return $WatchingHistoryVideoDtoCopyWith<$Res>(_self.videoResponse!, (
      value,
    ) {
      return _then(_self.copyWith(videoResponse: value));
    });
  }
}

/// @nodoc
mixin _$WatchingHistoryVideoDto {
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
  WatchingHistoryChannelDto? get channel;
  String? get blindType;
  int? get watchTimeline;

  /// Create a copy of WatchingHistoryVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryVideoDtoCopyWith<WatchingHistoryVideoDto> get copyWith =>
      _$WatchingHistoryVideoDtoCopyWithImpl<WatchingHistoryVideoDto>(
        this as WatchingHistoryVideoDto,
        _$identity,
      );

  /// Serializes this WatchingHistoryVideoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryVideoDto &&
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
    return 'WatchingHistoryVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryVideoDtoCopyWith<$Res> {
  factory $WatchingHistoryVideoDtoCopyWith(
    WatchingHistoryVideoDto value,
    $Res Function(WatchingHistoryVideoDto) _then,
  ) = _$WatchingHistoryVideoDtoCopyWithImpl;
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
    WatchingHistoryChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  $WatchingHistoryChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$WatchingHistoryVideoDtoCopyWithImpl<$Res>
    implements $WatchingHistoryVideoDtoCopyWith<$Res> {
  _$WatchingHistoryVideoDtoCopyWithImpl(this._self, this._then);

  final WatchingHistoryVideoDto _self;
  final $Res Function(WatchingHistoryVideoDto) _then;

  /// Create a copy of WatchingHistoryVideoDto
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
                  as WatchingHistoryChannelDto?,
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

  /// Create a copy of WatchingHistoryVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $WatchingHistoryChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryVideoDto].
extension WatchingHistoryVideoDtoPatterns on WatchingHistoryVideoDto {
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
    TResult Function(_WatchingHistoryVideoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideoDto() when $default != null:
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
    TResult Function(_WatchingHistoryVideoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideoDto():
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
    TResult? Function(_WatchingHistoryVideoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideoDto() when $default != null:
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
      WatchingHistoryChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideoDto() when $default != null:
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
      WatchingHistoryChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideoDto():
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
      WatchingHistoryChannelDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryVideoDto() when $default != null:
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
class _WatchingHistoryVideoDto implements WatchingHistoryVideoDto {
  const _WatchingHistoryVideoDto({
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
  factory _WatchingHistoryVideoDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryVideoDtoFromJson(json);

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
  final WatchingHistoryChannelDto? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;

  /// Create a copy of WatchingHistoryVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryVideoDtoCopyWith<_WatchingHistoryVideoDto> get copyWith =>
      __$WatchingHistoryVideoDtoCopyWithImpl<_WatchingHistoryVideoDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$WatchingHistoryVideoDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryVideoDto &&
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
    return 'WatchingHistoryVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryVideoDtoCopyWith<$Res>
    implements $WatchingHistoryVideoDtoCopyWith<$Res> {
  factory _$WatchingHistoryVideoDtoCopyWith(
    _WatchingHistoryVideoDto value,
    $Res Function(_WatchingHistoryVideoDto) _then,
  ) = __$WatchingHistoryVideoDtoCopyWithImpl;
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
    WatchingHistoryChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  @override
  $WatchingHistoryChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$WatchingHistoryVideoDtoCopyWithImpl<$Res>
    implements _$WatchingHistoryVideoDtoCopyWith<$Res> {
  __$WatchingHistoryVideoDtoCopyWithImpl(this._self, this._then);

  final _WatchingHistoryVideoDto _self;
  final $Res Function(_WatchingHistoryVideoDto) _then;

  /// Create a copy of WatchingHistoryVideoDto
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
      _WatchingHistoryVideoDto(
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
                  as WatchingHistoryChannelDto?,
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

  /// Create a copy of WatchingHistoryVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $WatchingHistoryChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$WatchingHistoryChannelDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  WatchingHistoryChannelPersonalDataDto? get personalData;

  /// Create a copy of WatchingHistoryChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelDtoCopyWith<WatchingHistoryChannelDto> get copyWith =>
      _$WatchingHistoryChannelDtoCopyWithImpl<WatchingHistoryChannelDto>(
        this as WatchingHistoryChannelDto,
        _$identity,
      );

  /// Serializes this WatchingHistoryChannelDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryChannelDto &&
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
    return 'WatchingHistoryChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryChannelDtoCopyWith<$Res> {
  factory $WatchingHistoryChannelDtoCopyWith(
    WatchingHistoryChannelDto value,
    $Res Function(WatchingHistoryChannelDto) _then,
  ) = _$WatchingHistoryChannelDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    WatchingHistoryChannelPersonalDataDto? personalData,
  });

  $WatchingHistoryChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$WatchingHistoryChannelDtoCopyWithImpl<$Res>
    implements $WatchingHistoryChannelDtoCopyWith<$Res> {
  _$WatchingHistoryChannelDtoCopyWithImpl(this._self, this._then);

  final WatchingHistoryChannelDto _self;
  final $Res Function(WatchingHistoryChannelDto) _then;

  /// Create a copy of WatchingHistoryChannelDto
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
                  as WatchingHistoryChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $WatchingHistoryChannelPersonalDataDtoCopyWith<$Res>(
      _self.personalData!,
      (value) {
        return _then(_self.copyWith(personalData: value));
      },
    );
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryChannelDto].
extension WatchingHistoryChannelDtoPatterns on WatchingHistoryChannelDto {
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
    TResult Function(_WatchingHistoryChannelDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelDto() when $default != null:
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
    TResult Function(_WatchingHistoryChannelDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelDto():
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
    TResult? Function(_WatchingHistoryChannelDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelDto() when $default != null:
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
      WatchingHistoryChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelDto() when $default != null:
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
      WatchingHistoryChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelDto():
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
      WatchingHistoryChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelDto() when $default != null:
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
class _WatchingHistoryChannelDto implements WatchingHistoryChannelDto {
  const _WatchingHistoryChannelDto({
    this.channelId = '',
    this.channelName = '',
    this.channelImageUrl,
    this.verifiedMark = false,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _WatchingHistoryChannelDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryChannelDtoFromJson(json);

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
  final WatchingHistoryChannelPersonalDataDto? personalData;

  /// Create a copy of WatchingHistoryChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryChannelDtoCopyWith<_WatchingHistoryChannelDto>
  get copyWith =>
      __$WatchingHistoryChannelDtoCopyWithImpl<_WatchingHistoryChannelDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$WatchingHistoryChannelDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryChannelDto &&
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
    return 'WatchingHistoryChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryChannelDtoCopyWith<$Res>
    implements $WatchingHistoryChannelDtoCopyWith<$Res> {
  factory _$WatchingHistoryChannelDtoCopyWith(
    _WatchingHistoryChannelDto value,
    $Res Function(_WatchingHistoryChannelDto) _then,
  ) = __$WatchingHistoryChannelDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    WatchingHistoryChannelPersonalDataDto? personalData,
  });

  @override
  $WatchingHistoryChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$WatchingHistoryChannelDtoCopyWithImpl<$Res>
    implements _$WatchingHistoryChannelDtoCopyWith<$Res> {
  __$WatchingHistoryChannelDtoCopyWithImpl(this._self, this._then);

  final _WatchingHistoryChannelDto _self;
  final $Res Function(_WatchingHistoryChannelDto) _then;

  /// Create a copy of WatchingHistoryChannelDto
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
      _WatchingHistoryChannelDto(
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
                  as WatchingHistoryChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of WatchingHistoryChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $WatchingHistoryChannelPersonalDataDtoCopyWith<$Res>(
      _self.personalData!,
      (value) {
        return _then(_self.copyWith(personalData: value));
      },
    );
  }
}

/// @nodoc
mixin _$WatchingHistoryChannelPersonalDataDto {
  WatchingHistoryChannelPersonalFollowingDto? get following;
  bool get privateUserBlock;

  /// Create a copy of WatchingHistoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelPersonalDataDtoCopyWith<
    WatchingHistoryChannelPersonalDataDto
  >
  get copyWith =>
      _$WatchingHistoryChannelPersonalDataDtoCopyWithImpl<
        WatchingHistoryChannelPersonalDataDto
      >(this as WatchingHistoryChannelPersonalDataDto, _$identity);

  /// Serializes this WatchingHistoryChannelPersonalDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryChannelPersonalDataDto &&
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
    return 'WatchingHistoryChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryChannelPersonalDataDtoCopyWith<$Res> {
  factory $WatchingHistoryChannelPersonalDataDtoCopyWith(
    WatchingHistoryChannelPersonalDataDto value,
    $Res Function(WatchingHistoryChannelPersonalDataDto) _then,
  ) = _$WatchingHistoryChannelPersonalDataDtoCopyWithImpl;
  @useResult
  $Res call({
    WatchingHistoryChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  $WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$WatchingHistoryChannelPersonalDataDtoCopyWithImpl<$Res>
    implements $WatchingHistoryChannelPersonalDataDtoCopyWith<$Res> {
  _$WatchingHistoryChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final WatchingHistoryChannelPersonalDataDto _self;
  final $Res Function(WatchingHistoryChannelPersonalDataDto) _then;

  /// Create a copy of WatchingHistoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of WatchingHistoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res>(
      _self.following!,
      (value) {
        return _then(_self.copyWith(following: value));
      },
    );
  }
}

/// Adds pattern-matching-related methods to [WatchingHistoryChannelPersonalDataDto].
extension WatchingHistoryChannelPersonalDataDtoPatterns
    on WatchingHistoryChannelPersonalDataDto {
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
    TResult Function(_WatchingHistoryChannelPersonalDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelPersonalDataDto() when $default != null:
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
    TResult Function(_WatchingHistoryChannelPersonalDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelPersonalDataDto():
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
    TResult? Function(_WatchingHistoryChannelPersonalDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelPersonalDataDto() when $default != null:
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
      WatchingHistoryChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelPersonalDataDto() when $default != null:
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
      WatchingHistoryChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelPersonalDataDto():
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
      WatchingHistoryChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WatchingHistoryChannelPersonalDataDto
    implements WatchingHistoryChannelPersonalDataDto {
  const _WatchingHistoryChannelPersonalDataDto({
    this.following,
    this.privateUserBlock = false,
  });
  factory _WatchingHistoryChannelPersonalDataDto.fromJson(
    Map<String, dynamic> json,
  ) => _$WatchingHistoryChannelPersonalDataDtoFromJson(json);

  @override
  final WatchingHistoryChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool privateUserBlock;

  /// Create a copy of WatchingHistoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryChannelPersonalDataDtoCopyWith<
    _WatchingHistoryChannelPersonalDataDto
  >
  get copyWith =>
      __$WatchingHistoryChannelPersonalDataDtoCopyWithImpl<
        _WatchingHistoryChannelPersonalDataDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WatchingHistoryChannelPersonalDataDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryChannelPersonalDataDto &&
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
    return 'WatchingHistoryChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryChannelPersonalDataDtoCopyWith<$Res>
    implements $WatchingHistoryChannelPersonalDataDtoCopyWith<$Res> {
  factory _$WatchingHistoryChannelPersonalDataDtoCopyWith(
    _WatchingHistoryChannelPersonalDataDto value,
    $Res Function(_WatchingHistoryChannelPersonalDataDto) _then,
  ) = __$WatchingHistoryChannelPersonalDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    WatchingHistoryChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  @override
  $WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$WatchingHistoryChannelPersonalDataDtoCopyWithImpl<$Res>
    implements _$WatchingHistoryChannelPersonalDataDtoCopyWith<$Res> {
  __$WatchingHistoryChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final _WatchingHistoryChannelPersonalDataDto _self;
  final $Res Function(_WatchingHistoryChannelPersonalDataDto) _then;

  /// Create a copy of WatchingHistoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _WatchingHistoryChannelPersonalDataDto(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of WatchingHistoryChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res>(
      _self.following!,
      (value) {
        return _then(_self.copyWith(following: value));
      },
    );
  }
}

/// @nodoc
mixin _$WatchingHistoryChannelPersonalFollowingDto {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of WatchingHistoryChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryChannelPersonalFollowingDtoCopyWith<
    WatchingHistoryChannelPersonalFollowingDto
  >
  get copyWith =>
      _$WatchingHistoryChannelPersonalFollowingDtoCopyWithImpl<
        WatchingHistoryChannelPersonalFollowingDto
      >(this as WatchingHistoryChannelPersonalFollowingDto, _$identity);

  /// Serializes this WatchingHistoryChannelPersonalFollowingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryChannelPersonalFollowingDto &&
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
    return 'WatchingHistoryChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res> {
  factory $WatchingHistoryChannelPersonalFollowingDtoCopyWith(
    WatchingHistoryChannelPersonalFollowingDto value,
    $Res Function(WatchingHistoryChannelPersonalFollowingDto) _then,
  ) = _$WatchingHistoryChannelPersonalFollowingDtoCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$WatchingHistoryChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements $WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res> {
  _$WatchingHistoryChannelPersonalFollowingDtoCopyWithImpl(
    this._self,
    this._then,
  );

  final WatchingHistoryChannelPersonalFollowingDto _self;
  final $Res Function(WatchingHistoryChannelPersonalFollowingDto) _then;

  /// Create a copy of WatchingHistoryChannelPersonalFollowingDto
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

/// Adds pattern-matching-related methods to [WatchingHistoryChannelPersonalFollowingDto].
extension WatchingHistoryChannelPersonalFollowingDtoPatterns
    on WatchingHistoryChannelPersonalFollowingDto {
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
    TResult Function(_WatchingHistoryChannelPersonalFollowingDto value)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelPersonalFollowingDto() when $default != null:
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
    TResult Function(_WatchingHistoryChannelPersonalFollowingDto value)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelPersonalFollowingDto():
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
    TResult? Function(_WatchingHistoryChannelPersonalFollowingDto value)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchingHistoryChannelPersonalFollowingDto() when $default != null:
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
      case _WatchingHistoryChannelPersonalFollowingDto() when $default != null:
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
      case _WatchingHistoryChannelPersonalFollowingDto():
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
      case _WatchingHistoryChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WatchingHistoryChannelPersonalFollowingDto
    implements WatchingHistoryChannelPersonalFollowingDto {
  const _WatchingHistoryChannelPersonalFollowingDto({
    this.following = false,
    this.notification = false,
    this.followDate,
  });
  factory _WatchingHistoryChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$WatchingHistoryChannelPersonalFollowingDtoFromJson(json);

  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of WatchingHistoryChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchingHistoryChannelPersonalFollowingDtoCopyWith<
    _WatchingHistoryChannelPersonalFollowingDto
  >
  get copyWith =>
      __$WatchingHistoryChannelPersonalFollowingDtoCopyWithImpl<
        _WatchingHistoryChannelPersonalFollowingDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WatchingHistoryChannelPersonalFollowingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchingHistoryChannelPersonalFollowingDto &&
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
    return 'WatchingHistoryChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res>
    implements $WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res> {
  factory _$WatchingHistoryChannelPersonalFollowingDtoCopyWith(
    _WatchingHistoryChannelPersonalFollowingDto value,
    $Res Function(_WatchingHistoryChannelPersonalFollowingDto) _then,
  ) = __$WatchingHistoryChannelPersonalFollowingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$WatchingHistoryChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements _$WatchingHistoryChannelPersonalFollowingDtoCopyWith<$Res> {
  __$WatchingHistoryChannelPersonalFollowingDtoCopyWithImpl(
    this._self,
    this._then,
  );

  final _WatchingHistoryChannelPersonalFollowingDto _self;
  final $Res Function(_WatchingHistoryChannelPersonalFollowingDto) _then;

  /// Create a copy of WatchingHistoryChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _WatchingHistoryChannelPersonalFollowingDto(
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
