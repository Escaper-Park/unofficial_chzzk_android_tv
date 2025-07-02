// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VodResponse _$VodResponseFromJson(Map<String, dynamic> json) {
  return _VodResponse.fromJson(json);
}

/// @nodoc
mixin _$VodResponse {
  int get size => throw _privateConstructorUsedError;
  VodPage? get page => throw _privateConstructorUsedError;
  List<Vod> get data => throw _privateConstructorUsedError;

  /// Serializes this VodResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VodResponseCopyWith<VodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodResponseCopyWith<$Res> {
  factory $VodResponseCopyWith(
          VodResponse value, $Res Function(VodResponse) then) =
      _$VodResponseCopyWithImpl<$Res, VodResponse>;
  @useResult
  $Res call({int size, VodPage? page, List<Vod> data});

  $VodPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$VodResponseCopyWithImpl<$Res, $Val extends VodResponse>
    implements $VodResponseCopyWith<$Res> {
  _$VodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VodResponse
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
              as VodPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ) as $Val);
  }

  /// Create a copy of VodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $VodPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VodResponseImplCopyWith<$Res>
    implements $VodResponseCopyWith<$Res> {
  factory _$$VodResponseImplCopyWith(
          _$VodResponseImpl value, $Res Function(_$VodResponseImpl) then) =
      __$$VodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, VodPage? page, List<Vod> data});

  @override
  $VodPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$VodResponseImplCopyWithImpl<$Res>
    extends _$VodResponseCopyWithImpl<$Res, _$VodResponseImpl>
    implements _$$VodResponseImplCopyWith<$Res> {
  __$$VodResponseImplCopyWithImpl(
      _$VodResponseImpl _value, $Res Function(_$VodResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$VodResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as VodPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodResponseImpl implements _VodResponse {
  const _$VodResponseImpl(
      {required this.size, this.page, required final List<Vod> data})
      : _data = data;

  factory _$VodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodResponseImplFromJson(json);

  @override
  final int size;
  @override
  final VodPage? page;
  final List<Vod> _data;
  @override
  List<Vod> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'VodResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of VodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VodResponseImplCopyWith<_$VodResponseImpl> get copyWith =>
      __$$VodResponseImplCopyWithImpl<_$VodResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VodResponseImplToJson(
      this,
    );
  }
}

abstract class _VodResponse implements VodResponse {
  const factory _VodResponse(
      {required final int size,
      final VodPage? page,
      required final List<Vod> data}) = _$VodResponseImpl;

  factory _VodResponse.fromJson(Map<String, dynamic> json) =
      _$VodResponseImpl.fromJson;

  @override
  int get size;
  @override
  VodPage? get page;
  @override
  List<Vod> get data;

  /// Create a copy of VodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodResponseImplCopyWith<_$VodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VodPage _$VodPageFromJson(Map<String, dynamic> json) {
  return _VodPage.fromJson(json);
}

/// @nodoc
mixin _$VodPage {
  VodNext? get next => throw _privateConstructorUsedError;

  /// Serializes this VodPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VodPageCopyWith<VodPage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodPageCopyWith<$Res> {
  factory $VodPageCopyWith(VodPage value, $Res Function(VodPage) then) =
      _$VodPageCopyWithImpl<$Res, VodPage>;
  @useResult
  $Res call({VodNext? next});

  $VodNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$VodPageCopyWithImpl<$Res, $Val extends VodPage>
    implements $VodPageCopyWith<$Res> {
  _$VodPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VodPage
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
              as VodNext?,
    ) as $Val);
  }

  /// Create a copy of VodPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $VodNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VodPageImplCopyWith<$Res> implements $VodPageCopyWith<$Res> {
  factory _$$VodPageImplCopyWith(
          _$VodPageImpl value, $Res Function(_$VodPageImpl) then) =
      __$$VodPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VodNext? next});

  @override
  $VodNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$VodPageImplCopyWithImpl<$Res>
    extends _$VodPageCopyWithImpl<$Res, _$VodPageImpl>
    implements _$$VodPageImplCopyWith<$Res> {
  __$$VodPageImplCopyWithImpl(
      _$VodPageImpl _value, $Res Function(_$VodPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of VodPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$VodPageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as VodNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodPageImpl implements _VodPage {
  const _$VodPageImpl({this.next});

  factory _$VodPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodPageImplFromJson(json);

  @override
  final VodNext? next;

  @override
  String toString() {
    return 'VodPage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodPageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of VodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VodPageImplCopyWith<_$VodPageImpl> get copyWith =>
      __$$VodPageImplCopyWithImpl<_$VodPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VodPageImplToJson(
      this,
    );
  }
}

abstract class _VodPage implements VodPage {
  const factory _VodPage({final VodNext? next}) = _$VodPageImpl;

  factory _VodPage.fromJson(Map<String, dynamic> json) = _$VodPageImpl.fromJson;

  @override
  VodNext? get next;

  /// Create a copy of VodPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodPageImplCopyWith<_$VodPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VodNext _$VodNextFromJson(Map<String, dynamic> json) {
  return _VodNext.fromJson(json);
}

/// @nodoc
mixin _$VodNext {
  int? get publishDateAt => throw _privateConstructorUsedError;
  int? get readCount => throw _privateConstructorUsedError;

  /// Serializes this VodNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VodNextCopyWith<VodNext> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodNextCopyWith<$Res> {
  factory $VodNextCopyWith(VodNext value, $Res Function(VodNext) then) =
      _$VodNextCopyWithImpl<$Res, VodNext>;
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class _$VodNextCopyWithImpl<$Res, $Val extends VodNext>
    implements $VodNextCopyWith<$Res> {
  _$VodNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_value.copyWith(
      publishDateAt: freezed == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VodNextImplCopyWith<$Res> implements $VodNextCopyWith<$Res> {
  factory _$$VodNextImplCopyWith(
          _$VodNextImpl value, $Res Function(_$VodNextImpl) then) =
      __$$VodNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class __$$VodNextImplCopyWithImpl<$Res>
    extends _$VodNextCopyWithImpl<$Res, _$VodNextImpl>
    implements _$$VodNextImplCopyWith<$Res> {
  __$$VodNextImplCopyWithImpl(
      _$VodNextImpl _value, $Res Function(_$VodNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of VodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_$VodNextImpl(
      publishDateAt: freezed == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodNextImpl implements _VodNext {
  const _$VodNextImpl({this.publishDateAt, this.readCount});

  factory _$VodNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodNextImplFromJson(json);

  @override
  final int? publishDateAt;
  @override
  final int? readCount;

  @override
  String toString() {
    return 'VodNext(publishDateAt: $publishDateAt, readCount: $readCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodNextImpl &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publishDateAt, readCount);

  /// Create a copy of VodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VodNextImplCopyWith<_$VodNextImpl> get copyWith =>
      __$$VodNextImplCopyWithImpl<_$VodNextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VodNextImplToJson(
      this,
    );
  }
}

abstract class _VodNext implements VodNext {
  const factory _VodNext({final int? publishDateAt, final int? readCount}) =
      _$VodNextImpl;

  factory _VodNext.fromJson(Map<String, dynamic> json) = _$VodNextImpl.fromJson;

  @override
  int? get publishDateAt;
  @override
  int? get readCount;

  /// Create a copy of VodNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodNextImplCopyWith<_$VodNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelVodResponse _$ChannelVodResponseFromJson(Map<String, dynamic> json) {
  return _ChannelVodResponse.fromJson(json);
}

/// @nodoc
mixin _$ChannelVodResponse {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<Vod> get data => throw _privateConstructorUsedError;

  /// Serializes this ChannelVodResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelVodResponseCopyWith<ChannelVodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelVodResponseCopyWith<$Res> {
  factory $ChannelVodResponseCopyWith(
          ChannelVodResponse value, $Res Function(ChannelVodResponse) then) =
      _$ChannelVodResponseCopyWithImpl<$Res, ChannelVodResponse>;
  @useResult
  $Res call(
      {int page, int size, int totalCount, int totalPages, List<Vod> data});
}

/// @nodoc
class _$ChannelVodResponseCopyWithImpl<$Res, $Val extends ChannelVodResponse>
    implements $ChannelVodResponseCopyWith<$Res> {
  _$ChannelVodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelVodResponseImplCopyWith<$Res>
    implements $ChannelVodResponseCopyWith<$Res> {
  factory _$$ChannelVodResponseImplCopyWith(_$ChannelVodResponseImpl value,
          $Res Function(_$ChannelVodResponseImpl) then) =
      __$$ChannelVodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page, int size, int totalCount, int totalPages, List<Vod> data});
}

/// @nodoc
class __$$ChannelVodResponseImplCopyWithImpl<$Res>
    extends _$ChannelVodResponseCopyWithImpl<$Res, _$ChannelVodResponseImpl>
    implements _$$ChannelVodResponseImplCopyWith<$Res> {
  __$$ChannelVodResponseImplCopyWithImpl(_$ChannelVodResponseImpl _value,
      $Res Function(_$ChannelVodResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_$ChannelVodResponseImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelVodResponseImpl implements _ChannelVodResponse {
  const _$ChannelVodResponseImpl(
      {required this.page,
      required this.size,
      required this.totalCount,
      required this.totalPages,
      required final List<Vod> data})
      : _data = data;

  factory _$ChannelVodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelVodResponseImplFromJson(json);

  @override
  final int page;
  @override
  final int size;
  @override
  final int totalCount;
  @override
  final int totalPages;
  final List<Vod> _data;
  @override
  List<Vod> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ChannelVodResponse(page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelVodResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, totalCount,
      totalPages, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ChannelVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelVodResponseImplCopyWith<_$ChannelVodResponseImpl> get copyWith =>
      __$$ChannelVodResponseImplCopyWithImpl<_$ChannelVodResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelVodResponseImplToJson(
      this,
    );
  }
}

abstract class _ChannelVodResponse implements ChannelVodResponse {
  const factory _ChannelVodResponse(
      {required final int page,
      required final int size,
      required final int totalCount,
      required final int totalPages,
      required final List<Vod> data}) = _$ChannelVodResponseImpl;

  factory _ChannelVodResponse.fromJson(Map<String, dynamic> json) =
      _$ChannelVodResponseImpl.fromJson;

  @override
  int get page;
  @override
  int get size;
  @override
  int get totalCount;
  @override
  int get totalPages;
  @override
  List<Vod> get data;

  /// Create a copy of ChannelVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelVodResponseImplCopyWith<_$ChannelVodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingVodResponse _$FollowingVodResponseFromJson(Map<String, dynamic> json) {
  return _FollowingVodResponse.fromJson(json);
}

/// @nodoc
mixin _$FollowingVodResponse {
  int get size => throw _privateConstructorUsedError;
  FollowingVodPage? get page => throw _privateConstructorUsedError;
  List<Vod> get data => throw _privateConstructorUsedError;

  /// Serializes this FollowingVodResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowingVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingVodResponseCopyWith<FollowingVodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingVodResponseCopyWith<$Res> {
  factory $FollowingVodResponseCopyWith(FollowingVodResponse value,
          $Res Function(FollowingVodResponse) then) =
      _$FollowingVodResponseCopyWithImpl<$Res, FollowingVodResponse>;
  @useResult
  $Res call({int size, FollowingVodPage? page, List<Vod> data});

  $FollowingVodPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$FollowingVodResponseCopyWithImpl<$Res,
        $Val extends FollowingVodResponse>
    implements $FollowingVodResponseCopyWith<$Res> {
  _$FollowingVodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowingVodResponse
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
              as FollowingVodPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ) as $Val);
  }

  /// Create a copy of FollowingVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $FollowingVodPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowingVodResponseImplCopyWith<$Res>
    implements $FollowingVodResponseCopyWith<$Res> {
  factory _$$FollowingVodResponseImplCopyWith(_$FollowingVodResponseImpl value,
          $Res Function(_$FollowingVodResponseImpl) then) =
      __$$FollowingVodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, FollowingVodPage? page, List<Vod> data});

  @override
  $FollowingVodPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$FollowingVodResponseImplCopyWithImpl<$Res>
    extends _$FollowingVodResponseCopyWithImpl<$Res, _$FollowingVodResponseImpl>
    implements _$$FollowingVodResponseImplCopyWith<$Res> {
  __$$FollowingVodResponseImplCopyWithImpl(_$FollowingVodResponseImpl _value,
      $Res Function(_$FollowingVodResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowingVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$FollowingVodResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as FollowingVodPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingVodResponseImpl implements _FollowingVodResponse {
  const _$FollowingVodResponseImpl(
      {required this.size, this.page, required final List<Vod> data})
      : _data = data;

  factory _$FollowingVodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingVodResponseImplFromJson(json);

  @override
  final int size;
  @override
  final FollowingVodPage? page;
  final List<Vod> _data;
  @override
  List<Vod> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FollowingVodResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingVodResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of FollowingVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingVodResponseImplCopyWith<_$FollowingVodResponseImpl>
      get copyWith =>
          __$$FollowingVodResponseImplCopyWithImpl<_$FollowingVodResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingVodResponseImplToJson(
      this,
    );
  }
}

abstract class _FollowingVodResponse implements FollowingVodResponse {
  const factory _FollowingVodResponse(
      {required final int size,
      final FollowingVodPage? page,
      required final List<Vod> data}) = _$FollowingVodResponseImpl;

  factory _FollowingVodResponse.fromJson(Map<String, dynamic> json) =
      _$FollowingVodResponseImpl.fromJson;

  @override
  int get size;
  @override
  FollowingVodPage? get page;
  @override
  List<Vod> get data;

  /// Create a copy of FollowingVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingVodResponseImplCopyWith<_$FollowingVodResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FollowingVodPage _$FollowingVodPageFromJson(Map<String, dynamic> json) {
  return _FollowingVodPage.fromJson(json);
}

/// @nodoc
mixin _$FollowingVodPage {
  FollowingVodNext? get next => throw _privateConstructorUsedError;

  /// Serializes this FollowingVodPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowingVodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingVodPageCopyWith<FollowingVodPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingVodPageCopyWith<$Res> {
  factory $FollowingVodPageCopyWith(
          FollowingVodPage value, $Res Function(FollowingVodPage) then) =
      _$FollowingVodPageCopyWithImpl<$Res, FollowingVodPage>;
  @useResult
  $Res call({FollowingVodNext? next});

  $FollowingVodNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$FollowingVodPageCopyWithImpl<$Res, $Val extends FollowingVodPage>
    implements $FollowingVodPageCopyWith<$Res> {
  _$FollowingVodPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowingVodPage
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
              as FollowingVodNext?,
    ) as $Val);
  }

  /// Create a copy of FollowingVodPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingVodNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $FollowingVodNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowingVodPageImplCopyWith<$Res>
    implements $FollowingVodPageCopyWith<$Res> {
  factory _$$FollowingVodPageImplCopyWith(_$FollowingVodPageImpl value,
          $Res Function(_$FollowingVodPageImpl) then) =
      __$$FollowingVodPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FollowingVodNext? next});

  @override
  $FollowingVodNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$FollowingVodPageImplCopyWithImpl<$Res>
    extends _$FollowingVodPageCopyWithImpl<$Res, _$FollowingVodPageImpl>
    implements _$$FollowingVodPageImplCopyWith<$Res> {
  __$$FollowingVodPageImplCopyWithImpl(_$FollowingVodPageImpl _value,
      $Res Function(_$FollowingVodPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowingVodPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$FollowingVodPageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as FollowingVodNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingVodPageImpl implements _FollowingVodPage {
  const _$FollowingVodPageImpl({this.next});

  factory _$FollowingVodPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingVodPageImplFromJson(json);

  @override
  final FollowingVodNext? next;

  @override
  String toString() {
    return 'FollowingVodPage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingVodPageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of FollowingVodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingVodPageImplCopyWith<_$FollowingVodPageImpl> get copyWith =>
      __$$FollowingVodPageImplCopyWithImpl<_$FollowingVodPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingVodPageImplToJson(
      this,
    );
  }
}

abstract class _FollowingVodPage implements FollowingVodPage {
  const factory _FollowingVodPage({final FollowingVodNext? next}) =
      _$FollowingVodPageImpl;

  factory _FollowingVodPage.fromJson(Map<String, dynamic> json) =
      _$FollowingVodPageImpl.fromJson;

  @override
  FollowingVodNext? get next;

  /// Create a copy of FollowingVodPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingVodPageImplCopyWith<_$FollowingVodPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingVodNext _$FollowingVodNextFromJson(Map<String, dynamic> json) {
  return _FollowingVodNext.fromJson(json);
}

/// @nodoc
mixin _$FollowingVodNext {
  String? get nextNo => throw _privateConstructorUsedError;

  /// Serializes this FollowingVodNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowingVodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingVodNextCopyWith<FollowingVodNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingVodNextCopyWith<$Res> {
  factory $FollowingVodNextCopyWith(
          FollowingVodNext value, $Res Function(FollowingVodNext) then) =
      _$FollowingVodNextCopyWithImpl<$Res, FollowingVodNext>;
  @useResult
  $Res call({String? nextNo});
}

/// @nodoc
class _$FollowingVodNextCopyWithImpl<$Res, $Val extends FollowingVodNext>
    implements $FollowingVodNextCopyWith<$Res> {
  _$FollowingVodNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowingVodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextNo = freezed,
  }) {
    return _then(_value.copyWith(
      nextNo: freezed == nextNo
          ? _value.nextNo
          : nextNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingVodNextImplCopyWith<$Res>
    implements $FollowingVodNextCopyWith<$Res> {
  factory _$$FollowingVodNextImplCopyWith(_$FollowingVodNextImpl value,
          $Res Function(_$FollowingVodNextImpl) then) =
      __$$FollowingVodNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nextNo});
}

/// @nodoc
class __$$FollowingVodNextImplCopyWithImpl<$Res>
    extends _$FollowingVodNextCopyWithImpl<$Res, _$FollowingVodNextImpl>
    implements _$$FollowingVodNextImplCopyWith<$Res> {
  __$$FollowingVodNextImplCopyWithImpl(_$FollowingVodNextImpl _value,
      $Res Function(_$FollowingVodNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowingVodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextNo = freezed,
  }) {
    return _then(_$FollowingVodNextImpl(
      nextNo: freezed == nextNo
          ? _value.nextNo
          : nextNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingVodNextImpl implements _FollowingVodNext {
  const _$FollowingVodNextImpl({this.nextNo});

  factory _$FollowingVodNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingVodNextImplFromJson(json);

  @override
  final String? nextNo;

  @override
  String toString() {
    return 'FollowingVodNext(nextNo: $nextNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingVodNextImpl &&
            (identical(other.nextNo, nextNo) || other.nextNo == nextNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nextNo);

  /// Create a copy of FollowingVodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingVodNextImplCopyWith<_$FollowingVodNextImpl> get copyWith =>
      __$$FollowingVodNextImplCopyWithImpl<_$FollowingVodNextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingVodNextImplToJson(
      this,
    );
  }
}

abstract class _FollowingVodNext implements FollowingVodNext {
  const factory _FollowingVodNext({final String? nextNo}) =
      _$FollowingVodNextImpl;

  factory _FollowingVodNext.fromJson(Map<String, dynamic> json) =
      _$FollowingVodNextImpl.fromJson;

  @override
  String? get nextNo;

  /// Create a copy of FollowingVodNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingVodNextImplCopyWith<_$FollowingVodNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryVodResponse _$CategoryVodResponseFromJson(Map<String, dynamic> json) {
  return _CategoryVodResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryVodResponse {
  int get size => throw _privateConstructorUsedError;
  CategoryVodPage? get page => throw _privateConstructorUsedError;
  List<Vod> get data => throw _privateConstructorUsedError;

  /// Serializes this CategoryVodResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryVodResponseCopyWith<CategoryVodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryVodResponseCopyWith<$Res> {
  factory $CategoryVodResponseCopyWith(
          CategoryVodResponse value, $Res Function(CategoryVodResponse) then) =
      _$CategoryVodResponseCopyWithImpl<$Res, CategoryVodResponse>;
  @useResult
  $Res call({int size, CategoryVodPage? page, List<Vod> data});

  $CategoryVodPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$CategoryVodResponseCopyWithImpl<$Res, $Val extends CategoryVodResponse>
    implements $CategoryVodResponseCopyWith<$Res> {
  _$CategoryVodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryVodResponse
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
              as CategoryVodPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ) as $Val);
  }

  /// Create a copy of CategoryVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVodPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $CategoryVodPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryVodResponseImplCopyWith<$Res>
    implements $CategoryVodResponseCopyWith<$Res> {
  factory _$$CategoryVodResponseImplCopyWith(_$CategoryVodResponseImpl value,
          $Res Function(_$CategoryVodResponseImpl) then) =
      __$$CategoryVodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, CategoryVodPage? page, List<Vod> data});

  @override
  $CategoryVodPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$CategoryVodResponseImplCopyWithImpl<$Res>
    extends _$CategoryVodResponseCopyWithImpl<$Res, _$CategoryVodResponseImpl>
    implements _$$CategoryVodResponseImplCopyWith<$Res> {
  __$$CategoryVodResponseImplCopyWithImpl(_$CategoryVodResponseImpl _value,
      $Res Function(_$CategoryVodResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$CategoryVodResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CategoryVodPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryVodResponseImpl implements _CategoryVodResponse {
  const _$CategoryVodResponseImpl(
      {required this.size, this.page, required final List<Vod> data})
      : _data = data;

  factory _$CategoryVodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryVodResponseImplFromJson(json);

  @override
  final int size;
  @override
  final CategoryVodPage? page;
  final List<Vod> _data;
  @override
  List<Vod> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CategoryVodResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryVodResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CategoryVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryVodResponseImplCopyWith<_$CategoryVodResponseImpl> get copyWith =>
      __$$CategoryVodResponseImplCopyWithImpl<_$CategoryVodResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryVodResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoryVodResponse implements CategoryVodResponse {
  const factory _CategoryVodResponse(
      {required final int size,
      final CategoryVodPage? page,
      required final List<Vod> data}) = _$CategoryVodResponseImpl;

  factory _CategoryVodResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryVodResponseImpl.fromJson;

  @override
  int get size;
  @override
  CategoryVodPage? get page;
  @override
  List<Vod> get data;

  /// Create a copy of CategoryVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryVodResponseImplCopyWith<_$CategoryVodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryVodPage _$CategoryVodPageFromJson(Map<String, dynamic> json) {
  return _CategoryVodPage.fromJson(json);
}

/// @nodoc
mixin _$CategoryVodPage {
  CategoryVodNext? get next => throw _privateConstructorUsedError;

  /// Serializes this CategoryVodPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryVodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryVodPageCopyWith<CategoryVodPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryVodPageCopyWith<$Res> {
  factory $CategoryVodPageCopyWith(
          CategoryVodPage value, $Res Function(CategoryVodPage) then) =
      _$CategoryVodPageCopyWithImpl<$Res, CategoryVodPage>;
  @useResult
  $Res call({CategoryVodNext? next});

  $CategoryVodNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$CategoryVodPageCopyWithImpl<$Res, $Val extends CategoryVodPage>
    implements $CategoryVodPageCopyWith<$Res> {
  _$CategoryVodPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryVodPage
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
              as CategoryVodNext?,
    ) as $Val);
  }

  /// Create a copy of CategoryVodPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryVodNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $CategoryVodNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryVodPageImplCopyWith<$Res>
    implements $CategoryVodPageCopyWith<$Res> {
  factory _$$CategoryVodPageImplCopyWith(_$CategoryVodPageImpl value,
          $Res Function(_$CategoryVodPageImpl) then) =
      __$$CategoryVodPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryVodNext? next});

  @override
  $CategoryVodNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$CategoryVodPageImplCopyWithImpl<$Res>
    extends _$CategoryVodPageCopyWithImpl<$Res, _$CategoryVodPageImpl>
    implements _$$CategoryVodPageImplCopyWith<$Res> {
  __$$CategoryVodPageImplCopyWithImpl(
      _$CategoryVodPageImpl _value, $Res Function(_$CategoryVodPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryVodPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$CategoryVodPageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as CategoryVodNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryVodPageImpl implements _CategoryVodPage {
  const _$CategoryVodPageImpl({this.next});

  factory _$CategoryVodPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryVodPageImplFromJson(json);

  @override
  final CategoryVodNext? next;

  @override
  String toString() {
    return 'CategoryVodPage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryVodPageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of CategoryVodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryVodPageImplCopyWith<_$CategoryVodPageImpl> get copyWith =>
      __$$CategoryVodPageImplCopyWithImpl<_$CategoryVodPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryVodPageImplToJson(
      this,
    );
  }
}

abstract class _CategoryVodPage implements CategoryVodPage {
  const factory _CategoryVodPage({final CategoryVodNext? next}) =
      _$CategoryVodPageImpl;

  factory _CategoryVodPage.fromJson(Map<String, dynamic> json) =
      _$CategoryVodPageImpl.fromJson;

  @override
  CategoryVodNext? get next;

  /// Create a copy of CategoryVodPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryVodPageImplCopyWith<_$CategoryVodPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryVodNext _$CategoryVodNextFromJson(Map<String, dynamic> json) {
  return _CategoryVodNext.fromJson(json);
}

/// @nodoc
mixin _$CategoryVodNext {
  int? get publishDateAt => throw _privateConstructorUsedError;
  int? get readCount => throw _privateConstructorUsedError;

  /// Serializes this CategoryVodNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryVodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryVodNextCopyWith<CategoryVodNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryVodNextCopyWith<$Res> {
  factory $CategoryVodNextCopyWith(
          CategoryVodNext value, $Res Function(CategoryVodNext) then) =
      _$CategoryVodNextCopyWithImpl<$Res, CategoryVodNext>;
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class _$CategoryVodNextCopyWithImpl<$Res, $Val extends CategoryVodNext>
    implements $CategoryVodNextCopyWith<$Res> {
  _$CategoryVodNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryVodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_value.copyWith(
      publishDateAt: freezed == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryVodNextImplCopyWith<$Res>
    implements $CategoryVodNextCopyWith<$Res> {
  factory _$$CategoryVodNextImplCopyWith(_$CategoryVodNextImpl value,
          $Res Function(_$CategoryVodNextImpl) then) =
      __$$CategoryVodNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class __$$CategoryVodNextImplCopyWithImpl<$Res>
    extends _$CategoryVodNextCopyWithImpl<$Res, _$CategoryVodNextImpl>
    implements _$$CategoryVodNextImplCopyWith<$Res> {
  __$$CategoryVodNextImplCopyWithImpl(
      _$CategoryVodNextImpl _value, $Res Function(_$CategoryVodNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryVodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_$CategoryVodNextImpl(
      publishDateAt: freezed == publishDateAt
          ? _value.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryVodNextImpl implements _CategoryVodNext {
  const _$CategoryVodNextImpl({this.publishDateAt, this.readCount});

  factory _$CategoryVodNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryVodNextImplFromJson(json);

  @override
  final int? publishDateAt;
  @override
  final int? readCount;

  @override
  String toString() {
    return 'CategoryVodNext(publishDateAt: $publishDateAt, readCount: $readCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryVodNextImpl &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publishDateAt, readCount);

  /// Create a copy of CategoryVodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryVodNextImplCopyWith<_$CategoryVodNextImpl> get copyWith =>
      __$$CategoryVodNextImplCopyWithImpl<_$CategoryVodNextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryVodNextImplToJson(
      this,
    );
  }
}

abstract class _CategoryVodNext implements CategoryVodNext {
  const factory _CategoryVodNext(
      {final int? publishDateAt, final int? readCount}) = _$CategoryVodNextImpl;

  factory _CategoryVodNext.fromJson(Map<String, dynamic> json) =
      _$CategoryVodNextImpl.fromJson;

  @override
  int? get publishDateAt;
  @override
  int? get readCount;

  /// Create a copy of CategoryVodNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryVodNextImplCopyWith<_$CategoryVodNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
