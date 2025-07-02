// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extras.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Extras _$ExtrasFromJson(Map<String, dynamic> json) {
  return _Extras.fromJson(json);
}

/// @nodoc
mixin _$Extras {
  String? get chatType => throw _privateConstructorUsedError;
  Map<String, String>? get emojis => throw _privateConstructorUsedError;
  String? get streamingChannelId => throw _privateConstructorUsedError;
  bool? get isAnonymous => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  int? get payAmount => throw _privateConstructorUsedError;
  String? get donationType => throw _privateConstructorUsedError;

  /// Serializes this Extras to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Extras
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtrasCopyWith<Extras> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtrasCopyWith<$Res> {
  factory $ExtrasCopyWith(Extras value, $Res Function(Extras) then) =
      _$ExtrasCopyWithImpl<$Res, Extras>;
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
class _$ExtrasCopyWithImpl<$Res, $Val extends Extras>
    implements $ExtrasCopyWith<$Res> {
  _$ExtrasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      chatType: freezed == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as String?,
      emojis: freezed == emojis
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      streamingChannelId: freezed == streamingChannelId
          ? _value.streamingChannelId
          : streamingChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: freezed == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      payAmount: freezed == payAmount
          ? _value.payAmount
          : payAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      donationType: freezed == donationType
          ? _value.donationType
          : donationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtrasImplCopyWith<$Res> implements $ExtrasCopyWith<$Res> {
  factory _$$ExtrasImplCopyWith(
          _$ExtrasImpl value, $Res Function(_$ExtrasImpl) then) =
      __$$ExtrasImplCopyWithImpl<$Res>;
  @override
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
class __$$ExtrasImplCopyWithImpl<$Res>
    extends _$ExtrasCopyWithImpl<$Res, _$ExtrasImpl>
    implements _$$ExtrasImplCopyWith<$Res> {
  __$$ExtrasImplCopyWithImpl(
      _$ExtrasImpl _value, $Res Function(_$ExtrasImpl) _then)
      : super(_value, _then);

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
    return _then(_$ExtrasImpl(
      chatType: freezed == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as String?,
      emojis: freezed == emojis
          ? _value._emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      streamingChannelId: freezed == streamingChannelId
          ? _value.streamingChannelId
          : streamingChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: freezed == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      payAmount: freezed == payAmount
          ? _value.payAmount
          : payAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      donationType: freezed == donationType
          ? _value.donationType
          : donationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtrasImpl implements _Extras {
  const _$ExtrasImpl(
      {this.chatType,
      final Map<String, String>? emojis,
      this.streamingChannelId,
      this.isAnonymous,
      this.nickname,
      this.payAmount,
      this.donationType})
      : _emojis = emojis;

  factory _$ExtrasImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtrasImplFromJson(json);

  @override
  final String? chatType;
  final Map<String, String>? _emojis;
  @override
  Map<String, String>? get emojis {
    final value = _emojis;
    if (value == null) return null;
    if (_emojis is EqualUnmodifiableMapView) return _emojis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? streamingChannelId;
  @override
  final bool? isAnonymous;
  @override
  final String? nickname;
  @override
  final int? payAmount;
  @override
  final String? donationType;

  @override
  String toString() {
    return 'Extras(chatType: $chatType, emojis: $emojis, streamingChannelId: $streamingChannelId, isAnonymous: $isAnonymous, nickname: $nickname, payAmount: $payAmount, donationType: $donationType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtrasImpl &&
            (identical(other.chatType, chatType) ||
                other.chatType == chatType) &&
            const DeepCollectionEquality().equals(other._emojis, _emojis) &&
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
      const DeepCollectionEquality().hash(_emojis),
      streamingChannelId,
      isAnonymous,
      nickname,
      payAmount,
      donationType);

  /// Create a copy of Extras
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtrasImplCopyWith<_$ExtrasImpl> get copyWith =>
      __$$ExtrasImplCopyWithImpl<_$ExtrasImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtrasImplToJson(
      this,
    );
  }
}

abstract class _Extras implements Extras {
  const factory _Extras(
      {final String? chatType,
      final Map<String, String>? emojis,
      final String? streamingChannelId,
      final bool? isAnonymous,
      final String? nickname,
      final int? payAmount,
      final String? donationType}) = _$ExtrasImpl;

  factory _Extras.fromJson(Map<String, dynamic> json) = _$ExtrasImpl.fromJson;

  @override
  String? get chatType;
  @override
  Map<String, String>? get emojis;
  @override
  String? get streamingChannelId;
  @override
  bool? get isAnonymous;
  @override
  String? get nickname;
  @override
  int? get payAmount;
  @override
  String? get donationType;

  /// Create a copy of Extras
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtrasImplCopyWith<_$ExtrasImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
