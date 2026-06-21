// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodPlayerEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VodPlayerEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VodPlayerEvent()';
  }
}

/// @nodoc
class $VodPlayerEventCopyWith<$Res> {
  $VodPlayerEventCopyWith(VodPlayerEvent _, $Res Function(VodPlayerEvent) __);
}

/// Adds pattern-matching-related methods to [VodPlayerEvent].
extension VodPlayerEventPatterns on VodPlayerEvent {
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
    TResult Function(_TargetSelected value)? targetSelected,
    TResult Function(_RetryRequested value)? retryRequested,
    TResult Function(_ControlsRequested value)? controlsRequested,
    TResult Function(_ControlsClosed value)? controlsClosed,
    TResult Function(_BrowseRequested value)? browseRequested,
    TResult Function(_BrowseClosed value)? browseClosed,
    TResult Function(_BrowseFallbackPressed value)? browseFallbackPressed,
    TResult Function(_BrowseLoadMoreRequested value)? browseLoadMoreRequested,
    TResult Function(_BrowseVodSelected value)? browseVodSelected,
    TResult Function(_PreferencesChanged value)? preferencesChanged,
    TResult Function(_FollowingToggled value)? followingToggled,
    TResult Function(_GroupAddRequested value)? groupAddRequested,
    TResult Function(_FeedbackCleared value)? feedbackCleared,
    TResult Function(_PlaybackSpeedSelected value)? playbackSpeedSelected,
    TResult Function(_PlaybackReady value)? playbackReady,
    TResult Function(_PlaybackFailed value)? playbackFailed,
    TResult Function(_PlaybackPositionChanged value)? playbackPositionChanged,
    TResult Function(_PlaybackEnded value)? playbackEnded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _TargetSelected() when targetSelected != null:
        return targetSelected(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _ControlsRequested() when controlsRequested != null:
        return controlsRequested(_that);
      case _ControlsClosed() when controlsClosed != null:
        return controlsClosed(_that);
      case _BrowseRequested() when browseRequested != null:
        return browseRequested(_that);
      case _BrowseClosed() when browseClosed != null:
        return browseClosed(_that);
      case _BrowseFallbackPressed() when browseFallbackPressed != null:
        return browseFallbackPressed(_that);
      case _BrowseLoadMoreRequested() when browseLoadMoreRequested != null:
        return browseLoadMoreRequested(_that);
      case _BrowseVodSelected() when browseVodSelected != null:
        return browseVodSelected(_that);
      case _PreferencesChanged() when preferencesChanged != null:
        return preferencesChanged(_that);
      case _FollowingToggled() when followingToggled != null:
        return followingToggled(_that);
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that);
      case _FeedbackCleared() when feedbackCleared != null:
        return feedbackCleared(_that);
      case _PlaybackSpeedSelected() when playbackSpeedSelected != null:
        return playbackSpeedSelected(_that);
      case _PlaybackReady() when playbackReady != null:
        return playbackReady(_that);
      case _PlaybackFailed() when playbackFailed != null:
        return playbackFailed(_that);
      case _PlaybackPositionChanged() when playbackPositionChanged != null:
        return playbackPositionChanged(_that);
      case _PlaybackEnded() when playbackEnded != null:
        return playbackEnded(_that);
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
    required TResult Function(_TargetSelected value) targetSelected,
    required TResult Function(_RetryRequested value) retryRequested,
    required TResult Function(_ControlsRequested value) controlsRequested,
    required TResult Function(_ControlsClosed value) controlsClosed,
    required TResult Function(_BrowseRequested value) browseRequested,
    required TResult Function(_BrowseClosed value) browseClosed,
    required TResult Function(_BrowseFallbackPressed value)
    browseFallbackPressed,
    required TResult Function(_BrowseLoadMoreRequested value)
    browseLoadMoreRequested,
    required TResult Function(_BrowseVodSelected value) browseVodSelected,
    required TResult Function(_PreferencesChanged value) preferencesChanged,
    required TResult Function(_FollowingToggled value) followingToggled,
    required TResult Function(_GroupAddRequested value) groupAddRequested,
    required TResult Function(_FeedbackCleared value) feedbackCleared,
    required TResult Function(_PlaybackSpeedSelected value)
    playbackSpeedSelected,
    required TResult Function(_PlaybackReady value) playbackReady,
    required TResult Function(_PlaybackFailed value) playbackFailed,
    required TResult Function(_PlaybackPositionChanged value)
    playbackPositionChanged,
    required TResult Function(_PlaybackEnded value) playbackEnded,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _TargetSelected():
        return targetSelected(_that);
      case _RetryRequested():
        return retryRequested(_that);
      case _ControlsRequested():
        return controlsRequested(_that);
      case _ControlsClosed():
        return controlsClosed(_that);
      case _BrowseRequested():
        return browseRequested(_that);
      case _BrowseClosed():
        return browseClosed(_that);
      case _BrowseFallbackPressed():
        return browseFallbackPressed(_that);
      case _BrowseLoadMoreRequested():
        return browseLoadMoreRequested(_that);
      case _BrowseVodSelected():
        return browseVodSelected(_that);
      case _PreferencesChanged():
        return preferencesChanged(_that);
      case _FollowingToggled():
        return followingToggled(_that);
      case _GroupAddRequested():
        return groupAddRequested(_that);
      case _FeedbackCleared():
        return feedbackCleared(_that);
      case _PlaybackSpeedSelected():
        return playbackSpeedSelected(_that);
      case _PlaybackReady():
        return playbackReady(_that);
      case _PlaybackFailed():
        return playbackFailed(_that);
      case _PlaybackPositionChanged():
        return playbackPositionChanged(_that);
      case _PlaybackEnded():
        return playbackEnded(_that);
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
    TResult? Function(_TargetSelected value)? targetSelected,
    TResult? Function(_RetryRequested value)? retryRequested,
    TResult? Function(_ControlsRequested value)? controlsRequested,
    TResult? Function(_ControlsClosed value)? controlsClosed,
    TResult? Function(_BrowseRequested value)? browseRequested,
    TResult? Function(_BrowseClosed value)? browseClosed,
    TResult? Function(_BrowseFallbackPressed value)? browseFallbackPressed,
    TResult? Function(_BrowseLoadMoreRequested value)? browseLoadMoreRequested,
    TResult? Function(_BrowseVodSelected value)? browseVodSelected,
    TResult? Function(_PreferencesChanged value)? preferencesChanged,
    TResult? Function(_FollowingToggled value)? followingToggled,
    TResult? Function(_GroupAddRequested value)? groupAddRequested,
    TResult? Function(_FeedbackCleared value)? feedbackCleared,
    TResult? Function(_PlaybackSpeedSelected value)? playbackSpeedSelected,
    TResult? Function(_PlaybackReady value)? playbackReady,
    TResult? Function(_PlaybackFailed value)? playbackFailed,
    TResult? Function(_PlaybackPositionChanged value)? playbackPositionChanged,
    TResult? Function(_PlaybackEnded value)? playbackEnded,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _TargetSelected() when targetSelected != null:
        return targetSelected(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _ControlsRequested() when controlsRequested != null:
        return controlsRequested(_that);
      case _ControlsClosed() when controlsClosed != null:
        return controlsClosed(_that);
      case _BrowseRequested() when browseRequested != null:
        return browseRequested(_that);
      case _BrowseClosed() when browseClosed != null:
        return browseClosed(_that);
      case _BrowseFallbackPressed() when browseFallbackPressed != null:
        return browseFallbackPressed(_that);
      case _BrowseLoadMoreRequested() when browseLoadMoreRequested != null:
        return browseLoadMoreRequested(_that);
      case _BrowseVodSelected() when browseVodSelected != null:
        return browseVodSelected(_that);
      case _PreferencesChanged() when preferencesChanged != null:
        return preferencesChanged(_that);
      case _FollowingToggled() when followingToggled != null:
        return followingToggled(_that);
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that);
      case _FeedbackCleared() when feedbackCleared != null:
        return feedbackCleared(_that);
      case _PlaybackSpeedSelected() when playbackSpeedSelected != null:
        return playbackSpeedSelected(_that);
      case _PlaybackReady() when playbackReady != null:
        return playbackReady(_that);
      case _PlaybackFailed() when playbackFailed != null:
        return playbackFailed(_that);
      case _PlaybackPositionChanged() when playbackPositionChanged != null:
        return playbackPositionChanged(_that);
      case _PlaybackEnded() when playbackEnded != null:
        return playbackEnded(_that);
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
    TResult Function(VodPlayerInitialTarget? initialTarget)? started,
    TResult Function(VodPlayerInitialTarget target)? targetSelected,
    TResult Function()? retryRequested,
    TResult Function()? controlsRequested,
    TResult Function()? controlsClosed,
    TResult Function()? browseRequested,
    TResult Function()? browseClosed,
    TResult Function()? browseFallbackPressed,
    TResult Function()? browseLoadMoreRequested,
    TResult Function(VodPlayerInitialTarget target)? browseVodSelected,
    TResult Function(SettingsPreferences preferences)? preferencesChanged,
    TResult Function()? followingToggled,
    TResult Function(String groupId)? groupAddRequested,
    TResult Function(int serial)? feedbackCleared,
    TResult Function(double speed)? playbackSpeedSelected,
    TResult Function(String slotId, Uri playbackUri)? playbackReady,
    TResult Function(String slotId, Uri playbackUri)? playbackFailed,
    TResult Function(
      String slotId,
      Uri playbackUri,
      Duration position,
      Duration duration,
    )?
    playbackPositionChanged,
    TResult Function(
      String slotId,
      Uri playbackUri,
      Duration position,
      Duration duration,
    )?
    playbackEnded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.initialTarget);
      case _TargetSelected() when targetSelected != null:
        return targetSelected(_that.target);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _ControlsRequested() when controlsRequested != null:
        return controlsRequested();
      case _ControlsClosed() when controlsClosed != null:
        return controlsClosed();
      case _BrowseRequested() when browseRequested != null:
        return browseRequested();
      case _BrowseClosed() when browseClosed != null:
        return browseClosed();
      case _BrowseFallbackPressed() when browseFallbackPressed != null:
        return browseFallbackPressed();
      case _BrowseLoadMoreRequested() when browseLoadMoreRequested != null:
        return browseLoadMoreRequested();
      case _BrowseVodSelected() when browseVodSelected != null:
        return browseVodSelected(_that.target);
      case _PreferencesChanged() when preferencesChanged != null:
        return preferencesChanged(_that.preferences);
      case _FollowingToggled() when followingToggled != null:
        return followingToggled();
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that.groupId);
      case _FeedbackCleared() when feedbackCleared != null:
        return feedbackCleared(_that.serial);
      case _PlaybackSpeedSelected() when playbackSpeedSelected != null:
        return playbackSpeedSelected(_that.speed);
      case _PlaybackReady() when playbackReady != null:
        return playbackReady(_that.slotId, _that.playbackUri);
      case _PlaybackFailed() when playbackFailed != null:
        return playbackFailed(_that.slotId, _that.playbackUri);
      case _PlaybackPositionChanged() when playbackPositionChanged != null:
        return playbackPositionChanged(
          _that.slotId,
          _that.playbackUri,
          _that.position,
          _that.duration,
        );
      case _PlaybackEnded() when playbackEnded != null:
        return playbackEnded(
          _that.slotId,
          _that.playbackUri,
          _that.position,
          _that.duration,
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
  TResult when<TResult extends Object?>({
    required TResult Function(VodPlayerInitialTarget? initialTarget) started,
    required TResult Function(VodPlayerInitialTarget target) targetSelected,
    required TResult Function() retryRequested,
    required TResult Function() controlsRequested,
    required TResult Function() controlsClosed,
    required TResult Function() browseRequested,
    required TResult Function() browseClosed,
    required TResult Function() browseFallbackPressed,
    required TResult Function() browseLoadMoreRequested,
    required TResult Function(VodPlayerInitialTarget target) browseVodSelected,
    required TResult Function(SettingsPreferences preferences)
    preferencesChanged,
    required TResult Function() followingToggled,
    required TResult Function(String groupId) groupAddRequested,
    required TResult Function(int serial) feedbackCleared,
    required TResult Function(double speed) playbackSpeedSelected,
    required TResult Function(String slotId, Uri playbackUri) playbackReady,
    required TResult Function(String slotId, Uri playbackUri) playbackFailed,
    required TResult Function(
      String slotId,
      Uri playbackUri,
      Duration position,
      Duration duration,
    )
    playbackPositionChanged,
    required TResult Function(
      String slotId,
      Uri playbackUri,
      Duration position,
      Duration duration,
    )
    playbackEnded,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that.initialTarget);
      case _TargetSelected():
        return targetSelected(_that.target);
      case _RetryRequested():
        return retryRequested();
      case _ControlsRequested():
        return controlsRequested();
      case _ControlsClosed():
        return controlsClosed();
      case _BrowseRequested():
        return browseRequested();
      case _BrowseClosed():
        return browseClosed();
      case _BrowseFallbackPressed():
        return browseFallbackPressed();
      case _BrowseLoadMoreRequested():
        return browseLoadMoreRequested();
      case _BrowseVodSelected():
        return browseVodSelected(_that.target);
      case _PreferencesChanged():
        return preferencesChanged(_that.preferences);
      case _FollowingToggled():
        return followingToggled();
      case _GroupAddRequested():
        return groupAddRequested(_that.groupId);
      case _FeedbackCleared():
        return feedbackCleared(_that.serial);
      case _PlaybackSpeedSelected():
        return playbackSpeedSelected(_that.speed);
      case _PlaybackReady():
        return playbackReady(_that.slotId, _that.playbackUri);
      case _PlaybackFailed():
        return playbackFailed(_that.slotId, _that.playbackUri);
      case _PlaybackPositionChanged():
        return playbackPositionChanged(
          _that.slotId,
          _that.playbackUri,
          _that.position,
          _that.duration,
        );
      case _PlaybackEnded():
        return playbackEnded(
          _that.slotId,
          _that.playbackUri,
          _that.position,
          _that.duration,
        );
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
    TResult? Function(VodPlayerInitialTarget? initialTarget)? started,
    TResult? Function(VodPlayerInitialTarget target)? targetSelected,
    TResult? Function()? retryRequested,
    TResult? Function()? controlsRequested,
    TResult? Function()? controlsClosed,
    TResult? Function()? browseRequested,
    TResult? Function()? browseClosed,
    TResult? Function()? browseFallbackPressed,
    TResult? Function()? browseLoadMoreRequested,
    TResult? Function(VodPlayerInitialTarget target)? browseVodSelected,
    TResult? Function(SettingsPreferences preferences)? preferencesChanged,
    TResult? Function()? followingToggled,
    TResult? Function(String groupId)? groupAddRequested,
    TResult? Function(int serial)? feedbackCleared,
    TResult? Function(double speed)? playbackSpeedSelected,
    TResult? Function(String slotId, Uri playbackUri)? playbackReady,
    TResult? Function(String slotId, Uri playbackUri)? playbackFailed,
    TResult? Function(
      String slotId,
      Uri playbackUri,
      Duration position,
      Duration duration,
    )?
    playbackPositionChanged,
    TResult? Function(
      String slotId,
      Uri playbackUri,
      Duration position,
      Duration duration,
    )?
    playbackEnded,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.initialTarget);
      case _TargetSelected() when targetSelected != null:
        return targetSelected(_that.target);
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _ControlsRequested() when controlsRequested != null:
        return controlsRequested();
      case _ControlsClosed() when controlsClosed != null:
        return controlsClosed();
      case _BrowseRequested() when browseRequested != null:
        return browseRequested();
      case _BrowseClosed() when browseClosed != null:
        return browseClosed();
      case _BrowseFallbackPressed() when browseFallbackPressed != null:
        return browseFallbackPressed();
      case _BrowseLoadMoreRequested() when browseLoadMoreRequested != null:
        return browseLoadMoreRequested();
      case _BrowseVodSelected() when browseVodSelected != null:
        return browseVodSelected(_that.target);
      case _PreferencesChanged() when preferencesChanged != null:
        return preferencesChanged(_that.preferences);
      case _FollowingToggled() when followingToggled != null:
        return followingToggled();
      case _GroupAddRequested() when groupAddRequested != null:
        return groupAddRequested(_that.groupId);
      case _FeedbackCleared() when feedbackCleared != null:
        return feedbackCleared(_that.serial);
      case _PlaybackSpeedSelected() when playbackSpeedSelected != null:
        return playbackSpeedSelected(_that.speed);
      case _PlaybackReady() when playbackReady != null:
        return playbackReady(_that.slotId, _that.playbackUri);
      case _PlaybackFailed() when playbackFailed != null:
        return playbackFailed(_that.slotId, _that.playbackUri);
      case _PlaybackPositionChanged() when playbackPositionChanged != null:
        return playbackPositionChanged(
          _that.slotId,
          _that.playbackUri,
          _that.position,
          _that.duration,
        );
      case _PlaybackEnded() when playbackEnded != null:
        return playbackEnded(
          _that.slotId,
          _that.playbackUri,
          _that.position,
          _that.duration,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements VodPlayerEvent {
  const _Started({this.initialTarget});

  final VodPlayerInitialTarget? initialTarget;

  /// Create a copy of VodPlayerEvent
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
            (identical(other.initialTarget, initialTarget) ||
                other.initialTarget == initialTarget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialTarget);

  @override
  String toString() {
    return 'VodPlayerEvent.started(initialTarget: $initialTarget)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @useResult
  $Res call({VodPlayerInitialTarget? initialTarget});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? initialTarget = freezed}) {
    return _then(
      _Started(
        initialTarget: freezed == initialTarget
            ? _self.initialTarget
            : initialTarget // ignore: cast_nullable_to_non_nullable
                  as VodPlayerInitialTarget?,
      ),
    );
  }
}

/// @nodoc

class _TargetSelected implements VodPlayerEvent {
  const _TargetSelected({required this.target});

  final VodPlayerInitialTarget target;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TargetSelectedCopyWith<_TargetSelected> get copyWith =>
      __$TargetSelectedCopyWithImpl<_TargetSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TargetSelected &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, target);

  @override
  String toString() {
    return 'VodPlayerEvent.targetSelected(target: $target)';
  }
}

