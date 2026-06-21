// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_keyboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TvKeyboardState {
  String get value;
  TvKeyboardInputMode get inputMode;
  bool get isShifted;
  bool get isCapsLocked;

  /// Create a copy of TvKeyboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TvKeyboardStateCopyWith<TvKeyboardState> get copyWith =>
      _$TvKeyboardStateCopyWithImpl<TvKeyboardState>(
        this as TvKeyboardState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TvKeyboardState &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.inputMode, inputMode) ||
                other.inputMode == inputMode) &&
            (identical(other.isShifted, isShifted) ||
                other.isShifted == isShifted) &&
            (identical(other.isCapsLocked, isCapsLocked) ||
                other.isCapsLocked == isCapsLocked));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, value, inputMode, isShifted, isCapsLocked);

  @override
  String toString() {
    return 'TvKeyboardState(value: $value, inputMode: $inputMode, isShifted: $isShifted, isCapsLocked: $isCapsLocked)';
  }
}

/// @nodoc
abstract mixin class $TvKeyboardStateCopyWith<$Res> {
  factory $TvKeyboardStateCopyWith(
    TvKeyboardState value,
    $Res Function(TvKeyboardState) _then,
  ) = _$TvKeyboardStateCopyWithImpl;
  @useResult
  $Res call({
    String value,
    TvKeyboardInputMode inputMode,
    bool isShifted,
    bool isCapsLocked,
  });
}

/// @nodoc
class _$TvKeyboardStateCopyWithImpl<$Res>
    implements $TvKeyboardStateCopyWith<$Res> {
  _$TvKeyboardStateCopyWithImpl(this._self, this._then);

  final TvKeyboardState _self;
  final $Res Function(TvKeyboardState) _then;

  /// Create a copy of TvKeyboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? inputMode = null,
    Object? isShifted = null,
    Object? isCapsLocked = null,
  }) {
    return _then(
      _self.copyWith(
        value: null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        inputMode: null == inputMode
            ? _self.inputMode
            : inputMode // ignore: cast_nullable_to_non_nullable
                  as TvKeyboardInputMode,
        isShifted: null == isShifted
            ? _self.isShifted
            : isShifted // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCapsLocked: null == isCapsLocked
            ? _self.isCapsLocked
            : isCapsLocked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [TvKeyboardState].
extension TvKeyboardStatePatterns on TvKeyboardState {
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
    TResult Function(_TvKeyboardState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvKeyboardState() when $default != null:
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
    TResult Function(_TvKeyboardState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvKeyboardState():
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
    TResult? Function(_TvKeyboardState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvKeyboardState() when $default != null:
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
      String value,
      TvKeyboardInputMode inputMode,
      bool isShifted,
      bool isCapsLocked,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvKeyboardState() when $default != null:
        return $default(
          _that.value,
          _that.inputMode,
          _that.isShifted,
          _that.isCapsLocked,
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
      String value,
      TvKeyboardInputMode inputMode,
      bool isShifted,
      bool isCapsLocked,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvKeyboardState():
        return $default(
          _that.value,
          _that.inputMode,
          _that.isShifted,
          _that.isCapsLocked,
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
      String value,
      TvKeyboardInputMode inputMode,
      bool isShifted,
      bool isCapsLocked,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvKeyboardState() when $default != null:
        return $default(
          _that.value,
          _that.inputMode,
          _that.isShifted,
          _that.isCapsLocked,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TvKeyboardState implements TvKeyboardState {
  const _TvKeyboardState({
    required this.value,
    required this.inputMode,
    required this.isShifted,
    required this.isCapsLocked,
  });

  @override
  final String value;
  @override
  final TvKeyboardInputMode inputMode;
  @override
  final bool isShifted;
  @override
  final bool isCapsLocked;

  /// Create a copy of TvKeyboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TvKeyboardStateCopyWith<_TvKeyboardState> get copyWith =>
      __$TvKeyboardStateCopyWithImpl<_TvKeyboardState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvKeyboardState &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.inputMode, inputMode) ||
                other.inputMode == inputMode) &&
            (identical(other.isShifted, isShifted) ||
                other.isShifted == isShifted) &&
            (identical(other.isCapsLocked, isCapsLocked) ||
                other.isCapsLocked == isCapsLocked));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, value, inputMode, isShifted, isCapsLocked);

  @override
  String toString() {
    return 'TvKeyboardState(value: $value, inputMode: $inputMode, isShifted: $isShifted, isCapsLocked: $isCapsLocked)';
  }
}

/// @nodoc
abstract mixin class _$TvKeyboardStateCopyWith<$Res>
    implements $TvKeyboardStateCopyWith<$Res> {
  factory _$TvKeyboardStateCopyWith(
    _TvKeyboardState value,
    $Res Function(_TvKeyboardState) _then,
  ) = __$TvKeyboardStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String value,
    TvKeyboardInputMode inputMode,
    bool isShifted,
    bool isCapsLocked,
  });
}

/// @nodoc
class __$TvKeyboardStateCopyWithImpl<$Res>
    implements _$TvKeyboardStateCopyWith<$Res> {
  __$TvKeyboardStateCopyWithImpl(this._self, this._then);

  final _TvKeyboardState _self;
  final $Res Function(_TvKeyboardState) _then;

  /// Create a copy of TvKeyboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? inputMode = null,
    Object? isShifted = null,
    Object? isCapsLocked = null,
  }) {
    return _then(
      _TvKeyboardState(
        value: null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        inputMode: null == inputMode
            ? _self.inputMode
            : inputMode // ignore: cast_nullable_to_non_nullable
                  as TvKeyboardInputMode,
        isShifted: null == isShifted
            ? _self.isShifted
            : isShifted // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCapsLocked: null == isCapsLocked
            ? _self.isCapsLocked
            : isCapsLocked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
