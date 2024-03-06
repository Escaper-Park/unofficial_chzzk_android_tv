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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  PersonalData? get personalData => throw _privateConstructorUsedError;

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
      bool? openLive,
      PersonalData? personalData});

  $PersonalDataCopyWith<$Res>? get personalData;
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
    Object? personalData = freezed,
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
      personalData: freezed == personalData
          ? _value.personalData
          : personalData // ignore: cast_nullable_to_non_nullable
              as PersonalData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonalDataCopyWith<$Res>? get personalData {
    if (_value.personalData == null) {
      return null;
    }

    return $PersonalDataCopyWith<$Res>(_value.personalData!, (value) {
      return _then(_value.copyWith(personalData: value) as $Val);
    });
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
      bool? openLive,
      PersonalData? personalData});

  @override
  $PersonalDataCopyWith<$Res>? get personalData;
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
    Object? personalData = freezed,
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
      personalData: freezed == personalData
          ? _value.personalData
          : personalData // ignore: cast_nullable_to_non_nullable
              as PersonalData?,
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
      required this.openLive,
      required this.personalData});

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
  final PersonalData? personalData;

  @override
  String toString() {
    return 'Channel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, channelDescription: $channelDescription, openLive: $openLive, personalData: $personalData)';
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
                other.openLive == openLive) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
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
      openLive,
      personalData);

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
      required final bool? openLive,
      required final PersonalData? personalData}) = _$ChannelImpl;

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
  PersonalData? get personalData;
  @override
  @JsonKey(ignore: true)
  _$$ChannelImplCopyWith<_$ChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalData _$PersonalDataFromJson(Map<String, dynamic> json) {
  return _PersonalData.fromJson(json);
}

