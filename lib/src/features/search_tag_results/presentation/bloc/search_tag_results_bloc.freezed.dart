// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_tag_results_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchTagResultsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchTagResultsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchTagResultsEvent()';
  }
}

/// @nodoc
class $SearchTagResultsEventCopyWith<$Res> {
  $SearchTagResultsEventCopyWith(
    SearchTagResultsEvent _,
    $Res Function(SearchTagResultsEvent) __,
  );
}

/// Adds pattern-matching-related methods to [SearchTagResultsEvent].
extension SearchTagResultsEventPatterns on SearchTagResultsEvent {
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
    TResult Function(String tag)? started,
    TResult Function(SearchTagResultsTab tab)? tabSelected,
    TResult Function(SearchTagResultsLiveSortOption option)? liveSortSelected,
    TResult Function(SearchTagResultsVodSortOption option)? vodSortSelected,
    TResult Function()? retryRequested,
    TResult Function()? loadMoreRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.tag);
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
    required TResult Function(String tag) started,
    required TResult Function(SearchTagResultsTab tab) tabSelected,
    required TResult Function(SearchTagResultsLiveSortOption option)
    liveSortSelected,
    required TResult Function(SearchTagResultsVodSortOption option)
    vodSortSelected,
    required TResult Function() retryRequested,
    required TResult Function() loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that.tag);
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
    TResult? Function(String tag)? started,
    TResult? Function(SearchTagResultsTab tab)? tabSelected,
    TResult? Function(SearchTagResultsLiveSortOption option)? liveSortSelected,
    TResult? Function(SearchTagResultsVodSortOption option)? vodSortSelected,
    TResult? Function()? retryRequested,
    TResult? Function()? loadMoreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.tag);
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

class _Started implements SearchTagResultsEvent {
  const _Started({required this.tag});

  final String tag;

  /// Create a copy of SearchTagResultsEvent
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
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag);

  @override
  String toString() {
    return 'SearchTagResultsEvent.started(tag: $tag)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $SearchTagResultsEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @useResult
  $Res call({String tag});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of SearchTagResultsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? tag = null}) {
    return _then(
      _Started(
        tag: null == tag
            ? _self.tag
            : tag // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _TabSelected implements SearchTagResultsEvent {
  const _TabSelected(this.tab);

  final SearchTagResultsTab tab;

  /// Create a copy of SearchTagResultsEvent
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
    return 'SearchTagResultsEvent.tabSelected(tab: $tab)';
  }
}

/// @nodoc
abstract mixin class _$TabSelectedCopyWith<$Res>
    implements $SearchTagResultsEventCopyWith<$Res> {
  factory _$TabSelectedCopyWith(
    _TabSelected value,
    $Res Function(_TabSelected) _then,
  ) = __$TabSelectedCopyWithImpl;
  @useResult
  $Res call({SearchTagResultsTab tab});
}

/// @nodoc
class __$TabSelectedCopyWithImpl<$Res> implements _$TabSelectedCopyWith<$Res> {
  __$TabSelectedCopyWithImpl(this._self, this._then);

  final _TabSelected _self;
  final $Res Function(_TabSelected) _then;

  /// Create a copy of SearchTagResultsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? tab = null}) {
    return _then(
      _TabSelected(
        null == tab
            ? _self.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsTab,
      ),
    );
  }
}

/// @nodoc

class _LiveSortSelected implements SearchTagResultsEvent {
  const _LiveSortSelected(this.option);

  final SearchTagResultsLiveSortOption option;

  /// Create a copy of SearchTagResultsEvent
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
    return 'SearchTagResultsEvent.liveSortSelected(option: $option)';
  }
}

/// @nodoc
abstract mixin class _$LiveSortSelectedCopyWith<$Res>
    implements $SearchTagResultsEventCopyWith<$Res> {
  factory _$LiveSortSelectedCopyWith(
    _LiveSortSelected value,
    $Res Function(_LiveSortSelected) _then,
  ) = __$LiveSortSelectedCopyWithImpl;
  @useResult
  $Res call({SearchTagResultsLiveSortOption option});
}

