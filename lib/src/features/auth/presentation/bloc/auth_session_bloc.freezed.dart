// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthSessionEvent {
  Completer<bool>? get completer;

  /// Create a copy of AuthSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthSessionEventCopyWith<AuthSessionEvent> get copyWith =>
      _$AuthSessionEventCopyWithImpl<AuthSessionEvent>(
        this as AuthSessionEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSessionEvent &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completer);

  @override
  String toString() {
    return 'AuthSessionEvent(completer: $completer)';
  }
}

/// @nodoc
abstract mixin class $AuthSessionEventCopyWith<$Res> {
  factory $AuthSessionEventCopyWith(
    AuthSessionEvent value,
    $Res Function(AuthSessionEvent) _then,
  ) = _$AuthSessionEventCopyWithImpl;
  @useResult
  $Res call({Completer<bool>? completer});
}

/// @nodoc
class _$AuthSessionEventCopyWithImpl<$Res>
    implements $AuthSessionEventCopyWith<$Res> {
  _$AuthSessionEventCopyWithImpl(this._self, this._then);

  final AuthSessionEvent _self;
  final $Res Function(AuthSessionEvent) _then;

  /// Create a copy of AuthSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? completer = freezed}) {
    return _then(
      _self.copyWith(
        completer: freezed == completer
            ? _self.completer
            : completer // ignore: cast_nullable_to_non_nullable
                  as Completer<bool>?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AuthSessionEvent].
extension AuthSessionEventPatterns on AuthSessionEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RestoreRequested value)? restoreRequested,
    TResult Function(_CaptureRequested value)? captureRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RestoreRequested() when restoreRequested != null:
        return restoreRequested(_that);
      case _CaptureRequested() when captureRequested != null:
        return captureRequested(_that);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_RestoreRequested value) restoreRequested,
    required TResult Function(_CaptureRequested value) captureRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _RestoreRequested():
        return restoreRequested(_that);
      case _CaptureRequested():
        return captureRequested(_that);
      case _LogoutRequested():
        return logoutRequested(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RestoreRequested value)? restoreRequested,
    TResult? Function(_CaptureRequested value)? captureRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _RestoreRequested() when restoreRequested != null:
        return restoreRequested(_that);
      case _CaptureRequested() when captureRequested != null:
        return captureRequested(_that);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<bool>? completer)? restoreRequested,
    TResult Function(Completer<bool>? completer)? captureRequested,
    TResult Function(Completer<bool>? completer)? logoutRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RestoreRequested() when restoreRequested != null:
        return restoreRequested(_that.completer);
      case _CaptureRequested() when captureRequested != null:
        return captureRequested(_that.completer);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that.completer);
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
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<bool>? completer) restoreRequested,
    required TResult Function(Completer<bool>? completer) captureRequested,
    required TResult Function(Completer<bool>? completer) logoutRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _RestoreRequested():
        return restoreRequested(_that.completer);
      case _CaptureRequested():
        return captureRequested(_that.completer);
      case _LogoutRequested():
        return logoutRequested(_that.completer);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<bool>? completer)? restoreRequested,
    TResult? Function(Completer<bool>? completer)? captureRequested,
    TResult? Function(Completer<bool>? completer)? logoutRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _RestoreRequested() when restoreRequested != null:
        return restoreRequested(_that.completer);
      case _CaptureRequested() when captureRequested != null:
        return captureRequested(_that.completer);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that.completer);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RestoreRequested implements AuthSessionEvent {
  const _RestoreRequested({this.completer});

  @override
  final Completer<bool>? completer;

  /// Create a copy of AuthSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RestoreRequestedCopyWith<_RestoreRequested> get copyWith =>
      __$RestoreRequestedCopyWithImpl<_RestoreRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RestoreRequested &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completer);

  @override
  String toString() {
    return 'AuthSessionEvent.restoreRequested(completer: $completer)';
  }
}

