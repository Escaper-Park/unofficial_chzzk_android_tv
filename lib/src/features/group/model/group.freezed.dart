// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Groups {
  List<Group> get groups;
  int get lastActivatedGroupIndex;

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupsCopyWith<Groups> get copyWith =>
      _$GroupsCopyWithImpl<Groups>(this as Groups, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Groups &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            (identical(
                    other.lastActivatedGroupIndex, lastActivatedGroupIndex) ||
                other.lastActivatedGroupIndex == lastActivatedGroupIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(groups), lastActivatedGroupIndex);

  @override
  String toString() {
    return 'Groups(groups: $groups, lastActivatedGroupIndex: $lastActivatedGroupIndex)';
  }
}

/// @nodoc
abstract mixin class $GroupsCopyWith<$Res> {
  factory $GroupsCopyWith(Groups value, $Res Function(Groups) _then) =
      _$GroupsCopyWithImpl;
  @useResult
  $Res call({List<Group> groups, int lastActivatedGroupIndex});
}

/// @nodoc
class _$GroupsCopyWithImpl<$Res> implements $GroupsCopyWith<$Res> {
  _$GroupsCopyWithImpl(this._self, this._then);

  final Groups _self;
  final $Res Function(Groups) _then;

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? lastActivatedGroupIndex = null,
  }) {
    return _then(Groups(
      groups: null == groups
          ? _self.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      lastActivatedGroupIndex: null == lastActivatedGroupIndex
          ? _self.lastActivatedGroupIndex
          : lastActivatedGroupIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Group {
  String get id;
  String get groupName;
  List<String> get members;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupCopyWith<Group> get copyWith =>
      _$GroupCopyWithImpl<Group>(this as Group, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Group &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            const DeepCollectionEquality().equals(other.members, members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, groupName, const DeepCollectionEquality().hash(members));

  @override
  String toString() {
    return 'Group(id: $id, groupName: $groupName, members: $members)';
  }
}

/// @nodoc
abstract mixin class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) _then) =
      _$GroupCopyWithImpl;
  @useResult
  $Res call({String id, String groupName, List<String> members});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res> implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._self, this._then);

  final Group _self;
  final $Res Function(Group) _then;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? members = null,
  }) {
    return _then(Group(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
