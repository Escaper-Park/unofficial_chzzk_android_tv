// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowingResponse {
  int? get totalCount;
  int? get totalPage;
  List<Following> get followingList;

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingResponseCopyWith<FollowingResponse> get copyWith =>
      _$FollowingResponseCopyWithImpl<FollowingResponse>(
          this as FollowingResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingResponse &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            const DeepCollectionEquality()
                .equals(other.followingList, followingList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, totalPage,
      const DeepCollectionEquality().hash(followingList));

  @override
  String toString() {
    return 'FollowingResponse(totalCount: $totalCount, totalPage: $totalPage, followingList: $followingList)';
  }
}

/// @nodoc
abstract mixin class $FollowingResponseCopyWith<$Res> {
  factory $FollowingResponseCopyWith(
          FollowingResponse value, $Res Function(FollowingResponse) _then) =
      _$FollowingResponseCopyWithImpl;
  @useResult
  $Res call({int? totalCount, int? totalPage, List<Following> followingList});
}

/// @nodoc
class _$FollowingResponseCopyWithImpl<$Res>
    implements $FollowingResponseCopyWith<$Res> {
  _$FollowingResponseCopyWithImpl(this._self, this._then);

  final FollowingResponse _self;
  final $Res Function(FollowingResponse) _then;

  /// Create a copy of FollowingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPage = freezed,
    Object? followingList = null,
  }) {
    return _then(FollowingResponse(
      totalCount: freezed == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _self.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      followingList: null == followingList
          ? _self.followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Following>,
    ));
  }
}

// dart format on
