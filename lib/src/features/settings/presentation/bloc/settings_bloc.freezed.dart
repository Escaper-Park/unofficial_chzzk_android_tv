// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent()';
  }
}

/// @nodoc
class $SettingsEventCopyWith<$Res> {
  $SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}

/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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
    TResult Function(_Started value)? started,
    TResult Function(_MenuSelected value)? menuSelected,
    TResult Function(_ToggleRequested value)? toggleRequested,
    TResult Function(_EditorOpened value)? editorOpened,
    TResult Function(_EditorClosed value)? editorClosed,
    TResult Function(_OptionSelected value)? optionSelected,
    TResult Function(_SliderChanged value)? sliderChanged,
    TResult Function(_SliderChangeCommitted value)? sliderChangeCommitted,
    TResult Function(_SliderSaveDebounceElapsed value)?
    sliderSaveDebounceElapsed,
    TResult Function(_ResetRequested value)? resetRequested,
    TResult Function(_UpdateCheckRequested value)? updateCheckRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _MenuSelected() when menuSelected != null:
        return menuSelected(_that);
      case _ToggleRequested() when toggleRequested != null:
        return toggleRequested(_that);
      case _EditorOpened() when editorOpened != null:
        return editorOpened(_that);
      case _EditorClosed() when editorClosed != null:
        return editorClosed(_that);
      case _OptionSelected() when optionSelected != null:
        return optionSelected(_that);
      case _SliderChanged() when sliderChanged != null:
        return sliderChanged(_that);
      case _SliderChangeCommitted() when sliderChangeCommitted != null:
        return sliderChangeCommitted(_that);
      case _SliderSaveDebounceElapsed() when sliderSaveDebounceElapsed != null:
        return sliderSaveDebounceElapsed(_that);
      case _ResetRequested() when resetRequested != null:
        return resetRequested(_that);
      case _UpdateCheckRequested() when updateCheckRequested != null:
        return updateCheckRequested(_that);
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
    required TResult Function(_Started value) started,
    required TResult Function(_MenuSelected value) menuSelected,
    required TResult Function(_ToggleRequested value) toggleRequested,
    required TResult Function(_EditorOpened value) editorOpened,
    required TResult Function(_EditorClosed value) editorClosed,
    required TResult Function(_OptionSelected value) optionSelected,
    required TResult Function(_SliderChanged value) sliderChanged,
    required TResult Function(_SliderChangeCommitted value)
    sliderChangeCommitted,
    required TResult Function(_SliderSaveDebounceElapsed value)
    sliderSaveDebounceElapsed,
    required TResult Function(_ResetRequested value) resetRequested,
    required TResult Function(_UpdateCheckRequested value) updateCheckRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _MenuSelected():
        return menuSelected(_that);
      case _ToggleRequested():
        return toggleRequested(_that);
      case _EditorOpened():
        return editorOpened(_that);
      case _EditorClosed():
        return editorClosed(_that);
      case _OptionSelected():
        return optionSelected(_that);
      case _SliderChanged():
        return sliderChanged(_that);
      case _SliderChangeCommitted():
        return sliderChangeCommitted(_that);
      case _SliderSaveDebounceElapsed():
        return sliderSaveDebounceElapsed(_that);
      case _ResetRequested():
        return resetRequested(_that);
      case _UpdateCheckRequested():
        return updateCheckRequested(_that);
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
    TResult? Function(_Started value)? started,
    TResult? Function(_MenuSelected value)? menuSelected,
    TResult? Function(_ToggleRequested value)? toggleRequested,
    TResult? Function(_EditorOpened value)? editorOpened,
    TResult? Function(_EditorClosed value)? editorClosed,
    TResult? Function(_OptionSelected value)? optionSelected,
    TResult? Function(_SliderChanged value)? sliderChanged,
    TResult? Function(_SliderChangeCommitted value)? sliderChangeCommitted,
    TResult? Function(_SliderSaveDebounceElapsed value)?
    sliderSaveDebounceElapsed,
    TResult? Function(_ResetRequested value)? resetRequested,
    TResult? Function(_UpdateCheckRequested value)? updateCheckRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _MenuSelected() when menuSelected != null:
        return menuSelected(_that);
      case _ToggleRequested() when toggleRequested != null:
        return toggleRequested(_that);
      case _EditorOpened() when editorOpened != null:
        return editorOpened(_that);
      case _EditorClosed() when editorClosed != null:
        return editorClosed(_that);
      case _OptionSelected() when optionSelected != null:
        return optionSelected(_that);
      case _SliderChanged() when sliderChanged != null:
        return sliderChanged(_that);
      case _SliderChangeCommitted() when sliderChangeCommitted != null:
        return sliderChangeCommitted(_that);
      case _SliderSaveDebounceElapsed() when sliderSaveDebounceElapsed != null:
        return sliderSaveDebounceElapsed(_that);
      case _ResetRequested() when resetRequested != null:
        return resetRequested(_that);
      case _UpdateCheckRequested() when updateCheckRequested != null:
        return updateCheckRequested(_that);
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
    TResult Function()? started,
    TResult Function(SettingsCategoryId category)? menuSelected,
    TResult Function(SettingsPreferenceRef ref)? toggleRequested,
    TResult Function(SettingsPreferenceRef ref)? editorOpened,
    TResult Function()? editorClosed,
    TResult Function(SettingsPreferenceRef ref, int value)? optionSelected,
    TResult Function(SettingsPreferenceRef ref, int value)? sliderChanged,
    TResult Function()? sliderChangeCommitted,
    TResult Function()? sliderSaveDebounceElapsed,
    TResult Function()? resetRequested,
    TResult Function()? updateCheckRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _MenuSelected() when menuSelected != null:
        return menuSelected(_that.category);
      case _ToggleRequested() when toggleRequested != null:
        return toggleRequested(_that.ref);
      case _EditorOpened() when editorOpened != null:
        return editorOpened(_that.ref);
      case _EditorClosed() when editorClosed != null:
        return editorClosed();
      case _OptionSelected() when optionSelected != null:
        return optionSelected(_that.ref, _that.value);
      case _SliderChanged() when sliderChanged != null:
        return sliderChanged(_that.ref, _that.value);
      case _SliderChangeCommitted() when sliderChangeCommitted != null:
        return sliderChangeCommitted();
      case _SliderSaveDebounceElapsed() when sliderSaveDebounceElapsed != null:
        return sliderSaveDebounceElapsed();
      case _ResetRequested() when resetRequested != null:
        return resetRequested();
      case _UpdateCheckRequested() when updateCheckRequested != null:
        return updateCheckRequested();
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
    required TResult Function() started,
    required TResult Function(SettingsCategoryId category) menuSelected,
    required TResult Function(SettingsPreferenceRef ref) toggleRequested,
    required TResult Function(SettingsPreferenceRef ref) editorOpened,
    required TResult Function() editorClosed,
    required TResult Function(SettingsPreferenceRef ref, int value)
    optionSelected,
    required TResult Function(SettingsPreferenceRef ref, int value)
    sliderChanged,
    required TResult Function() sliderChangeCommitted,
    required TResult Function() sliderSaveDebounceElapsed,
    required TResult Function() resetRequested,
    required TResult Function() updateCheckRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _MenuSelected():
        return menuSelected(_that.category);
      case _ToggleRequested():
        return toggleRequested(_that.ref);
      case _EditorOpened():
        return editorOpened(_that.ref);
      case _EditorClosed():
        return editorClosed();
      case _OptionSelected():
        return optionSelected(_that.ref, _that.value);
      case _SliderChanged():
        return sliderChanged(_that.ref, _that.value);
      case _SliderChangeCommitted():
        return sliderChangeCommitted();
      case _SliderSaveDebounceElapsed():
        return sliderSaveDebounceElapsed();
      case _ResetRequested():
        return resetRequested();
      case _UpdateCheckRequested():
        return updateCheckRequested();
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
    TResult? Function()? started,
    TResult? Function(SettingsCategoryId category)? menuSelected,
    TResult? Function(SettingsPreferenceRef ref)? toggleRequested,
    TResult? Function(SettingsPreferenceRef ref)? editorOpened,
    TResult? Function()? editorClosed,
    TResult? Function(SettingsPreferenceRef ref, int value)? optionSelected,
    TResult? Function(SettingsPreferenceRef ref, int value)? sliderChanged,
    TResult? Function()? sliderChangeCommitted,
    TResult? Function()? sliderSaveDebounceElapsed,
    TResult? Function()? resetRequested,
    TResult? Function()? updateCheckRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _MenuSelected() when menuSelected != null:
        return menuSelected(_that.category);
      case _ToggleRequested() when toggleRequested != null:
        return toggleRequested(_that.ref);
      case _EditorOpened() when editorOpened != null:
        return editorOpened(_that.ref);
      case _EditorClosed() when editorClosed != null:
        return editorClosed();
      case _OptionSelected() when optionSelected != null:
        return optionSelected(_that.ref, _that.value);
      case _SliderChanged() when sliderChanged != null:
        return sliderChanged(_that.ref, _that.value);
      case _SliderChangeCommitted() when sliderChangeCommitted != null:
        return sliderChangeCommitted();
      case _SliderSaveDebounceElapsed() when sliderSaveDebounceElapsed != null:
        return sliderSaveDebounceElapsed();
      case _ResetRequested() when resetRequested != null:
        return resetRequested();
      case _UpdateCheckRequested() when updateCheckRequested != null:
        return updateCheckRequested();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements SettingsEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.started()';
  }
}