/// @nodoc
class __$LiveSortSelectedCopyWithImpl<$Res>
    implements _$LiveSortSelectedCopyWith<$Res> {
  __$LiveSortSelectedCopyWithImpl(this._self, this._then);

  final _LiveSortSelected _self;
  final $Res Function(_LiveSortSelected) _then;

  /// Create a copy of SearchTagResultsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? option = null}) {
    return _then(
      _LiveSortSelected(
        null == option
            ? _self.option
            : option // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsLiveSortOption,
      ),
    );
  }
}

/// @nodoc

class _VodSortSelected implements SearchTagResultsEvent {
  const _VodSortSelected(this.option);

  final SearchTagResultsVodSortOption option;

  /// Create a copy of SearchTagResultsEvent
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
    return 'SearchTagResultsEvent.vodSortSelected(option: $option)';
  }
}

/// @nodoc
abstract mixin class _$VodSortSelectedCopyWith<$Res>
    implements $SearchTagResultsEventCopyWith<$Res> {
  factory _$VodSortSelectedCopyWith(
    _VodSortSelected value,
    $Res Function(_VodSortSelected) _then,
  ) = __$VodSortSelectedCopyWithImpl;
  @useResult
  $Res call({SearchTagResultsVodSortOption option});
}

/// @nodoc
class __$VodSortSelectedCopyWithImpl<$Res>
    implements _$VodSortSelectedCopyWith<$Res> {
  __$VodSortSelectedCopyWithImpl(this._self, this._then);

  final _VodSortSelected _self;
  final $Res Function(_VodSortSelected) _then;

  /// Create a copy of SearchTagResultsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? option = null}) {
    return _then(
      _VodSortSelected(
        null == option
            ? _self.option
            : option // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsVodSortOption,
      ),
    );
  }
}

/// @nodoc

class _RetryRequested implements SearchTagResultsEvent {
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
    return 'SearchTagResultsEvent.retryRequested()';
  }
}

/// @nodoc

class _LoadMoreRequested implements SearchTagResultsEvent {
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
    return 'SearchTagResultsEvent.loadMoreRequested()';
  }
}

