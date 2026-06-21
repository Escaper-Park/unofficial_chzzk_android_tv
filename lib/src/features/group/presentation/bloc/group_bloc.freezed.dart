// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GroupEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GroupEvent()';
  }
}

/// @nodoc
class $GroupEventCopyWith<$Res> {
  $GroupEventCopyWith(GroupEvent _, $Res Function(GroupEvent) __);
}

/// Adds pattern-matching-related methods to [GroupEvent].
extension GroupEventPatterns on GroupEvent {
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
    TResult Function(_TabSelected value)? tabSelected,
    TResult Function(_GroupSelected value)? groupSelected,
    TResult Function(_CreateInputSelected value)? createInputSelected,
    TResult Function(_CreateInputChanged value)? createInputChanged,
    TResult Function(_CreateSubmitted value)? createSubmitted,
    TResult Function(_KeyboardClosed value)? keyboardClosed,
    TResult Function(_GroupActivationRequested value)? groupActivationRequested,
    TResult Function(_GroupDeleteRequested value)? groupDeleteRequested,
    TResult Function(_ChannelModalOpened value)? channelModalOpened,
    TResult Function(_ChannelModalClosed value)? channelModalClosed,
    TResult Function(_MemberRemoveRequested value)? memberRemoveRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that);
      case _GroupSelected() when groupSelected != null:
        return groupSelected(_that);
      case _CreateInputSelected() when createInputSelected != null:
        return createInputSelected(_that);
      case _CreateInputChanged() when createInputChanged != null:
        return createInputChanged(_that);
      case _CreateSubmitted() when createSubmitted != null:
        return createSubmitted(_that);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed(_that);
      case _GroupActivationRequested() when groupActivationRequested != null:
        return groupActivationRequested(_that);
      case _GroupDeleteRequested() when groupDeleteRequested != null:
        return groupDeleteRequested(_that);
      case _ChannelModalOpened() when channelModalOpened != null:
        return channelModalOpened(_that);
      case _ChannelModalClosed() when channelModalClosed != null:
        return channelModalClosed(_that);
      case _MemberRemoveRequested() when memberRemoveRequested != null:
        return memberRemoveRequested(_that);
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
    required TResult Function(_TabSelected value) tabSelected,
    required TResult Function(_GroupSelected value) groupSelected,
    required TResult Function(_CreateInputSelected value) createInputSelected,
    required TResult Function(_CreateInputChanged value) createInputChanged,
    required TResult Function(_CreateSubmitted value) createSubmitted,
    required TResult Function(_KeyboardClosed value) keyboardClosed,
    required TResult Function(_GroupActivationRequested value)
    groupActivationRequested,
    required TResult Function(_GroupDeleteRequested value) groupDeleteRequested,
    required TResult Function(_ChannelModalOpened value) channelModalOpened,
    required TResult Function(_ChannelModalClosed value) channelModalClosed,
    required TResult Function(_MemberRemoveRequested value)
    memberRemoveRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _RetryRequested():
        return retryRequested(_that);
      case _TabSelected():
        return tabSelected(_that);
      case _GroupSelected():
        return groupSelected(_that);
      case _CreateInputSelected():
        return createInputSelected(_that);
      case _CreateInputChanged():
        return createInputChanged(_that);
      case _CreateSubmitted():
        return createSubmitted(_that);
      case _KeyboardClosed():
        return keyboardClosed(_that);
      case _GroupActivationRequested():
        return groupActivationRequested(_that);
      case _GroupDeleteRequested():
        return groupDeleteRequested(_that);
      case _ChannelModalOpened():
        return channelModalOpened(_that);
      case _ChannelModalClosed():
        return channelModalClosed(_that);
      case _MemberRemoveRequested():
        return memberRemoveRequested(_that);
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
    TResult? Function(_TabSelected value)? tabSelected,
    TResult? Function(_GroupSelected value)? groupSelected,
    TResult? Function(_CreateInputSelected value)? createInputSelected,
    TResult? Function(_CreateInputChanged value)? createInputChanged,
    TResult? Function(_CreateSubmitted value)? createSubmitted,
    TResult? Function(_KeyboardClosed value)? keyboardClosed,
    TResult? Function(_GroupActivationRequested value)?
    groupActivationRequested,
    TResult? Function(_GroupDeleteRequested value)? groupDeleteRequested,
    TResult? Function(_ChannelModalOpened value)? channelModalOpened,
    TResult? Function(_ChannelModalClosed value)? channelModalClosed,
    TResult? Function(_MemberRemoveRequested value)? memberRemoveRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that);
      case _GroupSelected() when groupSelected != null:
        return groupSelected(_that);
      case _CreateInputSelected() when createInputSelected != null:
        return createInputSelected(_that);
      case _CreateInputChanged() when createInputChanged != null:
        return createInputChanged(_that);
      case _CreateSubmitted() when createSubmitted != null:
        return createSubmitted(_that);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed(_that);
      case _GroupActivationRequested() when groupActivationRequested != null:
        return groupActivationRequested(_that);
      case _GroupDeleteRequested() when groupDeleteRequested != null:
        return groupDeleteRequested(_that);
      case _ChannelModalOpened() when channelModalOpened != null:
        return channelModalOpened(_that);
      case _ChannelModalClosed() when channelModalClosed != null:
        return channelModalClosed(_that);
      case _MemberRemoveRequested() when memberRemoveRequested != null:
        return memberRemoveRequested(_that);
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
    TResult Function()? retryRequested,
    TResult Function(GroupTab tab)? tabSelected,
    TResult Function(String groupId)? groupSelected,
    TResult Function()? createInputSelected,
    TResult Function(String value)? createInputChanged,
    TResult Function(String value)? createSubmitted,
    TResult Function()? keyboardClosed,
    TResult Function(String groupId)? groupActivationRequested,
    TResult Function(String groupId)? groupDeleteRequested,
    TResult Function(String groupId, GroupMemberItem channel)?
    channelModalOpened,
    TResult Function()? channelModalClosed,
    TResult Function(String groupId, String channelId)? memberRemoveRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _GroupSelected() when groupSelected != null:
        return groupSelected(_that.groupId);
      case _CreateInputSelected() when createInputSelected != null:
        return createInputSelected();
      case _CreateInputChanged() when createInputChanged != null:
        return createInputChanged(_that.value);
      case _CreateSubmitted() when createSubmitted != null:
        return createSubmitted(_that.value);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed();
      case _GroupActivationRequested() when groupActivationRequested != null:
        return groupActivationRequested(_that.groupId);
      case _GroupDeleteRequested() when groupDeleteRequested != null:
        return groupDeleteRequested(_that.groupId);
      case _ChannelModalOpened() when channelModalOpened != null:
        return channelModalOpened(_that.groupId, _that.channel);
      case _ChannelModalClosed() when channelModalClosed != null:
        return channelModalClosed();
      case _MemberRemoveRequested() when memberRemoveRequested != null:
        return memberRemoveRequested(_that.groupId, _that.channelId);
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
    required TResult Function() retryRequested,
    required TResult Function(GroupTab tab) tabSelected,
    required TResult Function(String groupId) groupSelected,
    required TResult Function() createInputSelected,
    required TResult Function(String value) createInputChanged,
    required TResult Function(String value) createSubmitted,
    required TResult Function() keyboardClosed,
    required TResult Function(String groupId) groupActivationRequested,
    required TResult Function(String groupId) groupDeleteRequested,
    required TResult Function(String groupId, GroupMemberItem channel)
    channelModalOpened,
    required TResult Function() channelModalClosed,
    required TResult Function(String groupId, String channelId)
    memberRemoveRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _RetryRequested():
        return retryRequested();
      case _TabSelected():
        return tabSelected(_that.tab);
      case _GroupSelected():
        return groupSelected(_that.groupId);
      case _CreateInputSelected():
        return createInputSelected();
      case _CreateInputChanged():
        return createInputChanged(_that.value);
      case _CreateSubmitted():
        return createSubmitted(_that.value);
      case _KeyboardClosed():
        return keyboardClosed();
      case _GroupActivationRequested():
        return groupActivationRequested(_that.groupId);
      case _GroupDeleteRequested():
        return groupDeleteRequested(_that.groupId);
      case _ChannelModalOpened():
        return channelModalOpened(_that.groupId, _that.channel);
      case _ChannelModalClosed():
        return channelModalClosed();
      case _MemberRemoveRequested():
        return memberRemoveRequested(_that.groupId, _that.channelId);
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
    TResult? Function()? retryRequested,
    TResult? Function(GroupTab tab)? tabSelected,
    TResult? Function(String groupId)? groupSelected,
    TResult? Function()? createInputSelected,
    TResult? Function(String value)? createInputChanged,
    TResult? Function(String value)? createSubmitted,
    TResult? Function()? keyboardClosed,
    TResult? Function(String groupId)? groupActivationRequested,
    TResult? Function(String groupId)? groupDeleteRequested,
    TResult? Function(String groupId, GroupMemberItem channel)?
    channelModalOpened,
    TResult? Function()? channelModalClosed,
    TResult? Function(String groupId, String channelId)? memberRemoveRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _RetryRequested() when retryRequested != null:
        return retryRequested();
      case _TabSelected() when tabSelected != null:
        return tabSelected(_that.tab);
      case _GroupSelected() when groupSelected != null:
        return groupSelected(_that.groupId);
      case _CreateInputSelected() when createInputSelected != null:
        return createInputSelected();
      case _CreateInputChanged() when createInputChanged != null:
        return createInputChanged(_that.value);
      case _CreateSubmitted() when createSubmitted != null:
        return createSubmitted(_that.value);
      case _KeyboardClosed() when keyboardClosed != null:
        return keyboardClosed();
      case _GroupActivationRequested() when groupActivationRequested != null:
        return groupActivationRequested(_that.groupId);
      case _GroupDeleteRequested() when groupDeleteRequested != null:
        return groupDeleteRequested(_that.groupId);
      case _ChannelModalOpened() when channelModalOpened != null:
        return channelModalOpened(_that.groupId, _that.channel);
      case _ChannelModalClosed() when channelModalClosed != null:
        return channelModalClosed();
      case _MemberRemoveRequested() when memberRemoveRequested != null:
        return memberRemoveRequested(_that.groupId, _that.channelId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements GroupEvent {
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
    return 'GroupEvent.started()';
  }
}

