// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_chat_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodChatResponse {
  int? get nextPlayerMessageTime;
  List<VodChat>? get previousVideoChats;
  List<VodChat>? get videoChats;

  /// Create a copy of VodChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodChatResponseCopyWith<VodChatResponse> get copyWith =>
      _$VodChatResponseCopyWithImpl<VodChatResponse>(
          this as VodChatResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodChatResponse &&
            (identical(other.nextPlayerMessageTime, nextPlayerMessageTime) ||
                other.nextPlayerMessageTime == nextPlayerMessageTime) &&
            const DeepCollectionEquality()
                .equals(other.previousVideoChats, previousVideoChats) &&
            const DeepCollectionEquality()
                .equals(other.videoChats, videoChats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nextPlayerMessageTime,
      const DeepCollectionEquality().hash(previousVideoChats),
      const DeepCollectionEquality().hash(videoChats));

  @override
  String toString() {
    return 'VodChatResponse(nextPlayerMessageTime: $nextPlayerMessageTime, previousVideoChats: $previousVideoChats, videoChats: $videoChats)';
  }
}

/// @nodoc
abstract mixin class $VodChatResponseCopyWith<$Res> {
  factory $VodChatResponseCopyWith(
          VodChatResponse value, $Res Function(VodChatResponse) _then) =
      _$VodChatResponseCopyWithImpl;
  @useResult
  $Res call(
      {int? nextPlayerMessageTime,
      List<VodChat>? previousVideoChats,
      List<VodChat>? videoChats});
}

/// @nodoc
class _$VodChatResponseCopyWithImpl<$Res>
    implements $VodChatResponseCopyWith<$Res> {
  _$VodChatResponseCopyWithImpl(this._self, this._then);

  final VodChatResponse _self;
  final $Res Function(VodChatResponse) _then;

  /// Create a copy of VodChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPlayerMessageTime = freezed,
    Object? previousVideoChats = freezed,
    Object? videoChats = freezed,
  }) {
    return _then(VodChatResponse(
      nextPlayerMessageTime: freezed == nextPlayerMessageTime
          ? _self.nextPlayerMessageTime
          : nextPlayerMessageTime // ignore: cast_nullable_to_non_nullable
              as int?,
      previousVideoChats: freezed == previousVideoChats
          ? _self.previousVideoChats
          : previousVideoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
      videoChats: freezed == videoChats
          ? _self.videoChats
          : videoChats // ignore: cast_nullable_to_non_nullable
              as List<VodChat>?,
    ));
  }
}

// dart format on
