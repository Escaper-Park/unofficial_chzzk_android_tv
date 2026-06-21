// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowingEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FollowingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FollowingEvent()';
  }
}

/// @nodoc
class $FollowingEventCopyWith<$Res> {
  $FollowingEventCopyWith(FollowingEvent _, $Res Function(FollowingEvent) __);
}

/// Adds pattern-matching-related methods to [FollowingEvent].
extension FollowingEventPatterns on FollowingEvent {
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
    TResult Function(_LiveSortSelected value)? liveSortSelected,
    TResult Function(_LoadMoreRequested value)? loadMoreRequested,
    TResult Function(_ChannelModalOpened value)? channelModalOpened,
    TResult Function(_ChannelModalClosed value)? channelModalClosed,
    TResult Function(_ChannelUnfollowRequested value)? channelUnfollowRequested,
    TResult Function(_ChannelFollowRequested value)? channelFollowRequested,
    TResult Function(_ChannelGroupListRequested value)?
    channelGroupListRequested,
    TResult Function(_ChannelAddToGroupRequested value)?
    channelAddToGroupRequested,
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
      case _LiveSortSelected() when liveSortSelected != null:
        return liveSortSelected(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
      case _ChannelModalOpened() when channelModalOpened != null:
        return channelModalOpened(_that);
      case _ChannelModalClosed() when channelModalClosed != null:
        return channelModalClosed(_that);
      case _ChannelUnfollowRequested() when channelUnfollowRequested != null:
        return channelUnfollowRequested(_that);
      case _ChannelFollowRequested() when channelFollowRequested != null:
        return channelFollowRequested(_that);
      case _ChannelGroupListRequested() when channelGroupListRequested != null:
        return channelGroupListRequested(_that);
      case _ChannelAddToGroupRequested()
          when channelAddToGroupRequested != null:
        return channelAddToGroupRequested(_that);
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
    required TResult Function(_LiveSortSelected value) liveSortSelected,
    required TResult Function(_LoadMoreRequested value) loadMoreRequested,
    required TResult Function(_ChannelModalOpened value) channelModalOpened,
    required TResult Function(_ChannelModalClosed value) channelModalClosed,
    required TResult Function(_ChannelUnfollowRequested value)
    channelUnfollowRequested,
    required TResult Function(_ChannelFollowRequested value)
    channelFollowRequested,
    required TResult Function(_ChannelGroupListRequested value)
    channelGroupListRequested,
    required TResult Function(_ChannelAddToGroupRequested value)
    channelAddToGroupRequested,
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
      case _LiveSortSelected():
        return liveSortSelected(_that);
      case _LoadMoreRequested():
        return loadMoreRequested(_that);
      case _ChannelModalOpened():
        return channelModalOpened(_that);
      case _ChannelModalClosed():
        return channelModalClosed(_that);
      case _ChannelUnfollowRequested():
        return channelUnfollowRequested(_that);
      case _ChannelFollowRequested():
        return channelFollowRequested(_that);
      case _ChannelGroupListRequested():
        return channelGroupListRequested(_that);
      case _ChannelAddToGroupRequested():
        return channelAddToGroupRequested(_that);
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
    TResult? Function(_LiveSortSelected value)? liveSortSelected,
    TResult? Function(_LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(_ChannelModalOpened value)? channelModalOpened,
    TResult? Function(_ChannelModalClosed value)? channelModalClosed,
    TResult? Function(_ChannelUnfollowRequested value)?
    channelUnfollowRequested,
    TResult? Function(_ChannelFollowRequested value)? channelFollowRequested,
    TResult? Function(_ChannelGroupListRequested value)?
    channelGroupListRequested,
    TResult? Function(_ChannelAddToGroupRequested value)?
    channelAddToGroupRequested,
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
      case _LiveSortSelected() when liveSortSelected != null:
        return liveSortSelected(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
      case _ChannelModalOpened() when channelModalOpened != null:
        return channelModalOpened(_that);
      case _ChannelModalClosed() when channelModalClosed != null:
        return channelModalClosed(_that);
      case _ChannelUnfollowRequested() when channelUnfollowRequested != null:
        return channelUnfollowRequested(_that);
      case _ChannelFollowRequested() when channelFollowRequested != null:
        return channelFollowRequested(_that);
      case _ChannelGroupListRequested() when channelGroupListRequested != null:
        return channelGroupListRequested(_that);
      case _ChannelAddToGroupRequested()
          when channelAddToGroupRequested != null:
        return channelAddToGroupRequested(_that);
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
    TResult Function(FollowingTab tab)? tabSelected,
    TResult Function()? retryRequested,
    TResult Function(FollowingLiveSortOption option)? liveSortSelected,
    TResult Function()? loadMoreRequested,
    TResult Function(FollowingChannel channel, int index)? channelModalOpened,
    TResult Function()? channelModalClosed,
    TResult Function(FollowingChannel channel)? channelUnfollowRequested,
    TResult Function(FollowingChannel channel)? channelFollowRequested,
    TResult Function(FollowingChannel channel)? channelGroupListRequested,
    TResult Function(FollowingChannel channel, GroupItem group)?
    channelAddToGroupRequested,
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
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LiveSortSelected() when liveSortSelected != null:
        return liveSortSelected(_that.option);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
      case _ChannelModalOpened() when channelModalOpened != null:
        return channelModalOpened(_that.channel, _that.index);
      case _ChannelModalClosed() when channelModalClosed != null:
        return channelModalClosed();
      case _ChannelUnfollowRequested() when channelUnfollowRequested != null:
        return channelUnfollowRequested(_that.channel);
      case _ChannelFollowRequested() when channelFollowRequested != null:
        return channelFollowRequested(_that.channel);
      case _ChannelGroupListRequested() when channelGroupListRequested != null:
        return channelGroupListRequested(_that.channel);
      case _ChannelAddToGroupRequested()
          when channelAddToGroupRequested != null:
        return channelAddToGroupRequested(_that.channel, _that.group);
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
    required TResult Function(FollowingTab tab) tabSelected,
    required TResult Function() retryRequested,
    required TResult Function(FollowingLiveSortOption option) liveSortSelected,
    required TResult Function() loadMoreRequested,
    required TResult Function(FollowingChannel channel, int index)
    channelModalOpened,
    required TResult Function() channelModalClosed,
    required TResult Function(FollowingChannel channel)
    channelUnfollowRequested,
    required TResult Function(FollowingChannel channel) channelFollowRequested,
    required TResult Function(FollowingChannel channel)
    channelGroupListRequested,
    required TResult Function(FollowingChannel channel, GroupItem group)
    channelAddToGroupRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that.isSignedIn);
      case _AuthStateChanged():
        return authStateChanged(_that.isSignedIn);
      case _TabSelected():
        return tabSelected(_that.tab);
      case _RetryRequested():
        return retryRequested();
      case _LiveSortSelected():
        return liveSortSelected(_that.option);
      case _LoadMoreRequested():
        return loadMoreRequested();
      case _ChannelModalOpened():
        return channelModalOpened(_that.channel, _that.index);
      case _ChannelModalClosed():
        return channelModalClosed();
      case _ChannelUnfollowRequested():
        return channelUnfollowRequested(_that.channel);
      case _ChannelFollowRequested():
        return channelFollowRequested(_that.channel);
      case _ChannelGroupListRequested():
        return channelGroupListRequested(_that.channel);
      case _ChannelAddToGroupRequested():
        return channelAddToGroupRequested(_that.channel, _that.group);
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
    TResult? Function(FollowingTab tab)? tabSelected,
    TResult? Function()? retryRequested,
    TResult? Function(FollowingLiveSortOption option)? liveSortSelected,
    TResult? Function()? loadMoreRequested,
    TResult? Function(FollowingChannel channel, int index)? channelModalOpened,
    TResult? Function()? channelModalClosed,
    TResult? Function(FollowingChannel channel)? channelUnfollowRequested,
    TResult? Function(FollowingChannel channel)? channelFollowRequested,
    TResult? Function(FollowingChannel channel)? channelGroupListRequested,
    TResult? Function(FollowingChannel channel, GroupItem group)?
    channelAddToGroupRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.isSignedIn);
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that.isSignedIn);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LiveSortSelected() when liveSortSelected != null:
        return liveSortSelected(_that.option);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
      case _ChannelModalOpened() when channelModalOpened != null:
        return channelModalOpened(_that.channel, _that.index);
      case _ChannelModalClosed() when channelModalClosed != null:
        return channelModalClosed();
      case _ChannelUnfollowRequested() when channelUnfollowRequested != null:
        return channelUnfollowRequested(_that.channel);
      case _ChannelFollowRequested() when channelFollowRequested != null:
        return channelFollowRequested(_that.channel);
      case _ChannelGroupListRequested() when channelGroupListRequested != null:
        return channelGroupListRequested(_that.channel);
      case _ChannelAddToGroupRequested()
          when channelAddToGroupRequested != null:
        return channelAddToGroupRequested(_that.channel, _that.group);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements FollowingEvent {
  const _Started({required this.isSignedIn});

  final bool isSignedIn;

  /// Create a copy of FollowingEvent
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
    return 'FollowingEvent.started(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
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

  /// Create a copy of FollowingEvent
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

class _AuthStateChanged implements FollowingEvent {
  const _AuthStateChanged({required this.isSignedIn});

  final bool isSignedIn;

  /// Create a copy of FollowingEvent
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
    return 'FollowingEvent.authStateChanged(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateChangedCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
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

  /// Create a copy of FollowingEvent
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

class _TabSelected implements FollowingEvent {
  const _TabSelected(this.tab);

  final FollowingTab tab;

  /// Create a copy of FollowingEvent
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
    return 'FollowingEvent.tabSelected(tab: $tab)';
  }
}

/// @nodoc
abstract mixin class _$TabSelectedCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
  factory _$TabSelectedCopyWith(
    _TabSelected value,
    $Res Function(_TabSelected) _then,
  ) = __$TabSelectedCopyWithImpl;
  @useResult
  $Res call({FollowingTab tab});
}

/// @nodoc
class __$TabSelectedCopyWithImpl<$Res> implements _$TabSelectedCopyWith<$Res> {
  __$TabSelectedCopyWithImpl(this._self, this._then);