/// @nodoc
mixin _$PersonalData {
  bool get privateUserBlock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalDataCopyWith<PersonalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalDataCopyWith<$Res> {
  factory $PersonalDataCopyWith(
          PersonalData value, $Res Function(PersonalData) then) =
      _$PersonalDataCopyWithImpl<$Res, PersonalData>;
  @useResult
  $Res call({bool privateUserBlock});
}

/// @nodoc
class _$PersonalDataCopyWithImpl<$Res, $Val extends PersonalData>
    implements $PersonalDataCopyWith<$Res> {
  _$PersonalDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privateUserBlock = null,
  }) {
    return _then(_value.copyWith(
      privateUserBlock: null == privateUserBlock
          ? _value.privateUserBlock
          : privateUserBlock // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalDataImplCopyWith<$Res>
    implements $PersonalDataCopyWith<$Res> {
  factory _$$PersonalDataImplCopyWith(
          _$PersonalDataImpl value, $Res Function(_$PersonalDataImpl) then) =
      __$$PersonalDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool privateUserBlock});
}

/// @nodoc
class __$$PersonalDataImplCopyWithImpl<$Res>
    extends _$PersonalDataCopyWithImpl<$Res, _$PersonalDataImpl>
    implements _$$PersonalDataImplCopyWith<$Res> {
  __$$PersonalDataImplCopyWithImpl(
      _$PersonalDataImpl _value, $Res Function(_$PersonalDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privateUserBlock = null,
  }) {
    return _then(_$PersonalDataImpl(
      privateUserBlock: null == privateUserBlock
          ? _value.privateUserBlock
          : privateUserBlock // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalDataImpl implements _PersonalData {
  const _$PersonalDataImpl({required this.privateUserBlock});

  factory _$PersonalDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalDataImplFromJson(json);

  @override
  final bool privateUserBlock;

  @override
  String toString() {
    return 'PersonalData(privateUserBlock: $privateUserBlock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalDataImpl &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, privateUserBlock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalDataImplCopyWith<_$PersonalDataImpl> get copyWith =>
      __$$PersonalDataImplCopyWithImpl<_$PersonalDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalDataImplToJson(
      this,
    );
  }
}

abstract class _PersonalData implements PersonalData {
  const factory _PersonalData({required final bool privateUserBlock}) =
      _$PersonalDataImpl;

  factory _PersonalData.fromJson(Map<String, dynamic> json) =
      _$PersonalDataImpl.fromJson;

  @override
  bool get privateUserBlock;
  @override
  @JsonKey(ignore: true)
  _$$PersonalDataImplCopyWith<_$PersonalDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PopularChannelPage _$PopularChannelPageFromJson(Map<String, dynamic> json) {
  return _PopularChannelPage.fromJson(json);
}

/// @nodoc
mixin _$PopularChannelPage {
  int? get concurrentUserCount => throw _privateConstructorUsedError;
  int? get liveId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopularChannelPageCopyWith<PopularChannelPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularChannelPageCopyWith<$Res> {
  factory $PopularChannelPageCopyWith(
          PopularChannelPage value, $Res Function(PopularChannelPage) then) =
      _$PopularChannelPageCopyWithImpl<$Res, PopularChannelPage>;
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class _$PopularChannelPageCopyWithImpl<$Res, $Val extends PopularChannelPage>
    implements $PopularChannelPageCopyWith<$Res> {
  _$PopularChannelPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = freezed,
    Object? liveId = freezed,
  }) {
    return _then(_value.copyWith(
      concurrentUserCount: freezed == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      liveId: freezed == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularChannelPageImplCopyWith<$Res>
    implements $PopularChannelPageCopyWith<$Res> {
  factory _$$PopularChannelPageImplCopyWith(_$PopularChannelPageImpl value,
          $Res Function(_$PopularChannelPageImpl) then) =
      __$$PopularChannelPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class __$$PopularChannelPageImplCopyWithImpl<$Res>
    extends _$PopularChannelPageCopyWithImpl<$Res, _$PopularChannelPageImpl>
    implements _$$PopularChannelPageImplCopyWith<$Res> {
  __$$PopularChannelPageImplCopyWithImpl(_$PopularChannelPageImpl _value,
      $Res Function(_$PopularChannelPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = freezed,
    Object? liveId = freezed,
  }) {
    return _then(_$PopularChannelPageImpl(
      concurrentUserCount: freezed == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      liveId: freezed == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularChannelPageImpl implements _PopularChannelPage {
  _$PopularChannelPageImpl(
      {required this.concurrentUserCount, required this.liveId});

  factory _$PopularChannelPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularChannelPageImplFromJson(json);

  @override
  final int? concurrentUserCount;
  @override
  final int? liveId;

  @override
  String toString() {
    return 'PopularChannelPage(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularChannelPageImpl &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularChannelPageImplCopyWith<_$PopularChannelPageImpl> get copyWith =>
      __$$PopularChannelPageImplCopyWithImpl<_$PopularChannelPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularChannelPageImplToJson(
      this,
    );
  }
}

abstract class _PopularChannelPage implements PopularChannelPage {
  factory _PopularChannelPage(
      {required final int? concurrentUserCount,
      required final int? liveId}) = _$PopularChannelPageImpl;

  factory _PopularChannelPage.fromJson(Map<String, dynamic> json) =
      _$PopularChannelPageImpl.fromJson;

  @override
  int? get concurrentUserCount;
  @override
  int? get liveId;
  @override
  @JsonKey(ignore: true)
  _$$PopularChannelPageImplCopyWith<_$PopularChannelPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PopularChannelResponse {
  List<Channel>? get channels => throw _privateConstructorUsedError;
  PopularChannelPage? get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PopularChannelResponseCopyWith<PopularChannelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularChannelResponseCopyWith<$Res> {
  factory $PopularChannelResponseCopyWith(PopularChannelResponse value,
          $Res Function(PopularChannelResponse) then) =
      _$PopularChannelResponseCopyWithImpl<$Res, PopularChannelResponse>;
  @useResult
  $Res call({List<Channel>? channels, PopularChannelPage? page});

  $PopularChannelPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$PopularChannelResponseCopyWithImpl<$Res,
        $Val extends PopularChannelResponse>
    implements $PopularChannelResponseCopyWith<$Res> {
  _$PopularChannelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channels = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      channels: freezed == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Channel>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PopularChannelPage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PopularChannelPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $PopularChannelPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PopularChannelResponseImplCopyWith<$Res>
    implements $PopularChannelResponseCopyWith<$Res> {
  factory _$$PopularChannelResponseImplCopyWith(
          _$PopularChannelResponseImpl value,
          $Res Function(_$PopularChannelResponseImpl) then) =
      __$$PopularChannelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Channel>? channels, PopularChannelPage? page});

  @override
  $PopularChannelPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$PopularChannelResponseImplCopyWithImpl<$Res>
    extends _$PopularChannelResponseCopyWithImpl<$Res,
        _$PopularChannelResponseImpl>
    implements _$$PopularChannelResponseImplCopyWith<$Res> {
  __$$PopularChannelResponseImplCopyWithImpl(
      _$PopularChannelResponseImpl _value,
      $Res Function(_$PopularChannelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channels = freezed,
    Object? page = freezed,
  }) {
    return _then(_$PopularChannelResponseImpl(
      channels: freezed == channels
          ? _value._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Channel>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PopularChannelPage?,
    ));
  }
}

/// @nodoc

class _$PopularChannelResponseImpl implements _PopularChannelResponse {
  const _$PopularChannelResponseImpl(
      {required final List<Channel>? channels, required this.page})
      : _channels = channels;

  final List<Channel>? _channels;
  @override
  List<Channel>? get channels {
    final value = _channels;
    if (value == null) return null;
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PopularChannelPage? page;

  @override
  String toString() {
    return 'PopularChannelResponse(channels: $channels, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularChannelResponseImpl &&
            const DeepCollectionEquality().equals(other._channels, _channels) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_channels), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularChannelResponseImplCopyWith<_$PopularChannelResponseImpl>
      get copyWith => __$$PopularChannelResponseImplCopyWithImpl<
          _$PopularChannelResponseImpl>(this, _$identity);
}

abstract class _PopularChannelResponse implements PopularChannelResponse {
  const factory _PopularChannelResponse(
      {required final List<Channel>? channels,
      required final PopularChannelPage? page}) = _$PopularChannelResponseImpl;

  @override
  List<Channel>? get channels;
  @override
  PopularChannelPage? get page;
  @override
  @JsonKey(ignore: true)
  _$$PopularChannelResponseImplCopyWith<_$PopularChannelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
