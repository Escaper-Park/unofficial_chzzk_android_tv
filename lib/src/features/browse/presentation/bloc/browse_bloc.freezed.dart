// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'browse_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrowseEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BrowseEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrowseEvent()';
  }
}

/// @nodoc
class $BrowseEventCopyWith<$Res> {
  $BrowseEventCopyWith(BrowseEvent _, $Res Function(BrowseEvent) __);
}

/// Adds pattern-matching-related methods to [BrowseEvent].
extension BrowseEventPatterns on BrowseEvent {
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
    TResult Function(_AuthStateChanged value)? authStateChanged,
    TResult Function(_TabSelected value)? tabSelected,
    TResult Function(_LiveSortSelected value)? liveSortSelected,
    TResult Function(_VodSortSelected value)? vodSortSelected,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_LoadMoreRequested value)? loadMoreRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that);
      case _LiveSortSelected() when liveSortSelected != null:
        return liveSortSelected(_that);
      case _VodSortSelected() when vodSortSelected != null:
        return vodSortSelected(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
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
    required TResult Function(_AuthStateChanged value) authStateChanged,
    required TResult Function(_TabSelected value) tabSelected,
    required TResult Function(_LiveSortSelected value) liveSortSelected,
    required TResult Function(_VodSortSelected value) vodSortSelected,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_LoadMoreRequested value) loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _AuthStateChanged():
        return authStateChanged(_that);
      case _TabSelected():
        return tabSelected(_that);
      case _LiveSortSelected():
        return liveSortSelected(_that);
      case _VodSortSelected():
        return vodSortSelected(_that);
      case _RetryRequested():
        return retryRequested(_that);
      case _LoadMoreRequested():
        return loadMoreRequested(_that);
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
    TResult? Function(_AuthStateChanged value)? authStateChanged,
    TResult? Function(_TabSelected value)? tabSelected,
    TResult? Function(_LiveSortSelected value)? liveSortSelected,
    TResult? Function(_VodSortSelected value)? vodSortSelected,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_LoadMoreRequested value)? loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that);
      case _LiveSortSelected() when liveSortSelected != null:
        return liveSortSelected(_that);
      case _VodSortSelected() when vodSortSelected != null:
        return vodSortSelected(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
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
    TResult Function(bool isSignedIn)? started,
    TResult Function(bool isSignedIn)? authStateChanged,
    TResult Function(BrowseTab tab)? tabSelected,
    TResult Function(BrowseLiveSortOption option)? liveSortSelected,
    TResult Function(BrowseVodSortOption option)? vodSortSelected,
    TResult Function()? retryRequested,
    TResult Function()? loadMoreRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.isSignedIn);
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that.isSignedIn);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _LiveSortSelected() when liveSortSelected != null:
        return liveSortSelected(_that.option);
      case _VodSortSelected() when vodSortSelected != null:
        return vodSortSelected(_that.option);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
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
    required TResult Function(bool isSignedIn) started,
    required TResult Function(bool isSignedIn) authStateChanged,
    required TResult Function(BrowseTab tab) tabSelected,
    required TResult Function(BrowseLiveSortOption option) liveSortSelected,
    required TResult Function(BrowseVodSortOption option) vodSortSelected,
    required TResult Function() retryRequested,
    required TResult Function() loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that.isSignedIn);
      case _AuthStateChanged():
        return authStateChanged(_that.isSignedIn);
      case _TabSelected():
        return tabSelected(_that.tab);
      case _LiveSortSelected():
        return liveSortSelected(_that.option);
      case _VodSortSelected():
        return vodSortSelected(_that.option);
      case _RetryRequested():
        return retryRequested();
      case _LoadMoreRequested():
        return loadMoreRequested();
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
    TResult? Function(bool isSignedIn)? started,
    TResult? Function(bool isSignedIn)? authStateChanged,
    TResult? Function(BrowseTab tab)? tabSelected,
    TResult? Function(BrowseLiveSortOption option)? liveSortSelected,
    TResult? Function(BrowseVodSortOption option)? vodSortSelected,
    TResult? Function()? retryRequested,
    TResult? Function()? loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.isSignedIn);
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that.isSignedIn);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _LiveSortSelected() when liveSortSelected != null:
        return liveSortSelected(_that.option);
      case _VodSortSelected() when vodSortSelected != null:
        return vodSortSelected(_that.option);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements BrowseEvent {
  const _Started({required this.isSignedIn});

  final bool isSignedIn;

  /// Create a copy of BrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Started &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignedIn);

  @override
  String toString() {
    return 'BrowseEvent.started(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $BrowseEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @useResult
  $Res call({bool isSignedIn});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of BrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? isSignedIn = null}) {
    return _then(
      _Started(
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _AuthStateChanged implements BrowseEvent {
  const _AuthStateChanged({required this.isSignedIn});

  final bool isSignedIn;

  /// Create a copy of BrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthStateChangedCopyWith<_AuthStateChanged> get copyWith =>
      __$AuthStateChangedCopyWithImpl<_AuthStateChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthStateChanged &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignedIn);

  @override
  String toString() {
    return 'BrowseEvent.authStateChanged(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateChangedCopyWith<$Res>
    implements $BrowseEventCopyWith<$Res> {
  factory _$AuthStateChangedCopyWith(
    _AuthStateChanged value,
    $Res Function(_AuthStateChanged) _then,
  ) = __$AuthStateChangedCopyWithImpl;
  @useResult
  $Res call({bool isSignedIn});
}

/// @nodoc
class __$AuthStateChangedCopyWithImpl<$Res>
    implements _$AuthStateChangedCopyWith<$Res> {
  __$AuthStateChangedCopyWithImpl(this._self, this._then);

  final _AuthStateChanged _self;
  final $Res Function(_AuthStateChanged) _then;

  /// Create a copy of BrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? isSignedIn = null}) {
    return _then(
      _AuthStateChanged(
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _TabSelected implements BrowseEvent {
  const _TabSelected(this.tab);

  final BrowseTab tab;

  /// Create a copy of BrowseEvent
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
    return 'BrowseEvent.tabSelected(tab: $tab)';
  }
}

/// @nodoc
abstract mixin class _$TabSelectedCopyWith<$Res>
    implements $BrowseEventCopyWith<$Res> {
  factory _$TabSelectedCopyWith(
    _TabSelected value,
    $Res Function(_TabSelected) _then,
  ) = __$TabSelectedCopyWithImpl;
  @useResult
  $Res call({BrowseTab tab});
}

/// @nodoc
class __$TabSelectedCopyWithImpl<$Res> implements _$TabSelectedCopyWith<$Res> {
  __$TabSelectedCopyWithImpl(this._self, this._then);

  final _TabSelected _self;
  final $Res Function(_TabSelected) _then;

  /// Create a copy of BrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? tab = null}) {
    return _then(
      _TabSelected(
        null == tab
            ? _self.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as BrowseTab,
      ),
    );
  }
}

/// @nodoc

class _LiveSortSelected implements BrowseEvent {
  const _LiveSortSelected(this.option);

  final BrowseLiveSortOption option;

  /// Create a copy of BrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveSortSelectedCopyWith<_LiveSortSelected> get copyWith =>
      __$LiveSortSelectedCopyWithImpl<_LiveSortSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveSortSelected &&
            (identical(other.option, option) || other.option == option));
  }

  @override
  int get hashCode => Object.hash(runtimeType, option);

  @override
  String toString() {
    return 'BrowseEvent.liveSortSelected(option: $option)';
  }
}

/// @nodoc
abstract mixin class _$LiveSortSelectedCopyWith<$Res>
    implements $BrowseEventCopyWith<$Res> {
  factory _$LiveSortSelectedCopyWith(
    _LiveSortSelected value,
    $Res Function(_LiveSortSelected) _then,
  ) = __$LiveSortSelectedCopyWithImpl;
  @useResult
  $Res call({BrowseLiveSortOption option});
}

/// @nodoc
class __$LiveSortSelectedCopyWithImpl<$Res>
    implements _$LiveSortSelectedCopyWith<$Res> {
  __$LiveSortSelectedCopyWithImpl(this._self, this._then);

  final _LiveSortSelected _self;
  final $Res Function(_LiveSortSelected) _then;

  /// Create a copy of BrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? option = null}) {
    return _then(
      _LiveSortSelected(
        null == option
            ? _self.option
            : option // ignore: cast_nullable_to_non_nullable
                  as BrowseLiveSortOption,
      ),
    );
  }
}

/// @nodoc

class _VodSortSelected implements BrowseEvent {
  const _VodSortSelected(this.option);

  final BrowseVodSortOption option;

  /// Create a copy of BrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodSortSelectedCopyWith<_VodSortSelected> get copyWith =>
      __$VodSortSelectedCopyWithImpl<_VodSortSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodSortSelected &&
            (identical(other.option, option) || other.option == option));
  }

  @override
  int get hashCode => Object.hash(runtimeType, option);

  @override
  String toString() {
    return 'BrowseEvent.vodSortSelected(option: $option)';
  }
}

