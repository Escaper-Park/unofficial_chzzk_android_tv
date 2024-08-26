// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveStream _$LiveStreamFromJson(Map<String, dynamic> json) {
  return _LiveStream.fromJson(json);
}

/// @nodoc
mixin _$LiveStream {
  LiveDetail get liveDetail => throw _privateConstructorUsedError;
  List<Uri?> get uris => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveStreamCopyWith<LiveStream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveStreamCopyWith<$Res> {
  factory $LiveStreamCopyWith(
          LiveStream value, $Res Function(LiveStream) then) =
      _$LiveStreamCopyWithImpl<$Res, LiveStream>;
  @useResult
  $Res call({LiveDetail liveDetail, List<Uri?> uris});

  $LiveDetailCopyWith<$Res> get liveDetail;
}

/// @nodoc
class _$LiveStreamCopyWithImpl<$Res, $Val extends LiveStream>
    implements $LiveStreamCopyWith<$Res> {
  _$LiveStreamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveDetail = null,
    Object? uris = null,
  }) {
    return _then(_value.copyWith(
      liveDetail: null == liveDetail
          ? _value.liveDetail
          : liveDetail // ignore: cast_nullable_to_non_nullable
              as LiveDetail,
      uris: null == uris
          ? _value.uris
          : uris // ignore: cast_nullable_to_non_nullable
              as List<Uri?>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LiveDetailCopyWith<$Res> get liveDetail {
    return $LiveDetailCopyWith<$Res>(_value.liveDetail, (value) {
      return _then(_value.copyWith(liveDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveStreamImplCopyWith<$Res>
    implements $LiveStreamCopyWith<$Res> {
  factory _$$LiveStreamImplCopyWith(
          _$LiveStreamImpl value, $Res Function(_$LiveStreamImpl) then) =
      __$$LiveStreamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LiveDetail liveDetail, List<Uri?> uris});

  @override
  $LiveDetailCopyWith<$Res> get liveDetail;
}

/// @nodoc
class __$$LiveStreamImplCopyWithImpl<$Res>
    extends _$LiveStreamCopyWithImpl<$Res, _$LiveStreamImpl>
    implements _$$LiveStreamImplCopyWith<$Res> {
  __$$LiveStreamImplCopyWithImpl(
      _$LiveStreamImpl _value, $Res Function(_$LiveStreamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveDetail = null,
    Object? uris = null,
  }) {
    return _then(_$LiveStreamImpl(
      liveDetail: null == liveDetail
          ? _value.liveDetail
          : liveDetail // ignore: cast_nullable_to_non_nullable
              as LiveDetail,
      uris: null == uris
          ? _value._uris
          : uris // ignore: cast_nullable_to_non_nullable
              as List<Uri?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveStreamImpl implements _LiveStream {
  _$LiveStreamImpl({required this.liveDetail, required final List<Uri?> uris})
      : _uris = uris;

  factory _$LiveStreamImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveStreamImplFromJson(json);

  @override
  final LiveDetail liveDetail;
  final List<Uri?> _uris;
  @override
  List<Uri?> get uris {
    if (_uris is EqualUnmodifiableListView) return _uris;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uris);
  }

  @override
  String toString() {
    return 'LiveStream(liveDetail: $liveDetail, uris: $uris)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveStreamImpl &&
            (identical(other.liveDetail, liveDetail) ||
                other.liveDetail == liveDetail) &&
            const DeepCollectionEquality().equals(other._uris, _uris));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, liveDetail, const DeepCollectionEquality().hash(_uris));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveStreamImplCopyWith<_$LiveStreamImpl> get copyWith =>
      __$$LiveStreamImplCopyWithImpl<_$LiveStreamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveStreamImplToJson(
      this,
    );
  }
}

abstract class _LiveStream implements LiveStream {
  factory _LiveStream(
      {required final LiveDetail liveDetail,
      required final List<Uri?> uris}) = _$LiveStreamImpl;

  factory _LiveStream.fromJson(Map<String, dynamic> json) =
      _$LiveStreamImpl.fromJson;

  @override
  LiveDetail get liveDetail;
  @override
  List<Uri?> get uris;
  @override
  @JsonKey(ignore: true)
  _$$LiveStreamImplCopyWith<_$LiveStreamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
