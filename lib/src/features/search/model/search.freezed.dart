// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

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
  List<SearchChannelData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchChannelResponseCopyWith<SearchChannelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchChannelResponseCopyWith<$Res> {
  factory $SearchChannelResponseCopyWith(SearchChannelResponse value,
          $Res Function(SearchChannelResponse) then) =
      _$SearchChannelResponseCopyWithImpl<$Res, SearchChannelResponse>;
  @useResult
  $Res call({int size, List<SearchChannelData> data});
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
              as List<SearchChannelData>,
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
  $Res call({int size, List<SearchChannelData> data});
}

/// @nodoc
class __$$SearchChannelResponseImplCopyWithImpl<$Res>
    extends _$SearchChannelResponseCopyWithImpl<$Res,
        _$SearchChannelResponseImpl>
    implements _$$SearchChannelResponseImplCopyWith<$Res> {
  __$$SearchChannelResponseImplCopyWithImpl(_$SearchChannelResponseImpl _value,
      $Res Function(_$SearchChannelResponseImpl) _then)
      : super(_value, _then);

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
              as List<SearchChannelData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchChannelResponseImpl implements _SearchChannelResponse {
  const _$SearchChannelResponseImpl(
      {required this.size, required final List<SearchChannelData> data})
      : _data = data;

  factory _$SearchChannelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchChannelResponseImplFromJson(json);

  @override
  final int size;
  final List<SearchChannelData> _data;
  @override
  List<SearchChannelData> get data {
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
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
          required final List<SearchChannelData> data}) =
      _$SearchChannelResponseImpl;

  factory _SearchChannelResponse.fromJson(Map<String, dynamic> json) =
      _$SearchChannelResponseImpl.fromJson;

  @override
  int get size;
  @override
  List<SearchChannelData> get data;
  @override
  @JsonKey(ignore: true)
  _$$SearchChannelResponseImplCopyWith<_$SearchChannelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchChannelData _$SearchChannelDataFromJson(Map<String, dynamic> json) {
  return _SearchChannelData.fromJson(json);
}

/// @nodoc
mixin _$SearchChannelData {
  Channel get channel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchChannelDataCopyWith<SearchChannelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchChannelDataCopyWith<$Res> {
  factory $SearchChannelDataCopyWith(
          SearchChannelData value, $Res Function(SearchChannelData) then) =
      _$SearchChannelDataCopyWithImpl<$Res, SearchChannelData>;
  @useResult
  $Res call({Channel channel});

  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class _$SearchChannelDataCopyWithImpl<$Res, $Val extends SearchChannelData>
    implements $SearchChannelDataCopyWith<$Res> {
  _$SearchChannelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
  }) {
    return _then(_value.copyWith(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<$Res> get channel {
    return $ChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchChannelDataImplCopyWith<$Res>
    implements $SearchChannelDataCopyWith<$Res> {
  factory _$$SearchChannelDataImplCopyWith(_$SearchChannelDataImpl value,
          $Res Function(_$SearchChannelDataImpl) then) =
      __$$SearchChannelDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Channel channel});

  @override
  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$$SearchChannelDataImplCopyWithImpl<$Res>
    extends _$SearchChannelDataCopyWithImpl<$Res, _$SearchChannelDataImpl>
    implements _$$SearchChannelDataImplCopyWith<$Res> {
  __$$SearchChannelDataImplCopyWithImpl(_$SearchChannelDataImpl _value,
      $Res Function(_$SearchChannelDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
  }) {
    return _then(_$SearchChannelDataImpl(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchChannelDataImpl implements _SearchChannelData {
  const _$SearchChannelDataImpl({required this.channel});

  factory _$SearchChannelDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchChannelDataImplFromJson(json);

  @override
  final Channel channel;

  @override
  String toString() {
    return 'SearchChannelData(channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchChannelDataImpl &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, channel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchChannelDataImplCopyWith<_$SearchChannelDataImpl> get copyWith =>
      __$$SearchChannelDataImplCopyWithImpl<_$SearchChannelDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchChannelDataImplToJson(
      this,
    );
  }
}

abstract class _SearchChannelData implements SearchChannelData {
  const factory _SearchChannelData({required final Channel channel}) =
      _$SearchChannelDataImpl;

  factory _SearchChannelData.fromJson(Map<String, dynamic> json) =
      _$SearchChannelDataImpl.fromJson;

  @override
  Channel get channel;
  @override
  @JsonKey(ignore: true)
  _$$SearchChannelDataImplCopyWith<_$SearchChannelDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
