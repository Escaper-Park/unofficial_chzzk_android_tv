// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChannelEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChannelEvent()';
  }
}

/// @nodoc
class $ChannelEventCopyWith<$Res> {
  $ChannelEventCopyWith(ChannelEvent _, $Res Function(ChannelEvent) __);
}

/// Adds pattern-matching-related methods to [ChannelEvent].
extension ChannelEventPatterns on ChannelEvent {
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
    TResult Function(_VodSortSelected value)? vodSortSelected,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_LoadMoreRequested value)? loadMoreRequested,
    TResult Function(_FollowRequested value)? followRequested,
    TResult Function(_UnfollowRequested value)? unfollowRequested,
    TResult Function(_GroupPanelRequested value)? groupPanelRequested,
    TResult Function(_GroupPanelDismissed value)? groupPanelDismissed,
    TResult Function(_GroupAddRequested value)? groupAddRequested,
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
      case _VodSortSelected() when vodSortSelected != null:
        return vodSortSelected(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
      case _FollowRequested() when followRequested != null:
        return followRequested(_that);
      case _UnfollowRequested() when unfollowRequested != null:
        return unfollowRequested(_that);
      case _GroupPanelRequested() when groupPanelRequested != null:
        return groupPanelRequested(_that);
      case _GroupPanelDismissed() when groupPanelDismissed != null:
        return groupPanelDismissed(_that);
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that);
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
    required TResult Function(_VodSortSelected value) vodSortSelected,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_LoadMoreRequested value) loadMoreRequested,
    required TResult Function(_FollowRequested value) followRequested,
    required TResult Function(_UnfollowRequested value) unfollowRequested,
    required TResult Function(_GroupPanelRequested value) groupPanelRequested,
    required TResult Function(_GroupPanelDismissed value) groupPanelDismissed,
    required TResult Function(_GroupAddRequested value) groupAddRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _AuthStateChanged():
        return authStateChanged(_that);
      case _TabSelected():
        return tabSelected(_that);
      case _VodSortSelected():
        return vodSortSelected(_that);
      case _RetryRequested():
        return retryRequested(_that);
      case _LoadMoreRequested():
        return loadMoreRequested(_that);
      case _FollowRequested():
        return followRequested(_that);
      case _UnfollowRequested():
        return unfollowRequested(_that);
      case _GroupPanelRequested():
        return groupPanelRequested(_that);
      case _GroupPanelDismissed():
        return groupPanelDismissed(_that);
      case _GroupAddRequested():
        return groupAddRequested(_that);
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
    TResult? Function(_VodSortSelected value)? vodSortSelected,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(_FollowRequested value)? followRequested,
    TResult? Function(_UnfollowRequested value)? unfollowRequested,
    TResult? Function(_GroupPanelRequested value)? groupPanelRequested,
    TResult? Function(_GroupPanelDismissed value)? groupPanelDismissed,
    TResult? Function(_GroupAddRequested value)? groupAddRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that);
      case _VodSortSelected() when vodSortSelected != null:
        return vodSortSelected(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested(_that);
      case _FollowRequested() when followRequested != null:
        return followRequested(_that);
      case _UnfollowRequested() when unfollowRequested != null:
        return unfollowRequested(_that);
      case _GroupPanelRequested() when groupPanelRequested != null:
        return groupPanelRequested(_that);
      case _GroupPanelDismissed() when groupPanelDismissed != null:
        return groupPanelDismissed(_that);
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that);
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
    TResult Function(bool isSignedIn)? authStateChanged,
    TResult Function(ChannelTab tab)? tabSelected,
    TResult Function(ChannelVodSortOption option)? vodSortSelected,
    TResult Function()? retryRequested,
    TResult Function()? loadMoreRequested,
    TResult Function()? followRequested,
    TResult Function()? unfollowRequested,
    TResult Function()? groupPanelRequested,
    TResult Function()? groupPanelDismissed,
    TResult Function(GroupItem group)? groupAddRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that.isSignedIn);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _VodSortSelected() when vodSortSelected != null:
        return vodSortSelected(_that.option);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
      case _FollowRequested() when followRequested != null:
        return followRequested();
      case _UnfollowRequested() when unfollowRequested != null:
        return unfollowRequested();
      case _GroupPanelRequested() when groupPanelRequested != null:
        return groupPanelRequested();
      case _GroupPanelDismissed() when groupPanelDismissed != null:
        return groupPanelDismissed();
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that.group);
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
    required TResult Function(bool isSignedIn) authStateChanged,
    required TResult Function(ChannelTab tab) tabSelected,
    required TResult Function(ChannelVodSortOption option) vodSortSelected,
    required TResult Function() retryRequested,
    required TResult Function() loadMoreRequested,
    required TResult Function() followRequested,
    required TResult Function() unfollowRequested,
    required TResult Function() groupPanelRequested,
    required TResult Function() groupPanelDismissed,
    required TResult Function(GroupItem group) groupAddRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _AuthStateChanged():
        return authStateChanged(_that.isSignedIn);
      case _TabSelected():
        return tabSelected(_that.tab);
      case _VodSortSelected():
        return vodSortSelected(_that.option);
      case _RetryRequested():
        return retryRequested();
      case _LoadMoreRequested():
        return loadMoreRequested();
      case _FollowRequested():
        return followRequested();
      case _UnfollowRequested():
        return unfollowRequested();
      case _GroupPanelRequested():
        return groupPanelRequested();
      case _GroupPanelDismissed():
        return groupPanelDismissed();
      case _GroupAddRequested():
        return groupAddRequested(_that.group);
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
    TResult? Function(bool isSignedIn)? authStateChanged,
    TResult? Function(ChannelTab tab)? tabSelected,
    TResult? Function(ChannelVodSortOption option)? vodSortSelected,
    TResult? Function()? retryRequested,
    TResult? Function()? loadMoreRequested,
    TResult? Function()? followRequested,
    TResult? Function()? unfollowRequested,
    TResult? Function()? groupPanelRequested,
    TResult? Function()? groupPanelDismissed,
    TResult? Function(GroupItem group)? groupAddRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _AuthStateChanged() when authStateChanged != null:
        return authStateChanged(_that.isSignedIn);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _VodSortSelected() when vodSortSelected != null:
        return vodSortSelected(_that.option);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _LoadMoreRequested() when loadMoreRequested != null:
        return loadMoreRequested();
      case _FollowRequested() when followRequested != null:
        return followRequested();
      case _UnfollowRequested() when unfollowRequested != null:
        return unfollowRequested();
      case _GroupPanelRequested() when groupPanelRequested != null:
        return groupPanelRequested();
      case _GroupPanelDismissed() when groupPanelDismissed != null:
        return groupPanelDismissed();
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that.group);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements ChannelEvent {
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
    return 'ChannelEvent.started()';
  }
}

