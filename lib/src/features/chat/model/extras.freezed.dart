// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extras.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Extras {
  String? get chatType;
  Map<String, String>? get emojis;
  String? get streamingChannelId;
  bool? get isAnonymous;
  String? get nickname;
  int? get payAmount;
  String? get donationType;

  /// Create a copy of Extras
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExtrasCopyWith<Extras> get copyWith =>
      _$ExtrasCopyWithImpl<Extras>(this as Extras, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Extras &&
            (identical(other.chatType, chatType) ||
                other.chatType == chatType) &&
            const DeepCollectionEquality().equals(other.emojis, emojis) &&
            (identical(other.streamingChannelId, streamingChannelId) ||
                other.streamingChannelId == streamingChannelId) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.payAmount, payAmount) ||
                other.payAmount == payAmount) &&
            (identical(other.donationType, donationType) ||
                other.donationType == donationType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatType,
      const DeepCollectionEquality().hash(emojis),
      streamingChannelId,
      isAnonymous,
      nickname,
      payAmount,
      donationType);

  @override
  String toString() {
    return 'Extras(chatType: $chatType, emojis: $emojis, streamingChannelId: $streamingChannelId, isAnonymous: $isAnonymous, nickname: $nickname, payAmount: $payAmount, donationType: $donationType)';
  }
}

/// @nodoc
abstract mixin class $ExtrasCopyWith<$Res> {
  factory $ExtrasCopyWith(Extras value, $Res Function(Extras) _then) =
      _$ExtrasCopyWithImpl;
  @useResult
  $Res call(
      {String? chatType,
      Map<String, String>? emojis,
      String? streamingChannelId,
      bool? isAnonymous,
      String? nickname,
      int? payAmount,
      String? donationType});
}

/// @nodoc
class _$ExtrasCopyWithImpl<$Res> implements $ExtrasCopyWith<$Res> {
  _$ExtrasCopyWithImpl(this._self, this._then);

  final Extras _self;
  final $Res Function(Extras) _then;

  /// Create a copy of Extras
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatType = freezed,
    Object? emojis = freezed,
    Object? streamingChannelId = freezed,
    Object? isAnonymous = freezed,
    Object? nickname = freezed,
    Object? payAmount = freezed,
    Object? donationType = freezed,
  }) {
    return _then(Extras(
      chatType: freezed == chatType
          ? _self.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as String?,
      emojis: freezed == emojis
          ? _self.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      streamingChannelId: freezed == streamingChannelId
          ? _self.streamingChannelId
          : streamingChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: freezed == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool?,
      nickname: freezed == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      payAmount: freezed == payAmount
          ? _self.payAmount
          : payAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      donationType: freezed == donationType
          ? _self.donationType
          : donationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
