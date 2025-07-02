// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchChannelResponse _$SearchChannelResponseFromJson(
    Map<String, dynamic> json) {
  return _SearchChannelResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchChannelResponse {
  int get size => throw _privateConstructorUsedError;
  List<dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this SearchChannelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchChannelResponseCopyWith<SearchChannelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchChannelResponseCopyWith<$Res> {
  factory $SearchChannelResponseCopyWith(SearchChannelResponse value,
          $Res Function(SearchChannelResponse) then) =
      _$SearchChannelResponseCopyWithImpl<$Res, SearchChannelResponse>;
  @useResult
  $Res call({int size, List<dynamic> data});
}

/// @nodoc
class _$SearchChannelResponseCopyWithImpl<$Res,
        $Val extends SearchChannelResponse>
    implements $SearchChannelResponseCopyWith<$Res> {
  _$SearchChannelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchChannelResponseImplCopyWith<$Res>
    implements $SearchChannelResponseCopyWith<$Res> {
  factory _$$SearchChannelResponseImplCopyWith(
          _$SearchChannelResponseImpl value,
          $Res Function(_$SearchChannelResponseImpl) then) =
      __$$SearchChannelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, List<dynamic> data});
}

/// @nodoc
class __$$SearchChannelResponseImplCopyWithImpl<$Res>
    extends _$SearchChannelResponseCopyWithImpl<$Res,
        _$SearchChannelResponseImpl>
    implements _$$SearchChannelResponseImplCopyWith<$Res> {
  __$$SearchChannelResponseImplCopyWithImpl(_$SearchChannelResponseImpl _value,
      $Res Function(_$SearchChannelResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? data = null,
  }) {
    return _then(_$SearchChannelResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchChannelResponseImpl implements _SearchChannelResponse {
  const _$SearchChannelResponseImpl(
      {required this.size, required final List<dynamic> data})
      : _data = data;

  factory _$SearchChannelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchChannelResponseImplFromJson(json);

  @override
  final int size;
  final List<dynamic> _data;
  @override
  List<dynamic> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SearchChannelResponse(size: $size, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchChannelResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchChannelResponseImplCopyWith<_$SearchChannelResponseImpl>
      get copyWith => __$$SearchChannelResponseImplCopyWithImpl<
          _$SearchChannelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchChannelResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchChannelResponse implements SearchChannelResponse {
  const factory _SearchChannelResponse(
      {required final int size,
      required final List<dynamic> data}) = _$SearchChannelResponseImpl;

  factory _SearchChannelResponse.fromJson(Map<String, dynamic> json) =
      _$SearchChannelResponseImpl.fromJson;

  @override
  int get size;
  @override
  List<dynamic> get data;

  /// Create a copy of SearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchChannelResponseImplCopyWith<_$SearchChannelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchVodResponse _$SearchVodResponseFromJson(Map<String, dynamic> json) {
  return _SearchVodResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchVodResponse {
  int get size => throw _privateConstructorUsedError;
  List<dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this SearchVodResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchVodResponseCopyWith<SearchVodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchVodResponseCopyWith<$Res> {
  factory $SearchVodResponseCopyWith(
          SearchVodResponse value, $Res Function(SearchVodResponse) then) =
      _$SearchVodResponseCopyWithImpl<$Res, SearchVodResponse>;
  @useResult
  $Res call({int size, List<dynamic> data});
}

/// @nodoc
class _$SearchVodResponseCopyWithImpl<$Res, $Val extends SearchVodResponse>
    implements $SearchVodResponseCopyWith<$Res> {
  _$SearchVodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchVodResponseImplCopyWith<$Res>
    implements $SearchVodResponseCopyWith<$Res> {
  factory _$$SearchVodResponseImplCopyWith(_$SearchVodResponseImpl value,
          $Res Function(_$SearchVodResponseImpl) then) =
      __$$SearchVodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, List<dynamic> data});
}

/// @nodoc
class __$$SearchVodResponseImplCopyWithImpl<$Res>
    extends _$SearchVodResponseCopyWithImpl<$Res, _$SearchVodResponseImpl>
    implements _$$SearchVodResponseImplCopyWith<$Res> {
  __$$SearchVodResponseImplCopyWithImpl(_$SearchVodResponseImpl _value,
      $Res Function(_$SearchVodResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? data = null,
  }) {
    return _then(_$SearchVodResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchVodResponseImpl implements _SearchVodResponse {
  const _$SearchVodResponseImpl(
      {required this.size, required final List<dynamic> data})
      : _data = data;

  factory _$SearchVodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchVodResponseImplFromJson(json);

  @override
  final int size;
  final List<dynamic> _data;
  @override
  List<dynamic> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SearchVodResponse(size: $size, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchVodResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SearchVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchVodResponseImplCopyWith<_$SearchVodResponseImpl> get copyWith =>
      __$$SearchVodResponseImplCopyWithImpl<_$SearchVodResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchVodResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchVodResponse implements SearchVodResponse {
  const factory _SearchVodResponse(
      {required final int size,
      required final List<dynamic> data}) = _$SearchVodResponseImpl;

  factory _SearchVodResponse.fromJson(Map<String, dynamic> json) =
      _$SearchVodResponseImpl.fromJson;

  @override
  int get size;
  @override
  List<dynamic> get data;

  /// Create a copy of SearchVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchVodResponseImplCopyWith<_$SearchVodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchLiveResponse _$SearchLiveResponseFromJson(Map<String, dynamic> json) {
  return _SearchLiveResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchLiveResponse {
  int get size => throw _privateConstructorUsedError;
  List<dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this SearchLiveResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchLiveResponseCopyWith<SearchLiveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchLiveResponseCopyWith<$Res> {
  factory $SearchLiveResponseCopyWith(
          SearchLiveResponse value, $Res Function(SearchLiveResponse) then) =
      _$SearchLiveResponseCopyWithImpl<$Res, SearchLiveResponse>;
  @useResult
  $Res call({int size, List<dynamic> data});
}

/// @nodoc
class _$SearchLiveResponseCopyWithImpl<$Res, $Val extends SearchLiveResponse>
    implements $SearchLiveResponseCopyWith<$Res> {
  _$SearchLiveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchLiveResponseImplCopyWith<$Res>
    implements $SearchLiveResponseCopyWith<$Res> {
  factory _$$SearchLiveResponseImplCopyWith(_$SearchLiveResponseImpl value,
          $Res Function(_$SearchLiveResponseImpl) then) =
      __$$SearchLiveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, List<dynamic> data});
}

/// @nodoc
class __$$SearchLiveResponseImplCopyWithImpl<$Res>
    extends _$SearchLiveResponseCopyWithImpl<$Res, _$SearchLiveResponseImpl>
    implements _$$SearchLiveResponseImplCopyWith<$Res> {
  __$$SearchLiveResponseImplCopyWithImpl(_$SearchLiveResponseImpl _value,
      $Res Function(_$SearchLiveResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? data = null,
  }) {
    return _then(_$SearchLiveResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchLiveResponseImpl implements _SearchLiveResponse {
  const _$SearchLiveResponseImpl(
      {required this.size, required final List<dynamic> data})
      : _data = data;

  factory _$SearchLiveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchLiveResponseImplFromJson(json);

  @override
  final int size;
  final List<dynamic> _data;
  @override
  List<dynamic> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SearchLiveResponse(size: $size, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLiveResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SearchLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchLiveResponseImplCopyWith<_$SearchLiveResponseImpl> get copyWith =>
      __$$SearchLiveResponseImplCopyWithImpl<_$SearchLiveResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchLiveResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchLiveResponse implements SearchLiveResponse {
  const factory _SearchLiveResponse(
      {required final int size,
      required final List<dynamic> data}) = _$SearchLiveResponseImpl;

  factory _SearchLiveResponse.fromJson(Map<String, dynamic> json) =
      _$SearchLiveResponseImpl.fromJson;

  @override
  int get size;
  @override
  List<dynamic> get data;

  /// Create a copy of SearchLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchLiveResponseImplCopyWith<_$SearchLiveResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