/// @nodoc

class _MenuSelected implements SettingsEvent {
  const _MenuSelected(this.category);

  final SettingsCategoryId category;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuSelectedCopyWith<_MenuSelected> get copyWith =>
      __$MenuSelectedCopyWithImpl<_MenuSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuSelected &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'SettingsEvent.menuSelected(category: $category)';
  }
}

/// @nodoc
abstract mixin class _$MenuSelectedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory _$MenuSelectedCopyWith(
    _MenuSelected value,
    $Res Function(_MenuSelected) _then,
  ) = __$MenuSelectedCopyWithImpl;
  @useResult
  $Res call({SettingsCategoryId category});
}

/// @nodoc
class __$MenuSelectedCopyWithImpl<$Res>
    implements _$MenuSelectedCopyWith<$Res> {
  __$MenuSelectedCopyWithImpl(this._self, this._then);

  final _MenuSelected _self;
  final $Res Function(_MenuSelected) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? category = null}) {
    return _then(
      _MenuSelected(
        null == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as SettingsCategoryId,
      ),
    );
  }
}

/// @nodoc

class _ToggleRequested implements SettingsEvent {
  const _ToggleRequested(this.ref);

  final SettingsPreferenceRef ref;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToggleRequestedCopyWith<_ToggleRequested> get copyWith =>
      __$ToggleRequestedCopyWithImpl<_ToggleRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToggleRequested &&
            (identical(other.ref, ref) || other.ref == ref));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref);

  @override
  String toString() {
    return 'SettingsEvent.toggleRequested(ref: $ref)';
  }
}

