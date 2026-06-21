// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveListDto {
  List<LiveDto> get data;
  LivePageDto? get page;
  int get size;

  /// Create a copy of LiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveListDtoCopyWith<LiveListDto> get copyWith =>
      _$LiveListDtoCopyWithImpl<LiveListDto>(this as LiveListDto, _$identity);

  /// Serializes this LiveListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveListDto &&
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
    return 'LiveListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class $LiveListDtoCopyWith<$Res> {
  factory $LiveListDtoCopyWith(
    LiveListDto value,
    $Res Function(LiveListDto) _then,
  ) = _$LiveListDtoCopyWithImpl;
  @useResult
  $Res call({List<LiveDto> data, LivePageDto? page, int size});

  $LivePageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class _$LiveListDtoCopyWithImpl<$Res> implements $LiveListDtoCopyWith<$Res> {
  _$LiveListDtoCopyWithImpl(this._self, this._then);

  final LiveListDto _self;
  final $Res Function(LiveListDto) _then;

  /// Create a copy of LiveListDto
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
                  as List<LiveDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as LivePageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of LiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LivePageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $LivePageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LiveListDto].
extension LiveListDtoPatterns on LiveListDto {
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
    TResult Function(_LiveListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveListDto() when $default != null:
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
    TResult Function(_LiveListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveListDto():
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
    TResult? Function(_LiveListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveListDto() when $default != null:
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
    TResult Function(List<LiveDto> data, LivePageDto? page, int size)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveListDto() when $default != null:
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
    TResult Function(List<LiveDto> data, LivePageDto? page, int size) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveListDto():
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
    TResult? Function(List<LiveDto> data, LivePageDto? page, int size)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveListDto() when $default != null:
        return $default(_that.data, _that.page, _that.size);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LiveListDto implements LiveListDto {
  const _LiveListDto({
    final List<LiveDto> data = const <LiveDto>[],
    this.page,
    this.size = 0,
  }) : _data = data;
  factory _LiveListDto.fromJson(Map<String, dynamic> json) =>
      _$LiveListDtoFromJson(json);

  final List<LiveDto> _data;
  @override
  @JsonKey()
  List<LiveDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final LivePageDto? page;
  @override
  @JsonKey()
  final int size;

  /// Create a copy of LiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveListDtoCopyWith<_LiveListDto> get copyWith =>
      __$LiveListDtoCopyWithImpl<_LiveListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LiveListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveListDto &&
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
    return 'LiveListDto(data: $data, page: $page, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$LiveListDtoCopyWith<$Res>
    implements $LiveListDtoCopyWith<$Res> {
  factory _$LiveListDtoCopyWith(
    _LiveListDto value,
    $Res Function(_LiveListDto) _then,
  ) = __$LiveListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<LiveDto> data, LivePageDto? page, int size});

  @override
  $LivePageDtoCopyWith<$Res>? get page;
}

/// @nodoc
class __$LiveListDtoCopyWithImpl<$Res> implements _$LiveListDtoCopyWith<$Res> {
  __$LiveListDtoCopyWithImpl(this._self, this._then);

  final _LiveListDto _self;
  final $Res Function(_LiveListDto) _then;

  /// Create a copy of LiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = freezed,
    Object? size = null,
  }) {
    return _then(
      _LiveListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<LiveDto>,
        page: freezed == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as LivePageDto?,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of LiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LivePageDtoCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $LivePageDtoCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$LivePageDto {
  LivePageNextDto? get next;

  /// Create a copy of LivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LivePageDtoCopyWith<LivePageDto> get copyWith =>
      _$LivePageDtoCopyWithImpl<LivePageDto>(this as LivePageDto, _$identity);

  /// Serializes this LivePageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LivePageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'LivePageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class $LivePageDtoCopyWith<$Res> {
  factory $LivePageDtoCopyWith(
    LivePageDto value,
    $Res Function(LivePageDto) _then,
  ) = _$LivePageDtoCopyWithImpl;
  @useResult
  $Res call({LivePageNextDto? next});

  $LivePageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class _$LivePageDtoCopyWithImpl<$Res> implements $LivePageDtoCopyWith<$Res> {
  _$LivePageDtoCopyWithImpl(this._self, this._then);

  final LivePageDto _self;
  final $Res Function(LivePageDto) _then;

  /// Create a copy of LivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _self.copyWith(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as LivePageNextDto?,
      ),
    );
  }

  /// Create a copy of LivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LivePageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $LivePageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LivePageDto].
extension LivePageDtoPatterns on LivePageDto {
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
    TResult Function(_LivePageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LivePageDto() when $default != null:
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
    TResult Function(_LivePageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePageDto():
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
    TResult? Function(_LivePageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePageDto() when $default != null:
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
    TResult Function(LivePageNextDto? next)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LivePageDto() when $default != null:
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
    TResult Function(LivePageNextDto? next) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePageDto():
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
    TResult? Function(LivePageNextDto? next)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePageDto() when $default != null:
        return $default(_that.next);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LivePageDto implements LivePageDto {
  const _LivePageDto({this.next});
  factory _LivePageDto.fromJson(Map<String, dynamic> json) =>
      _$LivePageDtoFromJson(json);

  @override
  final LivePageNextDto? next;

  /// Create a copy of LivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LivePageDtoCopyWith<_LivePageDto> get copyWith =>
      __$LivePageDtoCopyWithImpl<_LivePageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LivePageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LivePageDto &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'LivePageDto(next: $next)';
  }
}

/// @nodoc
abstract mixin class _$LivePageDtoCopyWith<$Res>
    implements $LivePageDtoCopyWith<$Res> {
  factory _$LivePageDtoCopyWith(
    _LivePageDto value,
    $Res Function(_LivePageDto) _then,
  ) = __$LivePageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({LivePageNextDto? next});

  @override
  $LivePageNextDtoCopyWith<$Res>? get next;
}

/// @nodoc
class __$LivePageDtoCopyWithImpl<$Res> implements _$LivePageDtoCopyWith<$Res> {
  __$LivePageDtoCopyWithImpl(this._self, this._then);

  final _LivePageDto _self;
  final $Res Function(_LivePageDto) _then;

  /// Create a copy of LivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? next = freezed}) {
    return _then(
      _LivePageDto(
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as LivePageNextDto?,
      ),
    );
  }

  /// Create a copy of LivePageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LivePageNextDtoCopyWith<$Res>? get next {
    if (_self.next == null) {
      return null;
    }

    return $LivePageNextDtoCopyWith<$Res>(_self.next!, (value) {
      return _then(_self.copyWith(next: value));
    });
  }
}

/// @nodoc
mixin _$LivePageNextDto {
  int? get concurrentUserCount;
  int? get liveId;

  /// Create a copy of LivePageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LivePageNextDtoCopyWith<LivePageNextDto> get copyWith =>
      _$LivePageNextDtoCopyWithImpl<LivePageNextDto>(
        this as LivePageNextDto,
        _$identity,
      );

  /// Serializes this LivePageNextDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LivePageNextDto &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'LivePageNextDto(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class $LivePageNextDtoCopyWith<$Res> {
  factory $LivePageNextDtoCopyWith(
    LivePageNextDto value,
    $Res Function(LivePageNextDto) _then,
  ) = _$LivePageNextDtoCopyWithImpl;
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class _$LivePageNextDtoCopyWithImpl<$Res>
    implements $LivePageNextDtoCopyWith<$Res> {
  _$LivePageNextDtoCopyWithImpl(this._self, this._then);

  final LivePageNextDto _self;
  final $Res Function(LivePageNextDto) _then;

  /// Create a copy of LivePageNextDto
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

/// Adds pattern-matching-related methods to [LivePageNextDto].
extension LivePageNextDtoPatterns on LivePageNextDto {
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
    TResult Function(_LivePageNextDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LivePageNextDto() when $default != null:
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
    TResult Function(_LivePageNextDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePageNextDto():
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
    TResult? Function(_LivePageNextDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LivePageNextDto() when $default != null:
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
      case _LivePageNextDto() when $default != null:
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
      case _LivePageNextDto():
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
      case _LivePageNextDto() when $default != null:
        return $default(_that.concurrentUserCount, _that.liveId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LivePageNextDto implements LivePageNextDto {
  const _LivePageNextDto({this.concurrentUserCount, this.liveId});
  factory _LivePageNextDto.fromJson(Map<String, dynamic> json) =>
      _$LivePageNextDtoFromJson(json);

  @override
  final int? concurrentUserCount;
  @override
  final int? liveId;

  /// Create a copy of LivePageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LivePageNextDtoCopyWith<_LivePageNextDto> get copyWith =>
      __$LivePageNextDtoCopyWithImpl<_LivePageNextDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LivePageNextDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LivePageNextDto &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'LivePageNextDto(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class _$LivePageNextDtoCopyWith<$Res>
    implements $LivePageNextDtoCopyWith<$Res> {
  factory _$LivePageNextDtoCopyWith(
    _LivePageNextDto value,
    $Res Function(_LivePageNextDto) _then,
  ) = __$LivePageNextDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class __$LivePageNextDtoCopyWithImpl<$Res>
    implements _$LivePageNextDtoCopyWith<$Res> {
  __$LivePageNextDtoCopyWithImpl(this._self, this._then);

  final _LivePageNextDto _self;
  final $Res Function(_LivePageNextDto) _then;

  /// Create a copy of LivePageNextDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? concurrentUserCount = freezed, Object? liveId = freezed}) {
    return _then(
      _LivePageNextDto(
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
mixin _$LiveDto {
  int get liveId;
  String get liveTitle;
  String? get liveImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  String? get openDate;
  bool get adult;
  List<String> get tags;
  String? get liveCategoryValue;
  LiveChannelDto? get channel;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;
  String? get membershipBenefitType;
  Map<String, dynamic>? get party;

  /// Create a copy of LiveDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveDtoCopyWith<LiveDto> get copyWith =>
      _$LiveDtoCopyWithImpl<LiveDto>(this as LiveDto, _$identity);

  /// Serializes this LiveDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveDto &&
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
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
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
    membershipBenefitType,
    const DeepCollectionEquality().hash(party),
  );

  @override
  String toString() {
    return 'LiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, liveCategoryValue: $liveCategoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, membershipBenefitType: $membershipBenefitType, party: $party)';
  }
}

/// @nodoc
abstract mixin class $LiveDtoCopyWith<$Res> {
  factory $LiveDtoCopyWith(LiveDto value, $Res Function(LiveDto) _then) =
      _$LiveDtoCopyWithImpl;
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
    LiveChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? membershipBenefitType,
    Map<String, dynamic>? party,
  });

  $LiveChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$LiveDtoCopyWithImpl<$Res> implements $LiveDtoCopyWith<$Res> {
  _$LiveDtoCopyWithImpl(this._self, this._then);

  final LiveDto _self;
  final $Res Function(LiveDto) _then;

  /// Create a copy of LiveDto
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
    Object? membershipBenefitType = freezed,
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
                  as LiveChannelDto?,
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
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self.party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }

  /// Create a copy of LiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $LiveChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LiveDto].
extension LiveDtoPatterns on LiveDto {
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
    TResult Function(_LiveDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveDto() when $default != null:
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
    TResult Function(_LiveDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDto():
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
    TResult? Function(_LiveDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDto() when $default != null:
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
      LiveChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? membershipBenefitType,
      Map<String, dynamic>? party,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveDto() when $default != null:
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
          _that.membershipBenefitType,
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
      LiveChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? membershipBenefitType,
      Map<String, dynamic>? party,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDto():
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
          _that.membershipBenefitType,
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
      LiveChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? membershipBenefitType,
      Map<String, dynamic>? party,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDto() when $default != null:
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
          _that.membershipBenefitType,
          _that.party,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LiveDto implements LiveDto {
  const _LiveDto({
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
    this.membershipBenefitType,
    final Map<String, dynamic>? party,
  }) : _tags = tags,
       _party = party;
  factory _LiveDto.fromJson(Map<String, dynamic> json) =>
      _$LiveDtoFromJson(json);

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
  final LiveChannelDto? channel;
  @override
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  @override
  final String? membershipBenefitType;
  final Map<String, dynamic>? _party;
  @override
  Map<String, dynamic>? get party {
    final value = _party;
    if (value == null) return null;
    if (_party is EqualUnmodifiableMapView) return _party;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of LiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveDtoCopyWith<_LiveDto> get copyWith =>
      __$LiveDtoCopyWithImpl<_LiveDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LiveDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveDto &&
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
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
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
    membershipBenefitType,
    const DeepCollectionEquality().hash(_party),
  );

  @override
  String toString() {
    return 'LiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, liveCategoryValue: $liveCategoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, membershipBenefitType: $membershipBenefitType, party: $party)';
  }
}

/// @nodoc
abstract mixin class _$LiveDtoCopyWith<$Res> implements $LiveDtoCopyWith<$Res> {
  factory _$LiveDtoCopyWith(_LiveDto value, $Res Function(_LiveDto) _then) =
      __$LiveDtoCopyWithImpl;
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
    LiveChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? membershipBenefitType,
    Map<String, dynamic>? party,
  });

  @override
  $LiveChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$LiveDtoCopyWithImpl<$Res> implements _$LiveDtoCopyWith<$Res> {
  __$LiveDtoCopyWithImpl(this._self, this._then);

  final _LiveDto _self;
  final $Res Function(_LiveDto) _then;

  /// Create a copy of LiveDto
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
    Object? membershipBenefitType = freezed,
    Object? party = freezed,
  }) {
    return _then(
      _LiveDto(
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
                  as LiveChannelDto?,
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
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self._party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }

  /// Create a copy of LiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $LiveChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$LiveStatusDto {
  String get liveTitle;
  String get status;
  int get concurrentUserCount;
  bool get adult;
  String? get openDate;
  String? get chatChannelId;
  List<String> get tags;
  String? get liveCategoryValue;
  String? get categoryType;
  String? get liveCategory;
  String? get userAdultStatus;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;
  String? get channelId;
  bool get krOnlyViewing;
  bool get timeMachineActive;
  String? get membershipBenefitType;
  List<String>? get liveTokenList;

  /// Create a copy of LiveStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveStatusDtoCopyWith<LiveStatusDto> get copyWith =>
      _$LiveStatusDtoCopyWithImpl<LiveStatusDto>(
        this as LiveStatusDto,
        _$identity,
      );

  /// Serializes this LiveStatusDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveStatusDto &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.krOnlyViewing, krOnlyViewing) ||
                other.krOnlyViewing == krOnlyViewing) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
            const DeepCollectionEquality().equals(
              other.liveTokenList,
              liveTokenList,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    liveTitle,
    status,
    concurrentUserCount,
    adult,
    openDate,
    chatChannelId,
    const DeepCollectionEquality().hash(tags),
    liveCategoryValue,
    categoryType,
    liveCategory,
    userAdultStatus,
    blindType,
    watchPartyTag,
    watchPartyType,
    channelId,
    krOnlyViewing,
    timeMachineActive,
    membershipBenefitType,
    const DeepCollectionEquality().hash(liveTokenList),
  ]);

  @override
  String toString() {
    return 'LiveStatusDto(liveTitle: $liveTitle, status: $status, concurrentUserCount: $concurrentUserCount, adult: $adult, openDate: $openDate, chatChannelId: $chatChannelId, tags: $tags, liveCategoryValue: $liveCategoryValue, categoryType: $categoryType, liveCategory: $liveCategory, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, channelId: $channelId, krOnlyViewing: $krOnlyViewing, timeMachineActive: $timeMachineActive, membershipBenefitType: $membershipBenefitType, liveTokenList: $liveTokenList)';
  }
}

/// @nodoc
abstract mixin class $LiveStatusDtoCopyWith<$Res> {
  factory $LiveStatusDtoCopyWith(
    LiveStatusDto value,
    $Res Function(LiveStatusDto) _then,
  ) = _$LiveStatusDtoCopyWithImpl;
  @useResult
  $Res call({
    String liveTitle,
    String status,
    int concurrentUserCount,
    bool adult,
    String? openDate,
    String? chatChannelId,
    List<String> tags,
    String? liveCategoryValue,
    String? categoryType,
    String? liveCategory,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
    bool krOnlyViewing,
    bool timeMachineActive,
    String? membershipBenefitType,
    List<String>? liveTokenList,
  });
}

/// @nodoc
class _$LiveStatusDtoCopyWithImpl<$Res>
    implements $LiveStatusDtoCopyWith<$Res> {
  _$LiveStatusDtoCopyWithImpl(this._self, this._then);

  final LiveStatusDto _self;
  final $Res Function(LiveStatusDto) _then;

  /// Create a copy of LiveStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveTitle = null,
    Object? status = null,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? openDate = freezed,
    Object? chatChannelId = freezed,
    Object? tags = null,
    Object? liveCategoryValue = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? userAdultStatus = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? channelId = freezed,
    Object? krOnlyViewing = null,
    Object? timeMachineActive = null,
    Object? membershipBenefitType = freezed,
    Object? liveTokenList = freezed,
  }) {
    return _then(
      _self.copyWith(
        liveTitle: null == liveTitle
            ? _self.liveTitle
            : liveTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        openDate: freezed == openDate
            ? _self.openDate
            : openDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        chatChannelId: freezed == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _self.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveCategory: freezed == liveCategory
            ? _self.liveCategory
            : liveCategory // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        krOnlyViewing: null == krOnlyViewing
            ? _self.krOnlyViewing
            : krOnlyViewing // ignore: cast_nullable_to_non_nullable
                  as bool,
        timeMachineActive: null == timeMachineActive
            ? _self.timeMachineActive
            : timeMachineActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveTokenList: freezed == liveTokenList
            ? _self.liveTokenList
            : liveTokenList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [LiveStatusDto].
extension LiveStatusDtoPatterns on LiveStatusDto {
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
    TResult Function(_LiveStatusDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveStatusDto() when $default != null:
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
    TResult Function(_LiveStatusDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveStatusDto():
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
    TResult? Function(_LiveStatusDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveStatusDto() when $default != null:
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
      String liveTitle,
      String status,
      int concurrentUserCount,
      bool adult,
      String? openDate,
      String? chatChannelId,
      List<String> tags,
      String? liveCategoryValue,
      String? categoryType,
      String? liveCategory,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
      bool krOnlyViewing,
      bool timeMachineActive,
      String? membershipBenefitType,
      List<String>? liveTokenList,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveStatusDto() when $default != null:
        return $default(
          _that.liveTitle,
          _that.status,
          _that.concurrentUserCount,
          _that.adult,
          _that.openDate,
          _that.chatChannelId,
          _that.tags,
          _that.liveCategoryValue,
          _that.categoryType,
          _that.liveCategory,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
          _that.krOnlyViewing,
          _that.timeMachineActive,
          _that.membershipBenefitType,
          _that.liveTokenList,
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
      String liveTitle,
      String status,
      int concurrentUserCount,
      bool adult,
      String? openDate,
      String? chatChannelId,
      List<String> tags,
      String? liveCategoryValue,
      String? categoryType,
      String? liveCategory,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
      bool krOnlyViewing,
      bool timeMachineActive,
      String? membershipBenefitType,
      List<String>? liveTokenList,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveStatusDto():
        return $default(
          _that.liveTitle,
          _that.status,
          _that.concurrentUserCount,
          _that.adult,
          _that.openDate,
          _that.chatChannelId,
          _that.tags,
          _that.liveCategoryValue,
          _that.categoryType,
          _that.liveCategory,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
          _that.krOnlyViewing,
          _that.timeMachineActive,
          _that.membershipBenefitType,
          _that.liveTokenList,
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
      String liveTitle,
      String status,
      int concurrentUserCount,
      bool adult,
      String? openDate,
      String? chatChannelId,
      List<String> tags,
      String? liveCategoryValue,
      String? categoryType,
      String? liveCategory,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
      bool krOnlyViewing,
      bool timeMachineActive,
      String? membershipBenefitType,
      List<String>? liveTokenList,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveStatusDto() when $default != null:
        return $default(
          _that.liveTitle,
          _that.status,
          _that.concurrentUserCount,
          _that.adult,
          _that.openDate,
          _that.chatChannelId,
          _that.tags,
          _that.liveCategoryValue,
          _that.categoryType,
          _that.liveCategory,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
          _that.krOnlyViewing,
          _that.timeMachineActive,
          _that.membershipBenefitType,
          _that.liveTokenList,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LiveStatusDto implements LiveStatusDto {
  const _LiveStatusDto({
    this.liveTitle = '',
    this.status = '',
    this.concurrentUserCount = 0,
    this.adult = false,
    this.openDate,
    this.chatChannelId,
    final List<String> tags = const <String>[],
    this.liveCategoryValue,
    this.categoryType,
    this.liveCategory,
    this.userAdultStatus,
    this.blindType,
    this.watchPartyTag,
    this.watchPartyType,
    this.channelId,
    this.krOnlyViewing = false,
    this.timeMachineActive = false,
    this.membershipBenefitType,
    final List<String>? liveTokenList,
  }) : _tags = tags,
       _liveTokenList = liveTokenList;
  factory _LiveStatusDto.fromJson(Map<String, dynamic> json) =>
      _$LiveStatusDtoFromJson(json);

  @override
  @JsonKey()
  final String liveTitle;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final int concurrentUserCount;
  @override
  @JsonKey()
  final bool adult;
  @override
  final String? openDate;
  @override
  final String? chatChannelId;
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
  final String? categoryType;
  @override
  final String? liveCategory;
  @override
  final String? userAdultStatus;
  @override
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  @override
  final String? channelId;
  @override
  @JsonKey()
  final bool krOnlyViewing;
  @override
  @JsonKey()
  final bool timeMachineActive;
  @override
  final String? membershipBenefitType;
  final List<String>? _liveTokenList;
  @override
  List<String>? get liveTokenList {
    final value = _liveTokenList;
    if (value == null) return null;
    if (_liveTokenList is EqualUnmodifiableListView) return _liveTokenList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of LiveStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveStatusDtoCopyWith<_LiveStatusDto> get copyWith =>
      __$LiveStatusDtoCopyWithImpl<_LiveStatusDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LiveStatusDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveStatusDto &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.krOnlyViewing, krOnlyViewing) ||
                other.krOnlyViewing == krOnlyViewing) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
            const DeepCollectionEquality().equals(
              other._liveTokenList,
              _liveTokenList,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    liveTitle,
    status,
    concurrentUserCount,
    adult,
    openDate,
    chatChannelId,
    const DeepCollectionEquality().hash(_tags),
    liveCategoryValue,
    categoryType,
    liveCategory,
    userAdultStatus,
    blindType,
    watchPartyTag,
    watchPartyType,
    channelId,
    krOnlyViewing,
    timeMachineActive,
    membershipBenefitType,
    const DeepCollectionEquality().hash(_liveTokenList),
  ]);

  @override
  String toString() {
    return 'LiveStatusDto(liveTitle: $liveTitle, status: $status, concurrentUserCount: $concurrentUserCount, adult: $adult, openDate: $openDate, chatChannelId: $chatChannelId, tags: $tags, liveCategoryValue: $liveCategoryValue, categoryType: $categoryType, liveCategory: $liveCategory, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, channelId: $channelId, krOnlyViewing: $krOnlyViewing, timeMachineActive: $timeMachineActive, membershipBenefitType: $membershipBenefitType, liveTokenList: $liveTokenList)';
  }
}

/// @nodoc
abstract mixin class _$LiveStatusDtoCopyWith<$Res>
    implements $LiveStatusDtoCopyWith<$Res> {
  factory _$LiveStatusDtoCopyWith(
    _LiveStatusDto value,
    $Res Function(_LiveStatusDto) _then,
  ) = __$LiveStatusDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String liveTitle,
    String status,
    int concurrentUserCount,
    bool adult,
    String? openDate,
    String? chatChannelId,
    List<String> tags,
    String? liveCategoryValue,
    String? categoryType,
    String? liveCategory,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
    bool krOnlyViewing,
    bool timeMachineActive,
    String? membershipBenefitType,
    List<String>? liveTokenList,
  });
}

/// @nodoc
class __$LiveStatusDtoCopyWithImpl<$Res>
    implements _$LiveStatusDtoCopyWith<$Res> {
  __$LiveStatusDtoCopyWithImpl(this._self, this._then);

  final _LiveStatusDto _self;
  final $Res Function(_LiveStatusDto) _then;

  /// Create a copy of LiveStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? liveTitle = null,
    Object? status = null,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? openDate = freezed,
    Object? chatChannelId = freezed,
    Object? tags = null,
    Object? liveCategoryValue = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? userAdultStatus = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? channelId = freezed,
    Object? krOnlyViewing = null,
    Object? timeMachineActive = null,
    Object? membershipBenefitType = freezed,
    Object? liveTokenList = freezed,
  }) {
    return _then(
      _LiveStatusDto(
        liveTitle: null == liveTitle
            ? _self.liveTitle
            : liveTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        openDate: freezed == openDate
            ? _self.openDate
            : openDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        chatChannelId: freezed == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveCategory: freezed == liveCategory
            ? _self.liveCategory
            : liveCategory // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        krOnlyViewing: null == krOnlyViewing
            ? _self.krOnlyViewing
            : krOnlyViewing // ignore: cast_nullable_to_non_nullable
                  as bool,
        timeMachineActive: null == timeMachineActive
            ? _self.timeMachineActive
            : timeMachineActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveTokenList: freezed == liveTokenList
            ? _self._liveTokenList
            : liveTokenList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
mixin _$LiveDetailDto {
  int get liveId;
  String get liveTitle;
  String get status;
  String? get liveImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  String? get openDate;
  bool get adult;
  List<String> get tags;
  String? get chatChannelId;
  String? get liveCategoryValue;
  String? get categoryType;
  String? get liveCategory;
  String? get livePlaybackJson;
  LiveChannelDto? get channel;
  String? get userAdultStatus;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;
  bool get timeMachineActive;
  bool get timeMachinePlayback;
  String? get membershipBenefitType;
  Map<String, dynamic>? get party;

  /// Create a copy of LiveDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveDetailDtoCopyWith<LiveDetailDto> get copyWith =>
      _$LiveDetailDtoCopyWithImpl<LiveDetailDto>(
        this as LiveDetailDto,
        _$identity,
      );

  /// Serializes this LiveDetailDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveDetailDto &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.status, status) || other.status == status) &&
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
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.livePlaybackJson, livePlaybackJson) ||
                other.livePlaybackJson == livePlaybackJson) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.timeMachinePlayback, timeMachinePlayback) ||
                other.timeMachinePlayback == timeMachinePlayback) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
            const DeepCollectionEquality().equals(other.party, party));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    liveId,
    liveTitle,
    status,
    liveImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    openDate,
    adult,
    const DeepCollectionEquality().hash(tags),
    chatChannelId,
    liveCategoryValue,
    categoryType,
    liveCategory,
    livePlaybackJson,
    channel,
    userAdultStatus,
    blindType,
    watchPartyTag,
    watchPartyType,
    timeMachineActive,
    timeMachinePlayback,
    membershipBenefitType,
    const DeepCollectionEquality().hash(party),
  ]);

  @override
  String toString() {
    return 'LiveDetailDto(liveId: $liveId, liveTitle: $liveTitle, status: $status, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, chatChannelId: $chatChannelId, liveCategoryValue: $liveCategoryValue, categoryType: $categoryType, liveCategory: $liveCategory, livePlaybackJson: $livePlaybackJson, channel: $channel, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, timeMachineActive: $timeMachineActive, timeMachinePlayback: $timeMachinePlayback, membershipBenefitType: $membershipBenefitType, party: $party)';
  }
}

/// @nodoc
abstract mixin class $LiveDetailDtoCopyWith<$Res> {
  factory $LiveDetailDtoCopyWith(
    LiveDetailDto value,
    $Res Function(LiveDetailDto) _then,
  ) = _$LiveDetailDtoCopyWithImpl;
  @useResult
  $Res call({
    int liveId,
    String liveTitle,
    String status,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    String? openDate,
    bool adult,
    List<String> tags,
    String? chatChannelId,
    String? liveCategoryValue,
    String? categoryType,
    String? liveCategory,
    String? livePlaybackJson,
    LiveChannelDto? channel,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    bool timeMachineActive,
    bool timeMachinePlayback,
    String? membershipBenefitType,
    Map<String, dynamic>? party,
  });

  $LiveChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$LiveDetailDtoCopyWithImpl<$Res>
    implements $LiveDetailDtoCopyWith<$Res> {
  _$LiveDetailDtoCopyWithImpl(this._self, this._then);

  final LiveDetailDto _self;
  final $Res Function(LiveDetailDto) _then;

  /// Create a copy of LiveDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = null,
    Object? liveTitle = null,
    Object? status = null,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? chatChannelId = freezed,
    Object? liveCategoryValue = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? livePlaybackJson = freezed,
    Object? channel = freezed,
    Object? userAdultStatus = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? timeMachineActive = null,
    Object? timeMachinePlayback = null,
    Object? membershipBenefitType = freezed,
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
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
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
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveCategory: freezed == liveCategory
            ? _self.liveCategory
            : liveCategory // ignore: cast_nullable_to_non_nullable
                  as String?,
        livePlaybackJson: freezed == livePlaybackJson
            ? _self.livePlaybackJson
            : livePlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as LiveChannelDto?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        timeMachineActive: null == timeMachineActive
            ? _self.timeMachineActive
            : timeMachineActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        timeMachinePlayback: null == timeMachinePlayback
            ? _self.timeMachinePlayback
            : timeMachinePlayback // ignore: cast_nullable_to_non_nullable
                  as bool,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self.party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }

  /// Create a copy of LiveDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $LiveChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LiveDetailDto].
extension LiveDetailDtoPatterns on LiveDetailDto {
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
    TResult Function(_LiveDetailDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveDetailDto() when $default != null:
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
    TResult Function(_LiveDetailDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDetailDto():
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
    TResult? Function(_LiveDetailDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDetailDto() when $default != null:
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
      String status,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? chatChannelId,
      String? liveCategoryValue,
      String? categoryType,
      String? liveCategory,
      String? livePlaybackJson,
      LiveChannelDto? channel,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      bool timeMachineActive,
      bool timeMachinePlayback,
      String? membershipBenefitType,
      Map<String, dynamic>? party,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveDetailDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.status,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.liveCategoryValue,
          _that.categoryType,
          _that.liveCategory,
          _that.livePlaybackJson,
          _that.channel,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.timeMachineActive,
          _that.timeMachinePlayback,
          _that.membershipBenefitType,
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
      String status,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? chatChannelId,
      String? liveCategoryValue,
      String? categoryType,
      String? liveCategory,
      String? livePlaybackJson,
      LiveChannelDto? channel,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      bool timeMachineActive,
      bool timeMachinePlayback,
      String? membershipBenefitType,
      Map<String, dynamic>? party,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDetailDto():
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.status,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.liveCategoryValue,
          _that.categoryType,
          _that.liveCategory,
          _that.livePlaybackJson,
          _that.channel,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.timeMachineActive,
          _that.timeMachinePlayback,
          _that.membershipBenefitType,
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
      String status,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      List<String> tags,
      String? chatChannelId,
      String? liveCategoryValue,
      String? categoryType,
      String? liveCategory,
      String? livePlaybackJson,
      LiveChannelDto? channel,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      bool timeMachineActive,
      bool timeMachinePlayback,
      String? membershipBenefitType,
      Map<String, dynamic>? party,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveDetailDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.status,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.openDate,
          _that.adult,
          _that.tags,
          _that.chatChannelId,
          _that.liveCategoryValue,
          _that.categoryType,
          _that.liveCategory,
          _that.livePlaybackJson,
          _that.channel,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.timeMachineActive,
          _that.timeMachinePlayback,
          _that.membershipBenefitType,
          _that.party,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LiveDetailDto implements LiveDetailDto {
  const _LiveDetailDto({
    this.liveId = 0,
    this.liveTitle = '',
    this.status = '',
    this.liveImageUrl,
    this.defaultThumbnailImageUrl,
    this.concurrentUserCount = 0,
    this.openDate,
    this.adult = false,
    final List<String> tags = const <String>[],
    this.chatChannelId,
    this.liveCategoryValue,
    this.categoryType,
    this.liveCategory,
    this.livePlaybackJson,
    this.channel,
    this.userAdultStatus,
    this.blindType,
    this.watchPartyTag,
    this.watchPartyType,
    this.timeMachineActive = false,
    this.timeMachinePlayback = false,
    this.membershipBenefitType,
    final Map<String, dynamic>? party,
  }) : _tags = tags,
       _party = party;
  factory _LiveDetailDto.fromJson(Map<String, dynamic> json) =>
      _$LiveDetailDtoFromJson(json);

  @override
  @JsonKey()
  final int liveId;
  @override
  @JsonKey()
  final String liveTitle;
  @override
  @JsonKey()
  final String status;
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
  final String? categoryType;
  @override
  final String? liveCategory;
  @override
  final String? livePlaybackJson;
  @override
  final LiveChannelDto? channel;
  @override
  final String? userAdultStatus;
  @override
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  @override
  @JsonKey()
  final bool timeMachineActive;
  @override
  @JsonKey()
  final bool timeMachinePlayback;
  @override
  final String? membershipBenefitType;
  final Map<String, dynamic>? _party;
  @override
  Map<String, dynamic>? get party {
    final value = _party;
    if (value == null) return null;
    if (_party is EqualUnmodifiableMapView) return _party;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of LiveDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveDetailDtoCopyWith<_LiveDetailDto> get copyWith =>
      __$LiveDetailDtoCopyWithImpl<_LiveDetailDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LiveDetailDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveDetailDto &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.status, status) || other.status == status) &&
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
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.livePlaybackJson, livePlaybackJson) ||
                other.livePlaybackJson == livePlaybackJson) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.timeMachinePlayback, timeMachinePlayback) ||
                other.timeMachinePlayback == timeMachinePlayback) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
            const DeepCollectionEquality().equals(other._party, _party));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    liveId,
    liveTitle,
    status,
    liveImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    openDate,
    adult,
    const DeepCollectionEquality().hash(_tags),
    chatChannelId,
    liveCategoryValue,
    categoryType,
    liveCategory,
    livePlaybackJson,
    channel,
    userAdultStatus,
    blindType,
    watchPartyTag,
    watchPartyType,
    timeMachineActive,
    timeMachinePlayback,
    membershipBenefitType,
    const DeepCollectionEquality().hash(_party),
  ]);

  @override
  String toString() {
    return 'LiveDetailDto(liveId: $liveId, liveTitle: $liveTitle, status: $status, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, tags: $tags, chatChannelId: $chatChannelId, liveCategoryValue: $liveCategoryValue, categoryType: $categoryType, liveCategory: $liveCategory, livePlaybackJson: $livePlaybackJson, channel: $channel, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, timeMachineActive: $timeMachineActive, timeMachinePlayback: $timeMachinePlayback, membershipBenefitType: $membershipBenefitType, party: $party)';
  }
}

/// @nodoc
abstract mixin class _$LiveDetailDtoCopyWith<$Res>
    implements $LiveDetailDtoCopyWith<$Res> {
  factory _$LiveDetailDtoCopyWith(
    _LiveDetailDto value,
    $Res Function(_LiveDetailDto) _then,
  ) = __$LiveDetailDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    int liveId,
    String liveTitle,
    String status,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    String? openDate,
    bool adult,
    List<String> tags,
    String? chatChannelId,
    String? liveCategoryValue,
    String? categoryType,
    String? liveCategory,
    String? livePlaybackJson,
    LiveChannelDto? channel,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    bool timeMachineActive,
    bool timeMachinePlayback,
    String? membershipBenefitType,
    Map<String, dynamic>? party,
  });

  @override
  $LiveChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$LiveDetailDtoCopyWithImpl<$Res>
    implements _$LiveDetailDtoCopyWith<$Res> {
  __$LiveDetailDtoCopyWithImpl(this._self, this._then);

  final _LiveDetailDto _self;
  final $Res Function(_LiveDetailDto) _then;

  /// Create a copy of LiveDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? liveId = null,
    Object? liveTitle = null,
    Object? status = null,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? tags = null,
    Object? chatChannelId = freezed,
    Object? liveCategoryValue = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? livePlaybackJson = freezed,
    Object? channel = freezed,
    Object? userAdultStatus = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? timeMachineActive = null,
    Object? timeMachinePlayback = null,
    Object? membershipBenefitType = freezed,
    Object? party = freezed,
  }) {
    return _then(
      _LiveDetailDto(
        liveId: null == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int,
        liveTitle: null == liveTitle
            ? _self.liveTitle
            : liveTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
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
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveCategory: freezed == liveCategory
            ? _self.liveCategory
            : liveCategory // ignore: cast_nullable_to_non_nullable
                  as String?,
        livePlaybackJson: freezed == livePlaybackJson
            ? _self.livePlaybackJson
            : livePlaybackJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as LiveChannelDto?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        timeMachineActive: null == timeMachineActive
            ? _self.timeMachineActive
            : timeMachineActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        timeMachinePlayback: null == timeMachinePlayback
            ? _self.timeMachinePlayback
            : timeMachinePlayback // ignore: cast_nullable_to_non_nullable
                  as bool,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self._party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }

  /// Create a copy of LiveDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $LiveChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$LiveChannelDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  LiveChannelPersonalDataDto? get personalData;

  /// Create a copy of LiveChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveChannelDtoCopyWith<LiveChannelDto> get copyWith =>
      _$LiveChannelDtoCopyWithImpl<LiveChannelDto>(
        this as LiveChannelDto,
        _$identity,
      );

  /// Serializes this LiveChannelDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveChannelDto &&
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
    return 'LiveChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $LiveChannelDtoCopyWith<$Res> {
  factory $LiveChannelDtoCopyWith(
    LiveChannelDto value,
    $Res Function(LiveChannelDto) _then,
  ) = _$LiveChannelDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    LiveChannelPersonalDataDto? personalData,
  });

  $LiveChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$LiveChannelDtoCopyWithImpl<$Res>
    implements $LiveChannelDtoCopyWith<$Res> {
  _$LiveChannelDtoCopyWithImpl(this._self, this._then);

  final LiveChannelDto _self;
  final $Res Function(LiveChannelDto) _then;

  /// Create a copy of LiveChannelDto
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
                  as LiveChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of LiveChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $LiveChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LiveChannelDto].
extension LiveChannelDtoPatterns on LiveChannelDto {
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
    TResult Function(_LiveChannelDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveChannelDto() when $default != null:
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
    TResult Function(_LiveChannelDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelDto():
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
    TResult? Function(_LiveChannelDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelDto() when $default != null:
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
      LiveChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveChannelDto() when $default != null:
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
      LiveChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelDto():
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
      LiveChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelDto() when $default != null:
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
class _LiveChannelDto implements LiveChannelDto {
  const _LiveChannelDto({
    this.channelId = '',
    this.channelName = '',
    this.channelImageUrl,
    this.verifiedMark = false,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _LiveChannelDto.fromJson(Map<String, dynamic> json) =>
      _$LiveChannelDtoFromJson(json);

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
  final LiveChannelPersonalDataDto? personalData;

  /// Create a copy of LiveChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveChannelDtoCopyWith<_LiveChannelDto> get copyWith =>
      __$LiveChannelDtoCopyWithImpl<_LiveChannelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LiveChannelDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveChannelDto &&
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
    return 'LiveChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$LiveChannelDtoCopyWith<$Res>
    implements $LiveChannelDtoCopyWith<$Res> {
  factory _$LiveChannelDtoCopyWith(
    _LiveChannelDto value,
    $Res Function(_LiveChannelDto) _then,
  ) = __$LiveChannelDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    LiveChannelPersonalDataDto? personalData,
  });

  @override
  $LiveChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$LiveChannelDtoCopyWithImpl<$Res>
    implements _$LiveChannelDtoCopyWith<$Res> {
  __$LiveChannelDtoCopyWithImpl(this._self, this._then);

  final _LiveChannelDto _self;
  final $Res Function(_LiveChannelDto) _then;

  /// Create a copy of LiveChannelDto
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
      _LiveChannelDto(
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
                  as LiveChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of LiveChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $LiveChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$LiveChannelPersonalDataDto {
  LiveChannelPersonalFollowingDto? get following;
  bool get privateUserBlock;

  /// Create a copy of LiveChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveChannelPersonalDataDtoCopyWith<LiveChannelPersonalDataDto>
  get copyWith =>
      _$LiveChannelPersonalDataDtoCopyWithImpl<LiveChannelPersonalDataDto>(
        this as LiveChannelPersonalDataDto,
        _$identity,
      );

  /// Serializes this LiveChannelPersonalDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveChannelPersonalDataDto &&
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
    return 'LiveChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $LiveChannelPersonalDataDtoCopyWith<$Res> {
  factory $LiveChannelPersonalDataDtoCopyWith(
    LiveChannelPersonalDataDto value,
    $Res Function(LiveChannelPersonalDataDto) _then,
  ) = _$LiveChannelPersonalDataDtoCopyWithImpl;
  @useResult
  $Res call({
    LiveChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  $LiveChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$LiveChannelPersonalDataDtoCopyWithImpl<$Res>
    implements $LiveChannelPersonalDataDtoCopyWith<$Res> {
  _$LiveChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final LiveChannelPersonalDataDto _self;
  final $Res Function(LiveChannelPersonalDataDto) _then;

  /// Create a copy of LiveChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as LiveChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of LiveChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $LiveChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LiveChannelPersonalDataDto].
extension LiveChannelPersonalDataDtoPatterns on LiveChannelPersonalDataDto {
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
    TResult Function(_LiveChannelPersonalDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveChannelPersonalDataDto() when $default != null:
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
    TResult Function(_LiveChannelPersonalDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelPersonalDataDto():
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
    TResult? Function(_LiveChannelPersonalDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelPersonalDataDto() when $default != null:
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
      LiveChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveChannelPersonalDataDto() when $default != null:
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
      LiveChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelPersonalDataDto():
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
      LiveChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LiveChannelPersonalDataDto implements LiveChannelPersonalDataDto {
  const _LiveChannelPersonalDataDto({
    this.following,
    this.privateUserBlock = false,
  });
  factory _LiveChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$LiveChannelPersonalDataDtoFromJson(json);

  @override
  final LiveChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool privateUserBlock;

  /// Create a copy of LiveChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveChannelPersonalDataDtoCopyWith<_LiveChannelPersonalDataDto>
  get copyWith =>
      __$LiveChannelPersonalDataDtoCopyWithImpl<_LiveChannelPersonalDataDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$LiveChannelPersonalDataDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveChannelPersonalDataDto &&
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
    return 'LiveChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$LiveChannelPersonalDataDtoCopyWith<$Res>
    implements $LiveChannelPersonalDataDtoCopyWith<$Res> {
  factory _$LiveChannelPersonalDataDtoCopyWith(
    _LiveChannelPersonalDataDto value,
    $Res Function(_LiveChannelPersonalDataDto) _then,
  ) = __$LiveChannelPersonalDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    LiveChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  @override
  $LiveChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$LiveChannelPersonalDataDtoCopyWithImpl<$Res>
    implements _$LiveChannelPersonalDataDtoCopyWith<$Res> {
  __$LiveChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final _LiveChannelPersonalDataDto _self;
  final $Res Function(_LiveChannelPersonalDataDto) _then;

  /// Create a copy of LiveChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _LiveChannelPersonalDataDto(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as LiveChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of LiveChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $LiveChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// @nodoc
mixin _$LiveChannelPersonalFollowingDto {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of LiveChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveChannelPersonalFollowingDtoCopyWith<LiveChannelPersonalFollowingDto>
  get copyWith =>
      _$LiveChannelPersonalFollowingDtoCopyWithImpl<
        LiveChannelPersonalFollowingDto
      >(this as LiveChannelPersonalFollowingDto, _$identity);

  /// Serializes this LiveChannelPersonalFollowingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveChannelPersonalFollowingDto &&
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
    return 'LiveChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $LiveChannelPersonalFollowingDtoCopyWith<$Res> {
  factory $LiveChannelPersonalFollowingDtoCopyWith(
    LiveChannelPersonalFollowingDto value,
    $Res Function(LiveChannelPersonalFollowingDto) _then,
  ) = _$LiveChannelPersonalFollowingDtoCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$LiveChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements $LiveChannelPersonalFollowingDtoCopyWith<$Res> {
  _$LiveChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final LiveChannelPersonalFollowingDto _self;
  final $Res Function(LiveChannelPersonalFollowingDto) _then;

  /// Create a copy of LiveChannelPersonalFollowingDto
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

/// Adds pattern-matching-related methods to [LiveChannelPersonalFollowingDto].
extension LiveChannelPersonalFollowingDtoPatterns
    on LiveChannelPersonalFollowingDto {
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
    TResult Function(_LiveChannelPersonalFollowingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveChannelPersonalFollowingDto() when $default != null:
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
    TResult Function(_LiveChannelPersonalFollowingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelPersonalFollowingDto():
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
    TResult? Function(_LiveChannelPersonalFollowingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveChannelPersonalFollowingDto() when $default != null:
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
      case _LiveChannelPersonalFollowingDto() when $default != null:
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
      case _LiveChannelPersonalFollowingDto():
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
      case _LiveChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LiveChannelPersonalFollowingDto
    implements LiveChannelPersonalFollowingDto {
  const _LiveChannelPersonalFollowingDto({
    this.following = false,
    this.notification = false,
    this.followDate,
  });
  factory _LiveChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$LiveChannelPersonalFollowingDtoFromJson(json);

  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of LiveChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveChannelPersonalFollowingDtoCopyWith<_LiveChannelPersonalFollowingDto>
  get copyWith =>
      __$LiveChannelPersonalFollowingDtoCopyWithImpl<
        _LiveChannelPersonalFollowingDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LiveChannelPersonalFollowingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveChannelPersonalFollowingDto &&
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
    return 'LiveChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$LiveChannelPersonalFollowingDtoCopyWith<$Res>
    implements $LiveChannelPersonalFollowingDtoCopyWith<$Res> {
  factory _$LiveChannelPersonalFollowingDtoCopyWith(
    _LiveChannelPersonalFollowingDto value,
    $Res Function(_LiveChannelPersonalFollowingDto) _then,
  ) = __$LiveChannelPersonalFollowingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$LiveChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements _$LiveChannelPersonalFollowingDtoCopyWith<$Res> {
  __$LiveChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final _LiveChannelPersonalFollowingDto _self;
  final $Res Function(_LiveChannelPersonalFollowingDto) _then;

  /// Create a copy of LiveChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _LiveChannelPersonalFollowingDto(
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