/// @nodoc
abstract mixin class _$RestoreRequestedCopyWith<$Res>
    implements $AuthSessionEventCopyWith<$Res> {
  factory _$RestoreRequestedCopyWith(
    _RestoreRequested value,
    $Res Function(_RestoreRequested) _then,
  ) = __$RestoreRequestedCopyWithImpl;
  @override
  @useResult
  $Res call({Completer<bool>? completer});
}

/// @nodoc
class __$RestoreRequestedCopyWithImpl<$Res>
    implements _$RestoreRequestedCopyWith<$Res> {
  __$RestoreRequestedCopyWithImpl(this._self, this._then);

  final _RestoreRequested _self;
  final $Res Function(_RestoreRequested) _then;

  /// Create a copy of AuthSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? completer = freezed}) {
    return _then(
      _RestoreRequested(
        completer: freezed == completer
            ? _self.completer
            : completer // ignore: cast_nullable_to_non_nullable
                  as Completer<bool>?,
      ),
    );
  }
}

/// @nodoc

class _CaptureRequested implements AuthSessionEvent {
  const _CaptureRequested({this.completer});

  @override
  final Completer<bool>? completer;

  /// Create a copy of AuthSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CaptureRequestedCopyWith<_CaptureRequested> get copyWith =>
      __$CaptureRequestedCopyWithImpl<_CaptureRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CaptureRequested &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completer);

  @override
  String toString() {
    return 'AuthSessionEvent.captureRequested(completer: $completer)';
  }
}

/// @nodoc
abstract mixin class _$CaptureRequestedCopyWith<$Res>
    implements $AuthSessionEventCopyWith<$Res> {
  factory _$CaptureRequestedCopyWith(
    _CaptureRequested value,
    $Res Function(_CaptureRequested) _then,
  ) = __$CaptureRequestedCopyWithImpl;
  @override
  @useResult
  $Res call({Completer<bool>? completer});
}

/// @nodoc
class __$CaptureRequestedCopyWithImpl<$Res>
    implements _$CaptureRequestedCopyWith<$Res> {
  __$CaptureRequestedCopyWithImpl(this._self, this._then);

  final _CaptureRequested _self;
  final $Res Function(_CaptureRequested) _then;

  /// Create a copy of AuthSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? completer = freezed}) {
    return _then(
      _CaptureRequested(
        completer: freezed == completer
            ? _self.completer
            : completer // ignore: cast_nullable_to_non_nullable
                  as Completer<bool>?,
      ),
    );
  }
}

/// @nodoc

class _LogoutRequested implements AuthSessionEvent {
  const _LogoutRequested({this.completer});

  @override
  final Completer<bool>? completer;

  /// Create a copy of AuthSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LogoutRequestedCopyWith<_LogoutRequested> get copyWith =>
      __$LogoutRequestedCopyWithImpl<_LogoutRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LogoutRequested &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completer);

  @override
  String toString() {
    return 'AuthSessionEvent.logoutRequested(completer: $completer)';
  }
}

/// @nodoc
abstract mixin class _$LogoutRequestedCopyWith<$Res>
    implements $AuthSessionEventCopyWith<$Res> {
  factory _$LogoutRequestedCopyWith(
    _LogoutRequested value,
    $Res Function(_LogoutRequested) _then,
  ) = __$LogoutRequestedCopyWithImpl;
  @override
  @useResult
  $Res call({Completer<bool>? completer});
}

/// @nodoc
class __$LogoutRequestedCopyWithImpl<$Res>
    implements _$LogoutRequestedCopyWith<$Res> {
  __$LogoutRequestedCopyWithImpl(this._self, this._then);

  final _LogoutRequested _self;
  final $Res Function(_LogoutRequested) _then;

  /// Create a copy of AuthSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? completer = freezed}) {
    return _then(
      _LogoutRequested(
        completer: freezed == completer
            ? _self.completer
            : completer // ignore: cast_nullable_to_non_nullable
                  as Completer<bool>?,
      ),
    );
  }
}

