// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthScreenEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthScreenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// @nodoc
class $AuthScreenEventCopyWith<$Res> {
  $AuthScreenEventCopyWith(
    AuthScreenEvent _,
    $Res Function(AuthScreenEvent) __,
  );
}

/// Adds pattern-matching-related methods to [AuthScreenEvent].
extension AuthScreenEventPatterns on AuthScreenEvent {
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
    TResult Function(_InputSelected value)? inputSelected,
    TResult Function(_KeyboardValueChanged value)? keyboardValueChanged,
    TResult Function(_KeyboardSubmitted value)? keyboardSubmitted,
    TResult Function(_KeyboardClosed value)? keyboardClosed,
    TResult Function(_PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(_ReloadRequested value)? reloadRequested,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_WebViewLoadingChanged value)? webViewLoadingChanged,
    TResult Function(_CaptchaRequirementChanged value)?
    captchaRequirementChanged,
    TResult Function(_LoginSubmissionStarted value)? loginSubmissionStarted,
    TResult Function(_SessionCaptureStarted value)? sessionCaptureStarted,
    TResult Function(_SessionCapturePending value)? sessionCapturePending,
    TResult Function(_LoginCompleted value)? loginCompleted,
    TResult Function(_FailureReported value)? failureReported,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InputSelected() when inputSelected != null:
        return inputSelected(_that);
      case _KeyboardValueChanged() when keyboardValueChanged != null:
        return keyboardValueChanged(_that);
      case _KeyboardSubmitted() when keyboardSubmitted != null:
        return keyboardSubmitted(_that);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed(_that);
      case _PasswordVisibilityToggled() when passwordVisibilityToggled != null:
        return passwordVisibilityToggled(_that);
      case _ReloadRequested() when reloadRequested != null:
        return reloadRequested(_that);
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that);
      case _WebViewLoadingChanged() when webViewLoadingChanged != null:
        return webViewLoadingChanged(_that);
      case _CaptchaRequirementChanged() when captchaRequirementChanged != null:
        return captchaRequirementChanged(_that);
      case _LoginSubmissionStarted() when loginSubmissionStarted != null:
        return loginSubmissionStarted(_that);
      case _SessionCaptureStarted() when sessionCaptureStarted != null:
        return sessionCaptureStarted(_that);
      case _SessionCapturePending() when sessionCapturePending != null:
        return sessionCapturePending(_that);
      case _LoginCompleted() when loginCompleted != null:
        return loginCompleted(_that);
      case _FailureReported() when failureReported != null:
        return failureReported(_that);
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
    required TResult Function(_InputSelected value) inputSelected,
    required TResult Function(_KeyboardValueChanged value) keyboardValueChanged,
    required TResult Function(_KeyboardSubmitted value) keyboardSubmitted,
    required TResult Function(_KeyboardClosed value) keyboardClosed,
    required TResult Function(_PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(_ReloadRequested value) reloadRequested,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_WebViewLoadingChanged value)
    webViewLoadingChanged,
    required TResult Function(_CaptchaRequirementChanged value)
    captchaRequirementChanged,
    required TResult Function(_LoginSubmissionStarted value)
    loginSubmissionStarted,
    required TResult Function(_SessionCaptureStarted value)
    sessionCaptureStarted,
    required TResult Function(_SessionCapturePending value)
    sessionCapturePending,
    required TResult Function(_LoginCompleted value) loginCompleted,
    required TResult Function(_FailureReported value) failureReported,
  }) {
    final _that = this;
    switch (_that) {
      case _InputSelected():
        return inputSelected(_that);
      case _KeyboardValueChanged():
        return keyboardValueChanged(_that);
      case _KeyboardSubmitted():
        return keyboardSubmitted(_that);
      case _KeyboardClosed():
        return keyboardClosed(_that);
      case _PasswordVisibilityToggled():
        return passwordVisibilityToggled(_that);
      case _ReloadRequested():
        return reloadRequested(_that);
      case _LoginRequested():
        return loginRequested(_that);
      case _WebViewLoadingChanged():
        return webViewLoadingChanged(_that);
      case _CaptchaRequirementChanged():
        return captchaRequirementChanged(_that);
      case _LoginSubmissionStarted():
        return loginSubmissionStarted(_that);
      case _SessionCaptureStarted():
        return sessionCaptureStarted(_that);
      case _SessionCapturePending():
        return sessionCapturePending(_that);
      case _LoginCompleted():
        return loginCompleted(_that);
      case _FailureReported():
        return failureReported(_that);
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
    TResult? Function(_InputSelected value)? inputSelected,
    TResult? Function(_KeyboardValueChanged value)? keyboardValueChanged,
    TResult? Function(_KeyboardSubmitted value)? keyboardSubmitted,
    TResult? Function(_KeyboardClosed value)? keyboardClosed,
    TResult? Function(_PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(_ReloadRequested value)? reloadRequested,
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_WebViewLoadingChanged value)? webViewLoadingChanged,
    TResult? Function(_CaptchaRequirementChanged value)?
    captchaRequirementChanged,
    TResult? Function(_LoginSubmissionStarted value)? loginSubmissionStarted,
    TResult? Function(_SessionCaptureStarted value)? sessionCaptureStarted,
    TResult? Function(_SessionCapturePending value)? sessionCapturePending,
    TResult? Function(_LoginCompleted value)? loginCompleted,
    TResult? Function(_FailureReported value)? failureReported,
  }) {
    final _that = this;
    switch (_that) {
      case _InputSelected() when inputSelected != null:
        return inputSelected(_that);
      case _KeyboardValueChanged() when keyboardValueChanged != null:
        return keyboardValueChanged(_that);
      case _KeyboardSubmitted() when keyboardSubmitted != null:
        return keyboardSubmitted(_that);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed(_that);
      case _PasswordVisibilityToggled() when passwordVisibilityToggled != null:
        return passwordVisibilityToggled(_that);
      case _ReloadRequested() when reloadRequested != null:
        return reloadRequested(_that);
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that);
      case _WebViewLoadingChanged() when webViewLoadingChanged != null:
        return webViewLoadingChanged(_that);
      case _CaptchaRequirementChanged() when captchaRequirementChanged != null:
        return captchaRequirementChanged(_that);
      case _LoginSubmissionStarted() when loginSubmissionStarted != null:
        return loginSubmissionStarted(_that);
      case _SessionCaptureStarted() when sessionCaptureStarted != null:
        return sessionCaptureStarted(_that);
      case _SessionCapturePending() when sessionCapturePending != null:
        return sessionCapturePending(_that);
      case _LoginCompleted() when loginCompleted != null:
        return loginCompleted(_that);
      case _FailureReported() when failureReported != null:
        return failureReported(_that);
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
    TResult Function(AuthInputField input)? inputSelected,
    TResult Function(String value)? keyboardValueChanged,
    TResult Function(String value)? keyboardSubmitted,
    TResult Function()? keyboardClosed,
    TResult Function()? passwordVisibilityToggled,
    TResult Function()? reloadRequested,
    TResult Function()? loginRequested,
    TResult Function(bool isLoading)? webViewLoadingChanged,
    TResult Function(bool isRequired)? captchaRequirementChanged,
    TResult Function()? loginSubmissionStarted,
    TResult Function()? sessionCaptureStarted,
    TResult Function()? sessionCapturePending,
    TResult Function()? loginCompleted,
    TResult Function(AuthScreenStatus status)? failureReported,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InputSelected() when inputSelected != null:
        return inputSelected(_that.input);
      case _KeyboardValueChanged() when keyboardValueChanged != null:
        return keyboardValueChanged(_that.value);
      case _KeyboardSubmitted() when keyboardSubmitted != null:
        return keyboardSubmitted(_that.value);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed();
      case _PasswordVisibilityToggled() when passwordVisibilityToggled != null:
        return passwordVisibilityToggled();
      case _ReloadRequested() when reloadRequested != null:
        return reloadRequested();
      case _LoginRequested() when loginRequested != null:
        return loginRequested();
      case _WebViewLoadingChanged() when webViewLoadingChanged != null:
        return webViewLoadingChanged(_that.isLoading);
      case _CaptchaRequirementChanged() when captchaRequirementChanged != null:
        return captchaRequirementChanged(_that.isRequired);
      case _LoginSubmissionStarted() when loginSubmissionStarted != null:
        return loginSubmissionStarted();
      case _SessionCaptureStarted() when sessionCaptureStarted != null:
        return sessionCaptureStarted();
      case _SessionCapturePending() when sessionCapturePending != null:
        return sessionCapturePending();
      case _LoginCompleted() when loginCompleted != null:
        return loginCompleted();
      case _FailureReported() when failureReported != null:
        return failureReported(_that.status);
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
    required TResult Function(AuthInputField input) inputSelected,
    required TResult Function(String value) keyboardValueChanged,
    required TResult Function(String value) keyboardSubmitted,
    required TResult Function() keyboardClosed,
    required TResult Function() passwordVisibilityToggled,
    required TResult Function() reloadRequested,
    required TResult Function() loginRequested,
    required TResult Function(bool isLoading) webViewLoadingChanged,
    required TResult Function(bool isRequired) captchaRequirementChanged,
    required TResult Function() loginSubmissionStarted,
    required TResult Function() sessionCaptureStarted,
    required TResult Function() sessionCapturePending,
    required TResult Function() loginCompleted,
    required TResult Function(AuthScreenStatus status) failureReported,
  }) {
    final _that = this;
    switch (_that) {
      case _InputSelected():
        return inputSelected(_that.input);
      case _KeyboardValueChanged():
        return keyboardValueChanged(_that.value);
      case _KeyboardSubmitted():
        return keyboardSubmitted(_that.value);
      case _KeyboardClosed():
        return keyboardClosed();
      case _PasswordVisibilityToggled():
        return passwordVisibilityToggled();
      case _ReloadRequested():
        return reloadRequested();
      case _LoginRequested():
        return loginRequested();
      case _WebViewLoadingChanged():
        return webViewLoadingChanged(_that.isLoading);
      case _CaptchaRequirementChanged():
        return captchaRequirementChanged(_that.isRequired);
      case _LoginSubmissionStarted():
        return loginSubmissionStarted();
      case _SessionCaptureStarted():
        return sessionCaptureStarted();
      case _SessionCapturePending():
        return sessionCapturePending();
      case _LoginCompleted():
        return loginCompleted();
      case _FailureReported():
        return failureReported(_that.status);
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
    TResult? Function(AuthInputField input)? inputSelected,
    TResult? Function(String value)? keyboardValueChanged,
    TResult? Function(String value)? keyboardSubmitted,
    TResult? Function()? keyboardClosed,
    TResult? Function()? passwordVisibilityToggled,
    TResult? Function()? reloadRequested,
    TResult? Function()? loginRequested,
    TResult? Function(bool isLoading)? webViewLoadingChanged,
    TResult? Function(bool isRequired)? captchaRequirementChanged,
    TResult? Function()? loginSubmissionStarted,
    TResult? Function()? sessionCaptureStarted,
    TResult? Function()? sessionCapturePending,
    TResult? Function()? loginCompleted,
    TResult? Function(AuthScreenStatus status)? failureReported,
  }) {
    final _that = this;
    switch (_that) {
      case _InputSelected() when inputSelected != null:
        return inputSelected(_that.input);
      case _KeyboardValueChanged() when keyboardValueChanged != null:
        return keyboardValueChanged(_that.value);
      case _KeyboardSubmitted() when keyboardSubmitted != null:
        return keyboardSubmitted(_that.value);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed();
      case _PasswordVisibilityToggled() when passwordVisibilityToggled != null:
        return passwordVisibilityToggled();
      case _ReloadRequested() when reloadRequested != null:
        return reloadRequested();
      case _LoginRequested() when loginRequested != null:
        return loginRequested();
      case _WebViewLoadingChanged() when webViewLoadingChanged != null:
        return webViewLoadingChanged(_that.isLoading);
      case _CaptchaRequirementChanged() when captchaRequirementChanged != null:
        return captchaRequirementChanged(_that.isRequired);
      case _LoginSubmissionStarted() when loginSubmissionStarted != null:
        return loginSubmissionStarted();
      case _SessionCaptureStarted() when sessionCaptureStarted != null:
        return sessionCaptureStarted();
      case _SessionCapturePending() when sessionCapturePending != null:
        return sessionCapturePending();
      case _LoginCompleted() when loginCompleted != null:
        return loginCompleted();
      case _FailureReported() when failureReported != null:
        return failureReported(_that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InputSelected implements AuthScreenEvent {
  const _InputSelected(this.input);

  final AuthInputField input;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InputSelectedCopyWith<_InputSelected> get copyWith =>
      __$InputSelectedCopyWithImpl<_InputSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InputSelected &&
            (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input);
}

/// @nodoc
abstract mixin class _$InputSelectedCopyWith<$Res>
    implements $AuthScreenEventCopyWith<$Res> {
  factory _$InputSelectedCopyWith(
    _InputSelected value,
    $Res Function(_InputSelected) _then,
  ) = __$InputSelectedCopyWithImpl;
  @useResult
  $Res call({AuthInputField input});
}

/// @nodoc
class __$InputSelectedCopyWithImpl<$Res>
    implements _$InputSelectedCopyWith<$Res> {
  __$InputSelectedCopyWithImpl(this._self, this._then);

  final _InputSelected _self;
  final $Res Function(_InputSelected) _then;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? input = null}) {
    return _then(
      _InputSelected(
        null == input
            ? _self.input
            : input // ignore: cast_nullable_to_non_nullable
                  as AuthInputField,
      ),
    );
  }
}

/// @nodoc

class _KeyboardValueChanged implements AuthScreenEvent {
  const _KeyboardValueChanged(this.value);

  final String value;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KeyboardValueChangedCopyWith<_KeyboardValueChanged> get copyWith =>
      __$KeyboardValueChangedCopyWithImpl<_KeyboardValueChanged>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KeyboardValueChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);
}

