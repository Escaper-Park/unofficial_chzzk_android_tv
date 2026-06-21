// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_results_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchResultsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchResultsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchResultsEvent()';
  }
}

/// @nodoc
class $SearchResultsEventCopyWith<$Res> {
  $SearchResultsEventCopyWith(
    SearchResultsEvent _,
    $Res Function(SearchResultsEvent) __,
  );
}

/// Adds pattern-matching-related methods to [SearchResultsEvent].
extension SearchResultsEventPatterns on SearchResultsEvent {
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
    TResult Function(_RetryRequested value)? retryRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
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
    required TResult Function(_RetryRequested value) retryRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _RetryRequested():
        return retryRequested(_that);
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
    TResult? Function(_RetryRequested value)? retryRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
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
    TResult Function(String query)? started,
    TResult Function()? retryRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.query);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
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
    required TResult Function(String query) started,
    required TResult Function() retryRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that.query);
      case _RetryRequested():
        return retryRequested();
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
    TResult? Function(String query)? started,
    TResult? Function()? retryRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.query);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements SearchResultsEvent {
  const _Started({required this.query});

  final String query;

  /// Create a copy of SearchResultsEvent
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
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'SearchResultsEvent.started(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $SearchResultsEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of SearchResultsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? query = null}) {
    return _then(
      _Started(
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _RetryRequested implements SearchResultsEvent {
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
    return 'SearchResultsEvent.retryRequested()';
  }
}

/// @nodoc
mixin _$SearchResultsState {
  String get query;
  SearchResultsLoadStatus get status;
  List<SearchChannelResult> get channels;
  List<SearchLiveResult> get lives;
  List<SearchVideoResult> get videos;

  /// Create a copy of SearchResultsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchResultsStateCopyWith<SearchResultsState> get copyWith =>
      _$SearchResultsStateCopyWithImpl<SearchResultsState>(
        this as SearchResultsState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchResultsState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.channels, channels) &&
            const DeepCollectionEquality().equals(other.lives, lives) &&
            const DeepCollectionEquality().equals(other.videos, videos));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    query,
    status,
    const DeepCollectionEquality().hash(channels),
    const DeepCollectionEquality().hash(lives),
    const DeepCollectionEquality().hash(videos),
  );

  @override
  String toString() {
    return 'SearchResultsState(query: $query, status: $status, channels: $channels, lives: $lives, videos: $videos)';
  }
}

/// @nodoc
abstract mixin class $SearchResultsStateCopyWith<$Res> {
  factory $SearchResultsStateCopyWith(
    SearchResultsState value,
    $Res Function(SearchResultsState) _then,
  ) = _$SearchResultsStateCopyWithImpl;
  @useResult
  $Res call({
    String query,
    SearchResultsLoadStatus status,
    List<SearchChannelResult> channels,
    List<SearchLiveResult> lives,
    List<SearchVideoResult> videos,
  });
}

