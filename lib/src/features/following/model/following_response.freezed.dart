// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowingResponse _$FollowingResponseFromJson(Map<String, dynamic> json) {
  return _FollowingResponse.fromJson(json);
}

/// @nodoc
mixin _$FollowingResponse {
  int? get totalCount => throw _privateConstructorUsedError;
  int? get totalPage => throw _privateConstructorUsedError;
  List<Following> get followingList => throw _privateConstructorUsedError;

  /// Serializes this FollowingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingResponseCopyWith<FollowingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingResponseCopyWith<$Res> {
  factory $FollowingResponseCopyWith(
          FollowingResponse value, $Res Function(FollowingResponse) then) =
      _$FollowingResponseCopyWithImpl<$Res, FollowingResponse>;
  @useResult
  $Res call({int? totalCount, int? totalPage, List<Following> followingList});
}

/// @nodoc
class _$FollowingResponseCopyWithImpl<$Res, $Val extends FollowingResponse>
    implements $FollowingResponseCopyWith<$Res> {
  _$FollowingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPage = freezed,
    Object? followingList = null,
  }) {
    return _then(_value.copyWith(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      followingList: null == followingList
          ? _value.followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Following>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingResponseImplCopyWith<$Res>
    implements $FollowingResponseCopyWith<$Res> {
  factory _$$FollowingResponseImplCopyWith(_$FollowingResponseImpl value,
          $Res Function(_$FollowingResponseImpl) then) =
      __$$FollowingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, int? totalPage, List<Following> followingList});
}

/// @nodoc
class __$$FollowingResponseImplCopyWithImpl<$Res>
    extends _$FollowingResponseCopyWithImpl<$Res, _$FollowingResponseImpl>
    implements _$$FollowingResponseImplCopyWith<$Res> {
  __$$FollowingResponseImplCopyWithImpl(_$FollowingResponseImpl _value,
      $Res Function(_$FollowingResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPage = freezed,
    Object? followingList = null,
  }) {
    return _then(_$FollowingResponseImpl(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      followingList: null == followingList
          ? _value._followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Following>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingResponseImpl implements _FollowingResponse {
  const _$FollowingResponseImpl(
      {this.totalCount,
      this.totalPage,
      required final List<Following> followingList})
      : _followingList = followingList;

  factory _$FollowingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingResponseImplFromJson(json);

  @override
  final int? totalCount;
  @override
  final int? totalPage;
  final List<Following> _followingList;
  @override
  List<Following> get followingList {
    if (_followingList is EqualUnmodifiableListView) return _followingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followingList);
  }

  @override
  String toString() {
    return 'FollowingResponse(totalCount: $totalCount, totalPage: $totalPage, followingList: $followingList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingResponseImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            const DeepCollectionEquality()
                .equals(other._followingList, _followingList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, totalPage,
      const DeepCollectionEquality().hash(_followingList));

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingResponseImplCopyWith<_$FollowingResponseImpl> get copyWith =>
      __$$FollowingResponseImplCopyWithImpl<_$FollowingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingResponseImplToJson(
      this,
    );
  }
}

abstract class _FollowingResponse implements FollowingResponse {
  const factory _FollowingResponse(
      {final int? totalCount,
      final int? totalPage,
      required final List<Following> followingList}) = _$FollowingResponseImpl;

  factory _FollowingResponse.fromJson(Map<String, dynamic> json) =
      _$FollowingResponseImpl.fromJson;

  @override
  int? get totalCount;
  @override
  int? get totalPage;
  @override
  List<Following> get followingList;

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingResponseImplCopyWith<_$FollowingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
