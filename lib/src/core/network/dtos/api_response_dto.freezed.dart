// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResponseDto<T> {
  int? get code;
  String? get message;
  T? get content;

  /// Create a copy of ApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiResponseDtoCopyWith<T, ApiResponseDto<T>> get copyWith =>
      _$ApiResponseDtoCopyWithImpl<T, ApiResponseDto<T>>(
        this as ApiResponseDto<T>,
        _$identity,
      );

  /// Serializes this ApiResponseDto to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiResponseDto<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    message,
    const DeepCollectionEquality().hash(content),
  );

  @override
  String toString() {
    return 'ApiResponseDto<$T>(code: $code, message: $message, content: $content)';
  }
}

/// @nodoc
abstract mixin class $ApiResponseDtoCopyWith<T, $Res> {
  factory $ApiResponseDtoCopyWith(
    ApiResponseDto<T> value,
    $Res Function(ApiResponseDto<T>) _then,
  ) = _$ApiResponseDtoCopyWithImpl;
  @useResult
  $Res call({int? code, String? message, T? content});
}

/// @nodoc
class _$ApiResponseDtoCopyWithImpl<T, $Res>
    implements $ApiResponseDtoCopyWith<T, $Res> {
  _$ApiResponseDtoCopyWithImpl(this._self, this._then);

  final ApiResponseDto<T> _self;
  final $Res Function(ApiResponseDto<T>) _then;

  /// Create a copy of ApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? content = freezed,
  }) {
    return _then(
      _self.copyWith(
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int?,
        message: freezed == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as T?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ApiResponseDto].
extension ApiResponseDtoPatterns<T> on ApiResponseDto<T> {
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
    TResult Function(_ApiResponseDto<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiResponseDto() when $default != null:
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
    TResult Function(_ApiResponseDto<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiResponseDto():
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
    TResult? Function(_ApiResponseDto<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiResponseDto() when $default != null:
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
    TResult Function(int? code, String? message, T? content)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiResponseDto() when $default != null:
        return $default(_that.code, _that.message, _that.content);
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
    TResult Function(int? code, String? message, T? content) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiResponseDto():
        return $default(_that.code, _that.message, _that.content);
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
    TResult? Function(int? code, String? message, T? content)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiResponseDto() when $default != null:
        return $default(_that.code, _that.message, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _ApiResponseDto<T> implements ApiResponseDto<T> {
  const _ApiResponseDto({this.code, this.message, this.content});
  factory _ApiResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseDtoFromJson(json, fromJsonT);

  @override
  final int? code;
  @override
  final String? message;
  @override
  final T? content;

  /// Create a copy of ApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApiResponseDtoCopyWith<T, _ApiResponseDto<T>> get copyWith =>
      __$ApiResponseDtoCopyWithImpl<T, _ApiResponseDto<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$ApiResponseDtoToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiResponseDto<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    message,
    const DeepCollectionEquality().hash(content),
  );

  @override
  String toString() {
    return 'ApiResponseDto<$T>(code: $code, message: $message, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$ApiResponseDtoCopyWith<T, $Res>
    implements $ApiResponseDtoCopyWith<T, $Res> {
  factory _$ApiResponseDtoCopyWith(
    _ApiResponseDto<T> value,
    $Res Function(_ApiResponseDto<T>) _then,
  ) = __$ApiResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? code, String? message, T? content});
}

/// @nodoc
class __$ApiResponseDtoCopyWithImpl<T, $Res>
    implements _$ApiResponseDtoCopyWith<T, $Res> {
  __$ApiResponseDtoCopyWithImpl(this._self, this._then);

  final _ApiResponseDto<T> _self;
  final $Res Function(_ApiResponseDto<T>) _then;

  /// Create a copy of ApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? content = freezed,
  }) {
    return _then(
      _ApiResponseDto<T>(
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int?,
        message: freezed == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as T?,
      ),
    );
  }
}