/// @nodoc

class _AuthStateChanged implements ChannelEvent {
  const _AuthStateChanged({required this.isSignedIn});

  final bool isSignedIn;

  /// Create a copy of ChannelEvent
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
    return 'ChannelEvent.authStateChanged(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateChangedCopyWith<$Res>
    implements $ChannelEventCopyWith<$Res> {
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

  /// Create a copy of ChannelEvent
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

class _TabSelected implements ChannelEvent {
  const _TabSelected(this.tab);

  final ChannelTab tab;

  /// Create a copy of ChannelEvent
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
    return 'ChannelEvent.tabSelected(tab: $tab)';
  }
}

/// @nodoc
abstract mixin class _$TabSelectedCopyWith<$Res>
    implements $ChannelEventCopyWith<$Res> {
  factory _$TabSelectedCopyWith(
    _TabSelected value,
    $Res Function(_TabSelected) _then,
  ) = __$TabSelectedCopyWithImpl;
  @useResult
  $Res call({ChannelTab tab});
}

/// @nodoc
class __$TabSelectedCopyWithImpl<$Res> implements _$TabSelectedCopyWith<$Res> {
  __$TabSelectedCopyWithImpl(this._self, this._then);

  final _TabSelected _self;
  final $Res Function(_TabSelected) _then;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? tab = null}) {
    return _then(
      _TabSelected(
        null == tab
            ? _self.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as ChannelTab,
      ),
    );
  }
}

/// @nodoc

class _VodSortSelected implements ChannelEvent {
  const _VodSortSelected(this.option);

  final ChannelVodSortOption option;

  /// Create a copy of ChannelEvent
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
    return 'ChannelEvent.vodSortSelected(option: $option)';
  }
}

/// @nodoc
abstract mixin class _$VodSortSelectedCopyWith<$Res>
    implements $ChannelEventCopyWith<$Res> {
  factory _$VodSortSelectedCopyWith(
    _VodSortSelected value,
    $Res Function(_VodSortSelected) _then,
  ) = __$VodSortSelectedCopyWithImpl;
  @useResult
  $Res call({ChannelVodSortOption option});
}

