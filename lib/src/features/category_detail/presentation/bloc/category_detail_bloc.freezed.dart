// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryDetailEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryDetailEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryDetailEvent()';
  }
}

/// @nodoc
class $CategoryDetailEventCopyWith<$Res> {
  $CategoryDetailEventCopyWith(
    CategoryDetailEvent _,
    $Res Function(CategoryDetailEvent) __,
  );
}

/// Adds pattern-matching-related methods to [CategoryDetailEvent].
extension CategoryDetailEventPatterns on CategoryDetailEvent {
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
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_LoadMoreRequested value)? loadMoreRequested,
    TResult Function(_FollowToggled value)? followToggled,
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
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
      case _FollowToggled() when followToggled != null:
        return followToggled(_that);
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
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_LoadMoreRequested value) loadMoreRequested,
    required TResult Function(_FollowToggled value) followToggled,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _AuthStateChanged():
        return authStateChanged(_that);
      case _TabSelected():
        return tabSelected(_that);
      case _RetryRequested():
        return retryRequested(_that);
      case _LoadMoreRequested():
        return loadMoreRequested(_that);
      case _FollowToggled():
        return followToggled(_that);
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
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(_FollowToggled value)? followToggled,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
      case _FollowToggled() when followToggled != null:
        return followToggled(_that);
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
    TResult Function(String categoryType, String categoryId, bool isSignedIn)?
    started,
    TResult Function(bool isSignedIn)? authStateChanged,
    TResult Function(CategoryDetailTab tab)? tabSelected,
    TResult Function()? retryRequested,
    TResult Function()? loadMoreRequested,
    TResult Function()? followToggled,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.categoryType, _that.categoryId, _that.isSignedIn);
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that.isSignedIn);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
      case _FollowToggled() when followToggled != null:
        return followToggled();
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
    required TResult Function(
      String categoryType,
      String categoryId,
      bool isSignedIn,
    )
    started,
    required TResult Function(bool isSignedIn) authStateChanged,
    required TResult Function(CategoryDetailTab tab) tabSelected,
    required TResult Function() retryRequested,
    required TResult Function() loadMoreRequested,
    required TResult Function() followToggled,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that.categoryType, _that.categoryId, _that.isSignedIn);
      case _AuthStateChanged():
        return authStateChanged(_that.isSignedIn);
      case _TabSelected():
        return tabSelected(_that.tab);
      case _RetryRequested():
        return retryRequested();
      case _LoadMoreRequested():
        return loadMoreRequested();
      case _FollowToggled():
        return followToggled();
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
    TResult? Function(String categoryType, String categoryId, bool isSignedIn)?
    started,
    TResult? Function(bool isSignedIn)? authStateChanged,
    TResult? Function(CategoryDetailTab tab)? tabSelected,
    TResult? Function()? retryRequested,
    TResult? Function()? loadMoreRequested,
    TResult? Function()? followToggled,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.categoryType, _that.categoryId, _that.isSignedIn);
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that.isSignedIn);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
      case _FollowToggled() when followToggled != null:
        return followToggled();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements CategoryDetailEvent {
  const _Started({
    required this.categoryType,
    required this.categoryId,
    required this.isSignedIn,
  });

  final String categoryType;
  final String categoryId;
  final bool isSignedIn;

  /// Create a copy of CategoryDetailEvent
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
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryType, categoryId, isSignedIn);

  @override
  String toString() {
    return 'CategoryDetailEvent.started(categoryType: $categoryType, categoryId: $categoryId, isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $CategoryDetailEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @useResult
  $Res call({String categoryType, String categoryId, bool isSignedIn});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of CategoryDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryType = null,
    Object? categoryId = null,
    Object? isSignedIn = null,
  }) {
    return _then(
      _Started(
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _AuthStateChanged implements CategoryDetailEvent {
  const _AuthStateChanged({required this.isSignedIn});

  final bool isSignedIn;

  /// Create a copy of CategoryDetailEvent
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
    return 'CategoryDetailEvent.authStateChanged(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateChangedCopyWith<$Res>
    implements $CategoryDetailEventCopyWith<$Res> {
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

  /// Create a copy of CategoryDetailEvent
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

class _TabSelected implements CategoryDetailEvent {
  const _TabSelected(this.tab);

  final CategoryDetailTab tab;

  /// Create a copy of CategoryDetailEvent
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
    return 'CategoryDetailEvent.tabSelected(tab: $tab)';
  }
}

/// @nodoc
abstract mixin class _$TabSelectedCopyWith<$Res>
    implements $CategoryDetailEventCopyWith<$Res> {
  factory _$TabSelectedCopyWith(
    _TabSelected value,
    $Res Function(_TabSelected) _then,
  ) = __$TabSelectedCopyWithImpl;
  @useResult
  $Res call({CategoryDetailTab tab});
}

/// @nodoc
class __$TabSelectedCopyWithImpl<$Res> implements _$TabSelectedCopyWith<$Res> {
  __$TabSelectedCopyWithImpl(this._self, this._then);

  final _TabSelected _self;
  final $Res Function(_TabSelected) _then;

  /// Create a copy of CategoryDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? tab = null}) {
    return _then(
      _TabSelected(
        null == tab
            ? _self.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailTab,
      ),
    );
  }
}

/// @nodoc

class _RetryRequested implements CategoryDetailEvent {
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
    return 'CategoryDetailEvent.retryRequested()';
  }
}

/// @nodoc

class _LoadMoreRequested implements CategoryDetailEvent {
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
    return 'CategoryDetailEvent.loadMoreRequested()';
  }
}

/// @nodoc

class _FollowToggled implements CategoryDetailEvent {
  const _FollowToggled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FollowToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryDetailEvent.followToggled()';
  }
}