/// @nodoc
abstract mixin class _$TargetSelectedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$TargetSelectedCopyWith(
    _TargetSelected value,
    $Res Function(_TargetSelected) _then,
  ) = __$TargetSelectedCopyWithImpl;
  @useResult
  $Res call({VodPlayerInitialTarget target});
}

/// @nodoc
class __$TargetSelectedCopyWithImpl<$Res>
    implements _$TargetSelectedCopyWith<$Res> {
  __$TargetSelectedCopyWithImpl(this._self, this._then);

  final _TargetSelected _self;
  final $Res Function(_TargetSelected) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? target = null}) {
    return _then(
      _TargetSelected(
        target: null == target
            ? _self.target
            : target // ignore: cast_nullable_to_non_nullable
                  as VodPlayerInitialTarget,
      ),
    );
  }
}

/// @nodoc

class _RetryRequested implements VodPlayerEvent {
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
    return 'VodPlayerEvent.retryRequested()';
  }
}

/// @nodoc

class _ControlsRequested implements VodPlayerEvent {
  const _ControlsRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ControlsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VodPlayerEvent.controlsRequested()';
  }
}

/// @nodoc

class _ControlsClosed implements VodPlayerEvent {
  const _ControlsClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ControlsClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VodPlayerEvent.controlsClosed()';
  }
}

