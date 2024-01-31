// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return _Channel.fromJson(json);
}

/// @nodoc
mixin _$Channel {
  String get channelId => throw _privateConstructorUsedError;
  String get channelName => throw _privateConstructorUsedError;
  String? get channelImageUrl => throw _privateConstructorUsedError;
  bool get verifiedMark => throw _privateConstructorUsedError;
  int? get followerCount => throw _privateConstructorUsedError;
  String? get channelDescription => throw _privateConstructorUsedError;
  bool? get openLive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelCopyWith<Channel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) then) =
      _$ChannelCopyWithImpl<$Res, Channel>;
  @useResult
  $Res call(
      {String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      int? followerCount,
      String? channelDescription,
      bool? openLive});
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res, $Val extends Channel>
    implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = freezed,
    Object? channelDescription = freezed,
    Object? openLive = freezed,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      channelImageUrl: freezed == channelImageUrl
          ? _value.channelImageUrl
          : channelImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      channelDescription: freezed == channelDescription
          ? _value.channelDescription
          : channelDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      openLive: freezed == openLive
          ? _value.openLive
          : openLive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelImplCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$$ChannelImplCopyWith(
          _$ChannelImpl value, $Res Function(_$ChannelImpl) then) =
      __$$ChannelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      int? followerCount,
      String? channelDescription,
      bool? openLive});
}

/// @nodoc
class __$$ChannelImplCopyWithImpl<$Res>
    extends _$ChannelCopyWithImpl<$Res, _$ChannelImpl>
    implements _$$ChannelImplCopyWith<$Res> {
  __$$ChannelImplCopyWithImpl(
      _$ChannelImpl _value, $Res Function(_$ChannelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = freezed,
    Object? channelDescription = freezed,
    Object? openLive = freezed,
  }) {
    return _then(_$ChannelImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      channelImageUrl: freezed == channelImageUrl
          ? _value.channelImageUrl
          : channelImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      channelDescription: freezed == channelDescription
          ? _value.channelDescription
          : channelDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      openLive: freezed == openLive
          ? _value.openLive
          : openLive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelImpl implements _Channel {
  const _$ChannelImpl(
      {required this.channelId,
      required this.channelName,
      required this.channelImageUrl,
      required this.verifiedMark,
      required this.followerCount,
      required this.channelDescription,
      required this.openLive});

  factory _$ChannelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelImplFromJson(json);

  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  final bool verifiedMark;
  @override
  final int? followerCount;
  @override
  final String? channelDescription;
  @override
  final bool? openLive;

  @override
  String toString() {
    return 'Channel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, channelDescription: $channelDescription, openLive: $openLive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.channelDescription, channelDescription) ||
                other.channelDescription == channelDescription) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      channelId,
      channelName,
      channelImageUrl,
      verifiedMark,
      followerCount,
      channelDescription,
      openLive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelImplCopyWith<_$ChannelImpl> get copyWith =>
      __$$ChannelImplCopyWithImpl<_$ChannelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelImplToJson(
      this,
    );
  }
}

abstract class _Channel implements Channel {
  const factory _Channel(
      {required final String channelId,
      required final String channelName,
      required final String? channelImageUrl,
      required final bool verifiedMark,
      required final int? followerCount,
      required final String? channelDescription,
      required final bool? openLive}) = _$ChannelImpl;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$ChannelImpl.fromJson;

  @override
  String get channelId;
  @override
  String get channelName;
  @override
  String? get channelImageUrl;
  @override
  bool get verifiedMark;
  @override
  int? get followerCount;
  @override
  String? get channelDescription;
  @override
  bool? get openLive;
  @override
  @JsonKey(ignore: true)
  _$$ChannelImplCopyWith<_$ChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
