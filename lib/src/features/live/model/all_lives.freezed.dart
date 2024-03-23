// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_lives.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllLivesChannelPage _$AllLivesChannelPageFromJson(Map<String, dynamic> json) {
  return _AllLivesChannelPage.fromJson(json);
}

/// @nodoc
mixin _$AllLivesChannelPage {
  int? get concurrentUserCount => throw _privateConstructorUsedError;
  int? get liveId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllLivesChannelPageCopyWith<AllLivesChannelPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllLivesChannelPageCopyWith<$Res> {
  factory $AllLivesChannelPageCopyWith(
          AllLivesChannelPage value, $Res Function(AllLivesChannelPage) then) =
      _$AllLivesChannelPageCopyWithImpl<$Res, AllLivesChannelPage>;
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class _$AllLivesChannelPageCopyWithImpl<$Res, $Val extends AllLivesChannelPage>
    implements $AllLivesChannelPageCopyWith<$Res> {
  _$AllLivesChannelPageCopyWithImpl(this._value, this._then);

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
abstract class _$$AllLivesChannelPageImplCopyWith<$Res>
    implements $AllLivesChannelPageCopyWith<$Res> {
  factory _$$AllLivesChannelPageImplCopyWith(_$AllLivesChannelPageImpl value,
          $Res Function(_$AllLivesChannelPageImpl) then) =
      __$$AllLivesChannelPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? concurrentUserCount, int? liveId});
}

/// @nodoc
class __$$AllLivesChannelPageImplCopyWithImpl<$Res>
    extends _$AllLivesChannelPageCopyWithImpl<$Res, _$AllLivesChannelPageImpl>
    implements _$$AllLivesChannelPageImplCopyWith<$Res> {
  __$$AllLivesChannelPageImplCopyWithImpl(_$AllLivesChannelPageImpl _value,
      $Res Function(_$AllLivesChannelPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = freezed,
    Object? liveId = freezed,
  }) {
    return _then(_$AllLivesChannelPageImpl(
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
class _$AllLivesChannelPageImpl implements _AllLivesChannelPage {
  _$AllLivesChannelPageImpl(
      {required this.concurrentUserCount, required this.liveId});

  factory _$AllLivesChannelPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllLivesChannelPageImplFromJson(json);

  @override
  final int? concurrentUserCount;
  @override
  final int? liveId;

  @override
  String toString() {
    return 'AllLivesChannelPage(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllLivesChannelPageImpl &&
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
  _$$AllLivesChannelPageImplCopyWith<_$AllLivesChannelPageImpl> get copyWith =>
      __$$AllLivesChannelPageImplCopyWithImpl<_$AllLivesChannelPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllLivesChannelPageImplToJson(
      this,
    );
  }
}

abstract class _AllLivesChannelPage implements AllLivesChannelPage {
  factory _AllLivesChannelPage(
      {required final int? concurrentUserCount,
      required final int? liveId}) = _$AllLivesChannelPageImpl;

  factory _AllLivesChannelPage.fromJson(Map<String, dynamic> json) =
      _$AllLivesChannelPageImpl.fromJson;

  @override
  int? get concurrentUserCount;
  @override
  int? get liveId;
  @override
  @JsonKey(ignore: true)
  _$$AllLivesChannelPageImplCopyWith<_$AllLivesChannelPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AllLivesChannelResponse {
  List<Channel>? get channels => throw _privateConstructorUsedError;
  AllLivesChannelPage? get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllLivesChannelResponseCopyWith<AllLivesChannelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllLivesChannelResponseCopyWith<$Res> {
  factory $AllLivesChannelResponseCopyWith(AllLivesChannelResponse value,
          $Res Function(AllLivesChannelResponse) then) =
      _$AllLivesChannelResponseCopyWithImpl<$Res, AllLivesChannelResponse>;
  @useResult
  $Res call({List<Channel>? channels, AllLivesChannelPage? page});

  $AllLivesChannelPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$AllLivesChannelResponseCopyWithImpl<$Res,
        $Val extends AllLivesChannelResponse>
    implements $AllLivesChannelResponseCopyWith<$Res> {
  _$AllLivesChannelResponseCopyWithImpl(this._value, this._then);

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
              as AllLivesChannelPage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AllLivesChannelPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $AllLivesChannelPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AllLivesChannelResponseImplCopyWith<$Res>
    implements $AllLivesChannelResponseCopyWith<$Res> {
  factory _$$AllLivesChannelResponseImplCopyWith(
          _$AllLivesChannelResponseImpl value,
          $Res Function(_$AllLivesChannelResponseImpl) then) =
      __$$AllLivesChannelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Channel>? channels, AllLivesChannelPage? page});

  @override
  $AllLivesChannelPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$AllLivesChannelResponseImplCopyWithImpl<$Res>
    extends _$AllLivesChannelResponseCopyWithImpl<$Res,
        _$AllLivesChannelResponseImpl>
    implements _$$AllLivesChannelResponseImplCopyWith<$Res> {
  __$$AllLivesChannelResponseImplCopyWithImpl(
      _$AllLivesChannelResponseImpl _value,
      $Res Function(_$AllLivesChannelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channels = freezed,
    Object? page = freezed,
  }) {
    return _then(_$AllLivesChannelResponseImpl(
      channels: freezed == channels
          ? _value._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Channel>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as AllLivesChannelPage?,
    ));
  }
}

/// @nodoc

class _$AllLivesChannelResponseImpl implements _AllLivesChannelResponse {
  const _$AllLivesChannelResponseImpl(
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
  final AllLivesChannelPage? page;

  @override
  String toString() {
    return 'AllLivesChannelResponse(channels: $channels, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllLivesChannelResponseImpl &&
            const DeepCollectionEquality().equals(other._channels, _channels) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_channels), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllLivesChannelResponseImplCopyWith<_$AllLivesChannelResponseImpl>
      get copyWith => __$$AllLivesChannelResponseImplCopyWithImpl<
          _$AllLivesChannelResponseImpl>(this, _$identity);
}

abstract class _AllLivesChannelResponse implements AllLivesChannelResponse {
  const factory _AllLivesChannelResponse(
          {required final List<Channel>? channels,
          required final AllLivesChannelPage? page}) =
      _$AllLivesChannelResponseImpl;

  @override
  List<Channel>? get channels;
  @override
  AllLivesChannelPage? get page;
  @override
  @JsonKey(ignore: true)
  _$$AllLivesChannelResponseImplCopyWith<_$AllLivesChannelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