/// @nodoc
mixin _$SearchTagResultsState {
  String get tag;
  SearchTagResultsTab get selectedTab;
  SearchTagResultsLiveSortOption get liveSortOption;
  SearchTagResultsVodSortOption get vodSortOption;
  SearchTagResultsPageData<SearchTagLive, SearchTagLiveCursor> get live;
  SearchTagResultsPageData<SearchTagVideo, SearchTagVideoCursor> get vod;
  SearchTagResultsFeedbackType? get feedbackType;
  int get feedbackSerial;

  /// Create a copy of SearchTagResultsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagResultsStateCopyWith<SearchTagResultsState> get copyWith =>
      _$SearchTagResultsStateCopyWithImpl<SearchTagResultsState>(
        this as SearchTagResultsState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagResultsState &&
            (identical(other.tag, tag) || other.tag == tag) &&
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
    tag,
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
    return 'SearchTagResultsState(tag: $tag, selectedTab: $selectedTab, liveSortOption: $liveSortOption, vodSortOption: $vodSortOption, live: $live, vod: $vod, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class $SearchTagResultsStateCopyWith<$Res> {
  factory $SearchTagResultsStateCopyWith(
    SearchTagResultsState value,
    $Res Function(SearchTagResultsState) _then,
  ) = _$SearchTagResultsStateCopyWithImpl;
  @useResult
  $Res call({
    String tag,
    SearchTagResultsTab selectedTab,
    SearchTagResultsLiveSortOption liveSortOption,
    SearchTagResultsVodSortOption vodSortOption,
    SearchTagResultsPageData<SearchTagLive, SearchTagLiveCursor> live,
    SearchTagResultsPageData<SearchTagVideo, SearchTagVideoCursor> vod,
    SearchTagResultsFeedbackType? feedbackType,
    int feedbackSerial,
  });

  $SearchTagResultsPageDataCopyWith<SearchTagLive, SearchTagLiveCursor, $Res>
  get live;
  $SearchTagResultsPageDataCopyWith<SearchTagVideo, SearchTagVideoCursor, $Res>
  get vod;
}

/// @nodoc
class _$SearchTagResultsStateCopyWithImpl<$Res>
    implements $SearchTagResultsStateCopyWith<$Res> {
  _$SearchTagResultsStateCopyWithImpl(this._self, this._then);

  final SearchTagResultsState _self;
  final $Res Function(SearchTagResultsState) _then;

  /// Create a copy of SearchTagResultsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
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
        tag: null == tag
            ? _self.tag
            : tag // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsTab,
        liveSortOption: null == liveSortOption
            ? _self.liveSortOption
            : liveSortOption // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsLiveSortOption,
        vodSortOption: null == vodSortOption
            ? _self.vodSortOption
            : vodSortOption // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsVodSortOption,
        live: null == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsPageData<
                    SearchTagLive,
                    SearchTagLiveCursor
                  >,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsPageData<
                    SearchTagVideo,
                    SearchTagVideoCursor
                  >,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of SearchTagResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagResultsPageDataCopyWith<SearchTagLive, SearchTagLiveCursor, $Res>
  get live {
    return $SearchTagResultsPageDataCopyWith<
      SearchTagLive,
      SearchTagLiveCursor,
      $Res
    >(_self.live, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of SearchTagResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagResultsPageDataCopyWith<SearchTagVideo, SearchTagVideoCursor, $Res>
  get vod {
    return $SearchTagResultsPageDataCopyWith<
      SearchTagVideo,
      SearchTagVideoCursor,
      $Res
    >(_self.vod, (value) {
      return _then(_self.copyWith(vod: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchTagResultsState].
extension SearchTagResultsStatePatterns on SearchTagResultsState {
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
    TResult Function(_SearchTagResultsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsState() when $default != null:
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
    TResult Function(_SearchTagResultsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsState():
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
    TResult? Function(_SearchTagResultsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsState() when $default != null:
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
      String tag,
      SearchTagResultsTab selectedTab,
      SearchTagResultsLiveSortOption liveSortOption,
      SearchTagResultsVodSortOption vodSortOption,
      SearchTagResultsPageData<SearchTagLive, SearchTagLiveCursor> live,
      SearchTagResultsPageData<SearchTagVideo, SearchTagVideoCursor> vod,
      SearchTagResultsFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsState() when $default != null:
        return $default(
          _that.tag,
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
      String tag,
      SearchTagResultsTab selectedTab,
      SearchTagResultsLiveSortOption liveSortOption,
      SearchTagResultsVodSortOption vodSortOption,
      SearchTagResultsPageData<SearchTagLive, SearchTagLiveCursor> live,
      SearchTagResultsPageData<SearchTagVideo, SearchTagVideoCursor> vod,
      SearchTagResultsFeedbackType? feedbackType,
      int feedbackSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsState():
        return $default(
          _that.tag,
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
      String tag,
      SearchTagResultsTab selectedTab,
      SearchTagResultsLiveSortOption liveSortOption,
      SearchTagResultsVodSortOption vodSortOption,
      SearchTagResultsPageData<SearchTagLive, SearchTagLiveCursor> live,
      SearchTagResultsPageData<SearchTagVideo, SearchTagVideoCursor> vod,
      SearchTagResultsFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsState() when $default != null:
        return $default(
          _that.tag,
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

class _SearchTagResultsState implements SearchTagResultsState {
  const _SearchTagResultsState({
    required this.tag,
    required this.selectedTab,
    required this.liveSortOption,
    required this.vodSortOption,
    required this.live,
    required this.vod,
    this.feedbackType,
    this.feedbackSerial = 0,
  });

  @override
  final String tag;
  @override
  final SearchTagResultsTab selectedTab;
  @override
  final SearchTagResultsLiveSortOption liveSortOption;
  @override
  final SearchTagResultsVodSortOption vodSortOption;
  @override
  final SearchTagResultsPageData<SearchTagLive, SearchTagLiveCursor> live;
  @override
  final SearchTagResultsPageData<SearchTagVideo, SearchTagVideoCursor> vod;
  @override
  final SearchTagResultsFeedbackType? feedbackType;
  @override
  @JsonKey()
  final int feedbackSerial;

  /// Create a copy of SearchTagResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagResultsStateCopyWith<_SearchTagResultsState> get copyWith =>
      __$SearchTagResultsStateCopyWithImpl<_SearchTagResultsState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagResultsState &&
            (identical(other.tag, tag) || other.tag == tag) &&
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
    tag,
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
    return 'SearchTagResultsState(tag: $tag, selectedTab: $selectedTab, liveSortOption: $liveSortOption, vodSortOption: $vodSortOption, live: $live, vod: $vod, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagResultsStateCopyWith<$Res>
    implements $SearchTagResultsStateCopyWith<$Res> {
  factory _$SearchTagResultsStateCopyWith(
    _SearchTagResultsState value,
    $Res Function(_SearchTagResultsState) _then,
  ) = __$SearchTagResultsStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String tag,
    SearchTagResultsTab selectedTab,
    SearchTagResultsLiveSortOption liveSortOption,
    SearchTagResultsVodSortOption vodSortOption,
    SearchTagResultsPageData<SearchTagLive, SearchTagLiveCursor> live,
    SearchTagResultsPageData<SearchTagVideo, SearchTagVideoCursor> vod,
    SearchTagResultsFeedbackType? feedbackType,
    int feedbackSerial,
  });

  @override
  $SearchTagResultsPageDataCopyWith<SearchTagLive, SearchTagLiveCursor, $Res>
  get live;
  @override
  $SearchTagResultsPageDataCopyWith<SearchTagVideo, SearchTagVideoCursor, $Res>
  get vod;
}

/// @nodoc
class __$SearchTagResultsStateCopyWithImpl<$Res>
    implements _$SearchTagResultsStateCopyWith<$Res> {
  __$SearchTagResultsStateCopyWithImpl(this._self, this._then);

  final _SearchTagResultsState _self;
  final $Res Function(_SearchTagResultsState) _then;

  /// Create a copy of SearchTagResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tag = null,
    Object? selectedTab = null,
    Object? liveSortOption = null,
    Object? vodSortOption = null,
    Object? live = null,
    Object? vod = null,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _SearchTagResultsState(
        tag: null == tag
            ? _self.tag
            : tag // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsTab,
        liveSortOption: null == liveSortOption
            ? _self.liveSortOption
            : liveSortOption // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsLiveSortOption,
        vodSortOption: null == vodSortOption
            ? _self.vodSortOption
            : vodSortOption // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsVodSortOption,
        live: null == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsPageData<
                    SearchTagLive,
                    SearchTagLiveCursor
                  >,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsPageData<
                    SearchTagVideo,
                    SearchTagVideoCursor
                  >,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of SearchTagResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagResultsPageDataCopyWith<SearchTagLive, SearchTagLiveCursor, $Res>
  get live {
    return $SearchTagResultsPageDataCopyWith<
      SearchTagLive,
      SearchTagLiveCursor,
      $Res
    >(_self.live, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of SearchTagResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagResultsPageDataCopyWith<SearchTagVideo, SearchTagVideoCursor, $Res>
  get vod {
    return $SearchTagResultsPageDataCopyWith<
      SearchTagVideo,
      SearchTagVideoCursor,
      $Res
    >(_self.vod, (value) {
      return _then(_self.copyWith(vod: value));
    });
  }
}

/// @nodoc
mixin _$SearchTagResultsPageData<T, C> {
  SearchTagResultsLoadStatus get status;
  List<T> get items;
  C? get cursor;
  SearchTagResultsPaginationStatus get paginationStatus;

  /// Create a copy of SearchTagResultsPageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagResultsPageDataCopyWith<T, C, SearchTagResultsPageData<T, C>>
  get copyWith =>
      _$SearchTagResultsPageDataCopyWithImpl<
        T,
        C,
        SearchTagResultsPageData<T, C>
      >(this as SearchTagResultsPageData<T, C>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagResultsPageData<T, C> &&
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
    return 'SearchTagResultsPageData<$T, $C>(status: $status, items: $items, cursor: $cursor, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class $SearchTagResultsPageDataCopyWith<T, C, $Res> {
  factory $SearchTagResultsPageDataCopyWith(
    SearchTagResultsPageData<T, C> value,
    $Res Function(SearchTagResultsPageData<T, C>) _then,
  ) = _$SearchTagResultsPageDataCopyWithImpl;
  @useResult
  $Res call({
    SearchTagResultsLoadStatus status,
    List<T> items,
    C? cursor,
    SearchTagResultsPaginationStatus paginationStatus,
  });
}

/// @nodoc
class _$SearchTagResultsPageDataCopyWithImpl<T, C, $Res>
    implements $SearchTagResultsPageDataCopyWith<T, C, $Res> {
  _$SearchTagResultsPageDataCopyWithImpl(this._self, this._then);

  final SearchTagResultsPageData<T, C> _self;
  final $Res Function(SearchTagResultsPageData<T, C>) _then;

  /// Create a copy of SearchTagResultsPageData
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
                  as SearchTagResultsLoadStatus,
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
                  as SearchTagResultsPaginationStatus,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchTagResultsPageData].
extension SearchTagResultsPageDataPatterns<T, C>
    on SearchTagResultsPageData<T, C> {
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
    TResult Function(_SearchTagResultsPageData<T, C> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsPageData() when $default != null:
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
    TResult Function(_SearchTagResultsPageData<T, C> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsPageData():
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
    TResult? Function(_SearchTagResultsPageData<T, C> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsPageData() when $default != null:
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
      SearchTagResultsLoadStatus status,
      List<T> items,
      C? cursor,
      SearchTagResultsPaginationStatus paginationStatus,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsPageData() when $default != null:
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
      SearchTagResultsLoadStatus status,
      List<T> items,
      C? cursor,
      SearchTagResultsPaginationStatus paginationStatus,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsPageData():
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
      SearchTagResultsLoadStatus status,
      List<T> items,
      C? cursor,
      SearchTagResultsPaginationStatus paginationStatus,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchTagResultsPageData() when $default != null:
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

class _SearchTagResultsPageData<T, C> extends SearchTagResultsPageData<T, C> {
  const _SearchTagResultsPageData({
    required this.status,
    required final List<T> items,
    this.cursor,
    required this.paginationStatus,
  }) : _items = items,
       super._();

  @override
  final SearchTagResultsLoadStatus status;
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
  final SearchTagResultsPaginationStatus paginationStatus;

  /// Create a copy of SearchTagResultsPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchTagResultsPageDataCopyWith<T, C, _SearchTagResultsPageData<T, C>>
  get copyWith =>
      __$SearchTagResultsPageDataCopyWithImpl<
        T,
        C,
        _SearchTagResultsPageData<T, C>
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchTagResultsPageData<T, C> &&
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
    return 'SearchTagResultsPageData<$T, $C>(status: $status, items: $items, cursor: $cursor, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class _$SearchTagResultsPageDataCopyWith<T, C, $Res>
    implements $SearchTagResultsPageDataCopyWith<T, C, $Res> {
  factory _$SearchTagResultsPageDataCopyWith(
    _SearchTagResultsPageData<T, C> value,
    $Res Function(_SearchTagResultsPageData<T, C>) _then,
  ) = __$SearchTagResultsPageDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    SearchTagResultsLoadStatus status,
    List<T> items,
    C? cursor,
    SearchTagResultsPaginationStatus paginationStatus,
  });
}

/// @nodoc
class __$SearchTagResultsPageDataCopyWithImpl<T, C, $Res>
    implements _$SearchTagResultsPageDataCopyWith<T, C, $Res> {
  __$SearchTagResultsPageDataCopyWithImpl(this._self, this._then);

  final _SearchTagResultsPageData<T, C> _self;
  final $Res Function(_SearchTagResultsPageData<T, C>) _then;

  /// Create a copy of SearchTagResultsPageData
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
      _SearchTagResultsPageData<T, C>(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SearchTagResultsLoadStatus,
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
                  as SearchTagResultsPaginationStatus,
      ),
    );
  }
}