/// @nodoc
class _$SearchResultsStateCopyWithImpl<$Res>
    implements $SearchResultsStateCopyWith<$Res> {
  _$SearchResultsStateCopyWithImpl(this._self, this._then);

  final SearchResultsState _self;
  final $Res Function(SearchResultsState) _then;

  /// Create a copy of SearchResultsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? status = null,
    Object? channels = null,
    Object? lives = null,
    Object? videos = null,
  }) {
    return _then(
      _self.copyWith(
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SearchResultsLoadStatus,
        channels: null == channels
            ? _self.channels
            : channels // ignore: cast_nullable_to_non_nullable
                  as List<SearchChannelResult>,
        lives: null == lives
            ? _self.lives
            : lives // ignore: cast_nullable_to_non_nullable
                  as List<SearchLiveResult>,
        videos: null == videos
            ? _self.videos
            : videos // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideoResult>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SearchResultsState].
extension SearchResultsStatePatterns on SearchResultsState {
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
    TResult Function(_SearchResultsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResultsState() when $default != null:
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
    TResult Function(_SearchResultsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchResultsState():
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
    TResult? Function(_SearchResultsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchResultsState() when $default != null:
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
      String query,
      SearchResultsLoadStatus status,
      List<SearchChannelResult> channels,
      List<SearchLiveResult> lives,
      List<SearchVideoResult> videos,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResultsState() when $default != null:
        return $default(
          _that.query,
          _that.status,
          _that.channels,
          _that.lives,
          _that.videos,
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
      String query,
      SearchResultsLoadStatus status,
      List<SearchChannelResult> channels,
      List<SearchLiveResult> lives,
      List<SearchVideoResult> videos,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchResultsState():
        return $default(
          _that.query,
          _that.status,
          _that.channels,
          _that.lives,
          _that.videos,
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
      String query,
      SearchResultsLoadStatus status,
      List<SearchChannelResult> channels,
      List<SearchLiveResult> lives,
      List<SearchVideoResult> videos,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchResultsState() when $default != null:
        return $default(
          _that.query,
          _that.status,
          _that.channels,
          _that.lives,
          _that.videos,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchResultsState extends SearchResultsState {
  const _SearchResultsState({
    required this.query,
    required this.status,
    required final List<SearchChannelResult> channels,
    required final List<SearchLiveResult> lives,
    required final List<SearchVideoResult> videos,
  }) : _channels = channels,
       _lives = lives,
       _videos = videos,
       super._();

  @override
  final String query;
  @override
  final SearchResultsLoadStatus status;
  final List<SearchChannelResult> _channels;
  @override
  List<SearchChannelResult> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  final List<SearchLiveResult> _lives;
  @override
  List<SearchLiveResult> get lives {
    if (_lives is EqualUnmodifiableListView) return _lives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lives);
  }

  final List<SearchVideoResult> _videos;
  @override
  List<SearchVideoResult> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  /// Create a copy of SearchResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchResultsStateCopyWith<_SearchResultsState> get copyWith =>
      __$SearchResultsStateCopyWithImpl<_SearchResultsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchResultsState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._channels, _channels) &&
            const DeepCollectionEquality().equals(other._lives, _lives) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    query,
    status,
    const DeepCollectionEquality().hash(_channels),
    const DeepCollectionEquality().hash(_lives),
    const DeepCollectionEquality().hash(_videos),
  );

  @override
  String toString() {
    return 'SearchResultsState(query: $query, status: $status, channels: $channels, lives: $lives, videos: $videos)';
  }
}

/// @nodoc
abstract mixin class _$SearchResultsStateCopyWith<$Res>
    implements $SearchResultsStateCopyWith<$Res> {
  factory _$SearchResultsStateCopyWith(
    _SearchResultsState value,
    $Res Function(_SearchResultsState) _then,
  ) = __$SearchResultsStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String query,
    SearchResultsLoadStatus status,
    List<SearchChannelResult> channels,
    List<SearchLiveResult> lives,
    List<SearchVideoResult> videos,
  });
}

/// @nodoc
class __$SearchResultsStateCopyWithImpl<$Res>
    implements _$SearchResultsStateCopyWith<$Res> {
  __$SearchResultsStateCopyWithImpl(this._self, this._then);

  final _SearchResultsState _self;
  final $Res Function(_SearchResultsState) _then;

  /// Create a copy of SearchResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? status = null,
    Object? channels = null,
    Object? lives = null,
    Object? videos = null,
  }) {
    return _then(
      _SearchResultsState(
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SearchResultsLoadStatus,
        channels: null == channels
            ? _self._channels
            : channels // ignore: cast_nullable_to_non_nullable
                  as List<SearchChannelResult>,
        lives: null == lives
            ? _self._lives
            : lives // ignore: cast_nullable_to_non_nullable
                  as List<SearchLiveResult>,
        videos: null == videos
            ? _self._videos
            : videos // ignore: cast_nullable_to_non_nullable
                  as List<SearchVideoResult>,
      ),
    );
  }
}