/// @nodoc
abstract mixin class _$ToggleRequestedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory _$ToggleRequestedCopyWith(
    _ToggleRequested value,
    $Res Function(_ToggleRequested) _then,
  ) = __$ToggleRequestedCopyWithImpl;
  @useResult
  $Res call({SettingsPreferenceRef ref});
}

/// @nodoc
class __$ToggleRequestedCopyWithImpl<$Res>
    implements _$ToggleRequestedCopyWith<$Res> {
  __$ToggleRequestedCopyWithImpl(this._self, this._then);

  final _ToggleRequested _self;
  final $Res Function(_ToggleRequested) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? ref = null}) {
    return _then(
      _ToggleRequested(
        null == ref
            ? _self.ref
            : ref // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferenceRef,
      ),
    );
  }
}

/// @nodoc

class _EditorOpened implements SettingsEvent {
  const _EditorOpened(this.ref);

  final SettingsPreferenceRef ref;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EditorOpenedCopyWith<_EditorOpened> get copyWith =>
      __$EditorOpenedCopyWithImpl<_EditorOpened>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditorOpened &&
            (identical(other.ref, ref) || other.ref == ref));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref);

  @override
  String toString() {
    return 'SettingsEvent.editorOpened(ref: $ref)';
  }
}

/// @nodoc
abstract mixin class _$EditorOpenedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory _$EditorOpenedCopyWith(
    _EditorOpened value,
    $Res Function(_EditorOpened) _then,
  ) = __$EditorOpenedCopyWithImpl;
  @useResult
  $Res call({SettingsPreferenceRef ref});
}

