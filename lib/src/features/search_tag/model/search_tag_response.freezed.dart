// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_tag_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchTagLiveResponse _$SearchTagLiveResponseFromJson(
    Map<String, dynamic> json) {
  return _SearchTagLiveResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchTagLiveResponse {
  int get size => throw _privateConstructorUsedError;
  SearchTagLivePage? get page => throw _privateConstructorUsedError;
  List<LiveInfo> get data => throw _privateConstructorUsedError;

  /// Serializes this SearchTagLiveResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchTagLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchTagLiveResponseCopyWith<SearchTagLiveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTagLiveResponseCopyWith<$Res> {
  factory $SearchTagLiveResponseCopyWith(SearchTagLiveResponse value,
          $Res Function(SearchTagLiveResponse) then) =
      _$SearchTagLiveResponseCopyWithImpl<$Res, SearchTagLiveResponse>;
  @useResult
  $Res call({int size, SearchTagLivePage? page, List<LiveInfo> data});

  $SearchTagLivePageCopyWith<$Res>? get page;
}

/// @nodoc
class _$SearchTagLiveResponseCopyWithImpl<$Res,
        $Val extends SearchTagLiveResponse>
    implements $SearchTagLiveResponseCopyWith<$Res> {
  _$SearchTagLiveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchTagLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as SearchTagLivePage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveInfo>,
    ) as $Val);
  }

  /// Create a copy of SearchTagLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagLivePageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $SearchTagLivePageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchTagLiveResponseImplCopyWith<$Res>
    implements $SearchTagLiveResponseCopyWith<$Res> {
  factory _$$SearchTagLiveResponseImplCopyWith(
          _$SearchTagLiveResponseImpl value,
          $Res Function(_$SearchTagLiveResponseImpl) then) =
      __$$SearchTagLiveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, SearchTagLivePage? page, List<LiveInfo> data});

  @override
  $SearchTagLivePageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$SearchTagLiveResponseImplCopyWithImpl<$Res>
    extends _$SearchTagLiveResponseCopyWithImpl<$Res,
        _$SearchTagLiveResponseImpl>
    implements _$$SearchTagLiveResponseImplCopyWith<$Res> {
  __$$SearchTagLiveResponseImplCopyWithImpl(_$SearchTagLiveResponseImpl _value,
      $Res Function(_$SearchTagLiveResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchTagLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$SearchTagLiveResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as SearchTagLivePage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchTagLiveResponseImpl implements _SearchTagLiveResponse {
  const _$SearchTagLiveResponseImpl(
      {required this.size, this.page, required final List<LiveInfo> data})
      : _data = data;

  factory _$SearchTagLiveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTagLiveResponseImplFromJson(json);

  @override
  final int size;
  @override
  final SearchTagLivePage? page;
  final List<LiveInfo> _data;
  @override
  List<LiveInfo> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SearchTagLiveResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTagLiveResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SearchTagLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTagLiveResponseImplCopyWith<_$SearchTagLiveResponseImpl>
      get copyWith => __$$SearchTagLiveResponseImplCopyWithImpl<
          _$SearchTagLiveResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTagLiveResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchTagLiveResponse implements SearchTagLiveResponse {
  const factory _SearchTagLiveResponse(
      {required final int size,
      final SearchTagLivePage? page,
      required final List<LiveInfo> data}) = _$SearchTagLiveResponseImpl;

  factory _SearchTagLiveResponse.fromJson(Map<String, dynamic> json) =
      _$SearchTagLiveResponseImpl.fromJson;

  @override
  int get size;
  @override
  SearchTagLivePage? get page;
  @override
  List<LiveInfo> get data;

  /// Create a copy of SearchTagLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTagLiveResponseImplCopyWith<_$SearchTagLiveResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchTagLivePage _$SearchTagLivePageFromJson(Map<String, dynamic> json) {
  return _SearchTagLivePage.fromJson(json);
}

/// @nodoc
mixin _$SearchTagLivePage {
  SearchTagLiveNext? get next => throw _privateConstructorUsedError;

  /// Serializes this SearchTagLivePage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchTagLivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchTagLivePageCopyWith<SearchTagLivePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTagLivePageCopyWith<$Res> {
  factory $SearchTagLivePageCopyWith(
          SearchTagLivePage value, $Res Function(SearchTagLivePage) then) =
      _$SearchTagLivePageCopyWithImpl<$Res, SearchTagLivePage>;
  @useResult
  $Res call({SearchTagLiveNext? next});

  $SearchTagLiveNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$SearchTagLivePageCopyWithImpl<$Res, $Val extends SearchTagLivePage>
    implements $SearchTagLivePageCopyWith<$Res> {
  _$SearchTagLivePageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchTagLivePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as SearchTagLiveNext?,
    ) as $Val);
  }

  /// Create a copy of SearchTagLivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagLiveNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $SearchTagLiveNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchTagLivePageImplCopyWith<$Res>
    implements $SearchTagLivePageCopyWith<$Res> {
  factory _$$SearchTagLivePageImplCopyWith(_$SearchTagLivePageImpl value,
          $Res Function(_$SearchTagLivePageImpl) then) =
      __$$SearchTagLivePageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchTagLiveNext? next});

  @override
  $SearchTagLiveNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$SearchTagLivePageImplCopyWithImpl<$Res>
    extends _$SearchTagLivePageCopyWithImpl<$Res, _$SearchTagLivePageImpl>
    implements _$$SearchTagLivePageImplCopyWith<$Res> {
  __$$SearchTagLivePageImplCopyWithImpl(_$SearchTagLivePageImpl _value,
      $Res Function(_$SearchTagLivePageImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchTagLivePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$SearchTagLivePageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as SearchTagLiveNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchTagLivePageImpl implements _SearchTagLivePage {
  const _$SearchTagLivePageImpl({this.next});

  factory _$SearchTagLivePageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTagLivePageImplFromJson(json);

  @override
  final SearchTagLiveNext? next;

  @override
  String toString() {
    return 'SearchTagLivePage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTagLivePageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of SearchTagLivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTagLivePageImplCopyWith<_$SearchTagLivePageImpl> get copyWith =>
      __$$SearchTagLivePageImplCopyWithImpl<_$SearchTagLivePageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTagLivePageImplToJson(
      this,
    );
  }
}

abstract class _SearchTagLivePage implements SearchTagLivePage {
  const factory _SearchTagLivePage({final SearchTagLiveNext? next}) =
      _$SearchTagLivePageImpl;

  factory _SearchTagLivePage.fromJson(Map<String, dynamic> json) =
      _$SearchTagLivePageImpl.fromJson;

  @override
  SearchTagLiveNext? get next;

  /// Create a copy of SearchTagLivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTagLivePageImplCopyWith<_$SearchTagLivePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchTagLiveNext _$SearchTagLiveNextFromJson(Map<String, dynamic> json) {
  return _SearchTagLiveNext.fromJson(json);
}

/// @nodoc
mixin _$SearchTagLiveNext {
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int get liveId => throw _privateConstructorUsedError;

  /// Serializes this SearchTagLiveNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchTagLiveNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchTagLiveNextCopyWith<SearchTagLiveNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTagLiveNextCopyWith<$Res> {
  factory $SearchTagLiveNextCopyWith(
          SearchTagLiveNext value, $Res Function(SearchTagLiveNext) then) =
      _$SearchTagLiveNextCopyWithImpl<$Res, SearchTagLiveNext>;
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class _$SearchTagLiveNextCopyWithImpl<$Res, $Val extends SearchTagLiveNext>
    implements $SearchTagLiveNextCopyWith<$Res> {
  _$SearchTagLiveNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchTagLiveNext
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$SearchTagLiveNextImplCopyWith<$Res>
    implements $SearchTagLiveNextCopyWith<$Res> {
  factory _$$SearchTagLiveNextImplCopyWith(_$SearchTagLiveNextImpl value,
          $Res Function(_$SearchTagLiveNextImpl) then) =
      __$$SearchTagLiveNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class __$$SearchTagLiveNextImplCopyWithImpl<$Res>
    extends _$SearchTagLiveNextCopyWithImpl<$Res, _$SearchTagLiveNextImpl>
    implements _$$SearchTagLiveNextImplCopyWith<$Res> {
  __$$SearchTagLiveNextImplCopyWithImpl(_$SearchTagLiveNextImpl _value,
      $Res Function(_$SearchTagLiveNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchTagLiveNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? liveId = null,
  }) {
    return _then(_$SearchTagLiveNextImpl(
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
class _$SearchTagLiveNextImpl implements _SearchTagLiveNext {
  const _$SearchTagLiveNextImpl(
      {required this.concurrentUserCount, required this.liveId});

  factory _$SearchTagLiveNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTagLiveNextImplFromJson(json);

  @override
  final int concurrentUserCount;
  @override
  final int liveId;

  @override
  String toString() {
    return 'SearchTagLiveNext(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTagLiveNextImpl &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  /// Create a copy of SearchTagLiveNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTagLiveNextImplCopyWith<_$SearchTagLiveNextImpl> get copyWith =>
      __$$SearchTagLiveNextImplCopyWithImpl<_$SearchTagLiveNextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTagLiveNextImplToJson(
      this,
    );
  }
}

abstract class _SearchTagLiveNext implements SearchTagLiveNext {
  const factory _SearchTagLiveNext(
      {required final int concurrentUserCount,
      required final int liveId}) = _$SearchTagLiveNextImpl;

  factory _SearchTagLiveNext.fromJson(Map<String, dynamic> json) =
      _$SearchTagLiveNextImpl.fromJson;

  @override
  int get concurrentUserCount;
  @override
  int get liveId;

  /// Create a copy of SearchTagLiveNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTagLiveNextImplCopyWith<_$SearchTagLiveNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchTagVodResponse _$SearchTagVodResponseFromJson(Map<String, dynamic> json) {
  return _SearchTagVodResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchTagVodResponse {
  int get size => throw _privateConstructorUsedError;
  SearchTagVodPage? get page => throw _privateConstructorUsedError;
  List<Vod> get data => throw _privateConstructorUsedError;

  /// Serializes this SearchTagVodResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchTagVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchTagVodResponseCopyWith<SearchTagVodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTagVodResponseCopyWith<$Res> {
  factory $SearchTagVodResponseCopyWith(SearchTagVodResponse value,
          $Res Function(SearchTagVodResponse) then) =
      _$SearchTagVodResponseCopyWithImpl<$Res, SearchTagVodResponse>;
  @useResult
  $Res call({int size, SearchTagVodPage? page, List<Vod> data});

  $SearchTagVodPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$SearchTagVodResponseCopyWithImpl<$Res,
        $Val extends SearchTagVodResponse>
    implements $SearchTagVodResponseCopyWith<$Res> {
  _$SearchTagVodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchTagVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as SearchTagVodPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ) as $Val);
  }

  /// Create a copy of SearchTagVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagVodPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $SearchTagVodPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchTagVodResponseImplCopyWith<$Res>
    implements $SearchTagVodResponseCopyWith<$Res> {
  factory _$$SearchTagVodResponseImplCopyWith(_$SearchTagVodResponseImpl value,
          $Res Function(_$SearchTagVodResponseImpl) then) =
      __$$SearchTagVodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, SearchTagVodPage? page, List<Vod> data});

  @override
  $SearchTagVodPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$SearchTagVodResponseImplCopyWithImpl<$Res>
    extends _$SearchTagVodResponseCopyWithImpl<$Res, _$SearchTagVodResponseImpl>
    implements _$$SearchTagVodResponseImplCopyWith<$Res> {
  __$$SearchTagVodResponseImplCopyWithImpl(_$SearchTagVodResponseImpl _value,
      $Res Function(_$SearchTagVodResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchTagVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$SearchTagVodResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as SearchTagVodPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchTagVodResponseImpl implements _SearchTagVodResponse {
  const _$SearchTagVodResponseImpl(
      {required this.size, this.page, required final List<Vod> data})
      : _data = data;

  factory _$SearchTagVodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTagVodResponseImplFromJson(json);

  @override
  final int size;
  @override
  final SearchTagVodPage? page;
  final List<Vod> _data;
  @override
  List<Vod> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SearchTagVodResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTagVodResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SearchTagVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTagVodResponseImplCopyWith<_$SearchTagVodResponseImpl>
      get copyWith =>
          __$$SearchTagVodResponseImplCopyWithImpl<_$SearchTagVodResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTagVodResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchTagVodResponse implements SearchTagVodResponse {
  const factory _SearchTagVodResponse(
      {required final int size,
      final SearchTagVodPage? page,
      required final List<Vod> data}) = _$SearchTagVodResponseImpl;

  factory _SearchTagVodResponse.fromJson(Map<String, dynamic> json) =
      _$SearchTagVodResponseImpl.fromJson;

  @override
  int get size;
  @override
  SearchTagVodPage? get page;
  @override
  List<Vod> get data;

  /// Create a copy of SearchTagVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTagVodResponseImplCopyWith<_$SearchTagVodResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchTagVodPage _$SearchTagVodPageFromJson(Map<String, dynamic> json) {
  return _SearchTagVodPage.fromJson(json);
}

/// @nodoc
mixin _$SearchTagVodPage {
  SearchTagVodNext? get next => throw _privateConstructorUsedError;

  /// Serializes this SearchTagVodPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchTagVodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchTagVodPageCopyWith<SearchTagVodPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTagVodPageCopyWith<$Res> {
  factory $SearchTagVodPageCopyWith(
          SearchTagVodPage value, $Res Function(SearchTagVodPage) then) =
      _$SearchTagVodPageCopyWithImpl<$Res, SearchTagVodPage>;
  @useResult
  $Res call({SearchTagVodNext? next});

  $SearchTagVodNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$SearchTagVodPageCopyWithImpl<$Res, $Val extends SearchTagVodPage>
    implements $SearchTagVodPageCopyWith<$Res> {
  _$SearchTagVodPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchTagVodPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as SearchTagVodNext?,
    ) as $Val);
  }

  /// Create a copy of SearchTagVodPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchTagVodNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $SearchTagVodNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchTagVodPageImplCopyWith<$Res>
    implements $SearchTagVodPageCopyWith<$Res> {
  factory _$$SearchTagVodPageImplCopyWith(_$SearchTagVodPageImpl value,
          $Res Function(_$SearchTagVodPageImpl) then) =
      __$$SearchTagVodPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchTagVodNext? next});

  @override
  $SearchTagVodNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$SearchTagVodPageImplCopyWithImpl<$Res>
    extends _$SearchTagVodPageCopyWithImpl<$Res, _$SearchTagVodPageImpl>
    implements _$$SearchTagVodPageImplCopyWith<$Res> {
  __$$SearchTagVodPageImplCopyWithImpl(_$SearchTagVodPageImpl _value,
      $Res Function(_$SearchTagVodPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchTagVodPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$SearchTagVodPageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as SearchTagVodNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchTagVodPageImpl implements _SearchTagVodPage {
  const _$SearchTagVodPageImpl({this.next});

  factory _$SearchTagVodPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTagVodPageImplFromJson(json);

  @override
  final SearchTagVodNext? next;

  @override
  String toString() {
    return 'SearchTagVodPage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTagVodPageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of SearchTagVodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTagVodPageImplCopyWith<_$SearchTagVodPageImpl> get copyWith =>
      __$$SearchTagVodPageImplCopyWithImpl<_$SearchTagVodPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTagVodPageImplToJson(
      this,
    );
  }
}

abstract class _SearchTagVodPage implements SearchTagVodPage {
  const factory _SearchTagVodPage({final SearchTagVodNext? next}) =
      _$SearchTagVodPageImpl;

  factory _SearchTagVodPage.fromJson(Map<String, dynamic> json) =
      _$SearchTagVodPageImpl.fromJson;

  @override
  SearchTagVodNext? get next;

  /// Create a copy of SearchTagVodPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTagVodPageImplCopyWith<_$SearchTagVodPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchTagVodNext _$SearchTagVodNextFromJson(Map<String, dynamic> json) {
  return _SearchTagVodNext.fromJson(json);
}

/// @nodoc
mixin _$SearchTagVodNext {
  int get start => throw _privateConstructorUsedError;

  /// Serializes this SearchTagVodNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchTagVodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchTagVodNextCopyWith<SearchTagVodNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTagVodNextCopyWith<$Res> {
  factory $SearchTagVodNextCopyWith(
          SearchTagVodNext value, $Res Function(SearchTagVodNext) then) =
      _$SearchTagVodNextCopyWithImpl<$Res, SearchTagVodNext>;
  @useResult
  $Res call({int start});
}

/// @nodoc
class _$SearchTagVodNextCopyWithImpl<$Res, $Val extends SearchTagVodNext>
    implements $SearchTagVodNextCopyWith<$Res> {
  _$SearchTagVodNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchTagVodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchTagVodNextImplCopyWith<$Res>
    implements $SearchTagVodNextCopyWith<$Res> {
  factory _$$SearchTagVodNextImplCopyWith(_$SearchTagVodNextImpl value,
          $Res Function(_$SearchTagVodNextImpl) then) =
      __$$SearchTagVodNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int start});
}

/// @nodoc
class __$$SearchTagVodNextImplCopyWithImpl<$Res>
    extends _$SearchTagVodNextCopyWithImpl<$Res, _$SearchTagVodNextImpl>
    implements _$$SearchTagVodNextImplCopyWith<$Res> {
  __$$SearchTagVodNextImplCopyWithImpl(_$SearchTagVodNextImpl _value,
      $Res Function(_$SearchTagVodNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchTagVodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
  }) {
    return _then(_$SearchTagVodNextImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchTagVodNextImpl implements _SearchTagVodNext {
  const _$SearchTagVodNextImpl({required this.start});

  factory _$SearchTagVodNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTagVodNextImplFromJson(json);

  @override
  final int start;

  @override
  String toString() {
    return 'SearchTagVodNext(start: $start)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTagVodNextImpl &&
            (identical(other.start, start) || other.start == start));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start);

  /// Create a copy of SearchTagVodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTagVodNextImplCopyWith<_$SearchTagVodNextImpl> get copyWith =>
      __$$SearchTagVodNextImplCopyWithImpl<_$SearchTagVodNextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTagVodNextImplToJson(
      this,
    );
  }
}

abstract class _SearchTagVodNext implements SearchTagVodNext {
  const factory _SearchTagVodNext({required final int start}) =
      _$SearchTagVodNextImpl;

  factory _SearchTagVodNext.fromJson(Map<String, dynamic> json) =
      _$SearchTagVodNextImpl.fromJson;

  @override
  int get start;

  /// Create a copy of SearchTagVodNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTagVodNextImplCopyWith<_$SearchTagVodNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