/// @nodoc

class _BrowseRequested implements VodPlayerEvent {
  const _BrowseRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BrowseRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VodPlayerEvent.browseRequested()';
  }
}

/// @nodoc

class _BrowseClosed implements VodPlayerEvent {
  const _BrowseClosed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BrowseClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VodPlayerEvent.browseClosed()';
  }
}

/// @nodoc

class _BrowseFallbackPressed implements VodPlayerEvent {
  const _BrowseFallbackPressed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BrowseFallbackPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VodPlayerEvent.browseFallbackPressed()';
  }
}

/// @nodoc

class _BrowseLoadMoreRequested implements VodPlayerEvent {
  const _BrowseLoadMoreRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BrowseLoadMoreRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VodPlayerEvent.browseLoadMoreRequested()';
  }
}

/// @nodoc

class _BrowseVodSelected implements VodPlayerEvent {
  const _BrowseVodSelected({required this.target});

  final VodPlayerInitialTarget target;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrowseVodSelectedCopyWith<_BrowseVodSelected> get copyWith =>
      __$BrowseVodSelectedCopyWithImpl<_BrowseVodSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrowseVodSelected &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, target);

  @override
  String toString() {
    return 'VodPlayerEvent.browseVodSelected(target: $target)';
  }
}

/// @nodoc
abstract mixin class _$BrowseVodSelectedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$BrowseVodSelectedCopyWith(
    _BrowseVodSelected value,
    $Res Function(_BrowseVodSelected) _then,
  ) = __$BrowseVodSelectedCopyWithImpl;
  @useResult
  $Res call({VodPlayerInitialTarget target});
}

/// @nodoc
class __$BrowseVodSelectedCopyWithImpl<$Res>
    implements _$BrowseVodSelectedCopyWith<$Res> {
  __$BrowseVodSelectedCopyWithImpl(this._self, this._then);

  final _BrowseVodSelected _self;
  final $Res Function(_BrowseVodSelected) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? target = null}) {
    return _then(
      _BrowseVodSelected(
        target: null == target
            ? _self.target
            : target // ignore: cast_nullable_to_non_nullable
                  as VodPlayerInitialTarget,
      ),
    );
  }
}

/// @nodoc

class _PreferencesChanged implements VodPlayerEvent {
  const _PreferencesChanged({required this.preferences});

  final SettingsPreferences preferences;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PreferencesChangedCopyWith<_PreferencesChanged> get copyWith =>
      __$PreferencesChangedCopyWithImpl<_PreferencesChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreferencesChanged &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preferences);

  @override
  String toString() {
    return 'VodPlayerEvent.preferencesChanged(preferences: $preferences)';
  }
}

/// @nodoc
abstract mixin class _$PreferencesChangedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$PreferencesChangedCopyWith(
    _PreferencesChanged value,
    $Res Function(_PreferencesChanged) _then,
  ) = __$PreferencesChangedCopyWithImpl;
  @useResult
  $Res call({SettingsPreferences preferences});

  $SettingsPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$PreferencesChangedCopyWithImpl<$Res>
    implements _$PreferencesChangedCopyWith<$Res> {
  __$PreferencesChangedCopyWithImpl(this._self, this._then);

  final _PreferencesChanged _self;
  final $Res Function(_PreferencesChanged) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? preferences = null}) {
    return _then(
      _PreferencesChanged(
        preferences: null == preferences
            ? _self.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferences,
      ),
    );
  }

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsPreferencesCopyWith<$Res> get preferences {
    return $SettingsPreferencesCopyWith<$Res>(_self.preferences, (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// @nodoc

class _FollowingToggled implements VodPlayerEvent {
  const _FollowingToggled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FollowingToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VodPlayerEvent.followingToggled()';
  }
}

/// @nodoc

class _GroupAddRequested implements VodPlayerEvent {
  const _GroupAddRequested({required this.groupId});

  final String groupId;

  /// Create a copy of VodPlayerEvent
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
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId);

  @override
  String toString() {
    return 'VodPlayerEvent.groupAddRequested(groupId: $groupId)';
  }
}

/// @nodoc
abstract mixin class _$GroupAddRequestedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$GroupAddRequestedCopyWith(
    _GroupAddRequested value,
    $Res Function(_GroupAddRequested) _then,
  ) = __$GroupAddRequestedCopyWithImpl;
  @useResult
  $Res call({String groupId});
}

/// @nodoc
class __$GroupAddRequestedCopyWithImpl<$Res>
    implements _$GroupAddRequestedCopyWith<$Res> {
  __$GroupAddRequestedCopyWithImpl(this._self, this._then);

  final _GroupAddRequested _self;
  final $Res Function(_GroupAddRequested) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? groupId = null}) {
    return _then(
      _GroupAddRequested(
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _FeedbackCleared implements VodPlayerEvent {
  const _FeedbackCleared({required this.serial});

  final int serial;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeedbackClearedCopyWith<_FeedbackCleared> get copyWith =>
      __$FeedbackClearedCopyWithImpl<_FeedbackCleared>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedbackCleared &&
            (identical(other.serial, serial) || other.serial == serial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serial);

  @override
  String toString() {
    return 'VodPlayerEvent.feedbackCleared(serial: $serial)';
  }
}

/// @nodoc
abstract mixin class _$FeedbackClearedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$FeedbackClearedCopyWith(
    _FeedbackCleared value,
    $Res Function(_FeedbackCleared) _then,
  ) = __$FeedbackClearedCopyWithImpl;
  @useResult
  $Res call({int serial});
}

/// @nodoc
class __$FeedbackClearedCopyWithImpl<$Res>
    implements _$FeedbackClearedCopyWith<$Res> {
  __$FeedbackClearedCopyWithImpl(this._self, this._then);

  final _FeedbackCleared _self;
  final $Res Function(_FeedbackCleared) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? serial = null}) {
    return _then(
      _FeedbackCleared(
        serial: null == serial
            ? _self.serial
            : serial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _PlaybackSpeedSelected implements VodPlayerEvent {
  const _PlaybackSpeedSelected({required this.speed});

  final double speed;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaybackSpeedSelectedCopyWith<_PlaybackSpeedSelected> get copyWith =>
      __$PlaybackSpeedSelectedCopyWithImpl<_PlaybackSpeedSelected>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaybackSpeedSelected &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, speed);

  @override
  String toString() {
    return 'VodPlayerEvent.playbackSpeedSelected(speed: $speed)';
  }
}

/// @nodoc
abstract mixin class _$PlaybackSpeedSelectedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$PlaybackSpeedSelectedCopyWith(
    _PlaybackSpeedSelected value,
    $Res Function(_PlaybackSpeedSelected) _then,
  ) = __$PlaybackSpeedSelectedCopyWithImpl;
  @useResult
  $Res call({double speed});
}

/// @nodoc
class __$PlaybackSpeedSelectedCopyWithImpl<$Res>
    implements _$PlaybackSpeedSelectedCopyWith<$Res> {
  __$PlaybackSpeedSelectedCopyWithImpl(this._self, this._then);

  final _PlaybackSpeedSelected _self;
  final $Res Function(_PlaybackSpeedSelected) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? speed = null}) {
    return _then(
      _PlaybackSpeedSelected(
        speed: null == speed
            ? _self.speed
            : speed // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _PlaybackReady implements VodPlayerEvent {
  const _PlaybackReady({required this.slotId, required this.playbackUri});

  final String slotId;
  final Uri playbackUri;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaybackReadyCopyWith<_PlaybackReady> get copyWith =>
      __$PlaybackReadyCopyWithImpl<_PlaybackReady>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaybackReady &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId, playbackUri);

  @override
  String toString() {
    return 'VodPlayerEvent.playbackReady(slotId: $slotId, playbackUri: $playbackUri)';
  }
}

/// @nodoc
abstract mixin class _$PlaybackReadyCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$PlaybackReadyCopyWith(
    _PlaybackReady value,
    $Res Function(_PlaybackReady) _then,
  ) = __$PlaybackReadyCopyWithImpl;
  @useResult
  $Res call({String slotId, Uri playbackUri});
}

/// @nodoc
class __$PlaybackReadyCopyWithImpl<$Res>
    implements _$PlaybackReadyCopyWith<$Res> {
  __$PlaybackReadyCopyWithImpl(this._self, this._then);

  final _PlaybackReady _self;
  final $Res Function(_PlaybackReady) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null, Object? playbackUri = null}) {
    return _then(
      _PlaybackReady(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        playbackUri: null == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri,
      ),
    );
  }
}

/// @nodoc

