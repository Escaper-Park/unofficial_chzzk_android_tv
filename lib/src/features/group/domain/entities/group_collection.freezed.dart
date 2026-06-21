// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupCollection {
  List<GroupItem> get groups;
  String? get activatedGroupId;
  int get lastActivatedGroupIndex;

  /// Create a copy of GroupCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupCollectionCopyWith<GroupCollection> get copyWith =>
      _$GroupCollectionCopyWithImpl<GroupCollection>(
        this as GroupCollection,
        _$identity,
      );

  /// Serializes this GroupCollection to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupCollection &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            (identical(other.activatedGroupId, activatedGroupId) ||
                other.activatedGroupId == activatedGroupId) &&
            (identical(
                  other.lastActivatedGroupIndex,
                  lastActivatedGroupIndex,
                ) ||
                other.lastActivatedGroupIndex == lastActivatedGroupIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(groups),
    activatedGroupId,
    lastActivatedGroupIndex,
  );

  @override
  String toString() {
    return 'GroupCollection(groups: $groups, activatedGroupId: $activatedGroupId, lastActivatedGroupIndex: $lastActivatedGroupIndex)';
  }
}

/// @nodoc
abstract mixin class $GroupCollectionCopyWith<$Res> {
  factory $GroupCollectionCopyWith(
    GroupCollection value,
    $Res Function(GroupCollection) _then,
  ) = _$GroupCollectionCopyWithImpl;
  @useResult
  $Res call({
    List<GroupItem> groups,
    String? activatedGroupId,
    int lastActivatedGroupIndex,
  });
}

