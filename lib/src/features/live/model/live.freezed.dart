// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveDetail _$LiveDetailFromJson(Map<String, dynamic> json) {
  return _LiveDetail.fromJson(json);
}

/// @nodoc
mixin _$LiveDetail {
  int get liveId => throw _privateConstructorUsedError;
  String get liveTitle => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get liveImageUrl => throw _privateConstructorUsedError;
  String? get defaultThumbnailImageUrl => throw _privateConstructorUsedError;
  int get concurrentUserCount => throw _privateConstructorUsedError;
  String? get openDate => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError; // Chat
  String? get chatChannelId => throw _privateConstructorUsedError; // Category
  String? get categoryType => throw _privateConstructorUsedError;
  String? get liveCategory => throw _privateConstructorUsedError;
  String? get liveCategoryValue => throw _privateConstructorUsedError;
  @LivePlaybackConverter()
  @JsonKey(name: 'livePlaybackJson')
  String? get livePath => throw _privateConstructorUsedError;
  String? get userAdultStatus => throw _privateConstructorUsedError;
  Channel get channel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveDetailCopyWith<LiveDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveDetailCopyWith<$Res> {
  factory $LiveDetailCopyWith(
          LiveDetail value, $Res Function(LiveDetail) then) =
      _$LiveDetailCopyWithImpl<$Res, LiveDetail>;
  @useResult
  $Res call(
      {int liveId,
      String liveTitle,
      String? status,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      String? chatChannelId,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      @LivePlaybackConverter()
      @JsonKey(name: 'livePlaybackJson')
      String? livePath,
      String? userAdultStatus,
      Channel channel});

  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class _$LiveDetailCopyWithImpl<$Res, $Val extends LiveDetail>
    implements $LiveDetailCopyWith<$Res> {
  _$LiveDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = null,
    Object? liveTitle = null,
    Object? status = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? chatChannelId = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? livePath = freezed,
    Object? userAdultStatus = freezed,
    Object? channel = null,
  }) {
    return _then(_value.copyWith(
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
      liveTitle: null == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      liveImageUrl: freezed == liveImageUrl
          ? _value.liveImageUrl
          : liveImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
          ? _value.defaultThumbnailImageUrl
          : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      openDate: freezed == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      chatChannelId: freezed == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategory: freezed == liveCategory
          ? _value.liveCategory
          : liveCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategoryValue: freezed == liveCategoryValue
          ? _value.liveCategoryValue
          : liveCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      livePath: freezed == livePath
          ? _value.livePath
          : livePath // ignore: cast_nullable_to_non_nullable
              as String?,
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$LiveDetailImplCopyWith<$Res>
    implements $LiveDetailCopyWith<$Res> {
  factory _$$LiveDetailImplCopyWith(
          _$LiveDetailImpl value, $Res Function(_$LiveDetailImpl) then) =
      __$$LiveDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int liveId,
      String liveTitle,
      String? status,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      String? openDate,
      bool adult,
      String? chatChannelId,
      String? categoryType,
      String? liveCategory,
      String? liveCategoryValue,
      @LivePlaybackConverter()
      @JsonKey(name: 'livePlaybackJson')
      String? livePath,
      String? userAdultStatus,
      Channel channel});

  @override
  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class __$$LiveDetailImplCopyWithImpl<$Res>
    extends _$LiveDetailCopyWithImpl<$Res, _$LiveDetailImpl>
    implements _$$LiveDetailImplCopyWith<$Res> {
  __$$LiveDetailImplCopyWithImpl(
      _$LiveDetailImpl _value, $Res Function(_$LiveDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = null,
    Object? liveTitle = null,
    Object? status = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? openDate = freezed,
    Object? adult = null,
    Object? chatChannelId = freezed,
    Object? categoryType = freezed,
    Object? liveCategory = freezed,
    Object? liveCategoryValue = freezed,
    Object? livePath = freezed,
    Object? userAdultStatus = freezed,
    Object? channel = null,
  }) {
    return _then(_$LiveDetailImpl(
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
      liveTitle: null == liveTitle
          ? _value.liveTitle
          : liveTitle // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      liveImageUrl: freezed == liveImageUrl
          ? _value.liveImageUrl
          : liveImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
          ? _value.defaultThumbnailImageUrl
          : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      openDate: freezed == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      chatChannelId: freezed == chatChannelId
          ? _value.chatChannelId
          : chatChannelId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategory: freezed == liveCategory
          ? _value.liveCategory
          : liveCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      liveCategoryValue: freezed == liveCategoryValue
          ? _value.liveCategoryValue
          : liveCategoryValue // ignore: cast_nullable_to_non_nullable
              as String?,
      livePath: freezed == livePath
          ? _value.livePath
          : livePath // ignore: cast_nullable_to_non_nullable
              as String?,
      userAdultStatus: freezed == userAdultStatus
          ? _value.userAdultStatus
          : userAdultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveDetailImpl implements _LiveDetail {
  _$LiveDetailImpl(
      {required this.liveId,
      required this.liveTitle,
      required this.status,
      required this.liveImageUrl,
      required this.defaultThumbnailImageUrl,
      required this.concurrentUserCount,
      required this.openDate,
      required this.adult,
      required this.chatChannelId,
      required this.categoryType,
      required this.liveCategory,
      required this.liveCategoryValue,
      @LivePlaybackConverter()
      @JsonKey(name: 'livePlaybackJson')
      required this.livePath,
      required this.userAdultStatus,
      required this.channel});

  factory _$LiveDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveDetailImplFromJson(json);

  @override
  final int liveId;
  @override
  final String liveTitle;
  @override
  final String? status;
  @override
  final String? liveImageUrl;
  @override
  final String? defaultThumbnailImageUrl;
  @override
  final int concurrentUserCount;
  @override
  final String? openDate;
  @override
  final bool adult;
// Chat
  @override
  final String? chatChannelId;
// Category
  @override
  final String? categoryType;
  @override
  final String? liveCategory;
  @override
  final String? liveCategoryValue;
  @override
  @LivePlaybackConverter()
  @JsonKey(name: 'livePlaybackJson')
  final String? livePath;
  @override
  final String? userAdultStatus;
  @override
  final Channel channel;

  @override
  String toString() {
    return 'LiveDetail(liveId: $liveId, liveTitle: $liveTitle, status: $status, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, openDate: $openDate, adult: $adult, chatChannelId: $chatChannelId, categoryType: $categoryType, liveCategory: $liveCategory, liveCategoryValue: $liveCategoryValue, livePath: $livePath, userAdultStatus: $userAdultStatus, channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveDetailImpl &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.liveImageUrl, liveImageUrl) ||
                other.liveImageUrl == liveImageUrl) &&
            (identical(
                    other.defaultThumbnailImageUrl, defaultThumbnailImageUrl) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.liveCategory, liveCategory) ||
                other.liveCategory == liveCategory) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.livePath, livePath) ||
                other.livePath == livePath) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      liveId,
      liveTitle,
      status,
      liveImageUrl,
      defaultThumbnailImageUrl,
      concurrentUserCount,
      openDate,
      adult,
      chatChannelId,
      categoryType,
      liveCategory,
      liveCategoryValue,
      livePath,
      userAdultStatus,
      channel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveDetailImplCopyWith<_$LiveDetailImpl> get copyWith =>
      __$$LiveDetailImplCopyWithImpl<_$LiveDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveDetailImplToJson(
      this,
    );
  }
}

abstract class _LiveDetail implements LiveDetail {
  factory _LiveDetail(
      {required final int liveId,
      required final String liveTitle,
      required final String? status,
      required final String? liveImageUrl,
      required final String? defaultThumbnailImageUrl,
      required final int concurrentUserCount,
      required final String? openDate,
      required final bool adult,
      required final String? chatChannelId,
      required final String? categoryType,
      required final String? liveCategory,
      required final String? liveCategoryValue,
      @LivePlaybackConverter()
      @JsonKey(name: 'livePlaybackJson')
      required final String? livePath,
      required final String? userAdultStatus,
      required final Channel channel}) = _$LiveDetailImpl;

  factory _LiveDetail.fromJson(Map<String, dynamic> json) =
      _$LiveDetailImpl.fromJson;

  @override
  int get liveId;
  @override
  String get liveTitle;
  @override
  String? get status;
  @override
  String? get liveImageUrl;
  @override
  String? get defaultThumbnailImageUrl;
  @override
  int get concurrentUserCount;
  @override
  String? get openDate;
  @override
  bool get adult;
  @override // Chat
  String? get chatChannelId;
  @override // Category
  String? get categoryType;
  @override
  String? get liveCategory;
  @override
  String? get liveCategoryValue;
  @override
  @LivePlaybackConverter()
  @JsonKey(name: 'livePlaybackJson')
  String? get livePath;
  @override
  String? get userAdultStatus;
  @override
  Channel get channel;
  @override
  @JsonKey(ignore: true)
  _$$LiveDetailImplCopyWith<_$LiveDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LivePage _$LivePageFromJson(Map<String, dynamic> json) {
  return _LivePage.fromJson(json);
}

/// @nodoc
mixin _$LivePage {
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int get liveId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LivePageCopyWith<LivePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivePageCopyWith<$Res> {
  factory $LivePageCopyWith(LivePage value, $Res Function(LivePage) then) =
      _$LivePageCopyWithImpl<$Res, LivePage>;
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class _$LivePageCopyWithImpl<$Res, $Val extends LivePage>
    implements $LivePageCopyWith<$Res> {
  _$LivePageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? liveId = null,
  }) {
    return _then(_value.copyWith(
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LivePageImplCopyWith<$Res>
    implements $LivePageCopyWith<$Res> {
  factory _$$LivePageImplCopyWith(
          _$LivePageImpl value, $Res Function(_$LivePageImpl) then) =
      __$$LivePageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class __$$LivePageImplCopyWithImpl<$Res>
    extends _$LivePageCopyWithImpl<$Res, _$LivePageImpl>
    implements _$$LivePageImplCopyWith<$Res> {
  __$$LivePageImplCopyWithImpl(
      _$LivePageImpl _value, $Res Function(_$LivePageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? liveId = null,
  }) {
    return _then(_$LivePageImpl(
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveId: null == liveId
          ? _value.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LivePageImpl implements _LivePage {
  const _$LivePageImpl(
      {required this.concurrentUserCount, required this.liveId});

  factory _$LivePageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LivePageImplFromJson(json);

  @override
  final int concurrentUserCount;
  @override
  final int liveId;

  @override
  String toString() {
    return 'LivePage(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivePageImpl &&
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
  _$$LivePageImplCopyWith<_$LivePageImpl> get copyWith =>
      __$$LivePageImplCopyWithImpl<_$LivePageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LivePageImplToJson(
      this,
    );
  }
}

abstract class _LivePage implements LivePage {
  const factory _LivePage(
      {required final int concurrentUserCount,
      required final int liveId}) = _$LivePageImpl;

  factory _LivePage.fromJson(Map<String, dynamic> json) =
      _$LivePageImpl.fromJson;

  @override
  int get concurrentUserCount;
  @override
  int get liveId;
  @override
  @JsonKey(ignore: true)
  _$$LivePageImplCopyWith<_$LivePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LiveResponse {
  List<LiveDetail>? get liveDetails => throw _privateConstructorUsedError;
  LivePage? get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiveResponseCopyWith<LiveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveResponseCopyWith<$Res> {
  factory $LiveResponseCopyWith(
          LiveResponse value, $Res Function(LiveResponse) then) =
      _$LiveResponseCopyWithImpl<$Res, LiveResponse>;
  @useResult
  $Res call({List<LiveDetail>? liveDetails, LivePage? page});

  $LivePageCopyWith<$Res>? get page;
}

/// @nodoc
class _$LiveResponseCopyWithImpl<$Res, $Val extends LiveResponse>
    implements $LiveResponseCopyWith<$Res> {
  _$LiveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveDetails = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      liveDetails: freezed == liveDetails
          ? _value.liveDetails
          : liveDetails // ignore: cast_nullable_to_non_nullable
              as List<LiveDetail>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as LivePage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LivePageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $LivePageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveResponseImplCopyWith<$Res>
    implements $LiveResponseCopyWith<$Res> {
  factory _$$LiveResponseImplCopyWith(
          _$LiveResponseImpl value, $Res Function(_$LiveResponseImpl) then) =
      __$$LiveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LiveDetail>? liveDetails, LivePage? page});

  @override
  $LivePageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$LiveResponseImplCopyWithImpl<$Res>
    extends _$LiveResponseCopyWithImpl<$Res, _$LiveResponseImpl>
    implements _$$LiveResponseImplCopyWith<$Res> {
  __$$LiveResponseImplCopyWithImpl(
      _$LiveResponseImpl _value, $Res Function(_$LiveResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveDetails = freezed,
    Object? page = freezed,
  }) {
    return _then(_$LiveResponseImpl(
      liveDetails: freezed == liveDetails
          ? _value._liveDetails
          : liveDetails // ignore: cast_nullable_to_non_nullable
              as List<LiveDetail>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as LivePage?,
    ));
  }
}

/// @nodoc

class _$LiveResponseImpl implements _LiveResponse {
  const _$LiveResponseImpl(
      {required final List<LiveDetail>? liveDetails, required this.page})
      : _liveDetails = liveDetails;

  final List<LiveDetail>? _liveDetails;
  @override
  List<LiveDetail>? get liveDetails {
    final value = _liveDetails;
    if (value == null) return null;
    if (_liveDetails is EqualUnmodifiableListView) return _liveDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final LivePage? page;

  @override
  String toString() {
    return 'LiveResponse(liveDetails: $liveDetails, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._liveDetails, _liveDetails) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_liveDetails), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveResponseImplCopyWith<_$LiveResponseImpl> get copyWith =>
      __$$LiveResponseImplCopyWithImpl<_$LiveResponseImpl>(this, _$identity);
}

abstract class _LiveResponse implements LiveResponse {
  const factory _LiveResponse(
      {required final List<LiveDetail>? liveDetails,
      required final LivePage? page}) = _$LiveResponseImpl;

  @override
  List<LiveDetail>? get liveDetails;
  @override
  LivePage? get page;
  @override
  @JsonKey(ignore: true)
  _$$LiveResponseImplCopyWith<_$LiveResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