/// @nodoc
abstract mixin class _$VodSortSelectedCopyWith<$Res>
    implements $BrowseEventCopyWith<$Res> {
  factory _$VodSortSelectedCopyWith(
    _VodSortSelected value,
    $Res Function(_VodSortSelected) _then,
  ) = __$VodSortSelectedCopyWithImpl;
  @useResult
  $Res call({BrowseVodSortOption option});
}

/// @nodoc
class __$VodSortSelectedCopyWithImpl<$Res>
    implements _$VodSortSelectedCopyWith<$Res> {
  __$VodSortSelectedCopyWithImpl(this._self, this._then);

  final _VodSortSelected _self;
  final $Res Function(_VodSortSelected) _then;

  /// Create a copy of BrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? option = null}) {
    return _then(
      _VodSortSelected(
        null == option
            ? _self.option
            : option // ignore: cast_nullable_to_non_nullable
                  as BrowseVodSortOption,
      ),
    );
  }
}

/// @nodoc

class _RetryRequested implements BrowseEvent {
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
    return 'BrowseEvent.retryRequested()';
  }
}

/// @nodoc

class _LoadMoreRequested implements BrowseEvent {
  const _LoadMoreRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMoreRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrowseEvent.loadMoreRequested()';
  }
}

/// @nodoc
mixin _$BrowseState {
  bool get isSignedIn;
  BrowseTab get selectedTab;
  BrowseLiveSortOption get liveSortOption;
  BrowseVodSortOption get vodSortOption;
  BrowsePageData<Live, LiveCursor> get live;
  BrowsePageData<Vod, BrowseVodCursor> get vod;
  BrowseFeedbackType? get feedbackType;
  int get feedbackSerial;

  /// Create a copy of BrowseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BrowseStateCopyWith<BrowseState> get copyWith =>
      _$BrowseStateCopyWithImpl<BrowseState>(this as BrowseState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BrowseState &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.liveSortOption, liveSortOption) ||
                other.liveSortOption == liveSortOption) &&
            (identical(other.vodSortOption, vodSortOption) ||
                other.vodSortOption == vodSortOption) &&
            (identical(other.live, live) || other.live == live) &&
            (identical(other.vod, vod) || other.vod == vod) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isSignedIn,
    selectedTab,
    liveSortOption,
    vodSortOption,
    live,
    vod,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'BrowseState(isSignedIn: $isSignedIn, selectedTab: $selectedTab, liveSortOption: $liveSortOption, vodSortOption: $vodSortOption, live: $live, vod: $vod, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class $BrowseStateCopyWith<$Res> {
  factory $BrowseStateCopyWith(
    BrowseState value,
    $Res Function(BrowseState) _then,
  ) = _$BrowseStateCopyWithImpl;
  @useResult
  $Res call({
    bool isSignedIn,
    BrowseTab selectedTab,
    BrowseLiveSortOption liveSortOption,
    BrowseVodSortOption vodSortOption,
    BrowsePageData<Live, LiveCursor> live,
    BrowsePageData<Vod, BrowseVodCursor> vod,
    BrowseFeedbackType? feedbackType,
    int feedbackSerial,
  });

  $BrowsePageDataCopyWith<Live, LiveCursor, $Res> get live;
  $BrowsePageDataCopyWith<Vod, BrowseVodCursor, $Res> get vod;
}

