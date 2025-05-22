// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveResponse {
  int get size;
  LivePage? get page;
  List<LiveInfo> get data;

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveResponseCopyWith<LiveResponse> get copyWith =>
      _$LiveResponseCopyWithImpl<LiveResponse>(
          this as LiveResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveResponse &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'LiveResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $LiveResponseCopyWith<$Res> {
  factory $LiveResponseCopyWith(
          LiveResponse value, $Res Function(LiveResponse) _then) =
      _$LiveResponseCopyWithImpl;
  @useResult
  $Res call({int size, LivePage? page, List<LiveInfo> data});
}

/// @nodoc
class _$LiveResponseCopyWithImpl<$Res> implements $LiveResponseCopyWith<$Res> {
  _$LiveResponseCopyWithImpl(this._self, this._then);

  final LiveResponse _self;
  final $Res Function(LiveResponse) _then;

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(LiveResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as LivePage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveInfo>,
    ));
  }
}

/// @nodoc
mixin _$LivePage {
  LiveNext? get next;

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LivePageCopyWith<LivePage> get copyWith =>
      _$LivePageCopyWithImpl<LivePage>(this as LivePage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LivePage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'LivePage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $LivePageCopyWith<$Res> {
  factory $LivePageCopyWith(LivePage value, $Res Function(LivePage) _then) =
      _$LivePageCopyWithImpl;
  @useResult
  $Res call({LiveNext? next});
}

/// @nodoc
class _$LivePageCopyWithImpl<$Res> implements $LivePageCopyWith<$Res> {
  _$LivePageCopyWithImpl(this._self, this._then);

  final LivePage _self;
  final $Res Function(LivePage) _then;

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(LivePage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as LiveNext?,
    ));
  }
}

/// @nodoc
mixin _$LiveNext {
  int get concurrentUserCount;
  int get liveId;

  /// Create a copy of LiveNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveNextCopyWith<LiveNext> get copyWith =>
      _$LiveNextCopyWithImpl<LiveNext>(this as LiveNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveNext &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'LiveNext(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class $LiveNextCopyWith<$Res> {
  factory $LiveNextCopyWith(LiveNext value, $Res Function(LiveNext) _then) =
      _$LiveNextCopyWithImpl;
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class _$LiveNextCopyWithImpl<$Res> implements $LiveNextCopyWith<$Res> {
  _$LiveNextCopyWithImpl(this._self, this._then);

  final LiveNext _self;
  final $Res Function(LiveNext) _then;

  /// Create a copy of LiveNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? liveId = null,
  }) {
    return _then(LiveNext(
      concurrentUserCount: null == concurrentUserCount
          ? _self.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveId: null == liveId
          ? _self.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