/// @nodoc
mixin _$CategoryDetailState {
  String get categoryType;
  String get categoryId;
  bool get isSignedIn;
  CategoryDetailTab get selectedTab;
  CategoryInfo? get info;
  CategoryDetailPageData<CategoryLive, CategoryLiveCursor> get live;
  CategoryDetailPageData<CategoryVideo, CategoryVideoCursor> get vod;
  CategoryDetailFeedbackType? get feedbackType;
  int get feedbackSerial;

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryDetailStateCopyWith<CategoryDetailState> get copyWith =>
      _$CategoryDetailStateCopyWithImpl<CategoryDetailState>(
        this as CategoryDetailState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryDetailState &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.info, info) || other.info == info) &&
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
    categoryType,
    categoryId,
    isSignedIn,
    selectedTab,
    info,
    live,
    vod,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'CategoryDetailState(categoryType: $categoryType, categoryId: $categoryId, isSignedIn: $isSignedIn, selectedTab: $selectedTab, info: $info, live: $live, vod: $vod, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class $CategoryDetailStateCopyWith<$Res> {
  factory $CategoryDetailStateCopyWith(
    CategoryDetailState value,
    $Res Function(CategoryDetailState) _then,
  ) = _$CategoryDetailStateCopyWithImpl;
  @useResult
  $Res call({
    String categoryType,
    String categoryId,
    bool isSignedIn,
    CategoryDetailTab selectedTab,
    CategoryInfo? info,
    CategoryDetailPageData<CategoryLive, CategoryLiveCursor> live,
    CategoryDetailPageData<CategoryVideo, CategoryVideoCursor> vod,
    CategoryDetailFeedbackType? feedbackType,
    int feedbackSerial,
  });

  $CategoryInfoCopyWith<$Res>? get info;
  $CategoryDetailPageDataCopyWith<CategoryLive, CategoryLiveCursor, $Res>
  get live;
  $CategoryDetailPageDataCopyWith<CategoryVideo, CategoryVideoCursor, $Res>
  get vod;
}