/// @nodoc
class __$VodSortSelectedCopyWithImpl<$Res>
    implements _$VodSortSelectedCopyWith<$Res> {
  __$VodSortSelectedCopyWithImpl(this._self, this._then);

  final _VodSortSelected _self;
  final $Res Function(_VodSortSelected) _then;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? option = null}) {
    return _then(
      _VodSortSelected(
        null == option
            ? _self.option
            : option // ignore: cast_nullable_to_non_nullable
                  as ChannelVodSortOption,
      ),
    );
  }
}

/// @nodoc

class _RetryRequested implements ChannelEvent {
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
    return 'ChannelEvent.retryRequested()';
  }
}

/// @nodoc

class _LoadMoreRequested implements ChannelEvent {
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
    return 'ChannelEvent.loadMoreRequested()';
  }
}

/// @nodoc

class _FollowRequested implements ChannelEvent {
  const _FollowRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FollowRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChannelEvent.followRequested()';
  }
}

/// @nodoc

class _UnfollowRequested implements ChannelEvent {
  const _UnfollowRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UnfollowRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChannelEvent.unfollowRequested()';
  }
}

/// @nodoc

class _GroupPanelRequested implements ChannelEvent {
  const _GroupPanelRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GroupPanelRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChannelEvent.groupPanelRequested()';
  }
}

/// @nodoc

class _GroupPanelDismissed implements ChannelEvent {
  const _GroupPanelDismissed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GroupPanelDismissed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChannelEvent.groupPanelDismissed()';
  }
}

/// @nodoc

class _GroupAddRequested implements ChannelEvent {
  const _GroupAddRequested(this.group);

  final GroupItem group;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupAddRequestedCopyWith<_GroupAddRequested> get copyWith =>
      __$GroupAddRequestedCopyWithImpl<_GroupAddRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupAddRequested &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  @override
  String toString() {
    return 'ChannelEvent.groupAddRequested(group: $group)';
  }
}

/// @nodoc
abstract mixin class _$GroupAddRequestedCopyWith<$Res>
    implements $ChannelEventCopyWith<$Res> {
  factory _$GroupAddRequestedCopyWith(
    _GroupAddRequested value,
    $Res Function(_GroupAddRequested) _then,
  ) = __$GroupAddRequestedCopyWithImpl;
  @useResult
  $Res call({GroupItem group});

  $GroupItemCopyWith<$Res> get group;
}

/// @nodoc
class __$GroupAddRequestedCopyWithImpl<$Res>
    implements _$GroupAddRequestedCopyWith<$Res> {
  __$GroupAddRequestedCopyWithImpl(this._self, this._then);

  final _GroupAddRequested _self;
  final $Res Function(_GroupAddRequested) _then;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? group = null}) {
    return _then(
      _GroupAddRequested(
        null == group
            ? _self.group
            : group // ignore: cast_nullable_to_non_nullable
                  as GroupItem,
      ),
    );
  }

  /// Create a copy of ChannelEvent
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
mixin _$ChannelState {
  String get channelId;
  bool get isSignedIn;
  ChannelTab get selectedTab;
  ChannelLoadStatus get profileStatus;
  ChannelDetail? get profile;
  ChannelMyInfo? get myInfo;
  ChannelLoadStatus get homeStatus;
  Live? get live;
  List<Vod> get latestVods;
  ChannelVodSortOption get vodSortOption;
  ChannelPageData<Vod> get vod;
  ChannelGroupPanelState? get groupPanel;
  ChannelFeedbackType? get feedbackType;
  int get feedbackSerial;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelStateCopyWith<ChannelState> get copyWith =>
      _$ChannelStateCopyWithImpl<ChannelState>(
        this as ChannelState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelState &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.myInfo, myInfo) || other.myInfo == myInfo) &&
            (identical(other.homeStatus, homeStatus) ||
                other.homeStatus == homeStatus) &&
            (identical(other.live, live) || other.live == live) &&
            const DeepCollectionEquality().equals(
              other.latestVods,
              latestVods,
            ) &&
            (identical(other.vodSortOption, vodSortOption) ||
                other.vodSortOption == vodSortOption) &&
            (identical(other.vod, vod) || other.vod == vod) &&
            (identical(other.groupPanel, groupPanel) ||
                other.groupPanel == groupPanel) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    isSignedIn,
    selectedTab,
    profileStatus,
    profile,
    myInfo,
    homeStatus,
    live,
    const DeepCollectionEquality().hash(latestVods),
    vodSortOption,
    vod,
    groupPanel,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'ChannelState(channelId: $channelId, isSignedIn: $isSignedIn, selectedTab: $selectedTab, profileStatus: $profileStatus, profile: $profile, myInfo: $myInfo, homeStatus: $homeStatus, live: $live, latestVods: $latestVods, vodSortOption: $vodSortOption, vod: $vod, groupPanel: $groupPanel, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class $ChannelStateCopyWith<$Res> {
  factory $ChannelStateCopyWith(
    ChannelState value,
    $Res Function(ChannelState) _then,
  ) = _$ChannelStateCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    bool isSignedIn,
    ChannelTab selectedTab,
    ChannelLoadStatus profileStatus,
    ChannelDetail? profile,
    ChannelMyInfo? myInfo,
    ChannelLoadStatus homeStatus,
    Live? live,
    List<Vod> latestVods,
    ChannelVodSortOption vodSortOption,
    ChannelPageData<Vod> vod,
    ChannelGroupPanelState? groupPanel,
    ChannelFeedbackType? feedbackType,
    int feedbackSerial,
  });

  $ChannelDetailCopyWith<$Res>? get profile;
  $ChannelMyInfoCopyWith<$Res>? get myInfo;
  $LiveCopyWith<$Res>? get live;
  $ChannelPageDataCopyWith<Vod, $Res> get vod;
  $ChannelGroupPanelStateCopyWith<$Res>? get groupPanel;
}