/// @nodoc
class __$EditorOpenedCopyWithImpl<$Res>
    implements _$EditorOpenedCopyWith<$Res> {
  __$EditorOpenedCopyWithImpl(this._self, this._then);

  final _EditorOpened _self;
  final $Res Function(_EditorOpened) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? ref = null}) {
    return _then(
      _EditorOpened(
        null == ref
            ? _self.ref
            : ref // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferenceRef,
      ),
    );
  }
}

/// @nodoc

class _EditorClosed implements SettingsEvent {
  const _EditorClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EditorClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.editorClosed()';
  }
}

/// @nodoc

class _OptionSelected implements SettingsEvent {
  const _OptionSelected({required this.ref, required this.value});

  final SettingsPreferenceRef ref;
  final int value;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OptionSelectedCopyWith<_OptionSelected> get copyWith =>
      __$OptionSelectedCopyWithImpl<_OptionSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OptionSelected &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref, value);

  @override
  String toString() {
    return 'SettingsEvent.optionSelected(ref: $ref, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$OptionSelectedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory _$OptionSelectedCopyWith(
    _OptionSelected value,
    $Res Function(_OptionSelected) _then,
  ) = __$OptionSelectedCopyWithImpl;
  @useResult
  $Res call({SettingsPreferenceRef ref, int value});
}

