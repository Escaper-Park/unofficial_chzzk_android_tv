// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'naver_session_cookie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NaverSessionCookie {
  String get nidAut;
  String get nidSes;

  /// Create a copy of NaverSessionCookie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NaverSessionCookieCopyWith<NaverSessionCookie> get copyWith =>
      _$NaverSessionCookieCopyWithImpl<NaverSessionCookie>(
        this as NaverSessionCookie,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NaverSessionCookie &&
            (identical(other.nidAut, nidAut) || other.nidAut == nidAut) &&
            (identical(other.nidSes, nidSes) || other.nidSes == nidSes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nidAut, nidSes);
}

/// @nodoc
abstract mixin class $NaverSessionCookieCopyWith<$Res> {
  factory $NaverSessionCookieCopyWith(
    NaverSessionCookie value,
    $Res Function(NaverSessionCookie) _then,
  ) = _$NaverSessionCookieCopyWithImpl;
  @useResult
  $Res call({String nidAut, String nidSes});
}

/// @nodoc
class _$NaverSessionCookieCopyWithImpl<$Res>
    implements $NaverSessionCookieCopyWith<$Res> {
  _$NaverSessionCookieCopyWithImpl(this._self, this._then);

  final NaverSessionCookie _self;
  final $Res Function(NaverSessionCookie) _then;

  /// Create a copy of NaverSessionCookie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nidAut = null, Object? nidSes = null}) {
    return _then(
      _self.copyWith(
        nidAut: null == nidAut
            ? _self.nidAut
            : nidAut // ignore: cast_nullable_to_non_nullable
                  as String,
        nidSes: null == nidSes
            ? _self.nidSes
            : nidSes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [NaverSessionCookie].
extension NaverSessionCookiePatterns on NaverSessionCookie {
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
    TResult Function(_NaverSessionCookie value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NaverSessionCookie() when $default != null:
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
    TResult Function(_NaverSessionCookie value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NaverSessionCookie():
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
    TResult? Function(_NaverSessionCookie value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NaverSessionCookie() when $default != null:
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
    TResult Function(String nidAut, String nidSes)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NaverSessionCookie() when $default != null:
        return $default(_that.nidAut, _that.nidSes);
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
    TResult Function(String nidAut, String nidSes) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NaverSessionCookie():
        return $default(_that.nidAut, _that.nidSes);
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
    TResult? Function(String nidAut, String nidSes)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NaverSessionCookie() when $default != null:
        return $default(_that.nidAut, _that.nidSes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NaverSessionCookie extends NaverSessionCookie {
  const _NaverSessionCookie({required this.nidAut, required this.nidSes})
    : super._();

  @override
  final String nidAut;
  @override
  final String nidSes;

  /// Create a copy of NaverSessionCookie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NaverSessionCookieCopyWith<_NaverSessionCookie> get copyWith =>
      __$NaverSessionCookieCopyWithImpl<_NaverSessionCookie>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NaverSessionCookie &&
            (identical(other.nidAut, nidAut) || other.nidAut == nidAut) &&
            (identical(other.nidSes, nidSes) || other.nidSes == nidSes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nidAut, nidSes);
}

/// @nodoc
abstract mixin class _$NaverSessionCookieCopyWith<$Res>
    implements $NaverSessionCookieCopyWith<$Res> {
  factory _$NaverSessionCookieCopyWith(
    _NaverSessionCookie value,
    $Res Function(_NaverSessionCookie) _then,
  ) = __$NaverSessionCookieCopyWithImpl;
  @override
  @useResult
  $Res call({String nidAut, String nidSes});
}

/// @nodoc
class __$NaverSessionCookieCopyWithImpl<$Res>
    implements _$NaverSessionCookieCopyWith<$Res> {
  __$NaverSessionCookieCopyWithImpl(this._self, this._then);

  final _NaverSessionCookie _self;
  final $Res Function(_NaverSessionCookie) _then;

  /// Create a copy of NaverSessionCookie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? nidAut = null, Object? nidSes = null}) {
    return _then(
      _NaverSessionCookie(
        nidAut: null == nidAut
            ? _self.nidAut
            : nidAut // ignore: cast_nullable_to_non_nullable
                  as String,
        nidSes: null == nidSes
            ? _self.nidSes
            : nidSes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