class _PlaybackFailed implements VodPlayerEvent {
  const _PlaybackFailed({required this.slotId, required this.playbackUri});

  final String slotId;
  final Uri playbackUri;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaybackFailedCopyWith<_PlaybackFailed> get copyWith =>
      __$PlaybackFailedCopyWithImpl<_PlaybackFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaybackFailed &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId, playbackUri);

  @override
  String toString() {
    return 'VodPlayerEvent.playbackFailed(slotId: $slotId, playbackUri: $playbackUri)';
  }
}

/// @nodoc
abstract mixin class _$PlaybackFailedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$PlaybackFailedCopyWith(
    _PlaybackFailed value,
    $Res Function(_PlaybackFailed) _then,
  ) = __$PlaybackFailedCopyWithImpl;
  @useResult
  $Res call({String slotId, Uri playbackUri});
}

/// @nodoc
class __$PlaybackFailedCopyWithImpl<$Res>
    implements _$PlaybackFailedCopyWith<$Res> {
  __$PlaybackFailedCopyWithImpl(this._self, this._then);

  final _PlaybackFailed _self;
  final $Res Function(_PlaybackFailed) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? slotId = null, Object? playbackUri = null}) {
    return _then(
      _PlaybackFailed(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        playbackUri: null == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri,
      ),
    );
  }
}

/// @nodoc

class _PlaybackPositionChanged implements VodPlayerEvent {
  const _PlaybackPositionChanged({
    required this.slotId,
    required this.playbackUri,
    required this.position,
    required this.duration,
  });

  final String slotId;
  final Uri playbackUri;
  final Duration position;
  final Duration duration;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaybackPositionChangedCopyWith<_PlaybackPositionChanged> get copyWith =>
      __$PlaybackPositionChangedCopyWithImpl<_PlaybackPositionChanged>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaybackPositionChanged &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, slotId, playbackUri, position, duration);

  @override
  String toString() {
    return 'VodPlayerEvent.playbackPositionChanged(slotId: $slotId, playbackUri: $playbackUri, position: $position, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$PlaybackPositionChangedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$PlaybackPositionChangedCopyWith(
    _PlaybackPositionChanged value,
    $Res Function(_PlaybackPositionChanged) _then,
  ) = __$PlaybackPositionChangedCopyWithImpl;
  @useResult
  $Res call({
    String slotId,
    Uri playbackUri,
    Duration position,
    Duration duration,
  });
}