  final _TabSelected _self;
  final $Res Function(_TabSelected) _then;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? tab = null}) {
    return _then(
      _TabSelected(
        null == tab
            ? _self.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as FollowingTab,
      ),
    );
  }
}

/// @nodoc

class _RetryRequested implements FollowingEvent {
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
    return 'FollowingEvent.retryRequested()';
  }
}

/// @nodoc

class _LiveSortSelected implements FollowingEvent {
  const _LiveSortSelected(this.option);

  final FollowingLiveSortOption option;

  /// Create a copy of FollowingEvent
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
    return 'FollowingEvent.liveSortSelected(option: $option)';
  }
}

/// @nodoc
abstract mixin class _$LiveSortSelectedCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
  factory _$LiveSortSelectedCopyWith(
    _LiveSortSelected value,
    $Res Function(_LiveSortSelected) _then,
  ) = __$LiveSortSelectedCopyWithImpl;
  @useResult
  $Res call({FollowingLiveSortOption option});
}

/// @nodoc
class __$LiveSortSelectedCopyWithImpl<$Res>
    implements _$LiveSortSelectedCopyWith<$Res> {
  __$LiveSortSelectedCopyWithImpl(this._self, this._then);

  final _LiveSortSelected _self;
  final $Res Function(_LiveSortSelected) _then;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? option = null}) {
    return _then(
      _LiveSortSelected(
        null == option
            ? _self.option
            : option // ignore: cast_nullable_to_non_nullable
                  as FollowingLiveSortOption,
      ),
    );
  }
}