/// @nodoc
abstract mixin class _$KeyboardValueChangedCopyWith<$Res>
    implements $AuthScreenEventCopyWith<$Res> {
  factory _$KeyboardValueChangedCopyWith(
    _KeyboardValueChanged value,
    $Res Function(_KeyboardValueChanged) _then,
  ) = __$KeyboardValueChangedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$KeyboardValueChangedCopyWithImpl<$Res>
    implements _$KeyboardValueChangedCopyWith<$Res> {
  __$KeyboardValueChangedCopyWithImpl(this._self, this._then);

  final _KeyboardValueChanged _self;
  final $Res Function(_KeyboardValueChanged) _then;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? value = null}) {
    return _then(
      _KeyboardValueChanged(
        null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _KeyboardSubmitted implements AuthScreenEvent {
  const _KeyboardSubmitted(this.value);

  final String value;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KeyboardSubmittedCopyWith<_KeyboardSubmitted> get copyWith =>
      __$KeyboardSubmittedCopyWithImpl<_KeyboardSubmitted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KeyboardSubmitted &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);
}

/// @nodoc
abstract mixin class _$KeyboardSubmittedCopyWith<$Res>
    implements $AuthScreenEventCopyWith<$Res> {
  factory _$KeyboardSubmittedCopyWith(
    _KeyboardSubmitted value,
    $Res Function(_KeyboardSubmitted) _then,
  ) = __$KeyboardSubmittedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$KeyboardSubmittedCopyWithImpl<$Res>
    implements _$KeyboardSubmittedCopyWith<$Res> {
  __$KeyboardSubmittedCopyWithImpl(this._self, this._then);

  final _KeyboardSubmitted _self;
  final $Res Function(_KeyboardSubmitted) _then;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? value = null}) {
    return _then(
      _KeyboardSubmitted(
        null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _KeyboardClosed implements AuthScreenEvent {
  const _KeyboardClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _KeyboardClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// @nodoc

class _PasswordVisibilityToggled implements AuthScreenEvent {
  const _PasswordVisibilityToggled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PasswordVisibilityToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// @nodoc

class _ReloadRequested implements AuthScreenEvent {
  const _ReloadRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ReloadRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// @nodoc

class _LoginRequested implements AuthScreenEvent {
  const _LoginRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoginRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// @nodoc

class _WebViewLoadingChanged implements AuthScreenEvent {
  const _WebViewLoadingChanged({required this.isLoading});

  final bool isLoading;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WebViewLoadingChangedCopyWith<_WebViewLoadingChanged> get copyWith =>
      __$WebViewLoadingChangedCopyWithImpl<_WebViewLoadingChanged>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WebViewLoadingChanged &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);
}

/// @nodoc
abstract mixin class _$WebViewLoadingChangedCopyWith<$Res>
    implements $AuthScreenEventCopyWith<$Res> {
  factory _$WebViewLoadingChangedCopyWith(
    _WebViewLoadingChanged value,
    $Res Function(_WebViewLoadingChanged) _then,
  ) = __$WebViewLoadingChangedCopyWithImpl;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$WebViewLoadingChangedCopyWithImpl<$Res>
    implements _$WebViewLoadingChangedCopyWith<$Res> {
  __$WebViewLoadingChangedCopyWithImpl(this._self, this._then);

  final _WebViewLoadingChanged _self;
  final $Res Function(_WebViewLoadingChanged) _then;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? isLoading = null}) {
    return _then(
      _WebViewLoadingChanged(
        isLoading: null == isLoading
            ? _self.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _CaptchaRequirementChanged implements AuthScreenEvent {
  const _CaptchaRequirementChanged({required this.isRequired});

  final bool isRequired;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CaptchaRequirementChangedCopyWith<_CaptchaRequirementChanged>
  get copyWith =>
      __$CaptchaRequirementChangedCopyWithImpl<_CaptchaRequirementChanged>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CaptchaRequirementChanged &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRequired);
}

/// @nodoc
abstract mixin class _$CaptchaRequirementChangedCopyWith<$Res>
    implements $AuthScreenEventCopyWith<$Res> {
  factory _$CaptchaRequirementChangedCopyWith(
    _CaptchaRequirementChanged value,
    $Res Function(_CaptchaRequirementChanged) _then,
  ) = __$CaptchaRequirementChangedCopyWithImpl;
  @useResult
  $Res call({bool isRequired});
}

/// @nodoc
class __$CaptchaRequirementChangedCopyWithImpl<$Res>
    implements _$CaptchaRequirementChangedCopyWith<$Res> {
  __$CaptchaRequirementChangedCopyWithImpl(this._self, this._then);

  final _CaptchaRequirementChanged _self;
  final $Res Function(_CaptchaRequirementChanged) _then;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? isRequired = null}) {
    return _then(
      _CaptchaRequirementChanged(
        isRequired: null == isRequired
            ? _self.isRequired
            : isRequired // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _LoginSubmissionStarted implements AuthScreenEvent {
  const _LoginSubmissionStarted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoginSubmissionStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// @nodoc

class _SessionCaptureStarted implements AuthScreenEvent {
  const _SessionCaptureStarted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SessionCaptureStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// @nodoc

class _SessionCapturePending implements AuthScreenEvent {
  const _SessionCapturePending();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SessionCapturePending);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// @nodoc

class _LoginCompleted implements AuthScreenEvent {
  const _LoginCompleted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoginCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// @nodoc

class _FailureReported implements AuthScreenEvent {
  const _FailureReported(this.status);

  final AuthScreenStatus status;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailureReportedCopyWith<_FailureReported> get copyWith =>
      __$FailureReportedCopyWithImpl<_FailureReported>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FailureReported &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);
}

/// @nodoc
abstract mixin class _$FailureReportedCopyWith<$Res>
    implements $AuthScreenEventCopyWith<$Res> {
  factory _$FailureReportedCopyWith(
    _FailureReported value,
    $Res Function(_FailureReported) _then,
  ) = __$FailureReportedCopyWithImpl;
  @useResult
  $Res call({AuthScreenStatus status});
}

/// @nodoc
class __$FailureReportedCopyWithImpl<$Res>
    implements _$FailureReportedCopyWith<$Res> {
  __$FailureReportedCopyWithImpl(this._self, this._then);

  final _FailureReported _self;
  final $Res Function(_FailureReported) _then;

  /// Create a copy of AuthScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? status = null}) {
    return _then(
      _FailureReported(
        null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuthScreenStatus,
      ),
    );
  }
}

/// @nodoc
mixin _$AuthScreenState {
  String get naverId;
  String get password;
  String get captcha;
  AuthInputField get activeInput;
  bool get isCaptchaRequired;
  bool get isPasswordVisible;
  bool get isKeyboardOpen;
  bool get isPageLoading;
  bool get isSubmitting;
  bool get isCapturingSession;
  bool get isLoginCompleted;
  int get reloadRequestId;
  int get submitRequestId;
  AuthScreenStatus get status;

  /// Create a copy of AuthScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthScreenStateCopyWith<AuthScreenState> get copyWith =>
      _$AuthScreenStateCopyWithImpl<AuthScreenState>(
        this as AuthScreenState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthScreenState &&
            (identical(other.naverId, naverId) || other.naverId == naverId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.captcha, captcha) || other.captcha == captcha) &&
            (identical(other.activeInput, activeInput) ||
                other.activeInput == activeInput) &&
            (identical(other.isCaptchaRequired, isCaptchaRequired) ||
                other.isCaptchaRequired == isCaptchaRequired) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.isKeyboardOpen, isKeyboardOpen) ||
                other.isKeyboardOpen == isKeyboardOpen) &&
            (identical(other.isPageLoading, isPageLoading) ||
                other.isPageLoading == isPageLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isCapturingSession, isCapturingSession) ||
                other.isCapturingSession == isCapturingSession) &&
            (identical(other.isLoginCompleted, isLoginCompleted) ||
                other.isLoginCompleted == isLoginCompleted) &&
            (identical(other.reloadRequestId, reloadRequestId) ||
                other.reloadRequestId == reloadRequestId) &&
            (identical(other.submitRequestId, submitRequestId) ||
                other.submitRequestId == submitRequestId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    naverId,
    password,
    captcha,
    activeInput,
    isCaptchaRequired,
    isPasswordVisible,
    isKeyboardOpen,
    isPageLoading,
    isSubmitting,
    isCapturingSession,
    isLoginCompleted,
    reloadRequestId,
    submitRequestId,
    status,
  );
}

/// @nodoc
abstract mixin class $AuthScreenStateCopyWith<$Res> {
  factory $AuthScreenStateCopyWith(
    AuthScreenState value,
    $Res Function(AuthScreenState) _then,
  ) = _$AuthScreenStateCopyWithImpl;
  @useResult
  $Res call({
    String naverId,
    String password,
    String captcha,
    AuthInputField activeInput,
    bool isCaptchaRequired,
    bool isPasswordVisible,
    bool isKeyboardOpen,
    bool isPageLoading,
    bool isSubmitting,
    bool isCapturingSession,
    bool isLoginCompleted,
    int reloadRequestId,
    int submitRequestId,
    AuthScreenStatus status,
  });
}

/// @nodoc
class _$AuthScreenStateCopyWithImpl<$Res>
    implements $AuthScreenStateCopyWith<$Res> {
  _$AuthScreenStateCopyWithImpl(this._self, this._then);

  final AuthScreenState _self;
  final $Res Function(AuthScreenState) _then;

  /// Create a copy of AuthScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? naverId = null,
    Object? password = null,
    Object? captcha = null,
    Object? activeInput = null,
    Object? isCaptchaRequired = null,
    Object? isPasswordVisible = null,
    Object? isKeyboardOpen = null,
    Object? isPageLoading = null,
    Object? isSubmitting = null,
    Object? isCapturingSession = null,
    Object? isLoginCompleted = null,
    Object? reloadRequestId = null,
    Object? submitRequestId = null,
    Object? status = null,
  }) {
    return _then(
      _self.copyWith(
        naverId: null == naverId
            ? _self.naverId
            : naverId // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _self.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        captcha: null == captcha
            ? _self.captcha
            : captcha // ignore: cast_nullable_to_non_nullable
                  as String,
        activeInput: null == activeInput
            ? _self.activeInput
            : activeInput // ignore: cast_nullable_to_non_nullable
                  as AuthInputField,
        isCaptchaRequired: null == isCaptchaRequired
            ? _self.isCaptchaRequired
            : isCaptchaRequired // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPasswordVisible: null == isPasswordVisible
            ? _self.isPasswordVisible
            : isPasswordVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
        isKeyboardOpen: null == isKeyboardOpen
            ? _self.isKeyboardOpen
            : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPageLoading: null == isPageLoading
            ? _self.isPageLoading
            : isPageLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSubmitting: null == isSubmitting
            ? _self.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCapturingSession: null == isCapturingSession
            ? _self.isCapturingSession
            : isCapturingSession // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoginCompleted: null == isLoginCompleted
            ? _self.isLoginCompleted
            : isLoginCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        reloadRequestId: null == reloadRequestId
            ? _self.reloadRequestId
            : reloadRequestId // ignore: cast_nullable_to_non_nullable
                  as int,
        submitRequestId: null == submitRequestId
            ? _self.submitRequestId
            : submitRequestId // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuthScreenStatus,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AuthScreenState].
extension AuthScreenStatePatterns on AuthScreenState {
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
    TResult Function(_AuthScreenState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthScreenState() when $default != null:
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
    TResult Function(_AuthScreenState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthScreenState():
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
    TResult? Function(_AuthScreenState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthScreenState() when $default != null:
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
      String naverId,
      String password,
      String captcha,
      AuthInputField activeInput,
      bool isCaptchaRequired,
      bool isPasswordVisible,
      bool isKeyboardOpen,
      bool isPageLoading,
      bool isSubmitting,
      bool isCapturingSession,
      bool isLoginCompleted,
      int reloadRequestId,
      int submitRequestId,
      AuthScreenStatus status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthScreenState() when $default != null:
        return $default(
          _that.naverId,
          _that.password,
          _that.captcha,
          _that.activeInput,
          _that.isCaptchaRequired,
          _that.isPasswordVisible,
          _that.isKeyboardOpen,
          _that.isPageLoading,
          _that.isSubmitting,
          _that.isCapturingSession,
          _that.isLoginCompleted,
          _that.reloadRequestId,
          _that.submitRequestId,
          _that.status,
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
      String naverId,
      String password,
      String captcha,
      AuthInputField activeInput,
      bool isCaptchaRequired,
      bool isPasswordVisible,
      bool isKeyboardOpen,
      bool isPageLoading,
      bool isSubmitting,
      bool isCapturingSession,
      bool isLoginCompleted,
      int reloadRequestId,
      int submitRequestId,
      AuthScreenStatus status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthScreenState():
        return $default(
          _that.naverId,
          _that.password,
          _that.captcha,
          _that.activeInput,
          _that.isCaptchaRequired,
          _that.isPasswordVisible,
          _that.isKeyboardOpen,
          _that.isPageLoading,
          _that.isSubmitting,
          _that.isCapturingSession,
          _that.isLoginCompleted,
          _that.reloadRequestId,
          _that.submitRequestId,
          _that.status,
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
      String naverId,
      String password,
      String captcha,
      AuthInputField activeInput,
      bool isCaptchaRequired,
      bool isPasswordVisible,
      bool isKeyboardOpen,
      bool isPageLoading,
      bool isSubmitting,
      bool isCapturingSession,
      bool isLoginCompleted,
      int reloadRequestId,
      int submitRequestId,
      AuthScreenStatus status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthScreenState() when $default != null:
        return $default(
          _that.naverId,
          _that.password,
          _that.captcha,
          _that.activeInput,
          _that.isCaptchaRequired,
          _that.isPasswordVisible,
          _that.isKeyboardOpen,
          _that.isPageLoading,
          _that.isSubmitting,
          _that.isCapturingSession,
          _that.isLoginCompleted,
          _that.reloadRequestId,
          _that.submitRequestId,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuthScreenState extends AuthScreenState {
  const _AuthScreenState({
    this.naverId = '',
    this.password = '',
    this.captcha = '',
    this.activeInput = AuthInputField.naverId,
    this.isCaptchaRequired = false,
    this.isPasswordVisible = false,
    this.isKeyboardOpen = false,
    this.isPageLoading = false,
    this.isSubmitting = false,
    this.isCapturingSession = false,
    this.isLoginCompleted = false,
    this.reloadRequestId = 0,
    this.submitRequestId = 0,
    this.status = AuthScreenStatus.idle,
  }) : super._();

  @override
  @JsonKey()
  final String naverId;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String captcha;
  @override
  @JsonKey()
  final AuthInputField activeInput;
  @override
  @JsonKey()
  final bool isCaptchaRequired;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  @JsonKey()
  final bool isKeyboardOpen;
  @override
  @JsonKey()
  final bool isPageLoading;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isCapturingSession;
  @override
  @JsonKey()
  final bool isLoginCompleted;
  @override
  @JsonKey()
  final int reloadRequestId;
  @override
  @JsonKey()
  final int submitRequestId;
  @override
  @JsonKey()
  final AuthScreenStatus status;

  /// Create a copy of AuthScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthScreenStateCopyWith<_AuthScreenState> get copyWith =>
      __$AuthScreenStateCopyWithImpl<_AuthScreenState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthScreenState &&
            (identical(other.naverId, naverId) || other.naverId == naverId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.captcha, captcha) || other.captcha == captcha) &&
            (identical(other.activeInput, activeInput) ||
                other.activeInput == activeInput) &&
            (identical(other.isCaptchaRequired, isCaptchaRequired) ||
                other.isCaptchaRequired == isCaptchaRequired) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.isKeyboardOpen, isKeyboardOpen) ||
                other.isKeyboardOpen == isKeyboardOpen) &&
            (identical(other.isPageLoading, isPageLoading) ||
                other.isPageLoading == isPageLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isCapturingSession, isCapturingSession) ||
                other.isCapturingSession == isCapturingSession) &&
            (identical(other.isLoginCompleted, isLoginCompleted) ||
                other.isLoginCompleted == isLoginCompleted) &&
            (identical(other.reloadRequestId, reloadRequestId) ||
                other.reloadRequestId == reloadRequestId) &&
            (identical(other.submitRequestId, submitRequestId) ||
                other.submitRequestId == submitRequestId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    naverId,
    password,
    captcha,
    activeInput,
    isCaptchaRequired,
    isPasswordVisible,
    isKeyboardOpen,
    isPageLoading,
    isSubmitting,
    isCapturingSession,
    isLoginCompleted,
    reloadRequestId,
    submitRequestId,
    status,
  );
}

/// @nodoc
abstract mixin class _$AuthScreenStateCopyWith<$Res>
    implements $AuthScreenStateCopyWith<$Res> {
  factory _$AuthScreenStateCopyWith(
    _AuthScreenState value,
    $Res Function(_AuthScreenState) _then,
  ) = __$AuthScreenStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String naverId,
    String password,
    String captcha,
    AuthInputField activeInput,
    bool isCaptchaRequired,
    bool isPasswordVisible,
    bool isKeyboardOpen,
    bool isPageLoading,
    bool isSubmitting,
    bool isCapturingSession,
    bool isLoginCompleted,
    int reloadRequestId,
    int submitRequestId,
    AuthScreenStatus status,
  });
}

/// @nodoc
class __$AuthScreenStateCopyWithImpl<$Res>
    implements _$AuthScreenStateCopyWith<$Res> {
  __$AuthScreenStateCopyWithImpl(this._self, this._then);

  final _AuthScreenState _self;
  final $Res Function(_AuthScreenState) _then;

  /// Create a copy of AuthScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? naverId = null,
    Object? password = null,
    Object? captcha = null,
    Object? activeInput = null,
    Object? isCaptchaRequired = null,
    Object? isPasswordVisible = null,
    Object? isKeyboardOpen = null,
    Object? isPageLoading = null,
    Object? isSubmitting = null,
    Object? isCapturingSession = null,
    Object? isLoginCompleted = null,
    Object? reloadRequestId = null,
    Object? submitRequestId = null,
    Object? status = null,
  }) {
    return _then(
      _AuthScreenState(
        naverId: null == naverId
            ? _self.naverId
            : naverId // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _self.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        captcha: null == captcha
            ? _self.captcha
            : captcha // ignore: cast_nullable_to_non_nullable
                  as String,
        activeInput: null == activeInput
            ? _self.activeInput
            : activeInput // ignore: cast_nullable_to_non_nullable
                  as AuthInputField,
        isCaptchaRequired: null == isCaptchaRequired
            ? _self.isCaptchaRequired
            : isCaptchaRequired // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPasswordVisible: null == isPasswordVisible
            ? _self.isPasswordVisible
            : isPasswordVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
        isKeyboardOpen: null == isKeyboardOpen
            ? _self.isKeyboardOpen
            : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPageLoading: null == isPageLoading
            ? _self.isPageLoading
            : isPageLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSubmitting: null == isSubmitting
            ? _self.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCapturingSession: null == isCapturingSession
            ? _self.isCapturingSession
            : isCapturingSession // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoginCompleted: null == isLoginCompleted
            ? _self.isLoginCompleted
            : isLoginCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        reloadRequestId: null == reloadRequestId
            ? _self.reloadRequestId
            : reloadRequestId // ignore: cast_nullable_to_non_nullable
                  as int,
        submitRequestId: null == submitRequestId
            ? _self.submitRequestId
            : submitRequestId // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuthScreenStatus,
      ),
    );
  }
}
