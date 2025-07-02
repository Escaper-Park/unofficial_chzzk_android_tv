// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Groups _$GroupsFromJson(Map<String, dynamic> json) {
  return _Groups.fromJson(json);
}

/// @nodoc
mixin _$Groups {
  List<Group> get groups => throw _privateConstructorUsedError;
  int get lastActivatedGroupIndex => throw _privateConstructorUsedError;

  /// Serializes this Groups to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupsCopyWith<Groups> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupsCopyWith<$Res> {
  factory $GroupsCopyWith(Groups value, $Res Function(Groups) then) =
      _$GroupsCopyWithImpl<$Res, Groups>;
  @useResult
  $Res call({List<Group> groups, int lastActivatedGroupIndex});
}

/// @nodoc
class _$GroupsCopyWithImpl<$Res, $Val extends Groups>
    implements $GroupsCopyWith<$Res> {
  _$GroupsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? lastActivatedGroupIndex = null,
  }) {
    return _then(_value.copyWith(
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      lastActivatedGroupIndex: null == lastActivatedGroupIndex
          ? _value.lastActivatedGroupIndex
          : lastActivatedGroupIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupsImplCopyWith<$Res> implements $GroupsCopyWith<$Res> {
  factory _$$GroupsImplCopyWith(
          _$GroupsImpl value, $Res Function(_$GroupsImpl) then) =
      __$$GroupsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Group> groups, int lastActivatedGroupIndex});
}

/// @nodoc
class __$$GroupsImplCopyWithImpl<$Res>
    extends _$GroupsCopyWithImpl<$Res, _$GroupsImpl>
    implements _$$GroupsImplCopyWith<$Res> {
  __$$GroupsImplCopyWithImpl(
      _$GroupsImpl _value, $Res Function(_$GroupsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? lastActivatedGroupIndex = null,
  }) {
    return _then(_$GroupsImpl(
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      lastActivatedGroupIndex: null == lastActivatedGroupIndex
          ? _value.lastActivatedGroupIndex
          : lastActivatedGroupIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupsImpl implements _Groups {
  const _$GroupsImpl(
      {required final List<Group> groups,
      required this.lastActivatedGroupIndex})
      : _groups = groups;

  factory _$GroupsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupsImplFromJson(json);

  final List<Group> _groups;
  @override
  List<Group> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final int lastActivatedGroupIndex;

  @override
  String toString() {
    return 'Groups(groups: $groups, lastActivatedGroupIndex: $lastActivatedGroupIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupsImpl &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(
                    other.lastActivatedGroupIndex, lastActivatedGroupIndex) ||
                other.lastActivatedGroupIndex == lastActivatedGroupIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_groups), lastActivatedGroupIndex);

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupsImplCopyWith<_$GroupsImpl> get copyWith =>
      __$$GroupsImplCopyWithImpl<_$GroupsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupsImplToJson(
      this,
    );
  }
}

abstract class _Groups implements Groups {
  const factory _Groups(
      {required final List<Group> groups,
      required final int lastActivatedGroupIndex}) = _$GroupsImpl;

  factory _Groups.fromJson(Map<String, dynamic> json) = _$GroupsImpl.fromJson;

  @override
  List<Group> get groups;
  @override
  int get lastActivatedGroupIndex;

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupsImplCopyWith<_$GroupsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
mixin _$Group {
  String get id => throw _privateConstructorUsedError;
  String get groupName => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;

  /// Serializes this Group to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res, Group>;
  @useResult
  $Res call({String id, String groupName, List<String> members});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res, $Val extends Group>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupImplCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$GroupImplCopyWith(
          _$GroupImpl value, $Res Function(_$GroupImpl) then) =
      __$$GroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String groupName, List<String> members});
}

/// @nodoc
class __$$GroupImplCopyWithImpl<$Res>
    extends _$GroupCopyWithImpl<$Res, _$GroupImpl>
    implements _$$GroupImplCopyWith<$Res> {
  __$$GroupImplCopyWithImpl(
      _$GroupImpl _value, $Res Function(_$GroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? members = null,
  }) {
    return _then(_$GroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupImpl implements _Group {
  const _$GroupImpl(
      {required this.id,
      required this.groupName,
      required final List<String> members})
      : _members = members;

  factory _$GroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupImplFromJson(json);

  @override
  final String id;
  @override
  final String groupName;
  final List<String> _members;
  @override
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'Group(id: $id, groupName: $groupName, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupName,
      const DeepCollectionEquality().hash(_members));

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      __$$GroupImplCopyWithImpl<_$GroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupImplToJson(
      this,
    );
  }
}

abstract class _Group implements Group {
  const factory _Group(
      {required final String id,
      required final String groupName,
      required final List<String> members}) = _$GroupImpl;

  factory _Group.fromJson(Map<String, dynamic> json) = _$GroupImpl.fromJson;

  @override
  String get id;
  @override
  String get groupName;
  @override
  List<String> get members;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