/// @nodoc

class _LoadMoreRequested implements FollowingEvent {
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
    return 'FollowingEvent.loadMoreRequested()';
  }
}

/// @nodoc

class _ChannelModalOpened implements FollowingEvent {
  const _ChannelModalOpened({required this.channel, required this.index});

  final FollowingChannel channel;
  final int index;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelModalOpenedCopyWith<_ChannelModalOpened> get copyWith =>
      __$ChannelModalOpenedCopyWithImpl<_ChannelModalOpened>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelModalOpened &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, index);

  @override
  String toString() {
    return 'FollowingEvent.channelModalOpened(channel: $channel, index: $index)';
  }
}

/// @nodoc
abstract mixin class _$ChannelModalOpenedCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
  factory _$ChannelModalOpenedCopyWith(
    _ChannelModalOpened value,
    $Res Function(_ChannelModalOpened) _then,
  ) = __$ChannelModalOpenedCopyWithImpl;
  @useResult
  $Res call({FollowingChannel channel, int index});

  $FollowingChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$ChannelModalOpenedCopyWithImpl<$Res>
    implements _$ChannelModalOpenedCopyWith<$Res> {
  __$ChannelModalOpenedCopyWithImpl(this._self, this._then);

  final _ChannelModalOpened _self;
  final $Res Function(_ChannelModalOpened) _then;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = null, Object? index = null}) {
    return _then(
      _ChannelModalOpened(
        channel: null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingChannel,
        index: null == index
            ? _self.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelCopyWith<$Res> get channel {
    return $FollowingChannelCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc

class _ChannelModalClosed implements FollowingEvent {
  const _ChannelModalClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ChannelModalClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FollowingEvent.channelModalClosed()';
  }
}

/// @nodoc

class _ChannelUnfollowRequested implements FollowingEvent {
  const _ChannelUnfollowRequested(this.channel);

  final FollowingChannel channel;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelUnfollowRequestedCopyWith<_ChannelUnfollowRequested> get copyWith =>
      __$ChannelUnfollowRequestedCopyWithImpl<_ChannelUnfollowRequested>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelUnfollowRequested &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel);

  @override
  String toString() {
    return 'FollowingEvent.channelUnfollowRequested(channel: $channel)';
  }
}

/// @nodoc
abstract mixin class _$ChannelUnfollowRequestedCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
  factory _$ChannelUnfollowRequestedCopyWith(
    _ChannelUnfollowRequested value,
    $Res Function(_ChannelUnfollowRequested) _then,
  ) = __$ChannelUnfollowRequestedCopyWithImpl;
  @useResult
  $Res call({FollowingChannel channel});

  $FollowingChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$ChannelUnfollowRequestedCopyWithImpl<$Res>
    implements _$ChannelUnfollowRequestedCopyWith<$Res> {
  __$ChannelUnfollowRequestedCopyWithImpl(this._self, this._then);

  final _ChannelUnfollowRequested _self;
  final $Res Function(_ChannelUnfollowRequested) _then;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = null}) {
    return _then(
      _ChannelUnfollowRequested(
        null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingChannel,
      ),
    );
  }

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelCopyWith<$Res> get channel {
    return $FollowingChannelCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc

class _ChannelFollowRequested implements FollowingEvent {
  const _ChannelFollowRequested(this.channel);

  final FollowingChannel channel;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelFollowRequestedCopyWith<_ChannelFollowRequested> get copyWith =>
      __$ChannelFollowRequestedCopyWithImpl<_ChannelFollowRequested>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelFollowRequested &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel);

  @override
  String toString() {
    return 'FollowingEvent.channelFollowRequested(channel: $channel)';
  }
}

/// @nodoc
abstract mixin class _$ChannelFollowRequestedCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
  factory _$ChannelFollowRequestedCopyWith(
    _ChannelFollowRequested value,
    $Res Function(_ChannelFollowRequested) _then,
  ) = __$ChannelFollowRequestedCopyWithImpl;
  @useResult
  $Res call({FollowingChannel channel});

  $FollowingChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$ChannelFollowRequestedCopyWithImpl<$Res>
    implements _$ChannelFollowRequestedCopyWith<$Res> {
  __$ChannelFollowRequestedCopyWithImpl(this._self, this._then);

  final _ChannelFollowRequested _self;
  final $Res Function(_ChannelFollowRequested) _then;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = null}) {
    return _then(
      _ChannelFollowRequested(
        null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingChannel,
      ),
    );
  }

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelCopyWith<$Res> get channel {
    return $FollowingChannelCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc

class _ChannelGroupListRequested implements FollowingEvent {
  const _ChannelGroupListRequested(this.channel);

  final FollowingChannel channel;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelGroupListRequestedCopyWith<_ChannelGroupListRequested>
  get copyWith =>
      __$ChannelGroupListRequestedCopyWithImpl<_ChannelGroupListRequested>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelGroupListRequested &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel);

  @override
  String toString() {
    return 'FollowingEvent.channelGroupListRequested(channel: $channel)';
  }
}

