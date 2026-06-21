// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchEvent()';
  }
}

/// @nodoc
class $SearchEventCopyWith<$Res> {
  $SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}

/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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
    TResult Function(_TabSelected value)? tabSelected,
    TResult Function(_InputSelected value)? inputSelected,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_KeyboardValueChanged value)? keyboardValueChanged,
    TResult Function(_KeyboardSubmitted value)? keyboardSubmitted,
    TResult Function(_KeyboardClosed value)? keyboardClosed,
    TResult Function(_SuggestionSelected value)? suggestionSelected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that);
      case _InputSelected() when inputSelected != null:
        return inputSelected(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _KeyboardValueChanged() when keyboardValueChanged != null:
        return keyboardValueChanged(_that);
      case _KeyboardSubmitted() when keyboardSubmitted != null:
        return keyboardSubmitted(_that);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed(_that);
      case _SuggestionSelected() when suggestionSelected != null:
        return suggestionSelected(_that);
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
    required TResult Function(_TabSelected value) tabSelected,
    required TResult Function(_InputSelected value) inputSelected,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_KeyboardValueChanged value) keyboardValueChanged,
    required TResult Function(_KeyboardSubmitted value) keyboardSubmitted,
    required TResult Function(_KeyboardClosed value) keyboardClosed,
    required TResult Function(_SuggestionSelected value) suggestionSelected,
  }) {
    final _that = this;
    switch (_that) {
      case _TabSelected():
        return tabSelected(_that);
      case _InputSelected():
        return inputSelected(_that);
      case _RetryRequested():
        return retryRequested(_that);
      case _KeyboardValueChanged():
        return keyboardValueChanged(_that);
      case _KeyboardSubmitted():
        return keyboardSubmitted(_that);
      case _KeyboardClosed():
        return keyboardClosed(_that);
      case _SuggestionSelected():
        return suggestionSelected(_that);
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
    TResult? Function(_TabSelected value)? tabSelected,
    TResult? Function(_InputSelected value)? inputSelected,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_KeyboardValueChanged value)? keyboardValueChanged,
    TResult? Function(_KeyboardSubmitted value)? keyboardSubmitted,
    TResult? Function(_KeyboardClosed value)? keyboardClosed,
    TResult? Function(_SuggestionSelected value)? suggestionSelected,
  }) {
    final _that = this;
    switch (_that) {
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that);
      case _InputSelected() when inputSelected != null:
        return inputSelected(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _KeyboardValueChanged() when keyboardValueChanged != null:
        return keyboardValueChanged(_that);
      case _KeyboardSubmitted() when keyboardSubmitted != null:
        return keyboardSubmitted(_that);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed(_that);
      case _SuggestionSelected() when suggestionSelected != null:
        return suggestionSelected(_that);
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
    TResult Function(SearchTab tab)? tabSelected,
    TResult Function()? inputSelected,
    TResult Function()? retryRequested,
    TResult Function(String value)? keyboardValueChanged,
    TResult Function(String value)? keyboardSubmitted,
    TResult Function()? keyboardClosed,
    TResult Function(String value)? suggestionSelected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _InputSelected() when inputSelected != null:
        return inputSelected();
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _KeyboardValueChanged() when keyboardValueChanged != null:
        return keyboardValueChanged(_that.value);
      case _KeyboardSubmitted() when keyboardSubmitted != null:
        return keyboardSubmitted(_that.value);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed();
      case _SuggestionSelected() when suggestionSelected != null:
        return suggestionSelected(_that.value);
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
    required TResult Function(SearchTab tab) tabSelected,
    required TResult Function() inputSelected,
    required TResult Function() retryRequested,
    required TResult Function(String value) keyboardValueChanged,
    required TResult Function(String value) keyboardSubmitted,
    required TResult Function() keyboardClosed,
    required TResult Function(String value) suggestionSelected,
  }) {
    final _that = this;
    switch (_that) {
      case _TabSelected():
        return tabSelected(_that.tab);
      case _InputSelected():
        return inputSelected();
      case _RetryRequested():
        return retryRequested();
      case _KeyboardValueChanged():
        return keyboardValueChanged(_that.value);
      case _KeyboardSubmitted():
        return keyboardSubmitted(_that.value);
      case _KeyboardClosed():
        return keyboardClosed();
      case _SuggestionSelected():
        return suggestionSelected(_that.value);
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
    TResult? Function(SearchTab tab)? tabSelected,
    TResult? Function()? inputSelected,
    TResult? Function()? retryRequested,
    TResult? Function(String value)? keyboardValueChanged,
    TResult? Function(String value)? keyboardSubmitted,
    TResult? Function()? keyboardClosed,
    TResult? Function(String value)? suggestionSelected,
  }) {
    final _that = this;
    switch (_that) {
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _InputSelected() when inputSelected != null:
        return inputSelected();
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _KeyboardValueChanged() when keyboardValueChanged != null:
        return keyboardValueChanged(_that.value);
      case _KeyboardSubmitted() when keyboardSubmitted != null:
        return keyboardSubmitted(_that.value);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed();
      case _SuggestionSelected() when suggestionSelected != null:
        return suggestionSelected(_that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TabSelected implements SearchEvent {
  const _TabSelected(this.tab);

  final SearchTab tab;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TabSelectedCopyWith<_TabSelected> get copyWith =>
      __$TabSelectedCopyWithImpl<_TabSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TabSelected &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab);

  @override
  String toString() {
    return 'SearchEvent.tabSelected(tab: $tab)';
  }
}

/// @nodoc
abstract mixin class _$TabSelectedCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$TabSelectedCopyWith(
    _TabSelected value,
    $Res Function(_TabSelected) _then,
  ) = __$TabSelectedCopyWithImpl;
  @useResult
  $Res call({SearchTab tab});
}

/// @nodoc
class __$TabSelectedCopyWithImpl<$Res> implements _$TabSelectedCopyWith<$Res> {
  __$TabSelectedCopyWithImpl(this._self, this._then);

  final _TabSelected _self;
  final $Res Function(_TabSelected) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? tab = null}) {
    return _then(
      _TabSelected(
        null == tab
            ? _self.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as SearchTab,
      ),
    );
  }
}