/// @nodoc
class _$ChannelStateCopyWithImpl<$Res> implements $ChannelStateCopyWith<$Res> {
  _$ChannelStateCopyWithImpl(this._self, this._then);

  final ChannelState _self;
  final $Res Function(ChannelState) _then;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? isSignedIn = null,
    Object? selectedTab = null,
    Object? profileStatus = null,
    Object? profile = freezed,
    Object? myInfo = freezed,
    Object? homeStatus = null,
    Object? live = freezed,
    Object? latestVods = null,
    Object? vodSortOption = null,
    Object? vod = null,
    Object? groupPanel = freezed,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _self.copyWith(
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as ChannelTab,
        profileStatus: null == profileStatus
            ? _self.profileStatus
            : profileStatus // ignore: cast_nullable_to_non_nullable
                  as ChannelLoadStatus,
        profile: freezed == profile
            ? _self.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as ChannelDetail?,
        myInfo: freezed == myInfo
            ? _self.myInfo
            : myInfo // ignore: cast_nullable_to_non_nullable
                  as ChannelMyInfo?,
        homeStatus: null == homeStatus
            ? _self.homeStatus
            : homeStatus // ignore: cast_nullable_to_non_nullable
                  as ChannelLoadStatus,
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as Live?,
        latestVods: null == latestVods
            ? _self.latestVods
            : latestVods // ignore: cast_nullable_to_non_nullable
                  as List<Vod>,
        vodSortOption: null == vodSortOption
            ? _self.vodSortOption
            : vodSortOption // ignore: cast_nullable_to_non_nullable
                  as ChannelVodSortOption,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as ChannelPageData<Vod>,
        groupPanel: freezed == groupPanel
            ? _self.groupPanel
            : groupPanel // ignore: cast_nullable_to_non_nullable
                  as ChannelGroupPanelState?,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as ChannelFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelDetailCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ChannelDetailCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelMyInfoCopyWith<$Res>? get myInfo {
    if (_self.myInfo == null) {
      return null;
    }

    return $ChannelMyInfoCopyWith<$Res>(_self.myInfo!, (value) {
      return _then(_self.copyWith(myInfo: value));
    });
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $LiveCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPageDataCopyWith<Vod, $Res> get vod {
    return $ChannelPageDataCopyWith<Vod, $Res>(_self.vod, (value) {
      return _then(_self.copyWith(vod: value));
    });
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelGroupPanelStateCopyWith<$Res>? get groupPanel {
    if (_self.groupPanel == null) {
      return null;
    }

    return $ChannelGroupPanelStateCopyWith<$Res>(_self.groupPanel!, (value) {
      return _then(_self.copyWith(groupPanel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChannelState].
extension ChannelStatePatterns on ChannelState {
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
    TResult Function(_ChannelState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelState() when $default != null:
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
    TResult Function(_ChannelState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelState():
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
    TResult? Function(_ChannelState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelState() when $default != null:
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
      String channelId,
      bool isSignedIn,
      ChannelTab selectedTab,
      ChannelLoadStatus profileStatus,
      ChannelDetail? profile,
      ChannelMyInfo? myInfo,
      ChannelLoadStatus homeStatus,
      Live? live,
      List<Vod> latestVods,
      ChannelVodSortOption vodSortOption,
      ChannelPageData<Vod> vod,
      ChannelGroupPanelState? groupPanel,
      ChannelFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelState() when $default != null:
        return $default(
          _that.channelId,
          _that.isSignedIn,
          _that.selectedTab,
          _that.profileStatus,
          _that.profile,
          _that.myInfo,
          _that.homeStatus,
          _that.live,
          _that.latestVods,
          _that.vodSortOption,
          _that.vod,
          _that.groupPanel,
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
      String channelId,
      bool isSignedIn,
      ChannelTab selectedTab,
      ChannelLoadStatus profileStatus,
      ChannelDetail? profile,
      ChannelMyInfo? myInfo,
      ChannelLoadStatus homeStatus,
      Live? live,
      List<Vod> latestVods,
      ChannelVodSortOption vodSortOption,
      ChannelPageData<Vod> vod,
      ChannelGroupPanelState? groupPanel,
      ChannelFeedbackType? feedbackType,
      int feedbackSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelState():
        return $default(
          _that.channelId,
          _that.isSignedIn,
          _that.selectedTab,
          _that.profileStatus,
          _that.profile,
          _that.myInfo,
          _that.homeStatus,
          _that.live,
          _that.latestVods,
          _that.vodSortOption,
          _that.vod,
          _that.groupPanel,
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
      String channelId,
      bool isSignedIn,
      ChannelTab selectedTab,
      ChannelLoadStatus profileStatus,
      ChannelDetail? profile,
      ChannelMyInfo? myInfo,
      ChannelLoadStatus homeStatus,
      Live? live,
      List<Vod> latestVods,
      ChannelVodSortOption vodSortOption,
      ChannelPageData<Vod> vod,
      ChannelGroupPanelState? groupPanel,
      ChannelFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelState() when $default != null:
        return $default(
          _that.channelId,
          _that.isSignedIn,
          _that.selectedTab,
          _that.profileStatus,
          _that.profile,
          _that.myInfo,
          _that.homeStatus,
          _that.live,
          _that.latestVods,
          _that.vodSortOption,
          _that.vod,
          _that.groupPanel,
          _that.feedbackType,
          _that.feedbackSerial,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChannelState extends ChannelState {
  const _ChannelState({
    required this.channelId,
    required this.isSignedIn,
    required this.selectedTab,
    required this.profileStatus,
    this.profile,
    this.myInfo,
    required this.homeStatus,
    this.live,
    final List<Vod> latestVods = const <Vod>[],
    required this.vodSortOption,
    required this.vod,
    this.groupPanel,
    this.feedbackType,
    this.feedbackSerial = 0,
  }) : _latestVods = latestVods,
       super._();

  @override
  final String channelId;
  @override
  final bool isSignedIn;
  @override
  final ChannelTab selectedTab;
  @override
  final ChannelLoadStatus profileStatus;
  @override
  final ChannelDetail? profile;
  @override
  final ChannelMyInfo? myInfo;
  @override
  final ChannelLoadStatus homeStatus;
  @override
  final Live? live;
  final List<Vod> _latestVods;
  @override
  @JsonKey()
  List<Vod> get latestVods {
    if (_latestVods is EqualUnmodifiableListView) return _latestVods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestVods);
  }

  @override
  final ChannelVodSortOption vodSortOption;
  @override
  final ChannelPageData<Vod> vod;
  @override
  final ChannelGroupPanelState? groupPanel;
  @override
  final ChannelFeedbackType? feedbackType;
  @override
  @JsonKey()
  final int feedbackSerial;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelStateCopyWith<_ChannelState> get copyWith =>
      __$ChannelStateCopyWithImpl<_ChannelState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelState &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.myInfo, myInfo) || other.myInfo == myInfo) &&
            (identical(other.homeStatus, homeStatus) ||
                other.homeStatus == homeStatus) &&
            (identical(other.live, live) || other.live == live) &&
            const DeepCollectionEquality().equals(
              other._latestVods,
              _latestVods,
            ) &&
            (identical(other.vodSortOption, vodSortOption) ||
                other.vodSortOption == vodSortOption) &&
            (identical(other.vod, vod) || other.vod == vod) &&
            (identical(other.groupPanel, groupPanel) ||
                other.groupPanel == groupPanel) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    isSignedIn,
    selectedTab,
    profileStatus,
    profile,
    myInfo,
    homeStatus,
    live,
    const DeepCollectionEquality().hash(_latestVods),
    vodSortOption,
    vod,
    groupPanel,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'ChannelState(channelId: $channelId, isSignedIn: $isSignedIn, selectedTab: $selectedTab, profileStatus: $profileStatus, profile: $profile, myInfo: $myInfo, homeStatus: $homeStatus, live: $live, latestVods: $latestVods, vodSortOption: $vodSortOption, vod: $vod, groupPanel: $groupPanel, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class _$ChannelStateCopyWith<$Res>
    implements $ChannelStateCopyWith<$Res> {
  factory _$ChannelStateCopyWith(
    _ChannelState value,
    $Res Function(_ChannelState) _then,
  ) = __$ChannelStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    bool isSignedIn,
    ChannelTab selectedTab,
    ChannelLoadStatus profileStatus,
    ChannelDetail? profile,
    ChannelMyInfo? myInfo,
    ChannelLoadStatus homeStatus,
    Live? live,
    List<Vod> latestVods,
    ChannelVodSortOption vodSortOption,
    ChannelPageData<Vod> vod,
    ChannelGroupPanelState? groupPanel,
    ChannelFeedbackType? feedbackType,
    int feedbackSerial,
  });

  @override
  $ChannelDetailCopyWith<$Res>? get profile;
  @override
  $ChannelMyInfoCopyWith<$Res>? get myInfo;
  @override
  $LiveCopyWith<$Res>? get live;
  @override
  $ChannelPageDataCopyWith<Vod, $Res> get vod;
  @override
  $ChannelGroupPanelStateCopyWith<$Res>? get groupPanel;
}

/// @nodoc
class __$ChannelStateCopyWithImpl<$Res>
    implements _$ChannelStateCopyWith<$Res> {
  __$ChannelStateCopyWithImpl(this._self, this._then);

  final _ChannelState _self;
  final $Res Function(_ChannelState) _then;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? isSignedIn = null,
    Object? selectedTab = null,
    Object? profileStatus = null,
    Object? profile = freezed,
    Object? myInfo = freezed,
    Object? homeStatus = null,
    Object? live = freezed,
    Object? latestVods = null,
    Object? vodSortOption = null,
    Object? vod = null,
    Object? groupPanel = freezed,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _ChannelState(
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as ChannelTab,
        profileStatus: null == profileStatus
            ? _self.profileStatus
            : profileStatus // ignore: cast_nullable_to_non_nullable
                  as ChannelLoadStatus,
        profile: freezed == profile
            ? _self.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as ChannelDetail?,
        myInfo: freezed == myInfo
            ? _self.myInfo
            : myInfo // ignore: cast_nullable_to_non_nullable
                  as ChannelMyInfo?,
        homeStatus: null == homeStatus
            ? _self.homeStatus
            : homeStatus // ignore: cast_nullable_to_non_nullable
                  as ChannelLoadStatus,
        live: freezed == live
            ? _self.live
            : live // ignore: cast_nullable_to_non_nullable
                  as Live?,
        latestVods: null == latestVods
            ? _self._latestVods
            : latestVods // ignore: cast_nullable_to_non_nullable
                  as List<Vod>,
        vodSortOption: null == vodSortOption
            ? _self.vodSortOption
            : vodSortOption // ignore: cast_nullable_to_non_nullable
                  as ChannelVodSortOption,
        vod: null == vod
            ? _self.vod
            : vod // ignore: cast_nullable_to_non_nullable
                  as ChannelPageData<Vod>,
        groupPanel: freezed == groupPanel
            ? _self.groupPanel
            : groupPanel // ignore: cast_nullable_to_non_nullable
                  as ChannelGroupPanelState?,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as ChannelFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelDetailCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ChannelDetailCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelMyInfoCopyWith<$Res>? get myInfo {
    if (_self.myInfo == null) {
      return null;
    }

    return $ChannelMyInfoCopyWith<$Res>(_self.myInfo!, (value) {
      return _then(_self.copyWith(myInfo: value));
    });
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveCopyWith<$Res>? get live {
    if (_self.live == null) {
      return null;
    }

    return $LiveCopyWith<$Res>(_self.live!, (value) {
      return _then(_self.copyWith(live: value));
    });
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPageDataCopyWith<Vod, $Res> get vod {
    return $ChannelPageDataCopyWith<Vod, $Res>(_self.vod, (value) {
      return _then(_self.copyWith(vod: value));
    });
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelGroupPanelStateCopyWith<$Res>? get groupPanel {
    if (_self.groupPanel == null) {
      return null;
    }

    return $ChannelGroupPanelStateCopyWith<$Res>(_self.groupPanel!, (value) {
      return _then(_self.copyWith(groupPanel: value));
    });
  }
}

/// @nodoc
mixin _$ChannelPageData<T> {
  ChannelLoadStatus get status;
  List<T> get items;
  int? get nextPage;
  ChannelPaginationStatus get paginationStatus;

  /// Create a copy of ChannelPageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelPageDataCopyWith<T, ChannelPageData<T>> get copyWith =>
      _$ChannelPageDataCopyWithImpl<T, ChannelPageData<T>>(
        this as ChannelPageData<T>,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelPageData<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(items),
    nextPage,
    paginationStatus,
  );

  @override
  String toString() {
    return 'ChannelPageData<$T>(status: $status, items: $items, nextPage: $nextPage, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class $ChannelPageDataCopyWith<T, $Res> {
  factory $ChannelPageDataCopyWith(
    ChannelPageData<T> value,
    $Res Function(ChannelPageData<T>) _then,
  ) = _$ChannelPageDataCopyWithImpl;
  @useResult
  $Res call({
    ChannelLoadStatus status,
    List<T> items,
    int? nextPage,
    ChannelPaginationStatus paginationStatus,
  });
}

/// @nodoc
class _$ChannelPageDataCopyWithImpl<T, $Res>
    implements $ChannelPageDataCopyWith<T, $Res> {
  _$ChannelPageDataCopyWithImpl(this._self, this._then);

  final ChannelPageData<T> _self;
  final $Res Function(ChannelPageData<T>) _then;

  /// Create a copy of ChannelPageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? nextPage = freezed,
    Object? paginationStatus = null,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ChannelLoadStatus,
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        nextPage: freezed == nextPage
            ? _self.nextPage
            : nextPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        paginationStatus: null == paginationStatus
            ? _self.paginationStatus
            : paginationStatus // ignore: cast_nullable_to_non_nullable
                  as ChannelPaginationStatus,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ChannelPageData].
extension ChannelPageDataPatterns<T> on ChannelPageData<T> {
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
    TResult Function(_ChannelPageData<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelPageData() when $default != null:
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
    TResult Function(_ChannelPageData<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPageData():
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
    TResult? Function(_ChannelPageData<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPageData() when $default != null:
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
      ChannelLoadStatus status,
      List<T> items,
      int? nextPage,
      ChannelPaginationStatus paginationStatus,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelPageData() when $default != null:
        return $default(
          _that.status,
          _that.items,
          _that.nextPage,
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
      ChannelLoadStatus status,
      List<T> items,
      int? nextPage,
      ChannelPaginationStatus paginationStatus,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPageData():
        return $default(
          _that.status,
          _that.items,
          _that.nextPage,
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
      ChannelLoadStatus status,
      List<T> items,
      int? nextPage,
      ChannelPaginationStatus paginationStatus,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPageData() when $default != null:
        return $default(
          _that.status,
          _that.items,
          _that.nextPage,
          _that.paginationStatus,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChannelPageData<T> extends ChannelPageData<T> {
  const _ChannelPageData({
    required this.status,
    required final List<T> items,
    this.nextPage,
    required this.paginationStatus,
  }) : _items = items,
       super._();

  @override
  final ChannelLoadStatus status;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int? nextPage;
  @override
  final ChannelPaginationStatus paginationStatus;

  /// Create a copy of ChannelPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelPageDataCopyWith<T, _ChannelPageData<T>> get copyWith =>
      __$ChannelPageDataCopyWithImpl<T, _ChannelPageData<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelPageData<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_items),
    nextPage,
    paginationStatus,
  );

  @override
  String toString() {
    return 'ChannelPageData<$T>(status: $status, items: $items, nextPage: $nextPage, paginationStatus: $paginationStatus)';
  }
}

/// @nodoc
abstract mixin class _$ChannelPageDataCopyWith<T, $Res>
    implements $ChannelPageDataCopyWith<T, $Res> {
  factory _$ChannelPageDataCopyWith(
    _ChannelPageData<T> value,
    $Res Function(_ChannelPageData<T>) _then,
  ) = __$ChannelPageDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    ChannelLoadStatus status,
    List<T> items,
    int? nextPage,
    ChannelPaginationStatus paginationStatus,
  });
}

/// @nodoc
class __$ChannelPageDataCopyWithImpl<T, $Res>
    implements _$ChannelPageDataCopyWith<T, $Res> {
  __$ChannelPageDataCopyWithImpl(this._self, this._then);

  final _ChannelPageData<T> _self;
  final $Res Function(_ChannelPageData<T>) _then;

  /// Create a copy of ChannelPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? nextPage = freezed,
    Object? paginationStatus = null,
  }) {
    return _then(
      _ChannelPageData<T>(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ChannelLoadStatus,
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        nextPage: freezed == nextPage
            ? _self.nextPage
            : nextPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        paginationStatus: null == paginationStatus
            ? _self.paginationStatus
            : paginationStatus // ignore: cast_nullable_to_non_nullable
                  as ChannelPaginationStatus,
      ),
    );
  }
}

/// @nodoc
mixin _$ChannelGroupPanelState {
  ChannelGroupPanelStatus get status;
  List<GroupItem> get groups;

  /// Create a copy of ChannelGroupPanelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelGroupPanelStateCopyWith<ChannelGroupPanelState> get copyWith =>
      _$ChannelGroupPanelStateCopyWithImpl<ChannelGroupPanelState>(
        this as ChannelGroupPanelState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelGroupPanelState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.groups, groups));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(groups),
  );

  @override
  String toString() {
    return 'ChannelGroupPanelState(status: $status, groups: $groups)';
  }
}

/// @nodoc
abstract mixin class $ChannelGroupPanelStateCopyWith<$Res> {
  factory $ChannelGroupPanelStateCopyWith(
    ChannelGroupPanelState value,
    $Res Function(ChannelGroupPanelState) _then,
  ) = _$ChannelGroupPanelStateCopyWithImpl;
  @useResult
  $Res call({ChannelGroupPanelStatus status, List<GroupItem> groups});
}

/// @nodoc
class _$ChannelGroupPanelStateCopyWithImpl<$Res>
    implements $ChannelGroupPanelStateCopyWith<$Res> {
  _$ChannelGroupPanelStateCopyWithImpl(this._self, this._then);

  final ChannelGroupPanelState _self;
  final $Res Function(ChannelGroupPanelState) _then;

  /// Create a copy of ChannelGroupPanelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? groups = null}) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ChannelGroupPanelStatus,
        groups: null == groups
            ? _self.groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<GroupItem>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ChannelGroupPanelState].
extension ChannelGroupPanelStatePatterns on ChannelGroupPanelState {
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
    TResult Function(_ChannelGroupPanelState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelGroupPanelState() when $default != null:
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
    TResult Function(_ChannelGroupPanelState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelGroupPanelState():
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
    TResult? Function(_ChannelGroupPanelState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelGroupPanelState() when $default != null:
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
    TResult Function(ChannelGroupPanelStatus status, List<GroupItem> groups)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelGroupPanelState() when $default != null:
        return $default(_that.status, _that.groups);
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
    TResult Function(ChannelGroupPanelStatus status, List<GroupItem> groups)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelGroupPanelState():
        return $default(_that.status, _that.groups);
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
    TResult? Function(ChannelGroupPanelStatus status, List<GroupItem> groups)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelGroupPanelState() when $default != null:
        return $default(_that.status, _that.groups);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChannelGroupPanelState implements ChannelGroupPanelState {
  const _ChannelGroupPanelState({
    required this.status,
    final List<GroupItem> groups = const <GroupItem>[],
  }) : _groups = groups;

  @override
  final ChannelGroupPanelStatus status;
  final List<GroupItem> _groups;
  @override
  @JsonKey()
  List<GroupItem> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  /// Create a copy of ChannelGroupPanelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelGroupPanelStateCopyWith<_ChannelGroupPanelState> get copyWith =>
      __$ChannelGroupPanelStateCopyWithImpl<_ChannelGroupPanelState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelGroupPanelState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_groups),
  );

  @override
  String toString() {
    return 'ChannelGroupPanelState(status: $status, groups: $groups)';
  }
}

/// @nodoc
abstract mixin class _$ChannelGroupPanelStateCopyWith<$Res>
    implements $ChannelGroupPanelStateCopyWith<$Res> {
  factory _$ChannelGroupPanelStateCopyWith(
    _ChannelGroupPanelState value,
    $Res Function(_ChannelGroupPanelState) _then,
  ) = __$ChannelGroupPanelStateCopyWithImpl;
  @override
  @useResult
  $Res call({ChannelGroupPanelStatus status, List<GroupItem> groups});
}

/// @nodoc
class __$ChannelGroupPanelStateCopyWithImpl<$Res>
    implements _$ChannelGroupPanelStateCopyWith<$Res> {
  __$ChannelGroupPanelStateCopyWithImpl(this._self, this._then);

  final _ChannelGroupPanelState _self;
  final $Res Function(_ChannelGroupPanelState) _then;

  /// Create a copy of ChannelGroupPanelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? status = null, Object? groups = null}) {
    return _then(
      _ChannelGroupPanelState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ChannelGroupPanelStatus,
        groups: null == groups
            ? _self._groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<GroupItem>,
      ),
    );
  }
}