/// @nodoc
class __$OptionSelectedCopyWithImpl<$Res>
    implements _$OptionSelectedCopyWith<$Res> {
  __$OptionSelectedCopyWithImpl(this._self, this._then);

  final _OptionSelected _self;
  final $Res Function(_OptionSelected) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? ref = null, Object? value = null}) {
    return _then(
      _OptionSelected(
        ref: null == ref
            ? _self.ref
            : ref // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferenceRef,
        value: null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _SliderChanged implements SettingsEvent {
  const _SliderChanged({required this.ref, required this.value});

  final SettingsPreferenceRef ref;
  final int value;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SliderChangedCopyWith<_SliderChanged> get copyWith =>
      __$SliderChangedCopyWithImpl<_SliderChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SliderChanged &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref, value);

  @override
  String toString() {
    return 'SettingsEvent.sliderChanged(ref: $ref, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$SliderChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory _$SliderChangedCopyWith(
    _SliderChanged value,
    $Res Function(_SliderChanged) _then,
  ) = __$SliderChangedCopyWithImpl;
  @useResult
  $Res call({SettingsPreferenceRef ref, int value});
}

/// @nodoc
class __$SliderChangedCopyWithImpl<$Res>
    implements _$SliderChangedCopyWith<$Res> {
  __$SliderChangedCopyWithImpl(this._self, this._then);

  final _SliderChanged _self;
  final $Res Function(_SliderChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? ref = null, Object? value = null}) {
    return _then(
      _SliderChanged(
        ref: null == ref
            ? _self.ref
            : ref // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferenceRef,
        value: null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _SliderChangeCommitted implements SettingsEvent {
  const _SliderChangeCommitted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SliderChangeCommitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.sliderChangeCommitted()';
  }
}

/// @nodoc

class _SliderSaveDebounceElapsed implements SettingsEvent {
  const _SliderSaveDebounceElapsed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SliderSaveDebounceElapsed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.sliderSaveDebounceElapsed()';
  }
}

/// @nodoc

class _ResetRequested implements SettingsEvent {
  const _ResetRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ResetRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.resetRequested()';
  }
}

/// @nodoc

class _UpdateCheckRequested implements SettingsEvent {
  const _UpdateCheckRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UpdateCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.updateCheckRequested()';
  }
}

/// @nodoc
mixin _$SettingsState {
  SettingsLoadStatus get loadStatus;
  SettingsSaveStatus get saveStatus;
  SettingsUpdateStatus get updateStatus;
  SettingsCategoryId get selectedCategory;
  SettingsPreferences get preferences;
  SettingsPreferenceRef? get activeEditor;
  SettingsUpdateInfo? get latestRelease;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      _$SettingsStateCopyWithImpl<SettingsState>(
        this as SettingsState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsState &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            (identical(other.saveStatus, saveStatus) ||
                other.saveStatus == saveStatus) &&
            (identical(other.updateStatus, updateStatus) ||
                other.updateStatus == updateStatus) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.activeEditor, activeEditor) ||
                other.activeEditor == activeEditor) &&
            (identical(other.latestRelease, latestRelease) ||
                other.latestRelease == latestRelease));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loadStatus,
    saveStatus,
    updateStatus,
    selectedCategory,
    preferences,
    activeEditor,
    latestRelease,
  );

  @override
  String toString() {
    return 'SettingsState(loadStatus: $loadStatus, saveStatus: $saveStatus, updateStatus: $updateStatus, selectedCategory: $selectedCategory, preferences: $preferences, activeEditor: $activeEditor, latestRelease: $latestRelease)';
  }
}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
    SettingsState value,
    $Res Function(SettingsState) _then,
  ) = _$SettingsStateCopyWithImpl;
  @useResult
  $Res call({
    SettingsLoadStatus loadStatus,
    SettingsSaveStatus saveStatus,
    SettingsUpdateStatus updateStatus,
    SettingsCategoryId selectedCategory,
    SettingsPreferences preferences,
    SettingsPreferenceRef? activeEditor,
    SettingsUpdateInfo? latestRelease,
  });

  $SettingsPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadStatus = null,
    Object? saveStatus = null,
    Object? updateStatus = null,
    Object? selectedCategory = null,
    Object? preferences = null,
    Object? activeEditor = freezed,
    Object? latestRelease = freezed,
  }) {
    return _then(
      _self.copyWith(
        loadStatus: null == loadStatus
            ? _self.loadStatus
            : loadStatus // ignore: cast_nullable_to_non_nullable
                  as SettingsLoadStatus,
        saveStatus: null == saveStatus
            ? _self.saveStatus
            : saveStatus // ignore: cast_nullable_to_non_nullable
                  as SettingsSaveStatus,
        updateStatus: null == updateStatus
            ? _self.updateStatus
            : updateStatus // ignore: cast_nullable_to_non_nullable
                  as SettingsUpdateStatus,
        selectedCategory: null == selectedCategory
            ? _self.selectedCategory
            : selectedCategory // ignore: cast_nullable_to_non_nullable
                  as SettingsCategoryId,
        preferences: null == preferences
            ? _self.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferences,
        activeEditor: freezed == activeEditor
            ? _self.activeEditor
            : activeEditor // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferenceRef?,
        latestRelease: freezed == latestRelease
            ? _self.latestRelease
            : latestRelease // ignore: cast_nullable_to_non_nullable
                  as SettingsUpdateInfo?,
      ),
    );
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsPreferencesCopyWith<$Res> get preferences {
    return $SettingsPreferencesCopyWith<$Res>(_self.preferences, (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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
    TResult Function(_SettingsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsState() when $default != null:
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
    TResult Function(_SettingsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsState():
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
    TResult? Function(_SettingsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsState() when $default != null:
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
      SettingsLoadStatus loadStatus,
      SettingsSaveStatus saveStatus,
      SettingsUpdateStatus updateStatus,
      SettingsCategoryId selectedCategory,
      SettingsPreferences preferences,
      SettingsPreferenceRef? activeEditor,
      SettingsUpdateInfo? latestRelease,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsState() when $default != null:
        return $default(
          _that.loadStatus,
          _that.saveStatus,
          _that.updateStatus,
          _that.selectedCategory,
          _that.preferences,
          _that.activeEditor,
          _that.latestRelease,
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
      SettingsLoadStatus loadStatus,
      SettingsSaveStatus saveStatus,
      SettingsUpdateStatus updateStatus,
      SettingsCategoryId selectedCategory,
      SettingsPreferences preferences,
      SettingsPreferenceRef? activeEditor,
      SettingsUpdateInfo? latestRelease,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsState():
        return $default(
          _that.loadStatus,
          _that.saveStatus,
          _that.updateStatus,
          _that.selectedCategory,
          _that.preferences,
          _that.activeEditor,
          _that.latestRelease,
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
      SettingsLoadStatus loadStatus,
      SettingsSaveStatus saveStatus,
      SettingsUpdateStatus updateStatus,
      SettingsCategoryId selectedCategory,
      SettingsPreferences preferences,
      SettingsPreferenceRef? activeEditor,
      SettingsUpdateInfo? latestRelease,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsState() when $default != null:
        return $default(
          _that.loadStatus,
          _that.saveStatus,
          _that.updateStatus,
          _that.selectedCategory,
          _that.preferences,
          _that.activeEditor,
          _that.latestRelease,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SettingsState implements SettingsState {
  const _SettingsState({
    this.loadStatus = SettingsLoadStatus.initial,
    this.saveStatus = SettingsSaveStatus.idle,
    this.updateStatus = SettingsUpdateStatus.idle,
    this.selectedCategory = SettingsCategoryId.general,
    this.preferences = defaultSettingsPreferences,
    this.activeEditor,
    this.latestRelease,
  });

  @override
  @JsonKey()
  final SettingsLoadStatus loadStatus;
  @override
  @JsonKey()
  final SettingsSaveStatus saveStatus;
  @override
  @JsonKey()
  final SettingsUpdateStatus updateStatus;
  @override
  @JsonKey()
  final SettingsCategoryId selectedCategory;
  @override
  @JsonKey()
  final SettingsPreferences preferences;
  @override
  final SettingsPreferenceRef? activeEditor;
  @override
  final SettingsUpdateInfo? latestRelease;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsState &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            (identical(other.saveStatus, saveStatus) ||
                other.saveStatus == saveStatus) &&
            (identical(other.updateStatus, updateStatus) ||
                other.updateStatus == updateStatus) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.activeEditor, activeEditor) ||
                other.activeEditor == activeEditor) &&
            (identical(other.latestRelease, latestRelease) ||
                other.latestRelease == latestRelease));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loadStatus,
    saveStatus,
    updateStatus,
    selectedCategory,
    preferences,
    activeEditor,
    latestRelease,
  );

  @override
  String toString() {
    return 'SettingsState(loadStatus: $loadStatus, saveStatus: $saveStatus, updateStatus: $updateStatus, selectedCategory: $selectedCategory, preferences: $preferences, activeEditor: $activeEditor, latestRelease: $latestRelease)';
  }
}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(
    _SettingsState value,
    $Res Function(_SettingsState) _then,
  ) = __$SettingsStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    SettingsLoadStatus loadStatus,
    SettingsSaveStatus saveStatus,
    SettingsUpdateStatus updateStatus,
    SettingsCategoryId selectedCategory,
    SettingsPreferences preferences,
    SettingsPreferenceRef? activeEditor,
    SettingsUpdateInfo? latestRelease,
  });

  @override
  $SettingsPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadStatus = null,
    Object? saveStatus = null,
    Object? updateStatus = null,
    Object? selectedCategory = null,
    Object? preferences = null,
    Object? activeEditor = freezed,
    Object? latestRelease = freezed,
  }) {
    return _then(
      _SettingsState(
        loadStatus: null == loadStatus
            ? _self.loadStatus
            : loadStatus // ignore: cast_nullable_to_non_nullable
                  as SettingsLoadStatus,
        saveStatus: null == saveStatus
            ? _self.saveStatus
            : saveStatus // ignore: cast_nullable_to_non_nullable
                  as SettingsSaveStatus,
        updateStatus: null == updateStatus
            ? _self.updateStatus
            : updateStatus // ignore: cast_nullable_to_non_nullable
                  as SettingsUpdateStatus,
        selectedCategory: null == selectedCategory
            ? _self.selectedCategory
            : selectedCategory // ignore: cast_nullable_to_non_nullable
                  as SettingsCategoryId,
        preferences: null == preferences
            ? _self.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferences,
        activeEditor: freezed == activeEditor
            ? _self.activeEditor
            : activeEditor // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferenceRef?,
        latestRelease: freezed == latestRelease
            ? _self.latestRelease
            : latestRelease // ignore: cast_nullable_to_non_nullable
                  as SettingsUpdateInfo?,
      ),
    );
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsPreferencesCopyWith<$Res> get preferences {
    return $SettingsPreferencesCopyWith<$Res>(_self.preferences, (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}
