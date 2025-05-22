// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watching_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchingHistoryResponse {
  int get size;
  WatchingHistoryPage? get page;
  List<WatchingHistory> get data;

  /// Create a copy of WatchingHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryResponseCopyWith<WatchingHistoryResponse> get copyWith =>
      _$WatchingHistoryResponseCopyWithImpl<WatchingHistoryResponse>(
          this as WatchingHistoryResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryResponse &&
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
    return 'WatchingHistoryResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryResponseCopyWith<$Res> {
  factory $WatchingHistoryResponseCopyWith(WatchingHistoryResponse value,
          $Res Function(WatchingHistoryResponse) _then) =
      _$WatchingHistoryResponseCopyWithImpl;
  @useResult
  $Res call({int size, WatchingHistoryPage? page, List<WatchingHistory> data});
}

/// @nodoc
class _$WatchingHistoryResponseCopyWithImpl<$Res>
    implements $WatchingHistoryResponseCopyWith<$Res> {
  _$WatchingHistoryResponseCopyWithImpl(this._self, this._then);

  final WatchingHistoryResponse _self;
  final $Res Function(WatchingHistoryResponse) _then;

  /// Create a copy of WatchingHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(WatchingHistoryResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as WatchingHistoryPage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WatchingHistory>,
    ));
  }
}

/// @nodoc
mixin _$WatchingHistoryPage {
  WatchingHistoryNext? get next;

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryPageCopyWith<WatchingHistoryPage> get copyWith =>
      _$WatchingHistoryPageCopyWithImpl<WatchingHistoryPage>(
          this as WatchingHistoryPage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryPage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'WatchingHistoryPage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryPageCopyWith<$Res> {
  factory $WatchingHistoryPageCopyWith(
          WatchingHistoryPage value, $Res Function(WatchingHistoryPage) _then) =
      _$WatchingHistoryPageCopyWithImpl;
  @useResult
  $Res call({WatchingHistoryNext? next});
}

/// @nodoc
class _$WatchingHistoryPageCopyWithImpl<$Res>
    implements $WatchingHistoryPageCopyWith<$Res> {
  _$WatchingHistoryPageCopyWithImpl(this._self, this._then);

  final WatchingHistoryPage _self;
  final $Res Function(WatchingHistoryPage) _then;

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(WatchingHistoryPage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as WatchingHistoryNext?,
    ));
  }
}

/// @nodoc
mixin _$WatchingHistoryNext {
  int? get lastTime;

  /// Create a copy of WatchingHistoryNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryNextCopyWith<WatchingHistoryNext> get copyWith =>
      _$WatchingHistoryNextCopyWithImpl<WatchingHistoryNext>(
          this as WatchingHistoryNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistoryNext &&
            (identical(other.lastTime, lastTime) ||
                other.lastTime == lastTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lastTime);

  @override
  String toString() {
    return 'WatchingHistoryNext(lastTime: $lastTime)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryNextCopyWith<$Res> {
  factory $WatchingHistoryNextCopyWith(
          WatchingHistoryNext value, $Res Function(WatchingHistoryNext) _then) =
      _$WatchingHistoryNextCopyWithImpl;
  @useResult
  $Res call({int? lastTime});
}

/// @nodoc
class _$WatchingHistoryNextCopyWithImpl<$Res>
    implements $WatchingHistoryNextCopyWith<$Res> {
  _$WatchingHistoryNextCopyWithImpl(this._self, this._then);

  final WatchingHistoryNext _self;
  final $Res Function(WatchingHistoryNext) _then;

  /// Create a copy of WatchingHistoryNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastTime = freezed,
  }) {
    return _then(WatchingHistoryNext(
      lastTime: freezed == lastTime
          ? _self.lastTime
          : lastTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