/// @nodoc
class _$BrowseStateCopyWithImpl<$Res> implements $BrowseStateCopyWith<$Res> {
  _$BrowseStateCopyWithImpl(this._self, this._then);

  final BrowseState _self;
  final $Res Function(BrowseState) _then;

  /// Create a copy of BrowseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignedIn = null,
    Object? selectedTab = null,
    Object? liveSortOption = null,
    Object? vodSortOption = null,
    Object? live = null,
    Object? vod = null,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _self.copyWith(
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as BrowseTab,
        liveSortOption: null == liveSortOption
            ? _self.liveSortOption
            : liveSortOption // ignore: cast_nullable_to_non_nullable
                  as BrowseLiveSortOption,
        vodSortOption: null == vodSortOption
            ? _self.vodSortOption
            : vodSortOption // ignore: cast_nullable_to_non_nullable
                  as BrowseVodSortOption,
        live: null == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as BrowsePageData<Live, LiveCursor>,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as BrowsePageData<Vod, BrowseVodCursor>,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as BrowseFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of BrowseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrowsePageDataCopyWith<Live, LiveCursor, $Res> get live {
    return $BrowsePageDataCopyWith<Live, LiveCursor, $Res>(_self.live, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of BrowseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrowsePageDataCopyWith<Vod, BrowseVodCursor, $Res> get vod {
    return $BrowsePageDataCopyWith<Vod, BrowseVodCursor, $Res>(_self.vod, (
      value,
    ) {
      return _then(_self.copyWith(vod: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BrowseState].
extension BrowseStatePatterns on BrowseState {
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
    TResult Function(_BrowseState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrowseState() when $default != null:
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
    TResult Function(_BrowseState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrowseState():
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
    TResult? Function(_BrowseState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrowseState() when $default != null:
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
      bool isSignedIn,
      BrowseTab selectedTab,
      BrowseLiveSortOption liveSortOption,
      BrowseVodSortOption vodSortOption,
      BrowsePageData<Live, LiveCursor> live,
      BrowsePageData<Vod, BrowseVodCursor> vod,
      BrowseFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrowseState() when $default != null:
        return $default(
          _that.isSignedIn,
          _that.selectedTab,
          _that.liveSortOption,
          _that.vodSortOption,
          _that.live,
          _that.vod,
          _that.feedbackType,
          _that.feedbackSerial,
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
      bool isSignedIn,
      BrowseTab selectedTab,
      BrowseLiveSortOption liveSortOption,
      BrowseVodSortOption vodSortOption,
      BrowsePageData<Live, LiveCursor> live,
      BrowsePageData<Vod, BrowseVodCursor> vod,
      BrowseFeedbackType? feedbackType,
      int feedbackSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrowseState():
        return $default(
          _that.isSignedIn,
          _that.selectedTab,
          _that.liveSortOption,
          _that.vodSortOption,
          _that.live,
          _that.vod,
          _that.feedbackType,
          _that.feedbackSerial,
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
      bool isSignedIn,
      BrowseTab selectedTab,
      BrowseLiveSortOption liveSortOption,
      BrowseVodSortOption vodSortOption,
      BrowsePageData<Live, LiveCursor> live,
      BrowsePageData<Vod, BrowseVodCursor> vod,
      BrowseFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrowseState() when $default != null:
        return $default(
          _that.isSignedIn,
          _that.selectedTab,
          _that.liveSortOption,
          _that.vodSortOption,
          _that.live,
          _that.vod,
          _that.feedbackType,
          _that.feedbackSerial,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BrowseState extends BrowseState {
  const _BrowseState({
    required this.isSignedIn,
    required this.selectedTab,
    required this.liveSortOption,
    required this.vodSortOption,
    required this.live,
    required this.vod,
    this.feedbackType,
    this.feedbackSerial = 0,
  }) : super._();

  @override
  final bool isSignedIn;
  @override
  final BrowseTab selectedTab;
  @override
  final BrowseLiveSortOption liveSortOption;
  @override
  final BrowseVodSortOption vodSortOption;
  @override
  final BrowsePageData<Live, LiveCursor> live;
  @override
  final BrowsePageData<Vod, BrowseVodCursor> vod;
  @override
  final BrowseFeedbackType? feedbackType;
  @override
  @JsonKey()
  final int feedbackSerial;

  /// Create a copy of BrowseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrowseStateCopyWith<_BrowseState> get copyWith =>
      __$BrowseStateCopyWithImpl<_BrowseState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowseState &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.liveSortOption, liveSortOption) ||
                other.liveSortOption == liveSortOption) &&
            (identical(other.vodSortOption, vodSortOption) ||
                other.vodSortOption == vodSortOption) &&
            (identical(other.live, live) || other.live == live) &&
            (identical(other.vod, vod) || other.vod == vod) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isSignedIn,
    selectedTab,
    liveSortOption,
    vodSortOption,
    live,
    vod,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'BrowseState(isSignedIn: $isSignedIn, selectedTab: $selectedTab, liveSortOption: $liveSortOption, vodSortOption: $vodSortOption, live: $live, vod: $vod, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class _$BrowseStateCopyWith<$Res>
    implements $BrowseStateCopyWith<$Res> {
  factory _$BrowseStateCopyWith(
    _BrowseState value,
    $Res Function(_BrowseState) _then,
  ) = __$BrowseStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool isSignedIn,
    BrowseTab selectedTab,
    BrowseLiveSortOption liveSortOption,
    BrowseVodSortOption vodSortOption,
    BrowsePageData<Live, LiveCursor> live,
    BrowsePageData<Vod, BrowseVodCursor> vod,
    BrowseFeedbackType? feedbackType,
    int feedbackSerial,
  });

  @override
  $BrowsePageDataCopyWith<Live, LiveCursor, $Res> get live;
  @override
  $BrowsePageDataCopyWith<Vod, BrowseVodCursor, $Res> get vod;
}

/// @nodoc
class __$BrowseStateCopyWithImpl<$Res> implements _$BrowseStateCopyWith<$Res> {
  __$BrowseStateCopyWithImpl(this._self, this._then);

  final _BrowseState _self;
  final $Res Function(_BrowseState) _then;

  /// Create a copy of BrowseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isSignedIn = null,
    Object? selectedTab = null,
    Object? liveSortOption = null,
    Object? vodSortOption = null,
    Object? live = null,
    Object? vod = null,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _BrowseState(
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as BrowseTab,
        liveSortOption: null == liveSortOption
            ? _self.liveSortOption
            : liveSortOption // ignore: cast_nullable_to_non_nullable
                  as BrowseLiveSortOption,
        vodSortOption: null == vodSortOption
            ? _self.vodSortOption
            : vodSortOption // ignore: cast_nullable_to_non_nullable
                  as BrowseVodSortOption,
        live: null == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as BrowsePageData<Live, LiveCursor>,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as BrowsePageData<Vod, BrowseVodCursor>,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as BrowseFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of BrowseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrowsePageDataCopyWith<Live, LiveCursor, $Res> get live {
    return $BrowsePageDataCopyWith<Live, LiveCursor, $Res>(_self.live, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of BrowseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrowsePageDataCopyWith<Vod, BrowseVodCursor, $Res> get vod {
    return $BrowsePageDataCopyWith<Vod, BrowseVodCursor, $Res>(_self.vod, (
      value,
    ) {
      return _then(_self.copyWith(vod: value));
    });
  }
}

/// @nodoc
mixin _$BrowsePageData<T, C> {
  BrowseLoadStatus get status;
  List<T> get items;
  C? get cursor;
  BrowsePaginationStatus get paginationStatus;

  /// Create a copy of BrowsePageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BrowsePageDataCopyWith<T, C, BrowsePageData<T, C>> get copyWith =>
      _$BrowsePageDataCopyWithImpl<T, C, BrowsePageData<T, C>>(
        this as BrowsePageData<T, C>,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BrowsePageData<T, C> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.cursor, cursor) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(items),
    const DeepCollectionEquality().hash(cursor),
    paginationStatus,
  );

  @override
  String toString() {
    return 'BrowsePageData<$T, $C>(status: $status, items: $items, cursor: $cursor, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class $BrowsePageDataCopyWith<T, C, $Res> {
  factory $BrowsePageDataCopyWith(
    BrowsePageData<T, C> value,
    $Res Function(BrowsePageData<T, C>) _then,
  ) = _$BrowsePageDataCopyWithImpl;
  @useResult
  $Res call({
    BrowseLoadStatus status,
    List<T> items,
    C? cursor,
    BrowsePaginationStatus paginationStatus,
  });
}

/// @nodoc
class _$BrowsePageDataCopyWithImpl<T, C, $Res>
    implements $BrowsePageDataCopyWith<T, C, $Res> {
  _$BrowsePageDataCopyWithImpl(this._self, this._then);

  final BrowsePageData<T, C> _self;
  final $Res Function(BrowsePageData<T, C>) _then;

  /// Create a copy of BrowsePageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? cursor = freezed,
    Object? paginationStatus = null,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BrowseLoadStatus,
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as C?,
        paginationStatus: null == paginationStatus
            ? _self.paginationStatus
            : paginationStatus // ignore: cast_nullable_to_non_nullable
                  as BrowsePaginationStatus,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [BrowsePageData].
extension BrowsePageDataPatterns<T, C> on BrowsePageData<T, C> {
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
    TResult Function(_BrowsePageData<T, C> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrowsePageData() when $default != null:
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
    TResult Function(_BrowsePageData<T, C> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrowsePageData():
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
    TResult? Function(_BrowsePageData<T, C> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrowsePageData() when $default != null:
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
      BrowseLoadStatus status,
      List<T> items,
      C? cursor,
      BrowsePaginationStatus paginationStatus,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrowsePageData() when $default != null:
        return $default(
          _that.status,
          _that.items,
          _that.cursor,
          _that.paginationStatus,
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
      BrowseLoadStatus status,
      List<T> items,
      C? cursor,
      BrowsePaginationStatus paginationStatus,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrowsePageData():
        return $default(
          _that.status,
          _that.items,
          _that.cursor,
          _that.paginationStatus,
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
      BrowseLoadStatus status,
      List<T> items,
      C? cursor,
      BrowsePaginationStatus paginationStatus,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrowsePageData() when $default != null:
        return $default(
          _that.status,
          _that.items,
          _that.cursor,
          _that.paginationStatus,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BrowsePageData<T, C> extends BrowsePageData<T, C> {
  const _BrowsePageData({
    required this.status,
    required final List<T> items,
    this.cursor,
    required this.paginationStatus,
  }) : _items = items,
       super._();

  @override
  final BrowseLoadStatus status;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final C? cursor;
  @override
  final BrowsePaginationStatus paginationStatus;

  /// Create a copy of BrowsePageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrowsePageDataCopyWith<T, C, _BrowsePageData<T, C>> get copyWith =>
      __$BrowsePageDataCopyWithImpl<T, C, _BrowsePageData<T, C>>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowsePageData<T, C> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.cursor, cursor) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(cursor),
    paginationStatus,
  );

  @override
  String toString() {
    return 'BrowsePageData<$T, $C>(status: $status, items: $items, cursor: $cursor, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class _$BrowsePageDataCopyWith<T, C, $Res>
    implements $BrowsePageDataCopyWith<T, C, $Res> {
  factory _$BrowsePageDataCopyWith(
    _BrowsePageData<T, C> value,
    $Res Function(_BrowsePageData<T, C>) _then,
  ) = __$BrowsePageDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    BrowseLoadStatus status,
    List<T> items,
    C? cursor,
    BrowsePaginationStatus paginationStatus,
  });
}

/// @nodoc
class __$BrowsePageDataCopyWithImpl<T, C, $Res>
    implements _$BrowsePageDataCopyWith<T, C, $Res> {
  __$BrowsePageDataCopyWithImpl(this._self, this._then);

  final _BrowsePageData<T, C> _self;
  final $Res Function(_BrowsePageData<T, C>) _then;

  /// Create a copy of BrowsePageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? cursor = freezed,
    Object? paginationStatus = null,
  }) {
    return _then(
      _BrowsePageData<T, C>(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BrowseLoadStatus,
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as C?,
        paginationStatus: null == paginationStatus
            ? _self.paginationStatus
            : paginationStatus // ignore: cast_nullable_to_non_nullable
                  as BrowsePaginationStatus,
      ),
    );
  }
}

/// @nodoc
mixin _$BrowseVodCursor {
  Object get cursor;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BrowseVodCursor &&
            const DeepCollectionEquality().equals(other.cursor, cursor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(cursor));

  @override
  String toString() {
    return 'BrowseVodCursor(cursor: $cursor)';
  }
}

/// @nodoc
class $BrowseVodCursorCopyWith<$Res> {
  $BrowseVodCursorCopyWith(
    BrowseVodCursor _,
    $Res Function(BrowseVodCursor) __,
  );
}

/// Adds pattern-matching-related methods to [BrowseVodCursor].
extension BrowseVodCursorPatterns on BrowseVodCursor {
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
    TResult Function(_BrowseVodCursorVod value)? vod,
    TResult Function(_BrowseVodCursorFollowing value)? following,
    TResult Function(_BrowseVodCursorWatchingHistory value)? watchingHistory,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrowseVodCursorVod() when vod != null:
        return vod(_that);
      case _BrowseVodCursorFollowing() when following != null:
        return following(_that);
      case _BrowseVodCursorWatchingHistory() when watchingHistory != null:
        return watchingHistory(_that);
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
    required TResult Function(_BrowseVodCursorVod value) vod,
    required TResult Function(_BrowseVodCursorFollowing value) following,
    required TResult Function(_BrowseVodCursorWatchingHistory value)
    watchingHistory,
  }) {
    final _that = this;
    switch (_that) {
      case _BrowseVodCursorVod():
        return vod(_that);
      case _BrowseVodCursorFollowing():
        return following(_that);
      case _BrowseVodCursorWatchingHistory():
        return watchingHistory(_that);
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
    TResult? Function(_BrowseVodCursorVod value)? vod,
    TResult? Function(_BrowseVodCursorFollowing value)? following,
    TResult? Function(_BrowseVodCursorWatchingHistory value)? watchingHistory,
  }) {
    final _that = this;
    switch (_that) {
      case _BrowseVodCursorVod() when vod != null:
        return vod(_that);
      case _BrowseVodCursorFollowing() when following != null:
        return following(_that);
      case _BrowseVodCursorWatchingHistory() when watchingHistory != null:
        return watchingHistory(_that);
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
    TResult Function(VodCursor cursor)? vod,
    TResult Function(FollowingVodCursor cursor)? following,
    TResult Function(WatchingHistoryCursor cursor)? watchingHistory,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrowseVodCursorVod() when vod != null:
        return vod(_that.cursor);
      case _BrowseVodCursorFollowing() when following != null:
        return following(_that.cursor);
      case _BrowseVodCursorWatchingHistory() when watchingHistory != null:
        return watchingHistory(_that.cursor);
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
    required TResult Function(VodCursor cursor) vod,
    required TResult Function(FollowingVodCursor cursor) following,
    required TResult Function(WatchingHistoryCursor cursor) watchingHistory,
  }) {
    final _that = this;
    switch (_that) {
      case _BrowseVodCursorVod():
        return vod(_that.cursor);
      case _BrowseVodCursorFollowing():
        return following(_that.cursor);
      case _BrowseVodCursorWatchingHistory():
        return watchingHistory(_that.cursor);
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
    TResult? Function(VodCursor cursor)? vod,
    TResult? Function(FollowingVodCursor cursor)? following,
    TResult? Function(WatchingHistoryCursor cursor)? watchingHistory,
  }) {
    final _that = this;
    switch (_that) {
      case _BrowseVodCursorVod() when vod != null:
        return vod(_that.cursor);
      case _BrowseVodCursorFollowing() when following != null:
        return following(_that.cursor);
      case _BrowseVodCursorWatchingHistory() when watchingHistory != null:
        return watchingHistory(_that.cursor);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BrowseVodCursorVod implements BrowseVodCursor {
  const _BrowseVodCursorVod(this.cursor);

  @override
  final VodCursor cursor;

  /// Create a copy of BrowseVodCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrowseVodCursorVodCopyWith<_BrowseVodCursorVod> get copyWith =>
      __$BrowseVodCursorVodCopyWithImpl<_BrowseVodCursorVod>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowseVodCursorVod &&
            (identical(other.cursor, cursor) || other.cursor == cursor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cursor);

  @override
  String toString() {
    return 'BrowseVodCursor.vod(cursor: $cursor)';
  }
}

/// @nodoc
abstract mixin class _$BrowseVodCursorVodCopyWith<$Res>
    implements $BrowseVodCursorCopyWith<$Res> {
  factory _$BrowseVodCursorVodCopyWith(
    _BrowseVodCursorVod value,
    $Res Function(_BrowseVodCursorVod) _then,
  ) = __$BrowseVodCursorVodCopyWithImpl;
  @useResult
  $Res call({VodCursor cursor});

  $VodCursorCopyWith<$Res> get cursor;
}

/// @nodoc
class __$BrowseVodCursorVodCopyWithImpl<$Res>
    implements _$BrowseVodCursorVodCopyWith<$Res> {
  __$BrowseVodCursorVodCopyWithImpl(this._self, this._then);

  final _BrowseVodCursorVod _self;
  final $Res Function(_BrowseVodCursorVod) _then;

  /// Create a copy of BrowseVodCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? cursor = null}) {
    return _then(
      _BrowseVodCursorVod(
        null == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as VodCursor,
      ),
    );
  }

  /// Create a copy of BrowseVodCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodCursorCopyWith<$Res> get cursor {
    return $VodCursorCopyWith<$Res>(_self.cursor, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc

class _BrowseVodCursorFollowing implements BrowseVodCursor {
  const _BrowseVodCursorFollowing(this.cursor);

  @override
  final FollowingVodCursor cursor;

  /// Create a copy of BrowseVodCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrowseVodCursorFollowingCopyWith<_BrowseVodCursorFollowing> get copyWith =>
      __$BrowseVodCursorFollowingCopyWithImpl<_BrowseVodCursorFollowing>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowseVodCursorFollowing &&
            (identical(other.cursor, cursor) || other.cursor == cursor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cursor);

  @override
  String toString() {
    return 'BrowseVodCursor.following(cursor: $cursor)';
  }
}

/// @nodoc
abstract mixin class _$BrowseVodCursorFollowingCopyWith<$Res>
    implements $BrowseVodCursorCopyWith<$Res> {
  factory _$BrowseVodCursorFollowingCopyWith(
    _BrowseVodCursorFollowing value,
    $Res Function(_BrowseVodCursorFollowing) _then,
  ) = __$BrowseVodCursorFollowingCopyWithImpl;
  @useResult
  $Res call({FollowingVodCursor cursor});

  $FollowingVodCursorCopyWith<$Res> get cursor;
}

/// @nodoc
class __$BrowseVodCursorFollowingCopyWithImpl<$Res>
    implements _$BrowseVodCursorFollowingCopyWith<$Res> {
  __$BrowseVodCursorFollowingCopyWithImpl(this._self, this._then);

  final _BrowseVodCursorFollowing _self;
  final $Res Function(_BrowseVodCursorFollowing) _then;

  /// Create a copy of BrowseVodCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? cursor = null}) {
    return _then(
      _BrowseVodCursorFollowing(
        null == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as FollowingVodCursor,
      ),
    );
  }

  /// Create a copy of BrowseVodCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodCursorCopyWith<$Res> get cursor {
    return $FollowingVodCursorCopyWith<$Res>(_self.cursor, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc

class _BrowseVodCursorWatchingHistory implements BrowseVodCursor {
  const _BrowseVodCursorWatchingHistory(this.cursor);

  @override
  final WatchingHistoryCursor cursor;

  /// Create a copy of BrowseVodCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrowseVodCursorWatchingHistoryCopyWith<_BrowseVodCursorWatchingHistory>
  get copyWith =>
      __$BrowseVodCursorWatchingHistoryCopyWithImpl<
        _BrowseVodCursorWatchingHistory
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowseVodCursorWatchingHistory &&
            (identical(other.cursor, cursor) || other.cursor == cursor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cursor);

  @override
  String toString() {
    return 'BrowseVodCursor.watchingHistory(cursor: $cursor)';
  }
}

/// @nodoc
abstract mixin class _$BrowseVodCursorWatchingHistoryCopyWith<$Res>
    implements $BrowseVodCursorCopyWith<$Res> {
  factory _$BrowseVodCursorWatchingHistoryCopyWith(
    _BrowseVodCursorWatchingHistory value,
    $Res Function(_BrowseVodCursorWatchingHistory) _then,
  ) = __$BrowseVodCursorWatchingHistoryCopyWithImpl;
  @useResult
  $Res call({WatchingHistoryCursor cursor});

  $WatchingHistoryCursorCopyWith<$Res> get cursor;
}

/// @nodoc
class __$BrowseVodCursorWatchingHistoryCopyWithImpl<$Res>
    implements _$BrowseVodCursorWatchingHistoryCopyWith<$Res> {
  __$BrowseVodCursorWatchingHistoryCopyWithImpl(this._self, this._then);

  final _BrowseVodCursorWatchingHistory _self;
  final $Res Function(_BrowseVodCursorWatchingHistory) _then;

  /// Create a copy of BrowseVodCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? cursor = null}) {
    return _then(
      _BrowseVodCursorWatchingHistory(
        null == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as WatchingHistoryCursor,
      ),
    );
  }

  /// Create a copy of BrowseVodCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryCursorCopyWith<$Res> get cursor {
    return $WatchingHistoryCursorCopyWith<$Res>(_self.cursor, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}