/// @nodoc

class _RetryRequested implements GroupEvent {
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
    return 'GroupEvent.retryRequested()';
  }
}

/// @nodoc

class _TabSelected implements GroupEvent {
  const _TabSelected(this.tab);

  final GroupTab tab;

  /// Create a copy of GroupEvent
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
    return 'GroupEvent.tabSelected(tab: $tab)';
  }
}

/// @nodoc
abstract mixin class _$TabSelectedCopyWith<$Res>
    implements $GroupEventCopyWith<$Res> {
  factory _$TabSelectedCopyWith(
    _TabSelected value,
    $Res Function(_TabSelected) _then,
  ) = __$TabSelectedCopyWithImpl;
  @useResult
  $Res call({GroupTab tab});
}

/// @nodoc
class __$TabSelectedCopyWithImpl<$Res> implements _$TabSelectedCopyWith<$Res> {
  __$TabSelectedCopyWithImpl(this._self, this._then);

  final _TabSelected _self;
  final $Res Function(_TabSelected) _then;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? tab = null}) {
    return _then(
      _TabSelected(
        null == tab
            ? _self.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as GroupTab,
      ),
    );
  }
}

/// @nodoc

class _GroupSelected implements GroupEvent {
  const _GroupSelected(this.groupId);

  final String groupId;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupSelectedCopyWith<_GroupSelected> get copyWith =>
      __$GroupSelectedCopyWithImpl<_GroupSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupSelected &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId);

  @override
  String toString() {
    return 'GroupEvent.groupSelected(groupId: $groupId)';
  }
}

