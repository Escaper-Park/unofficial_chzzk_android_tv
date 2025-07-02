// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveResponse _$LiveResponseFromJson(Map<String, dynamic> json) {
  return _LiveResponse.fromJson(json);
}

/// @nodoc
mixin _$LiveResponse {
  int get size => throw _privateConstructorUsedError;
  LivePage? get page => throw _privateConstructorUsedError;
  List<LiveInfo> get data => throw _privateConstructorUsedError;

  /// Serializes this LiveResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveResponseCopyWith<LiveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveResponseCopyWith<$Res> {
  factory $LiveResponseCopyWith(
          LiveResponse value, $Res Function(LiveResponse) then) =
      _$LiveResponseCopyWithImpl<$Res, LiveResponse>;
  @useResult
  $Res call({int size, LivePage? page, List<LiveInfo> data});

  $LivePageCopyWith<$Res>? get page;
}

/// @nodoc
class _$LiveResponseCopyWithImpl<$Res, $Val extends LiveResponse>
    implements $LiveResponseCopyWith<$Res> {
  _$LiveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveResponse
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
              as LivePage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveInfo>,
    ) as $Val);
  }

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LivePageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $LivePageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveResponseImplCopyWith<$Res>
    implements $LiveResponseCopyWith<$Res> {
  factory _$$LiveResponseImplCopyWith(
          _$LiveResponseImpl value, $Res Function(_$LiveResponseImpl) then) =
      __$$LiveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, LivePage? page, List<LiveInfo> data});

  @override
  $LivePageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$LiveResponseImplCopyWithImpl<$Res>
    extends _$LiveResponseCopyWithImpl<$Res, _$LiveResponseImpl>
    implements _$$LiveResponseImplCopyWith<$Res> {
  __$$LiveResponseImplCopyWithImpl(
      _$LiveResponseImpl _value, $Res Function(_$LiveResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$LiveResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as LivePage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveResponseImpl implements _LiveResponse {
  const _$LiveResponseImpl(
      {required this.size, this.page, required final List<LiveInfo> data})
      : _data = data;

  factory _$LiveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveResponseImplFromJson(json);

  @override
  final int size;
  @override
  final LivePage? page;
  final List<LiveInfo> _data;
  @override
  List<LiveInfo> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LiveResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveResponseImplCopyWith<_$LiveResponseImpl> get copyWith =>
      __$$LiveResponseImplCopyWithImpl<_$LiveResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveResponseImplToJson(
      this,
    );
  }
}

abstract class _LiveResponse implements LiveResponse {
  const factory _LiveResponse(
      {required final int size,
      final LivePage? page,
      required final List<LiveInfo> data}) = _$LiveResponseImpl;

  factory _LiveResponse.fromJson(Map<String, dynamic> json) =
      _$LiveResponseImpl.fromJson;

  @override
  int get size;
  @override
  LivePage? get page;
  @override
  List<LiveInfo> get data;

  /// Create a copy of LiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveResponseImplCopyWith<_$LiveResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LivePage _$LivePageFromJson(Map<String, dynamic> json) {
  return _LivePage.fromJson(json);
}

/// @nodoc
mixin _$LivePage {
  LiveNext? get next => throw _privateConstructorUsedError;

  /// Serializes this LivePage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LivePageCopyWith<LivePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivePageCopyWith<$Res> {
  factory $LivePageCopyWith(LivePage value, $Res Function(LivePage) then) =
      _$LivePageCopyWithImpl<$Res, LivePage>;
  @useResult
  $Res call({LiveNext? next});

  $LiveNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$LivePageCopyWithImpl<$Res, $Val extends LivePage>
    implements $LivePageCopyWith<$Res> {
  _$LivePageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LivePage
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
              as LiveNext?,
    ) as $Val);
  }

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $LiveNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LivePageImplCopyWith<$Res>
    implements $LivePageCopyWith<$Res> {
  factory _$$LivePageImplCopyWith(
          _$LivePageImpl value, $Res Function(_$LivePageImpl) then) =
      __$$LivePageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LiveNext? next});

  @override
  $LiveNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$LivePageImplCopyWithImpl<$Res>
    extends _$LivePageCopyWithImpl<$Res, _$LivePageImpl>
    implements _$$LivePageImplCopyWith<$Res> {
  __$$LivePageImplCopyWithImpl(
      _$LivePageImpl _value, $Res Function(_$LivePageImpl) _then)
      : super(_value, _then);

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$LivePageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as LiveNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LivePageImpl implements _LivePage {
  const _$LivePageImpl({this.next});

  factory _$LivePageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LivePageImplFromJson(json);

  @override
  final LiveNext? next;

  @override
  String toString() {
    return 'LivePage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivePageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LivePageImplCopyWith<_$LivePageImpl> get copyWith =>
      __$$LivePageImplCopyWithImpl<_$LivePageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LivePageImplToJson(
      this,
    );
  }
}

abstract class _LivePage implements LivePage {
  const factory _LivePage({final LiveNext? next}) = _$LivePageImpl;

  factory _LivePage.fromJson(Map<String, dynamic> json) =
      _$LivePageImpl.fromJson;

  @override
  LiveNext? get next;

  /// Create a copy of LivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LivePageImplCopyWith<_$LivePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveNext _$LiveNextFromJson(Map<String, dynamic> json) {
  return _LiveNext.fromJson(json);
}

/// @nodoc
mixin _$LiveNext {
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int get liveId => throw _privateConstructorUsedError;

  /// Serializes this LiveNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveNextCopyWith<LiveNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveNextCopyWith<$Res> {
  factory $LiveNextCopyWith(LiveNext value, $Res Function(LiveNext) then) =
      _$LiveNextCopyWithImpl<$Res, LiveNext>;
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class _$LiveNextCopyWithImpl<$Res, $Val extends LiveNext>
    implements $LiveNextCopyWith<$Res> {
  _$LiveNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? liveId = null,
  }) {
    return _then(_value.copyWith(
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveNextImplCopyWith<$Res>
    implements $LiveNextCopyWith<$Res> {
  factory _$$LiveNextImplCopyWith(
          _$LiveNextImpl value, $Res Function(_$LiveNextImpl) then) =
      __$$LiveNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class __$$LiveNextImplCopyWithImpl<$Res>
    extends _$LiveNextCopyWithImpl<$Res, _$LiveNextImpl>
    implements _$$LiveNextImplCopyWith<$Res> {
  __$$LiveNextImplCopyWithImpl(
      _$LiveNextImpl _value, $Res Function(_$LiveNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? liveId = null,
  }) {
    return _then(_$LiveNextImpl(
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveNextImpl implements _LiveNext {
  const _$LiveNextImpl(
      {required this.concurrentUserCount, required this.liveId});

  factory _$LiveNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveNextImplFromJson(json);

  @override
  final int concurrentUserCount;
  @override
  final int liveId;

  @override
  String toString() {
    return 'LiveNext(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveNextImpl &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  /// Create a copy of LiveNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveNextImplCopyWith<_$LiveNextImpl> get copyWith =>
      __$$LiveNextImplCopyWithImpl<_$LiveNextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveNextImplToJson(
      this,
    );
  }
}

abstract class _LiveNext implements LiveNext {
  const factory _LiveNext(
      {required final int concurrentUserCount,
      required final int liveId}) = _$LiveNextImpl;

  factory _LiveNext.fromJson(Map<String, dynamic> json) =
      _$LiveNextImpl.fromJson;

  @override
  int get concurrentUserCount;
  @override
  int get liveId;

  /// Create a copy of LiveNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveNextImplCopyWith<_$LiveNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