/// @nodoc

class _InputSelected implements SearchEvent {
  const _InputSelected();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InputSelected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchEvent.inputSelected()';
  }
}

/// @nodoc

class _RetryRequested implements SearchEvent {
  const _RetryRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RetryRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchEvent.retryRequested()';
  }
}

/// @nodoc

class _KeyboardValueChanged implements SearchEvent {
  const _KeyboardValueChanged(this.value);

  final String value;

  /// Create a copy of SearchEvent
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

  @override
  String toString() {
    return 'SearchEvent.keyboardValueChanged(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$KeyboardValueChangedCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
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

  /// Create a copy of SearchEvent
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

class _KeyboardSubmitted implements SearchEvent {
  const _KeyboardSubmitted(this.value);

  final String value;

  /// Create a copy of SearchEvent
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

  @override
  String toString() {
    return 'SearchEvent.keyboardSubmitted(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$KeyboardSubmittedCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
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

  /// Create a copy of SearchEvent
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

class _KeyboardClosed implements SearchEvent {
  const _KeyboardClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _KeyboardClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchEvent.keyboardClosed()';
  }
}

/// @nodoc

class _SuggestionSelected implements SearchEvent {
  const _SuggestionSelected(this.value);

  final String value;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuggestionSelectedCopyWith<_SuggestionSelected> get copyWith =>
      __$SuggestionSelectedCopyWithImpl<_SuggestionSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuggestionSelected &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SearchEvent.suggestionSelected(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$SuggestionSelectedCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$SuggestionSelectedCopyWith(
    _SuggestionSelected value,
    $Res Function(_SuggestionSelected) _then,
  ) = __$SuggestionSelectedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$SuggestionSelectedCopyWithImpl<$Res>
    implements _$SuggestionSelectedCopyWith<$Res> {
  __$SuggestionSelectedCopyWithImpl(this._self, this._then);

  final _SuggestionSelected _self;
  final $Res Function(_SuggestionSelected) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? value = null}) {
    return _then(
      _SuggestionSelected(
        null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$SearchNavigationRequest {
  SearchNavigationTarget get target;
  String get query;
  int get serial;

  /// Create a copy of SearchNavigationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchNavigationRequestCopyWith<SearchNavigationRequest> get copyWith =>
      _$SearchNavigationRequestCopyWithImpl<SearchNavigationRequest>(
        this as SearchNavigationRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchNavigationRequest &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.serial, serial) || other.serial == serial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, target, query, serial);

  @override
  String toString() {
    return 'SearchNavigationRequest(target: $target, query: $query, serial: $serial)';
  }
}

/// @nodoc
abstract mixin class $SearchNavigationRequestCopyWith<$Res> {
  factory $SearchNavigationRequestCopyWith(
    SearchNavigationRequest value,
    $Res Function(SearchNavigationRequest) _then,
  ) = _$SearchNavigationRequestCopyWithImpl;
  @useResult
  $Res call({SearchNavigationTarget target, String query, int serial});
}

/// @nodoc
class _$SearchNavigationRequestCopyWithImpl<$Res>
    implements $SearchNavigationRequestCopyWith<$Res> {
  _$SearchNavigationRequestCopyWithImpl(this._self, this._then);

  final SearchNavigationRequest _self;
  final $Res Function(SearchNavigationRequest) _then;

  /// Create a copy of SearchNavigationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? query = null,
    Object? serial = null,
  }) {
    return _then(
      _self.copyWith(
        target: null == target
            ? _self.target
            : target // ignore: cast_nullable_to_non_nullable
                  as SearchNavigationTarget,
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        serial: null == serial
            ? _self.serial
            : serial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchNavigationRequest].
extension SearchNavigationRequestPatterns on SearchNavigationRequest {
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
    TResult Function(_SearchNavigationRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchNavigationRequest() when $default != null:
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
    TResult Function(_SearchNavigationRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchNavigationRequest():
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
    TResult? Function(_SearchNavigationRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchNavigationRequest() when $default != null:
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
    TResult Function(SearchNavigationTarget target, String query, int serial)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchNavigationRequest() when $default != null:
        return $default(_that.target, _that.query, _that.serial);
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
    TResult Function(SearchNavigationTarget target, String query, int serial)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchNavigationRequest():
        return $default(_that.target, _that.query, _that.serial);
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
    TResult? Function(SearchNavigationTarget target, String query, int serial)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchNavigationRequest() when $default != null:
        return $default(_that.target, _that.query, _that.serial);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchNavigationRequest implements SearchNavigationRequest {
  const _SearchNavigationRequest({
    required this.target,
    required this.query,
    required this.serial,
  });

  @override
  final SearchNavigationTarget target;
  @override
  final String query;
  @override
  final int serial;

  /// Create a copy of SearchNavigationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchNavigationRequestCopyWith<_SearchNavigationRequest> get copyWith =>
      __$SearchNavigationRequestCopyWithImpl<_SearchNavigationRequest>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchNavigationRequest &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.serial, serial) || other.serial == serial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, target, query, serial);

  @override
  String toString() {
    return 'SearchNavigationRequest(target: $target, query: $query, serial: $serial)';
  }
}

/// @nodoc
abstract mixin class _$SearchNavigationRequestCopyWith<$Res>
    implements $SearchNavigationRequestCopyWith<$Res> {
  factory _$SearchNavigationRequestCopyWith(
    _SearchNavigationRequest value,
    $Res Function(_SearchNavigationRequest) _then,
  ) = __$SearchNavigationRequestCopyWithImpl;
  @override
  @useResult
  $Res call({SearchNavigationTarget target, String query, int serial});
}

/// @nodoc
class __$SearchNavigationRequestCopyWithImpl<$Res>
    implements _$SearchNavigationRequestCopyWith<$Res> {
  __$SearchNavigationRequestCopyWithImpl(this._self, this._then);

  final _SearchNavigationRequest _self;
  final $Res Function(_SearchNavigationRequest) _then;

  /// Create a copy of SearchNavigationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? target = null,
    Object? query = null,
    Object? serial = null,
  }) {
    return _then(
      _SearchNavigationRequest(
        target: null == target
            ? _self.target
            : target // ignore: cast_nullable_to_non_nullable
                  as SearchNavigationTarget,
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        serial: null == serial
            ? _self.serial
            : serial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$SearchState {
  SearchTab get selectedTab;
  String get query;
  bool get isKeyboardOpen;
  SearchSuggestionStatus get channelCategoryStatus;
  List<String> get channelSuggestions;
  List<String> get categorySuggestions;
  SearchSuggestionStatus get tagStatus;
  List<String> get tagSuggestions;
  SearchNavigationRequest? get navigationRequest;
  int get navigationSerial;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchStateCopyWith<SearchState> get copyWith =>
      _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchState &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isKeyboardOpen, isKeyboardOpen) ||
                other.isKeyboardOpen == isKeyboardOpen) &&
            (identical(other.channelCategoryStatus, channelCategoryStatus) ||
                other.channelCategoryStatus == channelCategoryStatus) &&
            const DeepCollectionEquality().equals(
              other.channelSuggestions,
              channelSuggestions,
            ) &&
            const DeepCollectionEquality().equals(
              other.categorySuggestions,
              categorySuggestions,
            ) &&
            (identical(other.tagStatus, tagStatus) ||
                other.tagStatus == tagStatus) &&
            const DeepCollectionEquality().equals(
              other.tagSuggestions,
              tagSuggestions,
            ) &&
            (identical(other.navigationRequest, navigationRequest) ||
                other.navigationRequest == navigationRequest) &&
            (identical(other.navigationSerial, navigationSerial) ||
                other.navigationSerial == navigationSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    selectedTab,
    query,
    isKeyboardOpen,
    channelCategoryStatus,
    const DeepCollectionEquality().hash(channelSuggestions),
    const DeepCollectionEquality().hash(categorySuggestions),
    tagStatus,
    const DeepCollectionEquality().hash(tagSuggestions),
    navigationRequest,
    navigationSerial,
  );

  @override
  String toString() {
    return 'SearchState(selectedTab: $selectedTab, query: $query, isKeyboardOpen: $isKeyboardOpen, channelCategoryStatus: $channelCategoryStatus, channelSuggestions: $channelSuggestions, categorySuggestions: $categorySuggestions, tagStatus: $tagStatus, tagSuggestions: $tagSuggestions, navigationRequest: $navigationRequest, navigationSerial: $navigationSerial)';
  }
}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
    SearchState value,
    $Res Function(SearchState) _then,
  ) = _$SearchStateCopyWithImpl;
  @useResult
  $Res call({
    SearchTab selectedTab,
    String query,
    bool isKeyboardOpen,
    SearchSuggestionStatus channelCategoryStatus,
    List<String> channelSuggestions,
    List<String> categorySuggestions,
    SearchSuggestionStatus tagStatus,
    List<String> tagSuggestions,
    SearchNavigationRequest? navigationRequest,
    int navigationSerial,
  });

  $SearchNavigationRequestCopyWith<$Res>? get navigationRequest;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTab = null,
    Object? query = null,
    Object? isKeyboardOpen = null,
    Object? channelCategoryStatus = null,
    Object? channelSuggestions = null,
    Object? categorySuggestions = null,
    Object? tagStatus = null,
    Object? tagSuggestions = null,
    Object? navigationRequest = freezed,
    Object? navigationSerial = null,
  }) {
    return _then(
      _self.copyWith(
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as SearchTab,
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        isKeyboardOpen: null == isKeyboardOpen
            ? _self.isKeyboardOpen
            : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        channelCategoryStatus: null == channelCategoryStatus
            ? _self.channelCategoryStatus
            : channelCategoryStatus // ignore: cast_nullable_to_non_nullable
                  as SearchSuggestionStatus,
        channelSuggestions: null == channelSuggestions
            ? _self.channelSuggestions
            : channelSuggestions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categorySuggestions: null == categorySuggestions
            ? _self.categorySuggestions
            : categorySuggestions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        tagStatus: null == tagStatus
            ? _self.tagStatus
            : tagStatus // ignore: cast_nullable_to_non_nullable
                  as SearchSuggestionStatus,
        tagSuggestions: null == tagSuggestions
            ? _self.tagSuggestions
            : tagSuggestions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        navigationRequest: freezed == navigationRequest
            ? _self.navigationRequest
            : navigationRequest // ignore: cast_nullable_to_non_nullable
                  as SearchNavigationRequest?,
        navigationSerial: null == navigationSerial
            ? _self.navigationSerial
            : navigationSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchNavigationRequestCopyWith<$Res>? get navigationRequest {
    if (_self.navigationRequest == null) {
      return null;
    }

    return $SearchNavigationRequestCopyWith<$Res>(_self.navigationRequest!, (
      value,
    ) {
      return _then(_self.copyWith(navigationRequest: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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
    TResult Function(_SearchState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
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
    TResult Function(_SearchState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
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
    TResult? Function(_SearchState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
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
      SearchTab selectedTab,
      String query,
      bool isKeyboardOpen,
      SearchSuggestionStatus channelCategoryStatus,
      List<String> channelSuggestions,
      List<String> categorySuggestions,
      SearchSuggestionStatus tagStatus,
      List<String> tagSuggestions,
      SearchNavigationRequest? navigationRequest,
      int navigationSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
          _that.selectedTab,
          _that.query,
          _that.isKeyboardOpen,
          _that.channelCategoryStatus,
          _that.channelSuggestions,
          _that.categorySuggestions,
          _that.tagStatus,
          _that.tagSuggestions,
          _that.navigationRequest,
          _that.navigationSerial,
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
      SearchTab selectedTab,
      String query,
      bool isKeyboardOpen,
      SearchSuggestionStatus channelCategoryStatus,
      List<String> channelSuggestions,
      List<String> categorySuggestions,
      SearchSuggestionStatus tagStatus,
      List<String> tagSuggestions,
      SearchNavigationRequest? navigationRequest,
      int navigationSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
        return $default(
          _that.selectedTab,
          _that.query,
          _that.isKeyboardOpen,
          _that.channelCategoryStatus,
          _that.channelSuggestions,
          _that.categorySuggestions,
          _that.tagStatus,
          _that.tagSuggestions,
          _that.navigationRequest,
          _that.navigationSerial,
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
      SearchTab selectedTab,
      String query,
      bool isKeyboardOpen,
      SearchSuggestionStatus channelCategoryStatus,
      List<String> channelSuggestions,
      List<String> categorySuggestions,
      SearchSuggestionStatus tagStatus,
      List<String> tagSuggestions,
      SearchNavigationRequest? navigationRequest,
      int navigationSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
          _that.selectedTab,
          _that.query,
          _that.isKeyboardOpen,
          _that.channelCategoryStatus,
          _that.channelSuggestions,
          _that.categorySuggestions,
          _that.tagStatus,
          _that.tagSuggestions,
          _that.navigationRequest,
          _that.navigationSerial,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchState extends SearchState {
  const _SearchState({
    required this.selectedTab,
    required this.query,
    required this.isKeyboardOpen,
    required this.channelCategoryStatus,
    required final List<String> channelSuggestions,
    required final List<String> categorySuggestions,
    required this.tagStatus,
    required final List<String> tagSuggestions,
    this.navigationRequest,
    this.navigationSerial = 0,
  }) : _channelSuggestions = channelSuggestions,
       _categorySuggestions = categorySuggestions,
       _tagSuggestions = tagSuggestions,
       super._();

  @override
  final SearchTab selectedTab;
  @override
  final String query;
  @override
  final bool isKeyboardOpen;
  @override
  final SearchSuggestionStatus channelCategoryStatus;
  final List<String> _channelSuggestions;
  @override
  List<String> get channelSuggestions {
    if (_channelSuggestions is EqualUnmodifiableListView)
      return _channelSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channelSuggestions);
  }

  final List<String> _categorySuggestions;
  @override
  List<String> get categorySuggestions {
    if (_categorySuggestions is EqualUnmodifiableListView)
      return _categorySuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categorySuggestions);
  }

  @override
  final SearchSuggestionStatus tagStatus;
  final List<String> _tagSuggestions;
  @override
  List<String> get tagSuggestions {
    if (_tagSuggestions is EqualUnmodifiableListView) return _tagSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagSuggestions);
  }

  @override
  final SearchNavigationRequest? navigationRequest;
  @override
  @JsonKey()
  final int navigationSerial;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchState &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isKeyboardOpen, isKeyboardOpen) ||
                other.isKeyboardOpen == isKeyboardOpen) &&
            (identical(other.channelCategoryStatus, channelCategoryStatus) ||
                other.channelCategoryStatus == channelCategoryStatus) &&
            const DeepCollectionEquality().equals(
              other._channelSuggestions,
              _channelSuggestions,
            ) &&
            const DeepCollectionEquality().equals(
              other._categorySuggestions,
              _categorySuggestions,
            ) &&
            (identical(other.tagStatus, tagStatus) ||
                other.tagStatus == tagStatus) &&
            const DeepCollectionEquality().equals(
              other._tagSuggestions,
              _tagSuggestions,
            ) &&
            (identical(other.navigationRequest, navigationRequest) ||
                other.navigationRequest == navigationRequest) &&
            (identical(other.navigationSerial, navigationSerial) ||
                other.navigationSerial == navigationSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    selectedTab,
    query,
    isKeyboardOpen,
    channelCategoryStatus,
    const DeepCollectionEquality().hash(_channelSuggestions),
    const DeepCollectionEquality().hash(_categorySuggestions),
    tagStatus,
    const DeepCollectionEquality().hash(_tagSuggestions),
    navigationRequest,
    navigationSerial,
  );

  @override
  String toString() {
    return 'SearchState(selectedTab: $selectedTab, query: $query, isKeyboardOpen: $isKeyboardOpen, channelCategoryStatus: $channelCategoryStatus, channelSuggestions: $channelSuggestions, categorySuggestions: $categorySuggestions, tagStatus: $tagStatus, tagSuggestions: $tagSuggestions, navigationRequest: $navigationRequest, navigationSerial: $navigationSerial)';
  }
}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
    _SearchState value,
    $Res Function(_SearchState) _then,
  ) = __$SearchStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    SearchTab selectedTab,
    String query,
    bool isKeyboardOpen,
    SearchSuggestionStatus channelCategoryStatus,
    List<String> channelSuggestions,
    List<String> categorySuggestions,
    SearchSuggestionStatus tagStatus,
    List<String> tagSuggestions,
    SearchNavigationRequest? navigationRequest,
    int navigationSerial,
  });

  @override
  $SearchNavigationRequestCopyWith<$Res>? get navigationRequest;
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedTab = null,
    Object? query = null,
    Object? isKeyboardOpen = null,
    Object? channelCategoryStatus = null,
    Object? channelSuggestions = null,
    Object? categorySuggestions = null,
    Object? tagStatus = null,
    Object? tagSuggestions = null,
    Object? navigationRequest = freezed,
    Object? navigationSerial = null,
  }) {
    return _then(
      _SearchState(
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as SearchTab,
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        isKeyboardOpen: null == isKeyboardOpen
            ? _self.isKeyboardOpen
            : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        channelCategoryStatus: null == channelCategoryStatus
            ? _self.channelCategoryStatus
            : channelCategoryStatus // ignore: cast_nullable_to_non_nullable
                  as SearchSuggestionStatus,
        channelSuggestions: null == channelSuggestions
            ? _self._channelSuggestions
            : channelSuggestions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categorySuggestions: null == categorySuggestions
            ? _self._categorySuggestions
            : categorySuggestions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        tagStatus: null == tagStatus
            ? _self.tagStatus
            : tagStatus // ignore: cast_nullable_to_non_nullable
                  as SearchSuggestionStatus,
        tagSuggestions: null == tagSuggestions
            ? _self._tagSuggestions
            : tagSuggestions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        navigationRequest: freezed == navigationRequest
            ? _self.navigationRequest
            : navigationRequest // ignore: cast_nullable_to_non_nullable
                  as SearchNavigationRequest?,
        navigationSerial: null == navigationSerial
            ? _self.navigationSerial
            : navigationSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchNavigationRequestCopyWith<$Res>? get navigationRequest {
    if (_self.navigationRequest == null) {
      return null;
    }

    return $SearchNavigationRequestCopyWith<$Res>(_self.navigationRequest!, (
      value,
    ) {
      return _then(_self.copyWith(navigationRequest: value));
    });
  }
}