/// @nodoc
abstract mixin class _$GroupSelectedCopyWith<$Res>
    implements $GroupEventCopyWith<$Res> {
  factory _$GroupSelectedCopyWith(
    _GroupSelected value,
    $Res Function(_GroupSelected) _then,
  ) = __$GroupSelectedCopyWithImpl;
  @useResult
  $Res call({String groupId});
}

/// @nodoc
class __$GroupSelectedCopyWithImpl<$Res>
    implements _$GroupSelectedCopyWith<$Res> {
  __$GroupSelectedCopyWithImpl(this._self, this._then);

  final _GroupSelected _self;
  final $Res Function(_GroupSelected) _then;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? groupId = null}) {
    return _then(
      _GroupSelected(
        null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _CreateInputSelected implements GroupEvent {
  const _CreateInputSelected();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CreateInputSelected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GroupEvent.createInputSelected()';
  }
}

/// @nodoc

class _CreateInputChanged implements GroupEvent {
  const _CreateInputChanged(this.value);

  final String value;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateInputChangedCopyWith<_CreateInputChanged> get copyWith =>
      __$CreateInputChangedCopyWithImpl<_CreateInputChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateInputChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'GroupEvent.createInputChanged(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$CreateInputChangedCopyWith<$Res>
    implements $GroupEventCopyWith<$Res> {
  factory _$CreateInputChangedCopyWith(
    _CreateInputChanged value,
    $Res Function(_CreateInputChanged) _then,
  ) = __$CreateInputChangedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$CreateInputChangedCopyWithImpl<$Res>
    implements _$CreateInputChangedCopyWith<$Res> {
  __$CreateInputChangedCopyWithImpl(this._self, this._then);

  final _CreateInputChanged _self;
  final $Res Function(_CreateInputChanged) _then;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? value = null}) {
    return _then(
      _CreateInputChanged(
        null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _CreateSubmitted implements GroupEvent {
  const _CreateSubmitted(this.value);

  final String value;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateSubmittedCopyWith<_CreateSubmitted> get copyWith =>
      __$CreateSubmittedCopyWithImpl<_CreateSubmitted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateSubmitted &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'GroupEvent.createSubmitted(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$CreateSubmittedCopyWith<$Res>
    implements $GroupEventCopyWith<$Res> {
  factory _$CreateSubmittedCopyWith(
    _CreateSubmitted value,
    $Res Function(_CreateSubmitted) _then,
  ) = __$CreateSubmittedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$CreateSubmittedCopyWithImpl<$Res>
    implements _$CreateSubmittedCopyWith<$Res> {
  __$CreateSubmittedCopyWithImpl(this._self, this._then);

  final _CreateSubmitted _self;
  final $Res Function(_CreateSubmitted) _then;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? value = null}) {
    return _then(
      _CreateSubmitted(
        null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _KeyboardClosed implements GroupEvent {
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
    return 'GroupEvent.keyboardClosed()';
  }
}

/// @nodoc

class _GroupActivationRequested implements GroupEvent {
  const _GroupActivationRequested(this.groupId);

  final String groupId;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupActivationRequestedCopyWith<_GroupActivationRequested> get copyWith =>
      __$GroupActivationRequestedCopyWithImpl<_GroupActivationRequested>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupActivationRequested &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId);

  @override
  String toString() {
    return 'GroupEvent.groupActivationRequested(groupId: $groupId)';
  }
}

/// @nodoc
abstract mixin class _$GroupActivationRequestedCopyWith<$Res>
    implements $GroupEventCopyWith<$Res> {
  factory _$GroupActivationRequestedCopyWith(
    _GroupActivationRequested value,
    $Res Function(_GroupActivationRequested) _then,
  ) = __$GroupActivationRequestedCopyWithImpl;
  @useResult
  $Res call({String groupId});
}

/// @nodoc
class __$GroupActivationRequestedCopyWithImpl<$Res>
    implements _$GroupActivationRequestedCopyWith<$Res> {
  __$GroupActivationRequestedCopyWithImpl(this._self, this._then);

  final _GroupActivationRequested _self;
  final $Res Function(_GroupActivationRequested) _then;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? groupId = null}) {
    return _then(
      _GroupActivationRequested(
        null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _GroupDeleteRequested implements GroupEvent {
  const _GroupDeleteRequested(this.groupId);

  final String groupId;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupDeleteRequestedCopyWith<_GroupDeleteRequested> get copyWith =>
      __$GroupDeleteRequestedCopyWithImpl<_GroupDeleteRequested>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupDeleteRequested &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId);

  @override
  String toString() {
    return 'GroupEvent.groupDeleteRequested(groupId: $groupId)';
  }
}

/// @nodoc
abstract mixin class _$GroupDeleteRequestedCopyWith<$Res>
    implements $GroupEventCopyWith<$Res> {
  factory _$GroupDeleteRequestedCopyWith(
    _GroupDeleteRequested value,
    $Res Function(_GroupDeleteRequested) _then,
  ) = __$GroupDeleteRequestedCopyWithImpl;
  @useResult
  $Res call({String groupId});
}

/// @nodoc
class __$GroupDeleteRequestedCopyWithImpl<$Res>
    implements _$GroupDeleteRequestedCopyWith<$Res> {
  __$GroupDeleteRequestedCopyWithImpl(this._self, this._then);

  final _GroupDeleteRequested _self;
  final $Res Function(_GroupDeleteRequested) _then;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? groupId = null}) {
    return _then(
      _GroupDeleteRequested(
        null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _ChannelModalOpened implements GroupEvent {
  const _ChannelModalOpened({required this.groupId, required this.channel});

  final String groupId;
  final GroupMemberItem channel;

  /// Create a copy of GroupEvent
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
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, channel);

  @override
  String toString() {
    return 'GroupEvent.channelModalOpened(groupId: $groupId, channel: $channel)';
  }
}

/// @nodoc
abstract mixin class _$ChannelModalOpenedCopyWith<$Res>
    implements $GroupEventCopyWith<$Res> {
  factory _$ChannelModalOpenedCopyWith(
    _ChannelModalOpened value,
    $Res Function(_ChannelModalOpened) _then,
  ) = __$ChannelModalOpenedCopyWithImpl;
  @useResult
  $Res call({String groupId, GroupMemberItem channel});

  $GroupMemberItemCopyWith<$Res> get channel;
}

/// @nodoc
class __$ChannelModalOpenedCopyWithImpl<$Res>
    implements _$ChannelModalOpenedCopyWith<$Res> {
  __$ChannelModalOpenedCopyWithImpl(this._self, this._then);

  final _ChannelModalOpened _self;
  final $Res Function(_ChannelModalOpened) _then;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? groupId = null, Object? channel = null}) {
    return _then(
      _ChannelModalOpened(
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
        channel: null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as GroupMemberItem,
      ),
    );
  }

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupMemberItemCopyWith<$Res> get channel {
    return $GroupMemberItemCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc

class _ChannelModalClosed implements GroupEvent {
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
    return 'GroupEvent.channelModalClosed()';
  }
}

/// @nodoc

class _MemberRemoveRequested implements GroupEvent {
  const _MemberRemoveRequested({
    required this.groupId,
    required this.channelId,
  });

  final String groupId;
  final String channelId;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberRemoveRequestedCopyWith<_MemberRemoveRequested> get copyWith =>
      __$MemberRemoveRequestedCopyWithImpl<_MemberRemoveRequested>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberRemoveRequested &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, channelId);

  @override
  String toString() {
    return 'GroupEvent.memberRemoveRequested(groupId: $groupId, channelId: $channelId)';
  }
}

/// @nodoc
abstract mixin class _$MemberRemoveRequestedCopyWith<$Res>
    implements $GroupEventCopyWith<$Res> {
  factory _$MemberRemoveRequestedCopyWith(
    _MemberRemoveRequested value,
    $Res Function(_MemberRemoveRequested) _then,
  ) = __$MemberRemoveRequestedCopyWithImpl;
  @useResult
  $Res call({String groupId, String channelId});
}

/// @nodoc
class __$MemberRemoveRequestedCopyWithImpl<$Res>
    implements _$MemberRemoveRequestedCopyWith<$Res> {
  __$MemberRemoveRequestedCopyWithImpl(this._self, this._then);

  final _MemberRemoveRequested _self;
  final $Res Function(_MemberRemoveRequested) _then;

  /// Create a copy of GroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? groupId = null, Object? channelId = null}) {
    return _then(
      _MemberRemoveRequested(
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$GroupChannelModalState {
  String get groupId;
  GroupMemberItem get channel;

  /// Create a copy of GroupChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupChannelModalStateCopyWith<GroupChannelModalState> get copyWith =>
      _$GroupChannelModalStateCopyWithImpl<GroupChannelModalState>(
        this as GroupChannelModalState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupChannelModalState &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, channel);

  @override
  String toString() {
    return 'GroupChannelModalState(groupId: $groupId, channel: $channel)';
  }
}

/// @nodoc
abstract mixin class $GroupChannelModalStateCopyWith<$Res> {
  factory $GroupChannelModalStateCopyWith(
    GroupChannelModalState value,
    $Res Function(GroupChannelModalState) _then,
  ) = _$GroupChannelModalStateCopyWithImpl;
  @useResult
  $Res call({String groupId, GroupMemberItem channel});

  $GroupMemberItemCopyWith<$Res> get channel;
}

/// @nodoc
class _$GroupChannelModalStateCopyWithImpl<$Res>
    implements $GroupChannelModalStateCopyWith<$Res> {
  _$GroupChannelModalStateCopyWithImpl(this._self, this._then);

  final GroupChannelModalState _self;
  final $Res Function(GroupChannelModalState) _then;

  /// Create a copy of GroupChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? groupId = null, Object? channel = null}) {
    return _then(
      _self.copyWith(
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
        channel: null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as GroupMemberItem,
      ),
    );
  }

  /// Create a copy of GroupChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupMemberItemCopyWith<$Res> get channel {
    return $GroupMemberItemCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GroupChannelModalState].
extension GroupChannelModalStatePatterns on GroupChannelModalState {
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
    TResult Function(_GroupChannelModalState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupChannelModalState() when $default != null:
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
    TResult Function(_GroupChannelModalState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupChannelModalState():
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
    TResult? Function(_GroupChannelModalState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupChannelModalState() when $default != null:
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
    TResult Function(String groupId, GroupMemberItem channel)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupChannelModalState() when $default != null:
        return $default(_that.groupId, _that.channel);
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
    TResult Function(String groupId, GroupMemberItem channel) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupChannelModalState():
        return $default(_that.groupId, _that.channel);
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
    TResult? Function(String groupId, GroupMemberItem channel)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupChannelModalState() when $default != null:
        return $default(_that.groupId, _that.channel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GroupChannelModalState implements GroupChannelModalState {
  const _GroupChannelModalState({required this.groupId, required this.channel});

  @override
  final String groupId;
  @override
  final GroupMemberItem channel;

  /// Create a copy of GroupChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupChannelModalStateCopyWith<_GroupChannelModalState> get copyWith =>
      __$GroupChannelModalStateCopyWithImpl<_GroupChannelModalState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupChannelModalState &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, channel);

  @override
  String toString() {
    return 'GroupChannelModalState(groupId: $groupId, channel: $channel)';
  }
}

/// @nodoc
abstract mixin class _$GroupChannelModalStateCopyWith<$Res>
    implements $GroupChannelModalStateCopyWith<$Res> {
  factory _$GroupChannelModalStateCopyWith(
    _GroupChannelModalState value,
    $Res Function(_GroupChannelModalState) _then,
  ) = __$GroupChannelModalStateCopyWithImpl;
  @override
  @useResult
  $Res call({String groupId, GroupMemberItem channel});

  @override
  $GroupMemberItemCopyWith<$Res> get channel;
}

/// @nodoc
class __$GroupChannelModalStateCopyWithImpl<$Res>
    implements _$GroupChannelModalStateCopyWith<$Res> {
  __$GroupChannelModalStateCopyWithImpl(this._self, this._then);

  final _GroupChannelModalState _self;
  final $Res Function(_GroupChannelModalState) _then;

  /// Create a copy of GroupChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? groupId = null, Object? channel = null}) {
    return _then(
      _GroupChannelModalState(
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
        channel: null == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as GroupMemberItem,
      ),
    );
  }

  /// Create a copy of GroupChannelModalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupMemberItemCopyWith<$Res> get channel {
    return $GroupMemberItemCopyWith<$Res>(_self.channel, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$GroupState {
  GroupLoadStatus get loadStatus;
  GroupTab get selectedTab;
  List<GroupItem> get groups;
  String? get selectedGroupId;
  String? get activatedGroupId;
  List<GroupMemberItem> get selectedGroupMembers;
  String get createInputValue;
  bool get isKeyboardOpen;
  GroupChannelModalState? get activeChannelModal;
  GroupFeedbackType? get feedbackType;
  int get feedbackSerial;

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupStateCopyWith<GroupState> get copyWith =>
      _$GroupStateCopyWithImpl<GroupState>(this as GroupState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupState &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            (identical(other.selectedGroupId, selectedGroupId) ||
                other.selectedGroupId == selectedGroupId) &&
            (identical(other.activatedGroupId, activatedGroupId) ||
                other.activatedGroupId == activatedGroupId) &&
            const DeepCollectionEquality().equals(
              other.selectedGroupMembers,
              selectedGroupMembers,
            ) &&
            (identical(other.createInputValue, createInputValue) ||
                other.createInputValue == createInputValue) &&
            (identical(other.isKeyboardOpen, isKeyboardOpen) ||
                other.isKeyboardOpen == isKeyboardOpen) &&
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
    loadStatus,
    selectedTab,
    const DeepCollectionEquality().hash(groups),
    selectedGroupId,
    activatedGroupId,
    const DeepCollectionEquality().hash(selectedGroupMembers),
    createInputValue,
    isKeyboardOpen,
    activeChannelModal,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'GroupState(loadStatus: $loadStatus, selectedTab: $selectedTab, groups: $groups, selectedGroupId: $selectedGroupId, activatedGroupId: $activatedGroupId, selectedGroupMembers: $selectedGroupMembers, createInputValue: $createInputValue, isKeyboardOpen: $isKeyboardOpen, activeChannelModal: $activeChannelModal, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class $GroupStateCopyWith<$Res> {
  factory $GroupStateCopyWith(
    GroupState value,
    $Res Function(GroupState) _then,
  ) = _$GroupStateCopyWithImpl;
  @useResult
  $Res call({
    GroupLoadStatus loadStatus,
    GroupTab selectedTab,
    List<GroupItem> groups,
    String? selectedGroupId,
    String? activatedGroupId,
    List<GroupMemberItem> selectedGroupMembers,
    String createInputValue,
    bool isKeyboardOpen,
    GroupChannelModalState? activeChannelModal,
    GroupFeedbackType? feedbackType,
    int feedbackSerial,
  });

  $GroupChannelModalStateCopyWith<$Res>? get activeChannelModal;
}

/// @nodoc
class _$GroupStateCopyWithImpl<$Res> implements $GroupStateCopyWith<$Res> {
  _$GroupStateCopyWithImpl(this._self, this._then);

  final GroupState _self;
  final $Res Function(GroupState) _then;

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadStatus = null,
    Object? selectedTab = null,
    Object? groups = null,
    Object? selectedGroupId = freezed,
    Object? activatedGroupId = freezed,
    Object? selectedGroupMembers = null,
    Object? createInputValue = null,
    Object? isKeyboardOpen = null,
    Object? activeChannelModal = freezed,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _self.copyWith(
        loadStatus: null == loadStatus
            ? _self.loadStatus
            : loadStatus // ignore: cast_nullable_to_non_nullable
                  as GroupLoadStatus,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as GroupTab,
        groups: null == groups
            ? _self.groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<GroupItem>,
        selectedGroupId: freezed == selectedGroupId
            ? _self.selectedGroupId
            : selectedGroupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        activatedGroupId: freezed == activatedGroupId
            ? _self.activatedGroupId
            : activatedGroupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedGroupMembers: null == selectedGroupMembers
            ? _self.selectedGroupMembers
            : selectedGroupMembers // ignore: cast_nullable_to_non_nullable
                  as List<GroupMemberItem>,
        createInputValue: null == createInputValue
            ? _self.createInputValue
            : createInputValue // ignore: cast_nullable_to_non_nullable
                  as String,
        isKeyboardOpen: null == isKeyboardOpen
            ? _self.isKeyboardOpen
            : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        activeChannelModal: freezed == activeChannelModal
            ? _self.activeChannelModal
            : activeChannelModal // ignore: cast_nullable_to_non_nullable
                  as GroupChannelModalState?,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as GroupFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupChannelModalStateCopyWith<$Res>? get activeChannelModal {
    if (_self.activeChannelModal == null) {
      return null;
    }

    return $GroupChannelModalStateCopyWith<$Res>(_self.activeChannelModal!, (
      value,
    ) {
      return _then(_self.copyWith(activeChannelModal: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GroupState].
extension GroupStatePatterns on GroupState {
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
    TResult Function(_GroupState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupState() when $default != null:
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
    TResult Function(_GroupState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupState():
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
    TResult? Function(_GroupState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupState() when $default != null:
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
      GroupLoadStatus loadStatus,
      GroupTab selectedTab,
      List<GroupItem> groups,
      String? selectedGroupId,
      String? activatedGroupId,
      List<GroupMemberItem> selectedGroupMembers,
      String createInputValue,
      bool isKeyboardOpen,
      GroupChannelModalState? activeChannelModal,
      GroupFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupState() when $default != null:
        return $default(
          _that.loadStatus,
          _that.selectedTab,
          _that.groups,
          _that.selectedGroupId,
          _that.activatedGroupId,
          _that.selectedGroupMembers,
          _that.createInputValue,
          _that.isKeyboardOpen,
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
      GroupLoadStatus loadStatus,
      GroupTab selectedTab,
      List<GroupItem> groups,
      String? selectedGroupId,
      String? activatedGroupId,
      List<GroupMemberItem> selectedGroupMembers,
      String createInputValue,
      bool isKeyboardOpen,
      GroupChannelModalState? activeChannelModal,
      GroupFeedbackType? feedbackType,
      int feedbackSerial,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupState():
        return $default(
          _that.loadStatus,
          _that.selectedTab,
          _that.groups,
          _that.selectedGroupId,
          _that.activatedGroupId,
          _that.selectedGroupMembers,
          _that.createInputValue,
          _that.isKeyboardOpen,
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
      GroupLoadStatus loadStatus,
      GroupTab selectedTab,
      List<GroupItem> groups,
      String? selectedGroupId,
      String? activatedGroupId,
      List<GroupMemberItem> selectedGroupMembers,
      String createInputValue,
      bool isKeyboardOpen,
      GroupChannelModalState? activeChannelModal,
      GroupFeedbackType? feedbackType,
      int feedbackSerial,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupState() when $default != null:
        return $default(
          _that.loadStatus,
          _that.selectedTab,
          _that.groups,
          _that.selectedGroupId,
          _that.activatedGroupId,
          _that.selectedGroupMembers,
          _that.createInputValue,
          _that.isKeyboardOpen,
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

class _GroupState extends GroupState {
  const _GroupState({
    this.loadStatus = GroupLoadStatus.initial,
    this.selectedTab = GroupTab.group,
    final List<GroupItem> groups = const <GroupItem>[],
    this.selectedGroupId,
    this.activatedGroupId,
    final List<GroupMemberItem> selectedGroupMembers =
        const <GroupMemberItem>[],
    this.createInputValue = '',
    this.isKeyboardOpen = false,
    this.activeChannelModal,
    this.feedbackType,
    this.feedbackSerial = 0,
  }) : _groups = groups,
       _selectedGroupMembers = selectedGroupMembers,
       super._();

  @override
  @JsonKey()
  final GroupLoadStatus loadStatus;
  @override
  @JsonKey()
  final GroupTab selectedTab;
  final List<GroupItem> _groups;
  @override
  @JsonKey()
  List<GroupItem> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final String? selectedGroupId;
  @override
  final String? activatedGroupId;
  final List<GroupMemberItem> _selectedGroupMembers;
  @override
  @JsonKey()
  List<GroupMemberItem> get selectedGroupMembers {
    if (_selectedGroupMembers is EqualUnmodifiableListView)
      return _selectedGroupMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedGroupMembers);
  }

  @override
  @JsonKey()
  final String createInputValue;
  @override
  @JsonKey()
  final bool isKeyboardOpen;
  @override
  final GroupChannelModalState? activeChannelModal;
  @override
  final GroupFeedbackType? feedbackType;
  @override
  @JsonKey()
  final int feedbackSerial;

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupStateCopyWith<_GroupState> get copyWith =>
      __$GroupStateCopyWithImpl<_GroupState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupState &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.selectedGroupId, selectedGroupId) ||
                other.selectedGroupId == selectedGroupId) &&
            (identical(other.activatedGroupId, activatedGroupId) ||
                other.activatedGroupId == activatedGroupId) &&
            const DeepCollectionEquality().equals(
              other._selectedGroupMembers,
              _selectedGroupMembers,
            ) &&
            (identical(other.createInputValue, createInputValue) ||
                other.createInputValue == createInputValue) &&
            (identical(other.isKeyboardOpen, isKeyboardOpen) ||
                other.isKeyboardOpen == isKeyboardOpen) &&
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
    loadStatus,
    selectedTab,
    const DeepCollectionEquality().hash(_groups),
    selectedGroupId,
    activatedGroupId,
    const DeepCollectionEquality().hash(_selectedGroupMembers),
    createInputValue,
    isKeyboardOpen,
    activeChannelModal,
    feedbackType,
    feedbackSerial,
  );

  @override
  String toString() {
    return 'GroupState(loadStatus: $loadStatus, selectedTab: $selectedTab, groups: $groups, selectedGroupId: $selectedGroupId, activatedGroupId: $activatedGroupId, selectedGroupMembers: $selectedGroupMembers, createInputValue: $createInputValue, isKeyboardOpen: $isKeyboardOpen, activeChannelModal: $activeChannelModal, feedbackType: $feedbackType, feedbackSerial: $feedbackSerial)';
  }
}

/// @nodoc
abstract mixin class _$GroupStateCopyWith<$Res>
    implements $GroupStateCopyWith<$Res> {
  factory _$GroupStateCopyWith(
    _GroupState value,
    $Res Function(_GroupState) _then,
  ) = __$GroupStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    GroupLoadStatus loadStatus,
    GroupTab selectedTab,
    List<GroupItem> groups,
    String? selectedGroupId,
    String? activatedGroupId,
    List<GroupMemberItem> selectedGroupMembers,
    String createInputValue,
    bool isKeyboardOpen,
    GroupChannelModalState? activeChannelModal,
    GroupFeedbackType? feedbackType,
    int feedbackSerial,
  });

  @override
  $GroupChannelModalStateCopyWith<$Res>? get activeChannelModal;
}

/// @nodoc
class __$GroupStateCopyWithImpl<$Res> implements _$GroupStateCopyWith<$Res> {
  __$GroupStateCopyWithImpl(this._self, this._then);

  final _GroupState _self;
  final $Res Function(_GroupState) _then;

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadStatus = null,
    Object? selectedTab = null,
    Object? groups = null,
    Object? selectedGroupId = freezed,
    Object? activatedGroupId = freezed,
    Object? selectedGroupMembers = null,
    Object? createInputValue = null,
    Object? isKeyboardOpen = null,
    Object? activeChannelModal = freezed,
    Object? feedbackType = freezed,
    Object? feedbackSerial = null,
  }) {
    return _then(
      _GroupState(
        loadStatus: null == loadStatus
            ? _self.loadStatus
            : loadStatus // ignore: cast_nullable_to_non_nullable
                  as GroupLoadStatus,
        selectedTab: null == selectedTab
            ? _self.selectedTab
            : selectedTab // ignore: cast_nullable_to_non_nullable
                  as GroupTab,
        groups: null == groups
            ? _self._groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<GroupItem>,
        selectedGroupId: freezed == selectedGroupId
            ? _self.selectedGroupId
            : selectedGroupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        activatedGroupId: freezed == activatedGroupId
            ? _self.activatedGroupId
            : activatedGroupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedGroupMembers: null == selectedGroupMembers
            ? _self._selectedGroupMembers
            : selectedGroupMembers // ignore: cast_nullable_to_non_nullable
                  as List<GroupMemberItem>,
        createInputValue: null == createInputValue
            ? _self.createInputValue
            : createInputValue // ignore: cast_nullable_to_non_nullable
                  as String,
        isKeyboardOpen: null == isKeyboardOpen
            ? _self.isKeyboardOpen
            : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        activeChannelModal: freezed == activeChannelModal
            ? _self.activeChannelModal
            : activeChannelModal // ignore: cast_nullable_to_non_nullable
                  as GroupChannelModalState?,
        feedbackType: freezed == feedbackType
            ? _self.feedbackType
            : feedbackType // ignore: cast_nullable_to_non_nullable
                  as GroupFeedbackType?,
        feedbackSerial: null == feedbackSerial
            ? _self.feedbackSerial
            : feedbackSerial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of GroupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupChannelModalStateCopyWith<$Res>? get activeChannelModal {
    if (_self.activeChannelModal == null) {
      return null;
    }

    return $GroupChannelModalStateCopyWith<$Res>(_self.activeChannelModal!, (
      value,
    ) {
      return _then(_self.copyWith(activeChannelModal: value));
    });
  }
}