/// @nodoc
abstract mixin class _$ChannelGroupListRequestedCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
  factory _$ChannelGroupListRequestedCopyWith(
    _ChannelGroupListRequested value,
    $Res Function(_ChannelGroupListRequested) _then,
  ) = __$ChannelGroupListRequestedCopyWithImpl;
  @useResult
  $Res call({FollowingChannel channel});

  $FollowingChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$ChannelGroupListRequestedCopyWithImpl<$Res>
    implements _$ChannelGroupListRequestedCopyWith<$Res> {
  __$ChannelGroupListRequestedCopyWithImpl(this._self, this._then);

  final _ChannelGroupListRequested _self;
  final $Res Function(_ChannelGroupListRequested) _then;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = null}) {
    return _then(
      _ChannelGroupListRequested(
        null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingChannel,
      ),
    );
  }

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelCopyWith<$Res> get channel {
    return $FollowingChannelCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc

class _ChannelAddToGroupRequested implements FollowingEvent {
  const _ChannelAddToGroupRequested({
    required this.channel,
    required this.group,
  });

  final FollowingChannel channel;
  final GroupItem group;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelAddToGroupRequestedCopyWith<_ChannelAddToGroupRequested>
  get copyWith =>
      __$ChannelAddToGroupRequestedCopyWithImpl<_ChannelAddToGroupRequested>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelAddToGroupRequested &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, group);

  @override
  String toString() {
    return 'FollowingEvent.channelAddToGroupRequested(channel: $channel, group: $group)';
  }
}

/// @nodoc
abstract mixin class _$ChannelAddToGroupRequestedCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
  factory _$ChannelAddToGroupRequestedCopyWith(
    _ChannelAddToGroupRequested value,
    $Res Function(_ChannelAddToGroupRequested) _then,
  ) = __$ChannelAddToGroupRequestedCopyWithImpl;
  @useResult
  $Res call({FollowingChannel channel, GroupItem group});

  $FollowingChannelCopyWith<$Res> get channel;
  $GroupItemCopyWith<$Res> get group;
}

/// @nodoc
class __$ChannelAddToGroupRequestedCopyWithImpl<$Res>
    implements _$ChannelAddToGroupRequestedCopyWith<$Res> {
  __$ChannelAddToGroupRequestedCopyWithImpl(this._self, this._then);

  final _ChannelAddToGroupRequested _self;
  final $Res Function(_ChannelAddToGroupRequested) _then;

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? channel = null, Object? group = null}) {
    return _then(
      _ChannelAddToGroupRequested(
        channel: null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingChannel,
        group: null == group
            ? _self.group
            : group // ignore: cast_nullable_to_non_nullable
                  as GroupItem,
      ),
    );
  }

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelCopyWith<$Res> get channel {
    return $FollowingChannelCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of FollowingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupItemCopyWith<$Res> get group {
    return $GroupItemCopyWith<$Res>(_self.group, (value) {
      return _then(_self.copyWith(group: value));
    });
  }
}

/// @nodoc
mixin _$FollowingState {
  bool get isSignedIn;
  FollowingTab get selectedTab;
  FollowingLiveSortOption get liveSortOption;
  FollowingSectionData<Live> get live;
  FollowingVodSectionData get vod;
  FollowingSectionData<FollowingChannel> get channel;
  FollowingSectionData<CategoryItem> get category;
  FollowingChannelModalState? get activeChannelModal;
  FollowingFeedbackType? get feedbackType;
  int get feedbackSerial;

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingStateCopyWith<FollowingState> get copyWith =>
      _$FollowingStateCopyWithImpl<FollowingState>(
        this as FollowingState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingState &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.liveSortOption, liveSortOption) ||
                other.liveSortOption == liveSortOption) &&
            (identical(other.live, live) || other.live == live) &&
            (identical(other.vod, vod) || other.vod == vod) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.activeChannelModal, activeChannelModal) ||
                other.activeChannelModal == activeChannelModal) &&
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
    live,
    vod,
    channel,
    category,
    activeChannelModal,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'FollowingState(isSignedIn: $isSignedIn, selectedTab: $selectedTab, liveSortOption: $liveSortOption, live: $live, vod: $vod, channel: $channel, category: $category, activeChannelModal: $activeChannelModal, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class $FollowingStateCopyWith<$Res> {
  factory $FollowingStateCopyWith(
    FollowingState value,
    $Res Function(FollowingState) _then,
  ) = _$FollowingStateCopyWithImpl;
  @useResult
  $Res call({
    bool isSignedIn,
    FollowingTab selectedTab,
    FollowingLiveSortOption liveSortOption,
    FollowingSectionData<Live> live,
    FollowingVodSectionData vod,
    FollowingSectionData<FollowingChannel> channel,
    FollowingSectionData<CategoryItem> category,
    FollowingChannelModalState? activeChannelModal,
    FollowingFeedbackType? feedbackType,
    int feedbackSerial,
  });

  $FollowingSectionDataCopyWith<Live, $Res> get live;
  $FollowingVodSectionDataCopyWith<$Res> get vod;
  $FollowingSectionDataCopyWith<FollowingChannel, $Res> get channel;
  $FollowingSectionDataCopyWith<CategoryItem, $Res> get category;
  $FollowingChannelModalStateCopyWith<$Res>? get activeChannelModal;
}