/// @nodoc
class _$GroupCollectionCopyWithImpl<$Res>
    implements $GroupCollectionCopyWith<$Res> {
  _$GroupCollectionCopyWithImpl(this._self, this._then);

  final GroupCollection _self;
  final $Res Function(GroupCollection) _then;

  /// Create a copy of GroupCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? activatedGroupId = freezed,
    Object? lastActivatedGroupIndex = null,
  }) {
    return _then(
      _self.copyWith(
        groups: null == groups
            ? _self.groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<GroupItem>,
        activatedGroupId: freezed == activatedGroupId
            ? _self.activatedGroupId
            : activatedGroupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastActivatedGroupIndex: null == lastActivatedGroupIndex
            ? _self.lastActivatedGroupIndex
            : lastActivatedGroupIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [GroupCollection].
extension GroupCollectionPatterns on GroupCollection {
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
    TResult Function(_GroupCollection value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupCollection() when $default != null:
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
    TResult Function(_GroupCollection value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupCollection():
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
    TResult? Function(_GroupCollection value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupCollection() when $default != null:
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
      List<GroupItem> groups,
      String? activatedGroupId,
      int lastActivatedGroupIndex,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupCollection() when $default != null:
        return $default(
          _that.groups,
          _that.activatedGroupId,
          _that.lastActivatedGroupIndex,
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
      List<GroupItem> groups,
      String? activatedGroupId,
      int lastActivatedGroupIndex,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupCollection():
        return $default(
          _that.groups,
          _that.activatedGroupId,
          _that.lastActivatedGroupIndex,
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
      List<GroupItem> groups,
      String? activatedGroupId,
      int lastActivatedGroupIndex,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupCollection() when $default != null:
        return $default(
          _that.groups,
          _that.activatedGroupId,
          _that.lastActivatedGroupIndex,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupCollection extends GroupCollection {
  const _GroupCollection({
    final List<GroupItem> groups = const <GroupItem>[],
    this.activatedGroupId,
    this.lastActivatedGroupIndex = 0,
  }) : _groups = groups,
       super._();
  factory _GroupCollection.fromJson(Map<String, dynamic> json) =>
      _$GroupCollectionFromJson(json);

  final List<GroupItem> _groups;
  @override
  @JsonKey()
  List<GroupItem> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final String? activatedGroupId;
  @override
  @JsonKey()
  final int lastActivatedGroupIndex;

  /// Create a copy of GroupCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupCollectionCopyWith<_GroupCollection> get copyWith =>
      __$GroupCollectionCopyWithImpl<_GroupCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupCollectionToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupCollection &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.activatedGroupId, activatedGroupId) ||
                other.activatedGroupId == activatedGroupId) &&
            (identical(
                  other.lastActivatedGroupIndex,
                  lastActivatedGroupIndex,
                ) ||
                other.lastActivatedGroupIndex == lastActivatedGroupIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_groups),
    activatedGroupId,
    lastActivatedGroupIndex,
  );

  @override
  String toString() {
    return 'GroupCollection(groups: $groups, activatedGroupId: $activatedGroupId, lastActivatedGroupIndex: $lastActivatedGroupIndex)';
  }
}

/// @nodoc
abstract mixin class _$GroupCollectionCopyWith<$Res>
    implements $GroupCollectionCopyWith<$Res> {
  factory _$GroupCollectionCopyWith(
    _GroupCollection value,
    $Res Function(_GroupCollection) _then,
  ) = __$GroupCollectionCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<GroupItem> groups,
    String? activatedGroupId,
    int lastActivatedGroupIndex,
  });
}

/// @nodoc
class __$GroupCollectionCopyWithImpl<$Res>
    implements _$GroupCollectionCopyWith<$Res> {
  __$GroupCollectionCopyWithImpl(this._self, this._then);

  final _GroupCollection _self;
  final $Res Function(_GroupCollection) _then;

  /// Create a copy of GroupCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groups = null,
    Object? activatedGroupId = freezed,
    Object? lastActivatedGroupIndex = null,
  }) {
    return _then(
      _GroupCollection(
        groups: null == groups
            ? _self._groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<GroupItem>,
        activatedGroupId: freezed == activatedGroupId
            ? _self.activatedGroupId
            : activatedGroupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastActivatedGroupIndex: null == lastActivatedGroupIndex
            ? _self.lastActivatedGroupIndex
            : lastActivatedGroupIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$GroupItem {
  String get id;
  String get groupName;
  List<String> get memberChannelIds;

  /// Create a copy of GroupItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupItemCopyWith<GroupItem> get copyWith =>
      _$GroupItemCopyWithImpl<GroupItem>(this as GroupItem, _$identity);

  /// Serializes this GroupItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            const DeepCollectionEquality().equals(
              other.memberChannelIds,
              memberChannelIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    groupName,
    const DeepCollectionEquality().hash(memberChannelIds),
  );

  @override
  String toString() {
    return 'GroupItem(id: $id, groupName: $groupName, memberChannelIds: $memberChannelIds)';
  }
}

/// @nodoc
abstract mixin class $GroupItemCopyWith<$Res> {
  factory $GroupItemCopyWith(GroupItem value, $Res Function(GroupItem) _then) =
      _$GroupItemCopyWithImpl;
  @useResult
  $Res call({String id, String groupName, List<String> memberChannelIds});
}

/// @nodoc
class _$GroupItemCopyWithImpl<$Res> implements $GroupItemCopyWith<$Res> {
  _$GroupItemCopyWithImpl(this._self, this._then);

  final GroupItem _self;
  final $Res Function(GroupItem) _then;

  /// Create a copy of GroupItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? memberChannelIds = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        groupName: null == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String,
        memberChannelIds: null == memberChannelIds
            ? _self.memberChannelIds
            : memberChannelIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [GroupItem].
extension GroupItemPatterns on GroupItem {
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
    TResult Function(_GroupItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupItem() when $default != null:
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
    TResult Function(_GroupItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupItem():
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
    TResult? Function(_GroupItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupItem() when $default != null:
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
      String id,
      String groupName,
      List<String> memberChannelIds,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupItem() when $default != null:
        return $default(_that.id, _that.groupName, _that.memberChannelIds);
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
    TResult Function(String id, String groupName, List<String> memberChannelIds)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupItem():
        return $default(_that.id, _that.groupName, _that.memberChannelIds);
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
      String id,
      String groupName,
      List<String> memberChannelIds,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupItem() when $default != null:
        return $default(_that.id, _that.groupName, _that.memberChannelIds);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupItem implements GroupItem {
  const _GroupItem({
    required this.id,
    required this.groupName,
    final List<String> memberChannelIds = const <String>[],
  }) : _memberChannelIds = memberChannelIds;
  factory _GroupItem.fromJson(Map<String, dynamic> json) =>
      _$GroupItemFromJson(json);

  @override
  final String id;
  @override
  final String groupName;
  final List<String> _memberChannelIds;
  @override
  @JsonKey()
  List<String> get memberChannelIds {
    if (_memberChannelIds is EqualUnmodifiableListView)
      return _memberChannelIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberChannelIds);
  }

  /// Create a copy of GroupItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupItemCopyWith<_GroupItem> get copyWith =>
      __$GroupItemCopyWithImpl<_GroupItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupItemToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            const DeepCollectionEquality().equals(
              other._memberChannelIds,
              _memberChannelIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    groupName,
    const DeepCollectionEquality().hash(_memberChannelIds),
  );

  @override
  String toString() {
    return 'GroupItem(id: $id, groupName: $groupName, memberChannelIds: $memberChannelIds)';
  }
}

/// @nodoc
abstract mixin class _$GroupItemCopyWith<$Res>
    implements $GroupItemCopyWith<$Res> {
  factory _$GroupItemCopyWith(
    _GroupItem value,
    $Res Function(_GroupItem) _then,
  ) = __$GroupItemCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String groupName, List<String> memberChannelIds});
}

/// @nodoc
class __$GroupItemCopyWithImpl<$Res> implements _$GroupItemCopyWith<$Res> {
  __$GroupItemCopyWithImpl(this._self, this._then);

  final _GroupItem _self;
  final $Res Function(_GroupItem) _then;

  /// Create a copy of GroupItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? memberChannelIds = null,
  }) {
    return _then(
      _GroupItem(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        groupName: null == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String,
        memberChannelIds: null == memberChannelIds
            ? _self._memberChannelIds
            : memberChannelIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
mixin _$GroupMemberItem {
  String get channelId;
  String get channelName;
  String? get profileImageUrl;
  bool get verifiedMark;
  bool get openLive;
  int? get liveId;

  /// Create a copy of GroupMemberItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupMemberItemCopyWith<GroupMemberItem> get copyWith =>
      _$GroupMemberItemCopyWithImpl<GroupMemberItem>(
        this as GroupMemberItem,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupMemberItem &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    profileImageUrl,
    verifiedMark,
    openLive,
    liveId,
  );

  @override
  String toString() {
    return 'GroupMemberItem(channelId: $channelId, channelName: $channelName, profileImageUrl: $profileImageUrl, verifiedMark: $verifiedMark, openLive: $openLive, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class $GroupMemberItemCopyWith<$Res> {
  factory $GroupMemberItemCopyWith(
    GroupMemberItem value,
    $Res Function(GroupMemberItem) _then,
  ) = _$GroupMemberItemCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? profileImageUrl,
    bool verifiedMark,
    bool openLive,
    int? liveId,
  });
}

/// @nodoc
class _$GroupMemberItemCopyWithImpl<$Res>
    implements $GroupMemberItemCopyWith<$Res> {
  _$GroupMemberItemCopyWithImpl(this._self, this._then);

  final GroupMemberItem _self;
  final $Res Function(GroupMemberItem) _then;

  /// Create a copy of GroupMemberItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? profileImageUrl = freezed,
    Object? verifiedMark = null,
    Object? openLive = null,
    Object? liveId = freezed,
  }) {
    return _then(
      _self.copyWith(
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        channelName: null == channelName
            ? _self.channelName
            : channelName // ignore: cast_nullable_to_non_nullable
                  as String,
        profileImageUrl: freezed == profileImageUrl
            ? _self.profileImageUrl
            : profileImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedMark: null == verifiedMark
            ? _self.verifiedMark
            : verifiedMark // ignore: cast_nullable_to_non_nullable
                  as bool,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [GroupMemberItem].
extension GroupMemberItemPatterns on GroupMemberItem {
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
    TResult Function(_GroupMemberItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupMemberItem() when $default != null:
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
    TResult Function(_GroupMemberItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupMemberItem():
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
    TResult? Function(_GroupMemberItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupMemberItem() when $default != null:
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
      String channelName,
      String? profileImageUrl,
      bool verifiedMark,
      bool openLive,
      int? liveId,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupMemberItem() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.profileImageUrl,
          _that.verifiedMark,
          _that.openLive,
          _that.liveId,
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
      String channelName,
      String? profileImageUrl,
      bool verifiedMark,
      bool openLive,
      int? liveId,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupMemberItem():
        return $default(
          _that.channelId,
          _that.channelName,
          _that.profileImageUrl,
          _that.verifiedMark,
          _that.openLive,
          _that.liveId,
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
      String channelName,
      String? profileImageUrl,
      bool verifiedMark,
      bool openLive,
      int? liveId,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupMemberItem() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.profileImageUrl,
          _that.verifiedMark,
          _that.openLive,
          _that.liveId,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GroupMemberItem implements GroupMemberItem {
  const _GroupMemberItem({
    required this.channelId,
    required this.channelName,
    this.profileImageUrl,
    this.verifiedMark = false,
    this.openLive = false,
    this.liveId,
  });

  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? profileImageUrl;
  @override
  @JsonKey()
  final bool verifiedMark;
  @override
  @JsonKey()
  final bool openLive;
  @override
  final int? liveId;

  /// Create a copy of GroupMemberItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupMemberItemCopyWith<_GroupMemberItem> get copyWith =>
      __$GroupMemberItemCopyWithImpl<_GroupMemberItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupMemberItem &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    profileImageUrl,
    verifiedMark,
    openLive,
    liveId,
  );

  @override
  String toString() {
    return 'GroupMemberItem(channelId: $channelId, channelName: $channelName, profileImageUrl: $profileImageUrl, verifiedMark: $verifiedMark, openLive: $openLive, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class _$GroupMemberItemCopyWith<$Res>
    implements $GroupMemberItemCopyWith<$Res> {
  factory _$GroupMemberItemCopyWith(
    _GroupMemberItem value,
    $Res Function(_GroupMemberItem) _then,
  ) = __$GroupMemberItemCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? profileImageUrl,
    bool verifiedMark,
    bool openLive,
    int? liveId,
  });
}

/// @nodoc
class __$GroupMemberItemCopyWithImpl<$Res>
    implements _$GroupMemberItemCopyWith<$Res> {
  __$GroupMemberItemCopyWithImpl(this._self, this._then);

  final _GroupMemberItem _self;
  final $Res Function(_GroupMemberItem) _then;

  /// Create a copy of GroupMemberItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? profileImageUrl = freezed,
    Object? verifiedMark = null,
    Object? openLive = null,
    Object? liveId = freezed,
  }) {
    return _then(
      _GroupMemberItem(
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        channelName: null == channelName
            ? _self.channelName
            : channelName // ignore: cast_nullable_to_non_nullable
                  as String,
        profileImageUrl: freezed == profileImageUrl
            ? _self.profileImageUrl
            : profileImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedMark: null == verifiedMark
            ? _self.verifiedMark
            : verifiedMark // ignore: cast_nullable_to_non_nullable
                  as bool,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}