/// @nodoc
class _$CategoryDetailStateCopyWithImpl<$Res>
    implements $CategoryDetailStateCopyWith<$Res> {
  _$CategoryDetailStateCopyWithImpl(this._self, this._then);

  final CategoryDetailState _self;
  final $Res Function(CategoryDetailState) _then;

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? categoryId = null,
    Object? isSignedIn = null,
    Object? selectedTab = null,
    Object? info = freezed,
    Object? live = null,
    Object? vod = null,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _self.copyWith(
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailTab,
        info: freezed == info
            ? _self.info
            : info // ignore: cast_nullable_to_non_nullable
                  as CategoryInfo?,
        live: null == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailPageData<CategoryLive, CategoryLiveCursor>,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailPageData<CategoryVideo, CategoryVideoCursor>,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryInfoCopyWith<$Res>? get info {
    if (_self.info == null) {
      return null;
    }

    return $CategoryInfoCopyWith<$Res>(_self.info!, (value) {
      return _then(_self.copyWith(info: value));
    });
  }

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDetailPageDataCopyWith<CategoryLive, CategoryLiveCursor, $Res>
  get live {
    return $CategoryDetailPageDataCopyWith<
      CategoryLive,
      CategoryLiveCursor,
      $Res
    >(_self.live, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDetailPageDataCopyWith<CategoryVideo, CategoryVideoCursor, $Res>
  get vod {
    return $CategoryDetailPageDataCopyWith<
      CategoryVideo,
      CategoryVideoCursor,
      $Res
    >(_self.vod, (value) {
      return _then(_self.copyWith(vod: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryDetailState].
extension CategoryDetailStatePatterns on CategoryDetailState {
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
    TResult Function(_CategoryDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailState() when $default != null:
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
    TResult Function(_CategoryDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailState():
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
    TResult? Function(_CategoryDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailState() when $default != null:
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
      String categoryType,
      String categoryId,
      bool isSignedIn,
      CategoryDetailTab selectedTab,
      CategoryInfo? info,
      CategoryDetailPageData<CategoryLive, CategoryLiveCursor> live,
      CategoryDetailPageData<CategoryVideo, CategoryVideoCursor> vod,
      CategoryDetailFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailState() when $default != null:
        return $default(
          _that.categoryType,
          _that.categoryId,
          _that.isSignedIn,
          _that.selectedTab,
          _that.info,
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
      String categoryType,
      String categoryId,
      bool isSignedIn,
      CategoryDetailTab selectedTab,
      CategoryInfo? info,
      CategoryDetailPageData<CategoryLive, CategoryLiveCursor> live,
      CategoryDetailPageData<CategoryVideo, CategoryVideoCursor> vod,
      CategoryDetailFeedbackType? feedbackType,
      int feedbackSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailState():
        return $default(
          _that.categoryType,
          _that.categoryId,
          _that.isSignedIn,
          _that.selectedTab,
          _that.info,
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
      String categoryType,
      String categoryId,
      bool isSignedIn,
      CategoryDetailTab selectedTab,
      CategoryInfo? info,
      CategoryDetailPageData<CategoryLive, CategoryLiveCursor> live,
      CategoryDetailPageData<CategoryVideo, CategoryVideoCursor> vod,
      CategoryDetailFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailState() when $default != null:
        return $default(
          _that.categoryType,
          _that.categoryId,
          _that.isSignedIn,
          _that.selectedTab,
          _that.info,
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

class _CategoryDetailState extends CategoryDetailState {
  const _CategoryDetailState({
    required this.categoryType,
    required this.categoryId,
    required this.isSignedIn,
    required this.selectedTab,
    this.info,
    required this.live,
    required this.vod,
    this.feedbackType,
    this.feedbackSerial = 0,
  }) : super._();

  @override
  final String categoryType;
  @override
  final String categoryId;
  @override
  final bool isSignedIn;
  @override
  final CategoryDetailTab selectedTab;
  @override
  final CategoryInfo? info;
  @override
  final CategoryDetailPageData<CategoryLive, CategoryLiveCursor> live;
  @override
  final CategoryDetailPageData<CategoryVideo, CategoryVideoCursor> vod;
  @override
  final CategoryDetailFeedbackType? feedbackType;
  @override
  @JsonKey()
  final int feedbackSerial;

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryDetailStateCopyWith<_CategoryDetailState> get copyWith =>
      __$CategoryDetailStateCopyWithImpl<_CategoryDetailState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryDetailState &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.info, info) || other.info == info) &&
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
    categoryType,
    categoryId,
    isSignedIn,
    selectedTab,
    info,
    live,
    vod,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'CategoryDetailState(categoryType: $categoryType, categoryId: $categoryId, isSignedIn: $isSignedIn, selectedTab: $selectedTab, info: $info, live: $live, vod: $vod, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class _$CategoryDetailStateCopyWith<$Res>
    implements $CategoryDetailStateCopyWith<$Res> {
  factory _$CategoryDetailStateCopyWith(
    _CategoryDetailState value,
    $Res Function(_CategoryDetailState) _then,
  ) = __$CategoryDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String categoryType,
    String categoryId,
    bool isSignedIn,
    CategoryDetailTab selectedTab,
    CategoryInfo? info,
    CategoryDetailPageData<CategoryLive, CategoryLiveCursor> live,
    CategoryDetailPageData<CategoryVideo, CategoryVideoCursor> vod,
    CategoryDetailFeedbackType? feedbackType,
    int feedbackSerial,
  });

  @override
  $CategoryInfoCopyWith<$Res>? get info;
  @override
  $CategoryDetailPageDataCopyWith<CategoryLive, CategoryLiveCursor, $Res>
  get live;
  @override
  $CategoryDetailPageDataCopyWith<CategoryVideo, CategoryVideoCursor, $Res>
  get vod;
}

/// @nodoc
class __$CategoryDetailStateCopyWithImpl<$Res>
    implements _$CategoryDetailStateCopyWith<$Res> {
  __$CategoryDetailStateCopyWithImpl(this._self, this._then);

  final _CategoryDetailState _self;
  final $Res Function(_CategoryDetailState) _then;

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryType = null,
    Object? categoryId = null,
    Object? isSignedIn = null,
    Object? selectedTab = null,
    Object? info = freezed,
    Object? live = null,
    Object? vod = null,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _CategoryDetailState(
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailTab,
        info: freezed == info
            ? _self.info
            : info // ignore: cast_nullable_to_non_nullable
                  as CategoryInfo?,
        live: null == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailPageData<CategoryLive, CategoryLiveCursor>,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailPageData<CategoryVideo, CategoryVideoCursor>,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryInfoCopyWith<$Res>? get info {
    if (_self.info == null) {
      return null;
    }

    return $CategoryInfoCopyWith<$Res>(_self.info!, (value) {
      return _then(_self.copyWith(info: value));
    });
  }

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDetailPageDataCopyWith<CategoryLive, CategoryLiveCursor, $Res>
  get live {
    return $CategoryDetailPageDataCopyWith<
      CategoryLive,
      CategoryLiveCursor,
      $Res
    >(_self.live, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of CategoryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDetailPageDataCopyWith<CategoryVideo, CategoryVideoCursor, $Res>
  get vod {
    return $CategoryDetailPageDataCopyWith<
      CategoryVideo,
      CategoryVideoCursor,
      $Res
    >(_self.vod, (value) {
      return _then(_self.copyWith(vod: value));
    });
  }
}

/// @nodoc
mixin _$CategoryDetailPageData<T, C> {
  CategoryDetailLoadStatus get status;
  List<T> get items;
  C? get cursor;
  CategoryDetailPaginationStatus get paginationStatus;

  /// Create a copy of CategoryDetailPageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryDetailPageDataCopyWith<T, C, CategoryDetailPageData<T, C>>
  get copyWith =>
      _$CategoryDetailPageDataCopyWithImpl<T, C, CategoryDetailPageData<T, C>>(
        this as CategoryDetailPageData<T, C>,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryDetailPageData<T, C> &&
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
    return 'CategoryDetailPageData<$T, $C>(status: $status, items: $items, cursor: $cursor, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class $CategoryDetailPageDataCopyWith<T, C, $Res> {
  factory $CategoryDetailPageDataCopyWith(
    CategoryDetailPageData<T, C> value,
    $Res Function(CategoryDetailPageData<T, C>) _then,
  ) = _$CategoryDetailPageDataCopyWithImpl;
  @useResult
  $Res call({
    CategoryDetailLoadStatus status,
    List<T> items,
    C? cursor,
    CategoryDetailPaginationStatus paginationStatus,
  });
}

/// @nodoc
class _$CategoryDetailPageDataCopyWithImpl<T, C, $Res>
    implements $CategoryDetailPageDataCopyWith<T, C, $Res> {
  _$CategoryDetailPageDataCopyWithImpl(this._self, this._then);

  final CategoryDetailPageData<T, C> _self;
  final $Res Function(CategoryDetailPageData<T, C>) _then;

  /// Create a copy of CategoryDetailPageData
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
                  as CategoryDetailLoadStatus,
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
                  as CategoryDetailPaginationStatus,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryDetailPageData].
extension CategoryDetailPageDataPatterns<T, C> on CategoryDetailPageData<T, C> {
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
    TResult Function(_CategoryDetailPageData<T, C> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailPageData() when $default != null:
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
    TResult Function(_CategoryDetailPageData<T, C> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailPageData():
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
    TResult? Function(_CategoryDetailPageData<T, C> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailPageData() when $default != null:
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
      CategoryDetailLoadStatus status,
      List<T> items,
      C? cursor,
      CategoryDetailPaginationStatus paginationStatus,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailPageData() when $default != null:
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
      CategoryDetailLoadStatus status,
      List<T> items,
      C? cursor,
      CategoryDetailPaginationStatus paginationStatus,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailPageData():
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
      CategoryDetailLoadStatus status,
      List<T> items,
      C? cursor,
      CategoryDetailPaginationStatus paginationStatus,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailPageData() when $default != null:
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

class _CategoryDetailPageData<T, C> extends CategoryDetailPageData<T, C> {
  const _CategoryDetailPageData({
    required this.status,
    required final List<T> items,
    this.cursor,
    required this.paginationStatus,
  }) : _items = items,
       super._();

  @override
  final CategoryDetailLoadStatus status;
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
  final CategoryDetailPaginationStatus paginationStatus;

  /// Create a copy of CategoryDetailPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryDetailPageDataCopyWith<T, C, _CategoryDetailPageData<T, C>>
  get copyWith =>
      __$CategoryDetailPageDataCopyWithImpl<
        T,
        C,
        _CategoryDetailPageData<T, C>
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryDetailPageData<T, C> &&
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
    return 'CategoryDetailPageData<$T, $C>(status: $status, items: $items, cursor: $cursor, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class _$CategoryDetailPageDataCopyWith<T, C, $Res>
    implements $CategoryDetailPageDataCopyWith<T, C, $Res> {
  factory _$CategoryDetailPageDataCopyWith(
    _CategoryDetailPageData<T, C> value,
    $Res Function(_CategoryDetailPageData<T, C>) _then,
  ) = __$CategoryDetailPageDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    CategoryDetailLoadStatus status,
    List<T> items,
    C? cursor,
    CategoryDetailPaginationStatus paginationStatus,
  });
}

/// @nodoc
class __$CategoryDetailPageDataCopyWithImpl<T, C, $Res>
    implements _$CategoryDetailPageDataCopyWith<T, C, $Res> {
  __$CategoryDetailPageDataCopyWithImpl(this._self, this._then);

  final _CategoryDetailPageData<T, C> _self;
  final $Res Function(_CategoryDetailPageData<T, C>) _then;

  /// Create a copy of CategoryDetailPageData
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
      _CategoryDetailPageData<T, C>(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CategoryDetailLoadStatus,
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
                  as CategoryDetailPaginationStatus,
      ),
    );
  }
}
