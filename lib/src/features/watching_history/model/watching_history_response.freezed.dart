// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watching_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchingHistoryResponse _$WatchingHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return _WatchingHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$WatchingHistoryResponse {
  int get size => throw _privateConstructorUsedError;
  WatchingHistoryPage? get page => throw _privateConstructorUsedError;
  List<WatchingHistory> get data => throw _privateConstructorUsedError;

  /// Serializes this WatchingHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WatchingHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchingHistoryResponseCopyWith<WatchingHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchingHistoryResponseCopyWith<$Res> {
  factory $WatchingHistoryResponseCopyWith(WatchingHistoryResponse value,
          $Res Function(WatchingHistoryResponse) then) =
      _$WatchingHistoryResponseCopyWithImpl<$Res, WatchingHistoryResponse>;
  @useResult
  $Res call({int size, WatchingHistoryPage? page, List<WatchingHistory> data});

  $WatchingHistoryPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$WatchingHistoryResponseCopyWithImpl<$Res,
        $Val extends WatchingHistoryResponse>
    implements $WatchingHistoryResponseCopyWith<$Res> {
  _$WatchingHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchingHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as WatchingHistoryPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WatchingHistory>,
    ) as $Val);
  }

  /// Create a copy of WatchingHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $WatchingHistoryPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WatchingHistoryResponseImplCopyWith<$Res>
    implements $WatchingHistoryResponseCopyWith<$Res> {
  factory _$$WatchingHistoryResponseImplCopyWith(
          _$WatchingHistoryResponseImpl value,
          $Res Function(_$WatchingHistoryResponseImpl) then) =
      __$$WatchingHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, WatchingHistoryPage? page, List<WatchingHistory> data});

  @override
  $WatchingHistoryPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$WatchingHistoryResponseImplCopyWithImpl<$Res>
    extends _$WatchingHistoryResponseCopyWithImpl<$Res,
        _$WatchingHistoryResponseImpl>
    implements _$$WatchingHistoryResponseImplCopyWith<$Res> {
  __$$WatchingHistoryResponseImplCopyWithImpl(
      _$WatchingHistoryResponseImpl _value,
      $Res Function(_$WatchingHistoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchingHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$WatchingHistoryResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as WatchingHistoryPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WatchingHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchingHistoryResponseImpl implements _WatchingHistoryResponse {
  const _$WatchingHistoryResponseImpl(
      {required this.size,
      this.page,
      required final List<WatchingHistory> data})
      : _data = data;

  factory _$WatchingHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchingHistoryResponseImplFromJson(json);

  @override
  final int size;
  @override
  final WatchingHistoryPage? page;
  final List<WatchingHistory> _data;
  @override
  List<WatchingHistory> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'WatchingHistoryResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchingHistoryResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of WatchingHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchingHistoryResponseImplCopyWith<_$WatchingHistoryResponseImpl>
      get copyWith => __$$WatchingHistoryResponseImplCopyWithImpl<
          _$WatchingHistoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchingHistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _WatchingHistoryResponse implements WatchingHistoryResponse {
  const factory _WatchingHistoryResponse(
          {required final int size,
          final WatchingHistoryPage? page,
          required final List<WatchingHistory> data}) =
      _$WatchingHistoryResponseImpl;

  factory _WatchingHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$WatchingHistoryResponseImpl.fromJson;

  @override
  int get size;
  @override
  WatchingHistoryPage? get page;
  @override
  List<WatchingHistory> get data;

  /// Create a copy of WatchingHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchingHistoryResponseImplCopyWith<_$WatchingHistoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WatchingHistoryPage _$WatchingHistoryPageFromJson(Map<String, dynamic> json) {
  return _WatchingHistoryPage.fromJson(json);
}

/// @nodoc
mixin _$WatchingHistoryPage {
  WatchingHistoryNext? get next => throw _privateConstructorUsedError;

  /// Serializes this WatchingHistoryPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchingHistoryPageCopyWith<WatchingHistoryPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchingHistoryPageCopyWith<$Res> {
  factory $WatchingHistoryPageCopyWith(
          WatchingHistoryPage value, $Res Function(WatchingHistoryPage) then) =
      _$WatchingHistoryPageCopyWithImpl<$Res, WatchingHistoryPage>;
  @useResult
  $Res call({WatchingHistoryNext? next});

  $WatchingHistoryNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$WatchingHistoryPageCopyWithImpl<$Res, $Val extends WatchingHistoryPage>
    implements $WatchingHistoryPageCopyWith<$Res> {
  _$WatchingHistoryPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as WatchingHistoryNext?,
    ) as $Val);
  }

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchingHistoryNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $WatchingHistoryNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WatchingHistoryPageImplCopyWith<$Res>
    implements $WatchingHistoryPageCopyWith<$Res> {
  factory _$$WatchingHistoryPageImplCopyWith(_$WatchingHistoryPageImpl value,
          $Res Function(_$WatchingHistoryPageImpl) then) =
      __$$WatchingHistoryPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WatchingHistoryNext? next});

  @override
  $WatchingHistoryNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$WatchingHistoryPageImplCopyWithImpl<$Res>
    extends _$WatchingHistoryPageCopyWithImpl<$Res, _$WatchingHistoryPageImpl>
    implements _$$WatchingHistoryPageImplCopyWith<$Res> {
  __$$WatchingHistoryPageImplCopyWithImpl(_$WatchingHistoryPageImpl _value,
      $Res Function(_$WatchingHistoryPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$WatchingHistoryPageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as WatchingHistoryNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchingHistoryPageImpl implements _WatchingHistoryPage {
  const _$WatchingHistoryPageImpl({this.next});

  factory _$WatchingHistoryPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchingHistoryPageImplFromJson(json);

  @override
  final WatchingHistoryNext? next;

  @override
  String toString() {
    return 'WatchingHistoryPage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchingHistoryPageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchingHistoryPageImplCopyWith<_$WatchingHistoryPageImpl> get copyWith =>
      __$$WatchingHistoryPageImplCopyWithImpl<_$WatchingHistoryPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchingHistoryPageImplToJson(
      this,
    );
  }
}

abstract class _WatchingHistoryPage implements WatchingHistoryPage {
  const factory _WatchingHistoryPage({final WatchingHistoryNext? next}) =
      _$WatchingHistoryPageImpl;

  factory _WatchingHistoryPage.fromJson(Map<String, dynamic> json) =
      _$WatchingHistoryPageImpl.fromJson;

  @override
  WatchingHistoryNext? get next;

  /// Create a copy of WatchingHistoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchingHistoryPageImplCopyWith<_$WatchingHistoryPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WatchingHistoryNext _$WatchingHistoryNextFromJson(Map<String, dynamic> json) {
  return _WatchingHistoryNext.fromJson(json);
}

/// @nodoc
mixin _$WatchingHistoryNext {
  int? get lastTime => throw _privateConstructorUsedError;

  /// Serializes this WatchingHistoryNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WatchingHistoryNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchingHistoryNextCopyWith<WatchingHistoryNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchingHistoryNextCopyWith<$Res> {
  factory $WatchingHistoryNextCopyWith(
          WatchingHistoryNext value, $Res Function(WatchingHistoryNext) then) =
      _$WatchingHistoryNextCopyWithImpl<$Res, WatchingHistoryNext>;
  @useResult
  $Res call({int? lastTime});
}

/// @nodoc
class _$WatchingHistoryNextCopyWithImpl<$Res, $Val extends WatchingHistoryNext>
    implements $WatchingHistoryNextCopyWith<$Res> {
  _$WatchingHistoryNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchingHistoryNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastTime = freezed,
  }) {
    return _then(_value.copyWith(
      lastTime: freezed == lastTime
          ? _value.lastTime
          : lastTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchingHistoryNextImplCopyWith<$Res>
    implements $WatchingHistoryNextCopyWith<$Res> {
  factory _$$WatchingHistoryNextImplCopyWith(_$WatchingHistoryNextImpl value,
          $Res Function(_$WatchingHistoryNextImpl) then) =
      __$$WatchingHistoryNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? lastTime});
}

/// @nodoc
class __$$WatchingHistoryNextImplCopyWithImpl<$Res>
    extends _$WatchingHistoryNextCopyWithImpl<$Res, _$WatchingHistoryNextImpl>
    implements _$$WatchingHistoryNextImplCopyWith<$Res> {
  __$$WatchingHistoryNextImplCopyWithImpl(_$WatchingHistoryNextImpl _value,
      $Res Function(_$WatchingHistoryNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchingHistoryNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastTime = freezed,
  }) {
    return _then(_$WatchingHistoryNextImpl(
      lastTime: freezed == lastTime
          ? _value.lastTime
          : lastTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchingHistoryNextImpl implements _WatchingHistoryNext {
  const _$WatchingHistoryNextImpl({this.lastTime});

  factory _$WatchingHistoryNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchingHistoryNextImplFromJson(json);

  @override
  final int? lastTime;

  @override
  String toString() {
    return 'WatchingHistoryNext(lastTime: $lastTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchingHistoryNextImpl &&
            (identical(other.lastTime, lastTime) ||
                other.lastTime == lastTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lastTime);

  /// Create a copy of WatchingHistoryNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchingHistoryNextImplCopyWith<_$WatchingHistoryNextImpl> get copyWith =>
      __$$WatchingHistoryNextImplCopyWithImpl<_$WatchingHistoryNextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchingHistoryNextImplToJson(
      this,
    );
  }
}

abstract class _WatchingHistoryNext implements WatchingHistoryNext {
  const factory _WatchingHistoryNext({final int? lastTime}) =
      _$WatchingHistoryNextImpl;

  factory _WatchingHistoryNext.fromJson(Map<String, dynamic> json) =
      _$WatchingHistoryNextImpl.fromJson;

  @override
  int? get lastTime;

  /// Create a copy of WatchingHistoryNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchingHistoryNextImplCopyWith<_$WatchingHistoryNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