/// @nodoc
mixin _$AuthSessionState {
  NaverSessionCookie? get session;
  AuthSessionStatus get status;

  /// Create a copy of AuthSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthSessionStateCopyWith<AuthSessionState> get copyWith =>
      _$AuthSessionStateCopyWithImpl<AuthSessionState>(
        this as AuthSessionState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSessionState &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session, status);
}

/// @nodoc
abstract mixin class $AuthSessionStateCopyWith<$Res> {
  factory $AuthSessionStateCopyWith(
    AuthSessionState value,
    $Res Function(AuthSessionState) _then,
  ) = _$AuthSessionStateCopyWithImpl;
  @useResult
  $Res call({NaverSessionCookie? session, AuthSessionStatus status});

  $NaverSessionCookieCopyWith<$Res>? get session;
}

/// @nodoc
class _$AuthSessionStateCopyWithImpl<$Res>
    implements $AuthSessionStateCopyWith<$Res> {
  _$AuthSessionStateCopyWithImpl(this._self, this._then);

  final AuthSessionState _self;
  final $Res Function(AuthSessionState) _then;

  /// Create a copy of AuthSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? session = freezed, Object? status = null}) {
    return _then(
      _self.copyWith(
        session: freezed == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as NaverSessionCookie?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuthSessionStatus,
      ),
    );
  }

  /// Create a copy of AuthSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NaverSessionCookieCopyWith<$Res>? get session {
    if (_self.session == null) {
      return null;
    }

    return $NaverSessionCookieCopyWith<$Res>(_self.session!, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AuthSessionState].
extension AuthSessionStatePatterns on AuthSessionState {
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
    TResult Function(_AuthSessionState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionState() when $default != null:
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
    TResult Function(_AuthSessionState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionState():
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
    TResult? Function(_AuthSessionState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionState() when $default != null:
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
    TResult Function(NaverSessionCookie? session, AuthSessionStatus status)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionState() when $default != null:
        return $default(_that.session, _that.status);
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
    TResult Function(NaverSessionCookie? session, AuthSessionStatus status)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionState():
        return $default(_that.session, _that.status);
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
    TResult? Function(NaverSessionCookie? session, AuthSessionStatus status)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionState() when $default != null:
        return $default(_that.session, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuthSessionState extends AuthSessionState {
  const _AuthSessionState({
    this.session,
    this.status = AuthSessionStatus.unauthenticated,
  }) : super._();

  @override
  final NaverSessionCookie? session;
  @override
  @JsonKey()
  final AuthSessionStatus status;

  /// Create a copy of AuthSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthSessionStateCopyWith<_AuthSessionState> get copyWith =>
      __$AuthSessionStateCopyWithImpl<_AuthSessionState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthSessionState &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session, status);
}

/// @nodoc
abstract mixin class _$AuthSessionStateCopyWith<$Res>
    implements $AuthSessionStateCopyWith<$Res> {
  factory _$AuthSessionStateCopyWith(
    _AuthSessionState value,
    $Res Function(_AuthSessionState) _then,
  ) = __$AuthSessionStateCopyWithImpl;
  @override
  @useResult
  $Res call({NaverSessionCookie? session, AuthSessionStatus status});

  @override
  $NaverSessionCookieCopyWith<$Res>? get session;
}

/// @nodoc
class __$AuthSessionStateCopyWithImpl<$Res>
    implements _$AuthSessionStateCopyWith<$Res> {
  __$AuthSessionStateCopyWithImpl(this._self, this._then);

  final _AuthSessionState _self;
  final $Res Function(_AuthSessionState) _then;

  /// Create a copy of AuthSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? session = freezed, Object? status = null}) {
    return _then(
      _AuthSessionState(
        session: freezed == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as NaverSessionCookie?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuthSessionStatus,
      ),
    );
  }

  /// Create a copy of AuthSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NaverSessionCookieCopyWith<$Res>? get session {
    if (_self.session == null) {
      return null;
    }

    return $NaverSessionCookieCopyWith<$Res>(_self.session!, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}