/// @nodoc
class __$PlaybackPositionChangedCopyWithImpl<$Res>
    implements _$PlaybackPositionChangedCopyWith<$Res> {
  __$PlaybackPositionChangedCopyWithImpl(this._self, this._then);

  final _PlaybackPositionChanged _self;
  final $Res Function(_PlaybackPositionChanged) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? slotId = null,
    Object? playbackUri = null,
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(
      _PlaybackPositionChanged(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        playbackUri: null == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri,
        position: null == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as Duration,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _PlaybackEnded implements VodPlayerEvent {
  const _PlaybackEnded({
    required this.slotId,
    required this.playbackUri,
    required this.position,
    required this.duration,
  });

  final String slotId;
  final Uri playbackUri;
  final Duration position;
  final Duration duration;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaybackEndedCopyWith<_PlaybackEnded> get copyWith =>
      __$PlaybackEndedCopyWithImpl<_PlaybackEnded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaybackEnded &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, slotId, playbackUri, position, duration);

  @override
  String toString() {
    return 'VodPlayerEvent.playbackEnded(slotId: $slotId, playbackUri: $playbackUri, position: $position, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$PlaybackEndedCopyWith<$Res>
    implements $VodPlayerEventCopyWith<$Res> {
  factory _$PlaybackEndedCopyWith(
    _PlaybackEnded value,
    $Res Function(_PlaybackEnded) _then,
  ) = __$PlaybackEndedCopyWithImpl;
  @useResult
  $Res call({
    String slotId,
    Uri playbackUri,
    Duration position,
    Duration duration,
  });
}

/// @nodoc
class __$PlaybackEndedCopyWithImpl<$Res>
    implements _$PlaybackEndedCopyWith<$Res> {
  __$PlaybackEndedCopyWithImpl(this._self, this._then);

  final _PlaybackEnded _self;
  final $Res Function(_PlaybackEnded) _then;

  /// Create a copy of VodPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? slotId = null,
    Object? playbackUri = null,
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(
      _PlaybackEnded(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        playbackUri: null == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri,
        position: null == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as Duration,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc
mixin _$VodPlayerState {
  VodPlayerOverlayMode get overlayMode;
  String get activeSlotId;
  String get primarySlotId;
  List<VodPlayerSlotState> get slots;
  SettingsPreferences get settingsPreferences;
  GroupCollection get groupCollection;
  double get playbackSpeed;
  VodPlayerBrowseLoadStatus get browseStatus;
  List<Vod> get browseItems;
  int? get browseNextPage;
  bool get browseHasMore;
  bool get browseLoadingMore;
  VodPlayerBrowseFallbackAction get browseFallbackAction;
  VodPlayerFeedbackType? get feedbackType;
  int get feedbackSerial;

  /// Create a copy of VodPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlayerStateCopyWith<VodPlayerState> get copyWith =>
      _$VodPlayerStateCopyWithImpl<VodPlayerState>(
        this as VodPlayerState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlayerState &&
            (identical(other.overlayMode, overlayMode) ||
                other.overlayMode == overlayMode) &&
            (identical(other.activeSlotId, activeSlotId) ||
                other.activeSlotId == activeSlotId) &&
            (identical(other.primarySlotId, primarySlotId) ||
                other.primarySlotId == primarySlotId) &&
            const DeepCollectionEquality().equals(other.slots, slots) &&
            (identical(other.settingsPreferences, settingsPreferences) ||
                other.settingsPreferences == settingsPreferences) &&
            (identical(other.groupCollection, groupCollection) ||
                other.groupCollection == groupCollection) &&
            (identical(other.playbackSpeed, playbackSpeed) ||
                other.playbackSpeed == playbackSpeed) &&
            (identical(other.browseStatus, browseStatus) ||
                other.browseStatus == browseStatus) &&
            const DeepCollectionEquality().equals(
              other.browseItems,
              browseItems,
            ) &&
            (identical(other.browseNextPage, browseNextPage) ||
                other.browseNextPage == browseNextPage) &&
            (identical(other.browseHasMore, browseHasMore) ||
                other.browseHasMore == browseHasMore) &&
            (identical(other.browseLoadingMore, browseLoadingMore) ||
                other.browseLoadingMore == browseLoadingMore) &&
            (identical(other.browseFallbackAction, browseFallbackAction) ||
                other.browseFallbackAction == browseFallbackAction) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    overlayMode,
    activeSlotId,
    primarySlotId,
    const DeepCollectionEquality().hash(slots),
    settingsPreferences,
    groupCollection,
    playbackSpeed,
    browseStatus,
    const DeepCollectionEquality().hash(browseItems),
    browseNextPage,
    browseHasMore,
    browseLoadingMore,
    browseFallbackAction,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'VodPlayerState(overlayMode: $overlayMode, activeSlotId: $activeSlotId, primarySlotId: $primarySlotId, slots: $slots, settingsPreferences: $settingsPreferences, groupCollection: $groupCollection, playbackSpeed: $playbackSpeed, browseStatus: $browseStatus, browseItems: $browseItems, browseNextPage: $browseNextPage, browseHasMore: $browseHasMore, browseLoadingMore: $browseLoadingMore, browseFallbackAction: $browseFallbackAction, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class $VodPlayerStateCopyWith<$Res> {
  factory $VodPlayerStateCopyWith(
    VodPlayerState value,
    $Res Function(VodPlayerState) _then,
  ) = _$VodPlayerStateCopyWithImpl;
  @useResult
  $Res call({
    VodPlayerOverlayMode overlayMode,
    String activeSlotId,
    String primarySlotId,
    List<VodPlayerSlotState> slots,
    SettingsPreferences settingsPreferences,
    GroupCollection groupCollection,
    double playbackSpeed,
    VodPlayerBrowseLoadStatus browseStatus,
    List<Vod> browseItems,
    int? browseNextPage,
    bool browseHasMore,
    bool browseLoadingMore,
    VodPlayerBrowseFallbackAction browseFallbackAction,
    VodPlayerFeedbackType? feedbackType,
    int feedbackSerial,
  });

  $SettingsPreferencesCopyWith<$Res> get settingsPreferences;
  $GroupCollectionCopyWith<$Res> get groupCollection;
}

/// @nodoc
class _$VodPlayerStateCopyWithImpl<$Res>
    implements $VodPlayerStateCopyWith<$Res> {
  _$VodPlayerStateCopyWithImpl(this._self, this._then);

  final VodPlayerState _self;
  final $Res Function(VodPlayerState) _then;

  /// Create a copy of VodPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overlayMode = null,
    Object? activeSlotId = null,
    Object? primarySlotId = null,
    Object? slots = null,
    Object? settingsPreferences = null,
    Object? groupCollection = null,
    Object? playbackSpeed = null,
    Object? browseStatus = null,
    Object? browseItems = null,
    Object? browseNextPage = freezed,
    Object? browseHasMore = null,
    Object? browseLoadingMore = null,
    Object? browseFallbackAction = null,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _self.copyWith(
        overlayMode: null == overlayMode
            ? _self.overlayMode
            : overlayMode // ignore: cast_nullable_to_non_nullable
                  as VodPlayerOverlayMode,
        activeSlotId: null == activeSlotId
            ? _self.activeSlotId
            : activeSlotId // ignore: cast_nullable_to_non_nullable
                  as String,
        primarySlotId: null == primarySlotId
            ? _self.primarySlotId
            : primarySlotId // ignore: cast_nullable_to_non_nullable
                  as String,
        slots: null == slots
            ? _self.slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<VodPlayerSlotState>,
        settingsPreferences: null == settingsPreferences
            ? _self.settingsPreferences
            : settingsPreferences // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferences,
        groupCollection: null == groupCollection
            ? _self.groupCollection
            : groupCollection // ignore: cast_nullable_to_non_nullable
                  as GroupCollection,
        playbackSpeed: null == playbackSpeed
            ? _self.playbackSpeed
            : playbackSpeed // ignore: cast_nullable_to_non_nullable
                  as double,
        browseStatus: null == browseStatus
            ? _self.browseStatus
            : browseStatus // ignore: cast_nullable_to_non_nullable
                  as VodPlayerBrowseLoadStatus,
        browseItems: null == browseItems
            ? _self.browseItems
            : browseItems // ignore: cast_nullable_to_non_nullable
                  as List<Vod>,
        browseNextPage: freezed == browseNextPage
            ? _self.browseNextPage
            : browseNextPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        browseHasMore: null == browseHasMore
            ? _self.browseHasMore
            : browseHasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseLoadingMore: null == browseLoadingMore
            ? _self.browseLoadingMore
            : browseLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseFallbackAction: null == browseFallbackAction
            ? _self.browseFallbackAction
            : browseFallbackAction // ignore: cast_nullable_to_non_nullable
                  as VodPlayerBrowseFallbackAction,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as VodPlayerFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of VodPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsPreferencesCopyWith<$Res> get settingsPreferences {
    return $SettingsPreferencesCopyWith<$Res>(_self.settingsPreferences, (
      value,
    ) {
      return _then(_self.copyWith(settingsPreferences: value));
    });
  }

  /// Create a copy of VodPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupCollectionCopyWith<$Res> get groupCollection {
    return $GroupCollectionCopyWith<$Res>(_self.groupCollection, (value) {
      return _then(_self.copyWith(groupCollection: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodPlayerState].
extension VodPlayerStatePatterns on VodPlayerState {
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
    TResult Function(_VodPlayerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlayerState() when $default != null:
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
    TResult Function(_VodPlayerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayerState():
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
    TResult? Function(_VodPlayerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayerState() when $default != null:
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
      VodPlayerOverlayMode overlayMode,
      String activeSlotId,
      String primarySlotId,
      List<VodPlayerSlotState> slots,
      SettingsPreferences settingsPreferences,
      GroupCollection groupCollection,
      double playbackSpeed,
      VodPlayerBrowseLoadStatus browseStatus,
      List<Vod> browseItems,
      int? browseNextPage,
      bool browseHasMore,
      bool browseLoadingMore,
      VodPlayerBrowseFallbackAction browseFallbackAction,
      VodPlayerFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlayerState() when $default != null:
        return $default(
          _that.overlayMode,
          _that.activeSlotId,
          _that.primarySlotId,
          _that.slots,
          _that.settingsPreferences,
          _that.groupCollection,
          _that.playbackSpeed,
          _that.browseStatus,
          _that.browseItems,
          _that.browseNextPage,
          _that.browseHasMore,
          _that.browseLoadingMore,
          _that.browseFallbackAction,
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
      VodPlayerOverlayMode overlayMode,
      String activeSlotId,
      String primarySlotId,
      List<VodPlayerSlotState> slots,
      SettingsPreferences settingsPreferences,
      GroupCollection groupCollection,
      double playbackSpeed,
      VodPlayerBrowseLoadStatus browseStatus,
      List<Vod> browseItems,
      int? browseNextPage,
      bool browseHasMore,
      bool browseLoadingMore,
      VodPlayerBrowseFallbackAction browseFallbackAction,
      VodPlayerFeedbackType? feedbackType,
      int feedbackSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayerState():
        return $default(
          _that.overlayMode,
          _that.activeSlotId,
          _that.primarySlotId,
          _that.slots,
          _that.settingsPreferences,
          _that.groupCollection,
          _that.playbackSpeed,
          _that.browseStatus,
          _that.browseItems,
          _that.browseNextPage,
          _that.browseHasMore,
          _that.browseLoadingMore,
          _that.browseFallbackAction,
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
      VodPlayerOverlayMode overlayMode,
      String activeSlotId,
      String primarySlotId,
      List<VodPlayerSlotState> slots,
      SettingsPreferences settingsPreferences,
      GroupCollection groupCollection,
      double playbackSpeed,
      VodPlayerBrowseLoadStatus browseStatus,
      List<Vod> browseItems,
      int? browseNextPage,
      bool browseHasMore,
      bool browseLoadingMore,
      VodPlayerBrowseFallbackAction browseFallbackAction,
      VodPlayerFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayerState() when $default != null:
        return $default(
          _that.overlayMode,
          _that.activeSlotId,
          _that.primarySlotId,
          _that.slots,
          _that.settingsPreferences,
          _that.groupCollection,
          _that.playbackSpeed,
          _that.browseStatus,
          _that.browseItems,
          _that.browseNextPage,
          _that.browseHasMore,
          _that.browseLoadingMore,
          _that.browseFallbackAction,
          _that.feedbackType,
          _that.feedbackSerial,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VodPlayerState extends VodPlayerState {
  const _VodPlayerState({
    this.overlayMode = VodPlayerOverlayMode.none,
    required this.activeSlotId,
    required this.primarySlotId,
    required final List<VodPlayerSlotState> slots,
    this.settingsPreferences = defaultSettingsPreferences,
    this.groupCollection = defaultGroupCollection,
    this.playbackSpeed = 1.0,
    this.browseStatus = VodPlayerBrowseLoadStatus.initial,
    final List<Vod> browseItems = const <Vod>[],
    this.browseNextPage,
    this.browseHasMore = false,
    this.browseLoadingMore = false,
    this.browseFallbackAction = VodPlayerBrowseFallbackAction.none,
    this.feedbackType,
    this.feedbackSerial = 0,
  }) : _slots = slots,
       _browseItems = browseItems,
       super._();

  @override
  @JsonKey()
  final VodPlayerOverlayMode overlayMode;
  @override
  final String activeSlotId;
  @override
  final String primarySlotId;
  final List<VodPlayerSlotState> _slots;
  @override
  List<VodPlayerSlotState> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  @JsonKey()
  final SettingsPreferences settingsPreferences;
  @override
  @JsonKey()
  final GroupCollection groupCollection;
  @override
  @JsonKey()
  final double playbackSpeed;
  @override
  @JsonKey()
  final VodPlayerBrowseLoadStatus browseStatus;
  final List<Vod> _browseItems;
  @override
  @JsonKey()
  List<Vod> get browseItems {
    if (_browseItems is EqualUnmodifiableListView) return _browseItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_browseItems);
  }

  @override
  final int? browseNextPage;
  @override
  @JsonKey()
  final bool browseHasMore;
  @override
  @JsonKey()
  final bool browseLoadingMore;
  @override
  @JsonKey()
  final VodPlayerBrowseFallbackAction browseFallbackAction;
  @override
  final VodPlayerFeedbackType? feedbackType;
  @override
  @JsonKey()
  final int feedbackSerial;

  /// Create a copy of VodPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlayerStateCopyWith<_VodPlayerState> get copyWith =>
      __$VodPlayerStateCopyWithImpl<_VodPlayerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlayerState &&
            (identical(other.overlayMode, overlayMode) ||
                other.overlayMode == overlayMode) &&
            (identical(other.activeSlotId, activeSlotId) ||
                other.activeSlotId == activeSlotId) &&
            (identical(other.primarySlotId, primarySlotId) ||
                other.primarySlotId == primarySlotId) &&
            const DeepCollectionEquality().equals(other._slots, _slots) &&
            (identical(other.settingsPreferences, settingsPreferences) ||
                other.settingsPreferences == settingsPreferences) &&
            (identical(other.groupCollection, groupCollection) ||
                other.groupCollection == groupCollection) &&
            (identical(other.playbackSpeed, playbackSpeed) ||
                other.playbackSpeed == playbackSpeed) &&
            (identical(other.browseStatus, browseStatus) ||
                other.browseStatus == browseStatus) &&
            const DeepCollectionEquality().equals(
              other._browseItems,
              _browseItems,
            ) &&
            (identical(other.browseNextPage, browseNextPage) ||
                other.browseNextPage == browseNextPage) &&
            (identical(other.browseHasMore, browseHasMore) ||
                other.browseHasMore == browseHasMore) &&
            (identical(other.browseLoadingMore, browseLoadingMore) ||
                other.browseLoadingMore == browseLoadingMore) &&
            (identical(other.browseFallbackAction, browseFallbackAction) ||
                other.browseFallbackAction == browseFallbackAction) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackSerial, feedbackSerial) ||
                other.feedbackSerial == feedbackSerial));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    overlayMode,
    activeSlotId,
    primarySlotId,
    const DeepCollectionEquality().hash(_slots),
    settingsPreferences,
    groupCollection,
    playbackSpeed,
    browseStatus,
    const DeepCollectionEquality().hash(_browseItems),
    browseNextPage,
    browseHasMore,
    browseLoadingMore,
    browseFallbackAction,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'VodPlayerState(overlayMode: $overlayMode, activeSlotId: $activeSlotId, primarySlotId: $primarySlotId, slots: $slots, settingsPreferences: $settingsPreferences, groupCollection: $groupCollection, playbackSpeed: $playbackSpeed, browseStatus: $browseStatus, browseItems: $browseItems, browseNextPage: $browseNextPage, browseHasMore: $browseHasMore, browseLoadingMore: $browseLoadingMore, browseFallbackAction: $browseFallbackAction, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class _$VodPlayerStateCopyWith<$Res>
    implements $VodPlayerStateCopyWith<$Res> {
  factory _$VodPlayerStateCopyWith(
    _VodPlayerState value,
    $Res Function(_VodPlayerState) _then,
  ) = __$VodPlayerStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    VodPlayerOverlayMode overlayMode,
    String activeSlotId,
    String primarySlotId,
    List<VodPlayerSlotState> slots,
    SettingsPreferences settingsPreferences,
    GroupCollection groupCollection,
    double playbackSpeed,
    VodPlayerBrowseLoadStatus browseStatus,
    List<Vod> browseItems,
    int? browseNextPage,
    bool browseHasMore,
    bool browseLoadingMore,
    VodPlayerBrowseFallbackAction browseFallbackAction,
    VodPlayerFeedbackType? feedbackType,
    int feedbackSerial,
  });

  @override
  $SettingsPreferencesCopyWith<$Res> get settingsPreferences;
  @override
  $GroupCollectionCopyWith<$Res> get groupCollection;
}

/// @nodoc
class __$VodPlayerStateCopyWithImpl<$Res>
    implements _$VodPlayerStateCopyWith<$Res> {
  __$VodPlayerStateCopyWithImpl(this._self, this._then);

  final _VodPlayerState _self;
  final $Res Function(_VodPlayerState) _then;

  /// Create a copy of VodPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? overlayMode = null,
    Object? activeSlotId = null,
    Object? primarySlotId = null,
    Object? slots = null,
    Object? settingsPreferences = null,
    Object? groupCollection = null,
    Object? playbackSpeed = null,
    Object? browseStatus = null,
    Object? browseItems = null,
    Object? browseNextPage = freezed,
    Object? browseHasMore = null,
    Object? browseLoadingMore = null,
    Object? browseFallbackAction = null,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _VodPlayerState(
        overlayMode: null == overlayMode
            ? _self.overlayMode
            : overlayMode // ignore: cast_nullable_to_non_nullable
                  as VodPlayerOverlayMode,
        activeSlotId: null == activeSlotId
            ? _self.activeSlotId
            : activeSlotId // ignore: cast_nullable_to_non_nullable
                  as String,
        primarySlotId: null == primarySlotId
            ? _self.primarySlotId
            : primarySlotId // ignore: cast_nullable_to_non_nullable
                  as String,
        slots: null == slots
            ? _self._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<VodPlayerSlotState>,
        settingsPreferences: null == settingsPreferences
            ? _self.settingsPreferences
            : settingsPreferences // ignore: cast_nullable_to_non_nullable
                  as SettingsPreferences,
        groupCollection: null == groupCollection
            ? _self.groupCollection
            : groupCollection // ignore: cast_nullable_to_non_nullable
                  as GroupCollection,
        playbackSpeed: null == playbackSpeed
            ? _self.playbackSpeed
            : playbackSpeed // ignore: cast_nullable_to_non_nullable
                  as double,
        browseStatus: null == browseStatus
            ? _self.browseStatus
            : browseStatus // ignore: cast_nullable_to_non_nullable
                  as VodPlayerBrowseLoadStatus,
        browseItems: null == browseItems
            ? _self._browseItems
            : browseItems // ignore: cast_nullable_to_non_nullable
                  as List<Vod>,
        browseNextPage: freezed == browseNextPage
            ? _self.browseNextPage
            : browseNextPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        browseHasMore: null == browseHasMore
            ? _self.browseHasMore
            : browseHasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseLoadingMore: null == browseLoadingMore
            ? _self.browseLoadingMore
            : browseLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        browseFallbackAction: null == browseFallbackAction
            ? _self.browseFallbackAction
            : browseFallbackAction // ignore: cast_nullable_to_non_nullable
                  as VodPlayerBrowseFallbackAction,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as VodPlayerFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of VodPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsPreferencesCopyWith<$Res> get settingsPreferences {
    return $SettingsPreferencesCopyWith<$Res>(_self.settingsPreferences, (
      value,
    ) {
      return _then(_self.copyWith(settingsPreferences: value));
    });
  }

  /// Create a copy of VodPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupCollectionCopyWith<$Res> get groupCollection {
    return $GroupCollectionCopyWith<$Res>(_self.groupCollection, (value) {
      return _then(_self.copyWith(groupCollection: value));
    });
  }
}

/// @nodoc
mixin _$VodPlayerSlotState {
  String get slotId;
  VodPlayerSlotStatus get status;
  int? get videoNo;
  String? get videoId;
  String? get fallbackTitle;
  String? get fallbackThumbnailImageUrl;
  String? get fallbackChannelId;
  String? get fallbackChannelName;
  bool get fallbackChannelVerified;
  VodDetail? get detail;
  Uri? get playbackUri;
  VodPlaybackCache? get playbackCache;
  VodSeekThumbnail? get seekThumbnail;
  List<int> get availableResolutionIndexes;
  PlayerVideoViewType get videoViewType;
  Duration get position;
  Duration get duration;
  Duration get startPosition;
  ChannelMyInfo? get channelMyInfo;
  VodPlayerFailureReason? get failureReason;

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlayerSlotStateCopyWith<VodPlayerSlotState> get copyWith =>
      _$VodPlayerSlotStateCopyWithImpl<VodPlayerSlotState>(
        this as VodPlayerSlotState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlayerSlotState &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.fallbackTitle, fallbackTitle) ||
                other.fallbackTitle == fallbackTitle) &&
            (identical(
                  other.fallbackThumbnailImageUrl,
                  fallbackThumbnailImageUrl,
                ) ||
                other.fallbackThumbnailImageUrl == fallbackThumbnailImageUrl) &&
            (identical(other.fallbackChannelId, fallbackChannelId) ||
                other.fallbackChannelId == fallbackChannelId) &&
            (identical(other.fallbackChannelName, fallbackChannelName) ||
                other.fallbackChannelName == fallbackChannelName) &&
            (identical(
                  other.fallbackChannelVerified,
                  fallbackChannelVerified,
                ) ||
                other.fallbackChannelVerified == fallbackChannelVerified) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri) &&
            (identical(other.playbackCache, playbackCache) ||
                other.playbackCache == playbackCache) &&
            (identical(other.seekThumbnail, seekThumbnail) ||
                other.seekThumbnail == seekThumbnail) &&
            const DeepCollectionEquality().equals(
              other.availableResolutionIndexes,
              availableResolutionIndexes,
            ) &&
            (identical(other.videoViewType, videoViewType) ||
                other.videoViewType == videoViewType) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.startPosition, startPosition) ||
                other.startPosition == startPosition) &&
            (identical(other.channelMyInfo, channelMyInfo) ||
                other.channelMyInfo == channelMyInfo) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    slotId,
    status,
    videoNo,
    videoId,
    fallbackTitle,
    fallbackThumbnailImageUrl,
    fallbackChannelId,
    fallbackChannelName,
    fallbackChannelVerified,
    detail,
    playbackUri,
    playbackCache,
    seekThumbnail,
    const DeepCollectionEquality().hash(availableResolutionIndexes),
    videoViewType,
    position,
    duration,
    startPosition,
    channelMyInfo,
    failureReason,
  ]);

  @override
  String toString() {
    return 'VodPlayerSlotState(slotId: $slotId, status: $status, videoNo: $videoNo, videoId: $videoId, fallbackTitle: $fallbackTitle, fallbackThumbnailImageUrl: $fallbackThumbnailImageUrl, fallbackChannelId: $fallbackChannelId, fallbackChannelName: $fallbackChannelName, fallbackChannelVerified: $fallbackChannelVerified, detail: $detail, playbackUri: $playbackUri, playbackCache: $playbackCache, seekThumbnail: $seekThumbnail, availableResolutionIndexes: $availableResolutionIndexes, videoViewType: $videoViewType, position: $position, duration: $duration, startPosition: $startPosition, channelMyInfo: $channelMyInfo, failureReason: $failureReason)';
  }
}

/// @nodoc
abstract mixin class $VodPlayerSlotStateCopyWith<$Res> {
  factory $VodPlayerSlotStateCopyWith(
    VodPlayerSlotState value,
    $Res Function(VodPlayerSlotState) _then,
  ) = _$VodPlayerSlotStateCopyWithImpl;
  @useResult
  $Res call({
    String slotId,
    VodPlayerSlotStatus status,
    int? videoNo,
    String? videoId,
    String? fallbackTitle,
    String? fallbackThumbnailImageUrl,
    String? fallbackChannelId,
    String? fallbackChannelName,
    bool fallbackChannelVerified,
    VodDetail? detail,
    Uri? playbackUri,
    VodPlaybackCache? playbackCache,
    VodSeekThumbnail? seekThumbnail,
    List<int> availableResolutionIndexes,
    PlayerVideoViewType videoViewType,
    Duration position,
    Duration duration,
    Duration startPosition,
    ChannelMyInfo? channelMyInfo,
    VodPlayerFailureReason? failureReason,
  });

  $VodDetailCopyWith<$Res>? get detail;
  $VodSeekThumbnailCopyWith<$Res>? get seekThumbnail;
  $ChannelMyInfoCopyWith<$Res>? get channelMyInfo;
}

/// @nodoc
class _$VodPlayerSlotStateCopyWithImpl<$Res>
    implements $VodPlayerSlotStateCopyWith<$Res> {
  _$VodPlayerSlotStateCopyWithImpl(this._self, this._then);

  final VodPlayerSlotState _self;
  final $Res Function(VodPlayerSlotState) _then;

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotId = null,
    Object? status = null,
    Object? videoNo = freezed,
    Object? videoId = freezed,
    Object? fallbackTitle = freezed,
    Object? fallbackThumbnailImageUrl = freezed,
    Object? fallbackChannelId = freezed,
    Object? fallbackChannelName = freezed,
    Object? fallbackChannelVerified = null,
    Object? detail = freezed,
    Object? playbackUri = freezed,
    Object? playbackCache = freezed,
    Object? seekThumbnail = freezed,
    Object? availableResolutionIndexes = null,
    Object? videoViewType = null,
    Object? position = null,
    Object? duration = null,
    Object? startPosition = null,
    Object? channelMyInfo = freezed,
    Object? failureReason = freezed,
  }) {
    return _then(
      _self.copyWith(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as VodPlayerSlotStatus,
        videoNo: freezed == videoNo
            ? _self.videoNo
            : videoNo // ignore: cast_nullable_to_non_nullable
                  as int?,
        videoId: freezed == videoId
            ? _self.videoId
            : videoId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackTitle: freezed == fallbackTitle
            ? _self.fallbackTitle
            : fallbackTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackThumbnailImageUrl: freezed == fallbackThumbnailImageUrl
            ? _self.fallbackThumbnailImageUrl
            : fallbackThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackChannelId: freezed == fallbackChannelId
            ? _self.fallbackChannelId
            : fallbackChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackChannelName: freezed == fallbackChannelName
            ? _self.fallbackChannelName
            : fallbackChannelName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackChannelVerified: null == fallbackChannelVerified
            ? _self.fallbackChannelVerified
            : fallbackChannelVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        detail: freezed == detail
            ? _self.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as VodDetail?,
        playbackUri: freezed == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri?,
        playbackCache: freezed == playbackCache
            ? _self.playbackCache
            : playbackCache // ignore: cast_nullable_to_non_nullable
                  as VodPlaybackCache?,
        seekThumbnail: freezed == seekThumbnail
            ? _self.seekThumbnail
            : seekThumbnail // ignore: cast_nullable_to_non_nullable
                  as VodSeekThumbnail?,
        availableResolutionIndexes: null == availableResolutionIndexes
            ? _self.availableResolutionIndexes
            : availableResolutionIndexes // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        videoViewType: null == videoViewType
            ? _self.videoViewType
            : videoViewType // ignore: cast_nullable_to_non_nullable
                  as PlayerVideoViewType,
        position: null == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as Duration,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        startPosition: null == startPosition
            ? _self.startPosition
            : startPosition // ignore: cast_nullable_to_non_nullable
                  as Duration,
        channelMyInfo: freezed == channelMyInfo
            ? _self.channelMyInfo
            : channelMyInfo // ignore: cast_nullable_to_non_nullable
                  as ChannelMyInfo?,
        failureReason: freezed == failureReason
            ? _self.failureReason
            : failureReason // ignore: cast_nullable_to_non_nullable
                  as VodPlayerFailureReason?,
      ),
    );
  }

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $VodDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodSeekThumbnailCopyWith<$Res>? get seekThumbnail {
    if (_self.seekThumbnail == null) {
      return null;
    }

    return $VodSeekThumbnailCopyWith<$Res>(_self.seekThumbnail!, (value) {
      return _then(_self.copyWith(seekThumbnail: value));
    });
  }

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelMyInfoCopyWith<$Res>? get channelMyInfo {
    if (_self.channelMyInfo == null) {
      return null;
    }

    return $ChannelMyInfoCopyWith<$Res>(_self.channelMyInfo!, (value) {
      return _then(_self.copyWith(channelMyInfo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodPlayerSlotState].
extension VodPlayerSlotStatePatterns on VodPlayerSlotState {
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
    TResult Function(_VodPlayerSlotState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlayerSlotState() when $default != null:
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
    TResult Function(_VodPlayerSlotState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayerSlotState():
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
    TResult? Function(_VodPlayerSlotState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayerSlotState() when $default != null:
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
      String slotId,
      VodPlayerSlotStatus status,
      int? videoNo,
      String? videoId,
      String? fallbackTitle,
      String? fallbackThumbnailImageUrl,
      String? fallbackChannelId,
      String? fallbackChannelName,
      bool fallbackChannelVerified,
      VodDetail? detail,
      Uri? playbackUri,
      VodPlaybackCache? playbackCache,
      VodSeekThumbnail? seekThumbnail,
      List<int> availableResolutionIndexes,
      PlayerVideoViewType videoViewType,
      Duration position,
      Duration duration,
      Duration startPosition,
      ChannelMyInfo? channelMyInfo,
      VodPlayerFailureReason? failureReason,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlayerSlotState() when $default != null:
        return $default(
          _that.slotId,
          _that.status,
          _that.videoNo,
          _that.videoId,
          _that.fallbackTitle,
          _that.fallbackThumbnailImageUrl,
          _that.fallbackChannelId,
          _that.fallbackChannelName,
          _that.fallbackChannelVerified,
          _that.detail,
          _that.playbackUri,
          _that.playbackCache,
          _that.seekThumbnail,
          _that.availableResolutionIndexes,
          _that.videoViewType,
          _that.position,
          _that.duration,
          _that.startPosition,
          _that.channelMyInfo,
          _that.failureReason,
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
      String slotId,
      VodPlayerSlotStatus status,
      int? videoNo,
      String? videoId,
      String? fallbackTitle,
      String? fallbackThumbnailImageUrl,
      String? fallbackChannelId,
      String? fallbackChannelName,
      bool fallbackChannelVerified,
      VodDetail? detail,
      Uri? playbackUri,
      VodPlaybackCache? playbackCache,
      VodSeekThumbnail? seekThumbnail,
      List<int> availableResolutionIndexes,
      PlayerVideoViewType videoViewType,
      Duration position,
      Duration duration,
      Duration startPosition,
      ChannelMyInfo? channelMyInfo,
      VodPlayerFailureReason? failureReason,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayerSlotState():
        return $default(
          _that.slotId,
          _that.status,
          _that.videoNo,
          _that.videoId,
          _that.fallbackTitle,
          _that.fallbackThumbnailImageUrl,
          _that.fallbackChannelId,
          _that.fallbackChannelName,
          _that.fallbackChannelVerified,
          _that.detail,
          _that.playbackUri,
          _that.playbackCache,
          _that.seekThumbnail,
          _that.availableResolutionIndexes,
          _that.videoViewType,
          _that.position,
          _that.duration,
          _that.startPosition,
          _that.channelMyInfo,
          _that.failureReason,
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
      String slotId,
      VodPlayerSlotStatus status,
      int? videoNo,
      String? videoId,
      String? fallbackTitle,
      String? fallbackThumbnailImageUrl,
      String? fallbackChannelId,
      String? fallbackChannelName,
      bool fallbackChannelVerified,
      VodDetail? detail,
      Uri? playbackUri,
      VodPlaybackCache? playbackCache,
      VodSeekThumbnail? seekThumbnail,
      List<int> availableResolutionIndexes,
      PlayerVideoViewType videoViewType,
      Duration position,
      Duration duration,
      Duration startPosition,
      ChannelMyInfo? channelMyInfo,
      VodPlayerFailureReason? failureReason,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayerSlotState() when $default != null:
        return $default(
          _that.slotId,
          _that.status,
          _that.videoNo,
          _that.videoId,
          _that.fallbackTitle,
          _that.fallbackThumbnailImageUrl,
          _that.fallbackChannelId,
          _that.fallbackChannelName,
          _that.fallbackChannelVerified,
          _that.detail,
          _that.playbackUri,
          _that.playbackCache,
          _that.seekThumbnail,
          _that.availableResolutionIndexes,
          _that.videoViewType,
          _that.position,
          _that.duration,
          _that.startPosition,
          _that.channelMyInfo,
          _that.failureReason,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VodPlayerSlotState extends VodPlayerSlotState {
  const _VodPlayerSlotState({
    required this.slotId,
    this.status = VodPlayerSlotStatus.empty,
    this.videoNo,
    this.videoId,
    this.fallbackTitle,
    this.fallbackThumbnailImageUrl,
    this.fallbackChannelId,
    this.fallbackChannelName,
    this.fallbackChannelVerified = false,
    this.detail,
    this.playbackUri,
    this.playbackCache,
    this.seekThumbnail,
    final List<int> availableResolutionIndexes = const <int>[
      VodPlaybackResolutionOptions.autoIndex,
    ],
    this.videoViewType = PlayerVideoViewType.textureView,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.startPosition = Duration.zero,
    this.channelMyInfo,
    this.failureReason,
  }) : _availableResolutionIndexes = availableResolutionIndexes,
       super._();

  @override
  final String slotId;
  @override
  @JsonKey()
  final VodPlayerSlotStatus status;
  @override
  final int? videoNo;
  @override
  final String? videoId;
  @override
  final String? fallbackTitle;
  @override
  final String? fallbackThumbnailImageUrl;
  @override
  final String? fallbackChannelId;
  @override
  final String? fallbackChannelName;
  @override
  @JsonKey()
  final bool fallbackChannelVerified;
  @override
  final VodDetail? detail;
  @override
  final Uri? playbackUri;
  @override
  final VodPlaybackCache? playbackCache;
  @override
  final VodSeekThumbnail? seekThumbnail;
  final List<int> _availableResolutionIndexes;
  @override
  @JsonKey()
  List<int> get availableResolutionIndexes {
    if (_availableResolutionIndexes is EqualUnmodifiableListView)
      return _availableResolutionIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableResolutionIndexes);
  }

  @override
  @JsonKey()
  final PlayerVideoViewType videoViewType;
  @override
  @JsonKey()
  final Duration position;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final Duration startPosition;
  @override
  final ChannelMyInfo? channelMyInfo;
  @override
  final VodPlayerFailureReason? failureReason;

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlayerSlotStateCopyWith<_VodPlayerSlotState> get copyWith =>
      __$VodPlayerSlotStateCopyWithImpl<_VodPlayerSlotState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlayerSlotState &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.fallbackTitle, fallbackTitle) ||
                other.fallbackTitle == fallbackTitle) &&
            (identical(
                  other.fallbackThumbnailImageUrl,
                  fallbackThumbnailImageUrl,
                ) ||
                other.fallbackThumbnailImageUrl == fallbackThumbnailImageUrl) &&
            (identical(other.fallbackChannelId, fallbackChannelId) ||
                other.fallbackChannelId == fallbackChannelId) &&
            (identical(other.fallbackChannelName, fallbackChannelName) ||
                other.fallbackChannelName == fallbackChannelName) &&
            (identical(
                  other.fallbackChannelVerified,
                  fallbackChannelVerified,
                ) ||
                other.fallbackChannelVerified == fallbackChannelVerified) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.playbackUri, playbackUri) ||
                other.playbackUri == playbackUri) &&
            (identical(other.playbackCache, playbackCache) ||
                other.playbackCache == playbackCache) &&
            (identical(other.seekThumbnail, seekThumbnail) ||
                other.seekThumbnail == seekThumbnail) &&
            const DeepCollectionEquality().equals(
              other._availableResolutionIndexes,
              _availableResolutionIndexes,
            ) &&
            (identical(other.videoViewType, videoViewType) ||
                other.videoViewType == videoViewType) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.startPosition, startPosition) ||
                other.startPosition == startPosition) &&
            (identical(other.channelMyInfo, channelMyInfo) ||
                other.channelMyInfo == channelMyInfo) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    slotId,
    status,
    videoNo,
    videoId,
    fallbackTitle,
    fallbackThumbnailImageUrl,
    fallbackChannelId,
    fallbackChannelName,
    fallbackChannelVerified,
    detail,
    playbackUri,
    playbackCache,
    seekThumbnail,
    const DeepCollectionEquality().hash(_availableResolutionIndexes),
    videoViewType,
    position,
    duration,
    startPosition,
    channelMyInfo,
    failureReason,
  ]);

  @override
  String toString() {
    return 'VodPlayerSlotState(slotId: $slotId, status: $status, videoNo: $videoNo, videoId: $videoId, fallbackTitle: $fallbackTitle, fallbackThumbnailImageUrl: $fallbackThumbnailImageUrl, fallbackChannelId: $fallbackChannelId, fallbackChannelName: $fallbackChannelName, fallbackChannelVerified: $fallbackChannelVerified, detail: $detail, playbackUri: $playbackUri, playbackCache: $playbackCache, seekThumbnail: $seekThumbnail, availableResolutionIndexes: $availableResolutionIndexes, videoViewType: $videoViewType, position: $position, duration: $duration, startPosition: $startPosition, channelMyInfo: $channelMyInfo, failureReason: $failureReason)';
  }
}

/// @nodoc
abstract mixin class _$VodPlayerSlotStateCopyWith<$Res>
    implements $VodPlayerSlotStateCopyWith<$Res> {
  factory _$VodPlayerSlotStateCopyWith(
    _VodPlayerSlotState value,
    $Res Function(_VodPlayerSlotState) _then,
  ) = __$VodPlayerSlotStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String slotId,
    VodPlayerSlotStatus status,
    int? videoNo,
    String? videoId,
    String? fallbackTitle,
    String? fallbackThumbnailImageUrl,
    String? fallbackChannelId,
    String? fallbackChannelName,
    bool fallbackChannelVerified,
    VodDetail? detail,
    Uri? playbackUri,
    VodPlaybackCache? playbackCache,
    VodSeekThumbnail? seekThumbnail,
    List<int> availableResolutionIndexes,
    PlayerVideoViewType videoViewType,
    Duration position,
    Duration duration,
    Duration startPosition,
    ChannelMyInfo? channelMyInfo,
    VodPlayerFailureReason? failureReason,
  });

  @override
  $VodDetailCopyWith<$Res>? get detail;
  @override
  $VodSeekThumbnailCopyWith<$Res>? get seekThumbnail;
  @override
  $ChannelMyInfoCopyWith<$Res>? get channelMyInfo;
}

/// @nodoc
class __$VodPlayerSlotStateCopyWithImpl<$Res>
    implements _$VodPlayerSlotStateCopyWith<$Res> {
  __$VodPlayerSlotStateCopyWithImpl(this._self, this._then);

  final _VodPlayerSlotState _self;
  final $Res Function(_VodPlayerSlotState) _then;

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? slotId = null,
    Object? status = null,
    Object? videoNo = freezed,
    Object? videoId = freezed,
    Object? fallbackTitle = freezed,
    Object? fallbackThumbnailImageUrl = freezed,
    Object? fallbackChannelId = freezed,
    Object? fallbackChannelName = freezed,
    Object? fallbackChannelVerified = null,
    Object? detail = freezed,
    Object? playbackUri = freezed,
    Object? playbackCache = freezed,
    Object? seekThumbnail = freezed,
    Object? availableResolutionIndexes = null,
    Object? videoViewType = null,
    Object? position = null,
    Object? duration = null,
    Object? startPosition = null,
    Object? channelMyInfo = freezed,
    Object? failureReason = freezed,
  }) {
    return _then(
      _VodPlayerSlotState(
        slotId: null == slotId
            ? _self.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as VodPlayerSlotStatus,
        videoNo: freezed == videoNo
            ? _self.videoNo
            : videoNo // ignore: cast_nullable_to_non_nullable
                  as int?,
        videoId: freezed == videoId
            ? _self.videoId
            : videoId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackTitle: freezed == fallbackTitle
            ? _self.fallbackTitle
            : fallbackTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackThumbnailImageUrl: freezed == fallbackThumbnailImageUrl
            ? _self.fallbackThumbnailImageUrl
            : fallbackThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackChannelId: freezed == fallbackChannelId
            ? _self.fallbackChannelId
            : fallbackChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackChannelName: freezed == fallbackChannelName
            ? _self.fallbackChannelName
            : fallbackChannelName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fallbackChannelVerified: null == fallbackChannelVerified
            ? _self.fallbackChannelVerified
            : fallbackChannelVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        detail: freezed == detail
            ? _self.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as VodDetail?,
        playbackUri: freezed == playbackUri
            ? _self.playbackUri
            : playbackUri // ignore: cast_nullable_to_non_nullable
                  as Uri?,
        playbackCache: freezed == playbackCache
            ? _self.playbackCache
            : playbackCache // ignore: cast_nullable_to_non_nullable
                  as VodPlaybackCache?,
        seekThumbnail: freezed == seekThumbnail
            ? _self.seekThumbnail
            : seekThumbnail // ignore: cast_nullable_to_non_nullable
                  as VodSeekThumbnail?,
        availableResolutionIndexes: null == availableResolutionIndexes
            ? _self._availableResolutionIndexes
            : availableResolutionIndexes // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        videoViewType: null == videoViewType
            ? _self.videoViewType
            : videoViewType // ignore: cast_nullable_to_non_nullable
                  as PlayerVideoViewType,
        position: null == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as Duration,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        startPosition: null == startPosition
            ? _self.startPosition
            : startPosition // ignore: cast_nullable_to_non_nullable
                  as Duration,
        channelMyInfo: freezed == channelMyInfo
            ? _self.channelMyInfo
            : channelMyInfo // ignore: cast_nullable_to_non_nullable
                  as ChannelMyInfo?,
        failureReason: freezed == failureReason
            ? _self.failureReason
            : failureReason // ignore: cast_nullable_to_non_nullable
                  as VodPlayerFailureReason?,
      ),
    );
  }

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $VodDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodSeekThumbnailCopyWith<$Res>? get seekThumbnail {
    if (_self.seekThumbnail == null) {
      return null;
    }

    return $VodSeekThumbnailCopyWith<$Res>(_self.seekThumbnail!, (value) {
      return _then(_self.copyWith(seekThumbnail: value));
    });
  }

  /// Create a copy of VodPlayerSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelMyInfoCopyWith<$Res>? get channelMyInfo {
    if (_self.channelMyInfo == null) {
      return null;
    }

    return $ChannelMyInfoCopyWith<$Res>(_self.channelMyInfo!, (value) {
      return _then(_self.copyWith(channelMyInfo: value));
    });
  }
}
