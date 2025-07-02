// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_chat_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VodChatResponse _$VodChatResponseFromJson(Map<String, dynamic> json) {
  return _VodChatResponse.fromJson(json);
}

/// @nodoc
mixin _$VodChatResponse {
  int? get nextPlayerMessageTime => throw _privateConstructorUsedError;
  List<VodChat>? get previousVideoChats => throw _privateConstructorUsedError;
  List<VodChat>? get videoChats => throw _privateConstructorUsedError;

  /// Serializes this VodChatResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VodChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VodChatResponseCopyWith<VodChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodChatResponseCopyWith<$Res> {
  factory $VodChatResponseCopyWith(
          VodChatResponse value, $Res Function(VodChatResponse) then) =
      _$VodChatResponseCopyWithImpl<$Res, VodChatResponse>;
  @useResult
  $Res call(
      {int? nextPlayerMessageTime,
      List<VodChat>? previousVideoChats,
      List<VodChat>? videoChats});
}

/// @nodoc
class _$VodChatResponseCopyWithImpl<$Res, $Val extends VodChatResponse>
    implements $VodChatResponseCopyWith<$Res> {
  _$VodChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VodChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPlayerMessageTime = freezed,
    Object? previousVideoChats = freezed,
    Object? videoChats = freezed,
  }) {
    return _then(_value.copyWith(
      nextPlayerMessageTime: freezed == nextPlayerMessageTime
          ? _value.nextPlayerMessageTime
          : nextPlayerMessageTime // ignore: cast_nullable_to_non_nullable
              as int?,
      previousVideoChats: freezed == previousVideoChats
          ? _value.previousVideoChats
          : previousVideoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
      videoChats: freezed == videoChats
          ? _value.videoChats
          : videoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VodChatResponseImplCopyWith<$Res>
    implements $VodChatResponseCopyWith<$Res> {
  factory _$$VodChatResponseImplCopyWith(_$VodChatResponseImpl value,
          $Res Function(_$VodChatResponseImpl) then) =
      __$$VodChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? nextPlayerMessageTime,
      List<VodChat>? previousVideoChats,
      List<VodChat>? videoChats});
}

/// @nodoc
class __$$VodChatResponseImplCopyWithImpl<$Res>
    extends _$VodChatResponseCopyWithImpl<$Res, _$VodChatResponseImpl>
    implements _$$VodChatResponseImplCopyWith<$Res> {
  __$$VodChatResponseImplCopyWithImpl(
      _$VodChatResponseImpl _value, $Res Function(_$VodChatResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VodChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPlayerMessageTime = freezed,
    Object? previousVideoChats = freezed,
    Object? videoChats = freezed,
  }) {
    return _then(_$VodChatResponseImpl(
      nextPlayerMessageTime: freezed == nextPlayerMessageTime
          ? _value.nextPlayerMessageTime
          : nextPlayerMessageTime // ignore: cast_nullable_to_non_nullable
              as int?,
      previousVideoChats: freezed == previousVideoChats
          ? _value._previousVideoChats
          : previousVideoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
      videoChats: freezed == videoChats
          ? _value._videoChats
          : videoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodChatResponseImpl implements _VodChatResponse {
  const _$VodChatResponseImpl(
      {this.nextPlayerMessageTime,
      final List<VodChat>? previousVideoChats,
      final List<VodChat>? videoChats})
      : _previousVideoChats = previousVideoChats,
        _videoChats = videoChats;

  factory _$VodChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodChatResponseImplFromJson(json);

  @override
  final int? nextPlayerMessageTime;
  final List<VodChat>? _previousVideoChats;
  @override
  List<VodChat>? get previousVideoChats {
    final value = _previousVideoChats;
    if (value == null) return null;
    if (_previousVideoChats is EqualUnmodifiableListView)
      return _previousVideoChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<VodChat>? _videoChats;
  @override
  List<VodChat>? get videoChats {
    final value = _videoChats;
    if (value == null) return null;
    if (_videoChats is EqualUnmodifiableListView) return _videoChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VodChatResponse(nextPlayerMessageTime: $nextPlayerMessageTime, previousVideoChats: $previousVideoChats, videoChats: $videoChats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodChatResponseImpl &&
            (identical(other.nextPlayerMessageTime, nextPlayerMessageTime) ||
                other.nextPlayerMessageTime == nextPlayerMessageTime) &&
            const DeepCollectionEquality()
                .equals(other._previousVideoChats, _previousVideoChats) &&
            const DeepCollectionEquality()
                .equals(other._videoChats, _videoChats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nextPlayerMessageTime,
      const DeepCollectionEquality().hash(_previousVideoChats),
      const DeepCollectionEquality().hash(_videoChats));

  /// Create a copy of VodChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VodChatResponseImplCopyWith<_$VodChatResponseImpl> get copyWith =>
      __$$VodChatResponseImplCopyWithImpl<_$VodChatResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VodChatResponseImplToJson(
      this,
    );
  }
}

abstract class _VodChatResponse implements VodChatResponse {
  const factory _VodChatResponse(
      {final int? nextPlayerMessageTime,
      final List<VodChat>? previousVideoChats,
      final List<VodChat>? videoChats}) = _$VodChatResponseImpl;

  factory _VodChatResponse.fromJson(Map<String, dynamic> json) =
      _$VodChatResponseImpl.fromJson;

  @override
  int? get nextPlayerMessageTime;
  @override
  List<VodChat>? get previousVideoChats;
  @override
  List<VodChat>? get videoChats;

  /// Create a copy of VodChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodChatResponseImplCopyWith<_$VodChatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