/// @nodoc
class _$FollowingStateCopyWithImpl<$Res>
    implements $FollowingStateCopyWith<$Res> {
  _$FollowingStateCopyWithImpl(this._self, this._then);

  final FollowingState _self;
  final $Res Function(FollowingState) _then;

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignedIn = null,
    Object? selectedTab = null,
    Object? liveSortOption = null,
    Object? live = null,
    Object? vod = null,
    Object? channel = null,
    Object? category = null,
    Object? activeChannelModal = freezed,
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
                  as FollowingTab,
        liveSortOption: null == liveSortOption
            ? _self.liveSortOption
            : liveSortOption // ignore: cast_nullable_to_non_nullable
                  as FollowingLiveSortOption,
        live: null == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as FollowingSectionData<Live>,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as FollowingVodSectionData,
        channel: null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingSectionData<FollowingChannel>,
        category: null == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as FollowingSectionData<CategoryItem>,
        activeChannelModal: freezed == activeChannelModal
            ? _self.activeChannelModal
            : activeChannelModal // ignore: cast_nullable_to_non_nullable
                  as FollowingChannelModalState?,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as FollowingFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingSectionDataCopyWith<Live, $Res> get live {
    return $FollowingSectionDataCopyWith<Live, $Res>(_self.live, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodSectionDataCopyWith<$Res> get vod {
    return $FollowingVodSectionDataCopyWith<$Res>(_self.vod, (value) {
      return _then(_self.copyWith(vod: value));
    });
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingSectionDataCopyWith<FollowingChannel, $Res> get channel {
    return $FollowingSectionDataCopyWith<FollowingChannel, $Res>(
      _self.channel,
      (value) {
        return _then(_self.copyWith(channel: value));
      },
    );
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingSectionDataCopyWith<CategoryItem, $Res> get category {
    return $FollowingSectionDataCopyWith<CategoryItem, $Res>(_self.category, (
      value,
    ) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelModalStateCopyWith<$Res>? get activeChannelModal {
    if (_self.activeChannelModal == null) {
      return null;
    }

    return $FollowingChannelModalStateCopyWith<$Res>(
      _self.activeChannelModal!,
      (value) {
        return _then(_self.copyWith(activeChannelModal: value));
      },
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingState].
extension FollowingStatePatterns on FollowingState {
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
    TResult Function(_FollowingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingState() when $default != null:
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
    TResult Function(_FollowingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingState():
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
    TResult? Function(_FollowingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingState() when $default != null:
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
      FollowingTab selectedTab,
      FollowingLiveSortOption liveSortOption,
      FollowingSectionData<Live> live,
      FollowingVodSectionData vod,
      FollowingSectionData<FollowingChannel> channel,
      FollowingSectionData<CategoryItem> category,
      FollowingChannelModalState? activeChannelModal,
      FollowingFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingState() when $default != null:
        return $default(
          _that.isSignedIn,
          _that.selectedTab,
          _that.liveSortOption,
          _that.live,
          _that.vod,
          _that.channel,
          _that.category,
          _that.activeChannelModal,
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
      FollowingTab selectedTab,
      FollowingLiveSortOption liveSortOption,
      FollowingSectionData<Live> live,
      FollowingVodSectionData vod,
      FollowingSectionData<FollowingChannel> channel,
      FollowingSectionData<CategoryItem> category,
      FollowingChannelModalState? activeChannelModal,
      FollowingFeedbackType? feedbackType,
      int feedbackSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingState():
        return $default(
          _that.isSignedIn,
          _that.selectedTab,
          _that.liveSortOption,
          _that.live,
          _that.vod,
          _that.channel,
          _that.category,
          _that.activeChannelModal,
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
      FollowingTab selectedTab,
      FollowingLiveSortOption liveSortOption,
      FollowingSectionData<Live> live,
      FollowingVodSectionData vod,
      FollowingSectionData<FollowingChannel> channel,
      FollowingSectionData<CategoryItem> category,
      FollowingChannelModalState? activeChannelModal,
      FollowingFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingState() when $default != null:
        return $default(
          _that.isSignedIn,
          _that.selectedTab,
          _that.liveSortOption,
          _that.live,
          _that.vod,
          _that.channel,
          _that.category,
          _that.activeChannelModal,
          _that.feedbackType,
          _that.feedbackSerial,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowingState extends FollowingState {
  const _FollowingState({
    required this.isSignedIn,
    required this.selectedTab,
    required this.liveSortOption,
    required this.live,
    required this.vod,
    required this.channel,
    required this.category,
    this.activeChannelModal,
    this.feedbackType,
    this.feedbackSerial = 0,
  }) : super._();

  @override
  final bool isSignedIn;
  @override
  final FollowingTab selectedTab;
  @override
  final FollowingLiveSortOption liveSortOption;
  @override
  final FollowingSectionData<Live> live;
  @override
  final FollowingVodSectionData vod;
  @override
  final FollowingSectionData<FollowingChannel> channel;
  @override
  final FollowingSectionData<CategoryItem> category;
  @override
  final FollowingChannelModalState? activeChannelModal;
  @override
  final FollowingFeedbackType? feedbackType;
  @override
  @JsonKey()
  final int feedbackSerial;

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingStateCopyWith<_FollowingState> get copyWith =>
      __$FollowingStateCopyWithImpl<_FollowingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingState &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.liveSortOption, liveSortOption) ||
                other.liveSortOption == liveSortOption) &&
            (identical(other.live, live) || other.live == live) &&
            (identical(other.vod, vod) || other.vod == vod) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.activeChannelModal, activeChannelModal) ||
                other.activeChannelModal == activeChannelModal) &&
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
    live,
    vod,
    channel,
    category,
    activeChannelModal,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'FollowingState(isSignedIn: $isSignedIn, selectedTab: $selectedTab, liveSortOption: $liveSortOption, live: $live, vod: $vod, channel: $channel, category: $category, activeChannelModal: $activeChannelModal, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class _$FollowingStateCopyWith<$Res>
    implements $FollowingStateCopyWith<$Res> {
  factory _$FollowingStateCopyWith(
    _FollowingState value,
    $Res Function(_FollowingState) _then,
  ) = __$FollowingStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool isSignedIn,
    FollowingTab selectedTab,
    FollowingLiveSortOption liveSortOption,
    FollowingSectionData<Live> live,
    FollowingVodSectionData vod,
    FollowingSectionData<FollowingChannel> channel,
    FollowingSectionData<CategoryItem> category,
    FollowingChannelModalState? activeChannelModal,
    FollowingFeedbackType? feedbackType,
    int feedbackSerial,
  });

  @override
  $FollowingSectionDataCopyWith<Live, $Res> get live;
  @override
  $FollowingVodSectionDataCopyWith<$Res> get vod;
  @override
  $FollowingSectionDataCopyWith<FollowingChannel, $Res> get channel;
  @override
  $FollowingSectionDataCopyWith<CategoryItem, $Res> get category;
  @override
  $FollowingChannelModalStateCopyWith<$Res>? get activeChannelModal;
}

/// @nodoc
class __$FollowingStateCopyWithImpl<$Res>
    implements _$FollowingStateCopyWith<$Res> {
  __$FollowingStateCopyWithImpl(this._self, this._then);

  final _FollowingState _self;
  final $Res Function(_FollowingState) _then;

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isSignedIn = null,
    Object? selectedTab = null,
    Object? liveSortOption = null,
    Object? live = null,
    Object? vod = null,
    Object? channel = null,
    Object? category = null,
    Object? activeChannelModal = freezed,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _FollowingState(
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as FollowingTab,
        liveSortOption: null == liveSortOption
            ? _self.liveSortOption
            : liveSortOption // ignore: cast_nullable_to_non_nullable
                  as FollowingLiveSortOption,
        live: null == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as FollowingSectionData<Live>,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as FollowingVodSectionData,
        channel: null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingSectionData<FollowingChannel>,
        category: null == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as FollowingSectionData<CategoryItem>,
        activeChannelModal: freezed == activeChannelModal
            ? _self.activeChannelModal
            : activeChannelModal // ignore: cast_nullable_to_non_nullable
                  as FollowingChannelModalState?,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as FollowingFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingSectionDataCopyWith<Live, $Res> get live {
    return $FollowingSectionDataCopyWith<Live, $Res>(_self.live, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodSectionDataCopyWith<$Res> get vod {
    return $FollowingVodSectionDataCopyWith<$Res>(_self.vod, (value) {
      return _then(_self.copyWith(vod: value));
    });
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingSectionDataCopyWith<FollowingChannel, $Res> get channel {
    return $FollowingSectionDataCopyWith<FollowingChannel, $Res>(
      _self.channel,
      (value) {
        return _then(_self.copyWith(channel: value));
      },
    );
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingSectionDataCopyWith<CategoryItem, $Res> get category {
    return $FollowingSectionDataCopyWith<CategoryItem, $Res>(_self.category, (
      value,
    ) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of FollowingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelModalStateCopyWith<$Res>? get activeChannelModal {
    if (_self.activeChannelModal == null) {
      return null;
    }

    return $FollowingChannelModalStateCopyWith<$Res>(
      _self.activeChannelModal!,
      (value) {
        return _then(_self.copyWith(activeChannelModal: value));
      },
    );
  }
}

/// @nodoc
mixin _$FollowingSectionData<T> {
  FollowingLoadStatus get status;
  List<T> get items;

  /// Create a copy of FollowingSectionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingSectionDataCopyWith<T, FollowingSectionData<T>> get copyWith =>
      _$FollowingSectionDataCopyWithImpl<T, FollowingSectionData<T>>(
        this as FollowingSectionData<T>,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingSectionData<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(items),
  );

  @override
  String toString() {
    return 'FollowingSectionData<$T>(status: $status, items: $items)';
  }
}

/// @nodoc
abstract mixin class $FollowingSectionDataCopyWith<T, $Res> {
  factory $FollowingSectionDataCopyWith(
    FollowingSectionData<T> value,
    $Res Function(FollowingSectionData<T>) _then,
  ) = _$FollowingSectionDataCopyWithImpl;
  @useResult
  $Res call({FollowingLoadStatus status, List<T> items});
}

/// @nodoc
class _$FollowingSectionDataCopyWithImpl<T, $Res>
    implements $FollowingSectionDataCopyWith<T, $Res> {
  _$FollowingSectionDataCopyWithImpl(this._self, this._then);

  final FollowingSectionData<T> _self;
  final $Res Function(FollowingSectionData<T>) _then;

  /// Create a copy of FollowingSectionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? items = null}) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FollowingLoadStatus,
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingSectionData].
extension FollowingSectionDataPatterns<T> on FollowingSectionData<T> {
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
    TResult Function(_FollowingSectionData<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingSectionData() when $default != null:
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
    TResult Function(_FollowingSectionData<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingSectionData():
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
    TResult? Function(_FollowingSectionData<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingSectionData() when $default != null:
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
    TResult Function(FollowingLoadStatus status, List<T> items)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingSectionData() when $default != null:
        return $default(_that.status, _that.items);
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
    TResult Function(FollowingLoadStatus status, List<T> items) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingSectionData():
        return $default(_that.status, _that.items);
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
    TResult? Function(FollowingLoadStatus status, List<T> items)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingSectionData() when $default != null:
        return $default(_that.status, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowingSectionData<T> extends FollowingSectionData<T> {
  const _FollowingSectionData({
    required this.status,
    required final List<T> items,
  }) : _items = items,
       super._();

  @override
  final FollowingLoadStatus status;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of FollowingSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingSectionDataCopyWith<T, _FollowingSectionData<T>> get copyWith =>
      __$FollowingSectionDataCopyWithImpl<T, _FollowingSectionData<T>>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingSectionData<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_items),
  );

  @override
  String toString() {
    return 'FollowingSectionData<$T>(status: $status, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$FollowingSectionDataCopyWith<T, $Res>
    implements $FollowingSectionDataCopyWith<T, $Res> {
  factory _$FollowingSectionDataCopyWith(
    _FollowingSectionData<T> value,
    $Res Function(_FollowingSectionData<T>) _then,
  ) = __$FollowingSectionDataCopyWithImpl;
  @override
  @useResult
  $Res call({FollowingLoadStatus status, List<T> items});
}

/// @nodoc
class __$FollowingSectionDataCopyWithImpl<T, $Res>
    implements _$FollowingSectionDataCopyWith<T, $Res> {
  __$FollowingSectionDataCopyWithImpl(this._self, this._then);

  final _FollowingSectionData<T> _self;
  final $Res Function(_FollowingSectionData<T>) _then;

  /// Create a copy of FollowingSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? status = null, Object? items = null}) {
    return _then(
      _FollowingSectionData<T>(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FollowingLoadStatus,
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingVodSectionData {
  FollowingLoadStatus get status;
  List<Vod> get items;
  FollowingVodCursor? get cursor;
  FollowingPaginationStatus get paginationStatus;

  /// Create a copy of FollowingVodSectionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingVodSectionDataCopyWith<FollowingVodSectionData> get copyWith =>
      _$FollowingVodSectionDataCopyWithImpl<FollowingVodSectionData>(
        this as FollowingVodSectionData,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingVodSectionData &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(items),
    cursor,
    paginationStatus,
  );

  @override
  String toString() {
    return 'FollowingVodSectionData(status: $status, items: $items, cursor: $cursor, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class $FollowingVodSectionDataCopyWith<$Res> {
  factory $FollowingVodSectionDataCopyWith(
    FollowingVodSectionData value,
    $Res Function(FollowingVodSectionData) _then,
  ) = _$FollowingVodSectionDataCopyWithImpl;
  @useResult
  $Res call({
    FollowingLoadStatus status,
    List<Vod> items,
    FollowingVodCursor? cursor,
    FollowingPaginationStatus paginationStatus,
  });

  $FollowingVodCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$FollowingVodSectionDataCopyWithImpl<$Res>
    implements $FollowingVodSectionDataCopyWith<$Res> {
  _$FollowingVodSectionDataCopyWithImpl(this._self, this._then);

  final FollowingVodSectionData _self;
  final $Res Function(FollowingVodSectionData) _then;

  /// Create a copy of FollowingVodSectionData
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
                  as FollowingLoadStatus,
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<Vod>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as FollowingVodCursor?,
        paginationStatus: null == paginationStatus
            ? _self.paginationStatus
            : paginationStatus // ignore: cast_nullable_to_non_nullable
                  as FollowingPaginationStatus,
      ),
    );
  }

  /// Create a copy of FollowingVodSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $FollowingVodCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FollowingVodSectionData].
extension FollowingVodSectionDataPatterns on FollowingVodSectionData {
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
    TResult Function(_FollowingVodSectionData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingVodSectionData() when $default != null:
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
    TResult Function(_FollowingVodSectionData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodSectionData():
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
    TResult? Function(_FollowingVodSectionData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodSectionData() when $default != null:
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
      FollowingLoadStatus status,
      List<Vod> items,
      FollowingVodCursor? cursor,
      FollowingPaginationStatus paginationStatus,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingVodSectionData() when $default != null:
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
      FollowingLoadStatus status,
      List<Vod> items,
      FollowingVodCursor? cursor,
      FollowingPaginationStatus paginationStatus,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodSectionData():
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
      FollowingLoadStatus status,
      List<Vod> items,
      FollowingVodCursor? cursor,
      FollowingPaginationStatus paginationStatus,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingVodSectionData() when $default != null:
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

class _FollowingVodSectionData extends FollowingVodSectionData {
  const _FollowingVodSectionData({
    required this.status,
    required final List<Vod> items,
    this.cursor,
    required this.paginationStatus,
  }) : _items = items,
       super._();

  @override
  final FollowingLoadStatus status;
  final List<Vod> _items;
  @override
  List<Vod> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final FollowingVodCursor? cursor;
  @override
  final FollowingPaginationStatus paginationStatus;

  /// Create a copy of FollowingVodSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingVodSectionDataCopyWith<_FollowingVodSectionData> get copyWith =>
      __$FollowingVodSectionDataCopyWithImpl<_FollowingVodSectionData>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingVodSectionData &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_items),
    cursor,
    paginationStatus,
  );

  @override
  String toString() {
    return 'FollowingVodSectionData(status: $status, items: $items, cursor: $cursor, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class _$FollowingVodSectionDataCopyWith<$Res>
    implements $FollowingVodSectionDataCopyWith<$Res> {
  factory _$FollowingVodSectionDataCopyWith(
    _FollowingVodSectionData value,
    $Res Function(_FollowingVodSectionData) _then,
  ) = __$FollowingVodSectionDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    FollowingLoadStatus status,
    List<Vod> items,
    FollowingVodCursor? cursor,
    FollowingPaginationStatus paginationStatus,
  });

  @override
  $FollowingVodCursorCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$FollowingVodSectionDataCopyWithImpl<$Res>
    implements _$FollowingVodSectionDataCopyWith<$Res> {
  __$FollowingVodSectionDataCopyWithImpl(this._self, this._then);

  final _FollowingVodSectionData _self;
  final $Res Function(_FollowingVodSectionData) _then;

  /// Create a copy of FollowingVodSectionData
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
      _FollowingVodSectionData(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FollowingLoadStatus,
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<Vod>,
        cursor: freezed == cursor
            ? _self.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as FollowingVodCursor?,
        paginationStatus: null == paginationStatus
            ? _self.paginationStatus
            : paginationStatus // ignore: cast_nullable_to_non_nullable
                  as FollowingPaginationStatus,
      ),
    );
  }

  /// Create a copy of FollowingVodSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodCursorCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
      return null;
    }

    return $FollowingVodCursorCopyWith<$Res>(_self.cursor!, (value) {
      return _then(_self.copyWith(cursor: value));
    });
  }
}

/// @nodoc
mixin _$FollowingChannelModalState {
  FollowingChannel get channel;
  int get index;
  FollowingChannelModalView get view;
  List<GroupItem> get groups;

  /// Create a copy of FollowingChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingChannelModalStateCopyWith<FollowingChannelModalState>
  get copyWith =>
      _$FollowingChannelModalStateCopyWithImpl<FollowingChannelModalState>(
        this as FollowingChannelModalState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingChannelModalState &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.view, view) || other.view == view) &&
            const DeepCollectionEquality().equals(other.groups, groups));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channel,
    index,
    view,
    const DeepCollectionEquality().hash(groups),
  );

  @override
  String toString() {
    return 'FollowingChannelModalState(channel: $channel, index: $index, view: $view, groups: $groups)';
  }
}

/// @nodoc
abstract mixin class $FollowingChannelModalStateCopyWith<$Res> {
  factory $FollowingChannelModalStateCopyWith(
    FollowingChannelModalState value,
    $Res Function(FollowingChannelModalState) _then,
  ) = _$FollowingChannelModalStateCopyWithImpl;
  @useResult
  $Res call({
    FollowingChannel channel,
    int index,
    FollowingChannelModalView view,
    List<GroupItem> groups,
  });

  $FollowingChannelCopyWith<$Res> get channel;
}

/// @nodoc
class _$FollowingChannelModalStateCopyWithImpl<$Res>
    implements $FollowingChannelModalStateCopyWith<$Res> {
  _$FollowingChannelModalStateCopyWithImpl(this._self, this._then);

  final FollowingChannelModalState _self;
  final $Res Function(FollowingChannelModalState) _then;

  /// Create a copy of FollowingChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? index = null,
    Object? view = null,
    Object? groups = null,
  }) {
    return _then(
      _self.copyWith(
        channel: null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingChannel,
        index: null == index
            ? _self.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        view: null == view
            ? _self.view
            : view // ignore: cast_nullable_to_non_nullable
                  as FollowingChannelModalView,
        groups: null == groups
            ? _self.groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<GroupItem>,
      ),
    );
  }

  /// Create a copy of FollowingChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelCopyWith<$Res> get channel {
    return $FollowingChannelCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FollowingChannelModalState].
extension FollowingChannelModalStatePatterns on FollowingChannelModalState {
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
    TResult Function(_FollowingChannelModalState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelModalState() when $default != null:
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
    TResult Function(_FollowingChannelModalState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelModalState():
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
    TResult? Function(_FollowingChannelModalState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelModalState() when $default != null:
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
      FollowingChannel channel,
      int index,
      FollowingChannelModalView view,
      List<GroupItem> groups,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelModalState() when $default != null:
        return $default(_that.channel, _that.index, _that.view, _that.groups);
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
      FollowingChannel channel,
      int index,
      FollowingChannelModalView view,
      List<GroupItem> groups,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelModalState():
        return $default(_that.channel, _that.index, _that.view, _that.groups);
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
      FollowingChannel channel,
      int index,
      FollowingChannelModalView view,
      List<GroupItem> groups,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelModalState() when $default != null:
        return $default(_that.channel, _that.index, _that.view, _that.groups);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowingChannelModalState implements FollowingChannelModalState {
  const _FollowingChannelModalState({
    required this.channel,
    required this.index,
    this.view = FollowingChannelModalView.actions,
    final List<GroupItem> groups = const <GroupItem>[],
  }) : _groups = groups;

  @override
  final FollowingChannel channel;
  @override
  final int index;
  @override
  @JsonKey()
  final FollowingChannelModalView view;
  final List<GroupItem> _groups;
  @override
  @JsonKey()
  List<GroupItem> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  /// Create a copy of FollowingChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingChannelModalStateCopyWith<_FollowingChannelModalState>
  get copyWith =>
      __$FollowingChannelModalStateCopyWithImpl<_FollowingChannelModalState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingChannelModalState &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.view, view) || other.view == view) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channel,
    index,
    view,
    const DeepCollectionEquality().hash(_groups),
  );

  @override
  String toString() {
    return 'FollowingChannelModalState(channel: $channel, index: $index, view: $view, groups: $groups)';
  }
}

/// @nodoc
abstract mixin class _$FollowingChannelModalStateCopyWith<$Res>
    implements $FollowingChannelModalStateCopyWith<$Res> {
  factory _$FollowingChannelModalStateCopyWith(
    _FollowingChannelModalState value,
    $Res Function(_FollowingChannelModalState) _then,
  ) = __$FollowingChannelModalStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    FollowingChannel channel,
    int index,
    FollowingChannelModalView view,
    List<GroupItem> groups,
  });

  @override
  $FollowingChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$FollowingChannelModalStateCopyWithImpl<$Res>
    implements _$FollowingChannelModalStateCopyWith<$Res> {
  __$FollowingChannelModalStateCopyWithImpl(this._self, this._then);

  final _FollowingChannelModalState _self;
  final $Res Function(_FollowingChannelModalState) _then;

  /// Create a copy of FollowingChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channel = null,
    Object? index = null,
    Object? view = null,
    Object? groups = null,
  }) {
    return _then(
      _FollowingChannelModalState(
        channel: null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingChannel,
        index: null == index
            ? _self.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        view: null == view
            ? _self.view
            : view // ignore: cast_nullable_to_non_nullable
                  as FollowingChannelModalView,
        groups: null == groups
            ? _self._groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<GroupItem>,
      ),
    );
  }

  /// Create a copy of FollowingChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelCopyWith<$Res> get channel {
    return $FollowingChannelCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}
