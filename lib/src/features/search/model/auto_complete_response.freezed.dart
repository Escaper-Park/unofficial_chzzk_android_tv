// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auto_complete_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AutoCompleteSearchChannelResponse _$AutoCompleteSearchChannelResponseFromJson(
    Map<String, dynamic> json) {
  return _AutoCompleteSearchChannelResponse.fromJson(json);
}

/// @nodoc
mixin _$AutoCompleteSearchChannelResponse {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<String> get data => throw _privateConstructorUsedError;

  /// Serializes this AutoCompleteSearchChannelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutoCompleteSearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutoCompleteSearchChannelResponseCopyWith<AutoCompleteSearchChannelResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteSearchChannelResponseCopyWith<$Res> {
  factory $AutoCompleteSearchChannelResponseCopyWith(
          AutoCompleteSearchChannelResponse value,
          $Res Function(AutoCompleteSearchChannelResponse) then) =
      _$AutoCompleteSearchChannelResponseCopyWithImpl<$Res,
          AutoCompleteSearchChannelResponse>;
  @useResult
  $Res call(
      {int page, int size, int totalCount, int totalPages, List<String> data});
}

/// @nodoc
class _$AutoCompleteSearchChannelResponseCopyWithImpl<$Res,
        $Val extends AutoCompleteSearchChannelResponse>
    implements $AutoCompleteSearchChannelResponseCopyWith<$Res> {
  _$AutoCompleteSearchChannelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutoCompleteSearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutoCompleteSearchChannelResponseImplCopyWith<$Res>
    implements $AutoCompleteSearchChannelResponseCopyWith<$Res> {
  factory _$$AutoCompleteSearchChannelResponseImplCopyWith(
          _$AutoCompleteSearchChannelResponseImpl value,
          $Res Function(_$AutoCompleteSearchChannelResponseImpl) then) =
      __$$AutoCompleteSearchChannelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page, int size, int totalCount, int totalPages, List<String> data});
}

/// @nodoc
class __$$AutoCompleteSearchChannelResponseImplCopyWithImpl<$Res>
    extends _$AutoCompleteSearchChannelResponseCopyWithImpl<$Res,
        _$AutoCompleteSearchChannelResponseImpl>
    implements _$$AutoCompleteSearchChannelResponseImplCopyWith<$Res> {
  __$$AutoCompleteSearchChannelResponseImplCopyWithImpl(
      _$AutoCompleteSearchChannelResponseImpl _value,
      $Res Function(_$AutoCompleteSearchChannelResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AutoCompleteSearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_$AutoCompleteSearchChannelResponseImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutoCompleteSearchChannelResponseImpl
    implements _AutoCompleteSearchChannelResponse {
  const _$AutoCompleteSearchChannelResponseImpl(
      {required this.page,
      required this.size,
      required this.totalCount,
      required this.totalPages,
      required final List<String> data})
      : _data = data;

  factory _$AutoCompleteSearchChannelResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AutoCompleteSearchChannelResponseImplFromJson(json);

  @override
  final int page;
  @override
  final int size;
  @override
  final int totalCount;
  @override
  final int totalPages;
  final List<String> _data;
  @override
  List<String> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AutoCompleteSearchChannelResponse(page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoCompleteSearchChannelResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, totalCount,
      totalPages, const DeepCollectionEquality().hash(_data));

  /// Create a copy of AutoCompleteSearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoCompleteSearchChannelResponseImplCopyWith<
          _$AutoCompleteSearchChannelResponseImpl>
      get copyWith => __$$AutoCompleteSearchChannelResponseImplCopyWithImpl<
          _$AutoCompleteSearchChannelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutoCompleteSearchChannelResponseImplToJson(
      this,
    );
  }
}

abstract class _AutoCompleteSearchChannelResponse
    implements AutoCompleteSearchChannelResponse {
  const factory _AutoCompleteSearchChannelResponse(
          {required final int page,
          required final int size,
          required final int totalCount,
          required final int totalPages,
          required final List<String> data}) =
      _$AutoCompleteSearchChannelResponseImpl;

  factory _AutoCompleteSearchChannelResponse.fromJson(
          Map<String, dynamic> json) =
      _$AutoCompleteSearchChannelResponseImpl.fromJson;

  @override
  int get page;
  @override
  int get size;
  @override
  int get totalCount;
  @override
  int get totalPages;
  @override
  List<String> get data;

  /// Create a copy of AutoCompleteSearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoCompleteSearchChannelResponseImplCopyWith<
          _$AutoCompleteSearchChannelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AutoCompleteSearchCategoryResponse _$AutoCompleteSearchCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _AutoCompleteSearchCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$AutoCompleteSearchCategoryResponse {
  Paging? get paging => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  List<String> get data => throw _privateConstructorUsedError;

  /// Serializes this AutoCompleteSearchCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutoCompleteSearchCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutoCompleteSearchCategoryResponseCopyWith<
          AutoCompleteSearchCategoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteSearchCategoryResponseCopyWith<$Res> {
  factory $AutoCompleteSearchCategoryResponseCopyWith(
          AutoCompleteSearchCategoryResponse value,
          $Res Function(AutoCompleteSearchCategoryResponse) then) =
      _$AutoCompleteSearchCategoryResponseCopyWithImpl<$Res,
          AutoCompleteSearchCategoryResponse>;
  @useResult
  $Res call({Paging? paging, int totalCount, List<String> data});

  $PagingCopyWith<$Res>? get paging;
}

/// @nodoc
class _$AutoCompleteSearchCategoryResponseCopyWithImpl<$Res,
        $Val extends AutoCompleteSearchCategoryResponse>
    implements $AutoCompleteSearchCategoryResponseCopyWith<$Res> {
  _$AutoCompleteSearchCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutoCompleteSearchCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paging = freezed,
    Object? totalCount = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      paging: freezed == paging
          ? _value.paging
          : paging // ignore: cast_nullable_to_non_nullable
              as Paging?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of AutoCompleteSearchCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PagingCopyWith<$Res>? get paging {
    if (_value.paging == null) {
      return null;
    }

    return $PagingCopyWith<$Res>(_value.paging!, (value) {
      return _then(_value.copyWith(paging: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AutoCompleteSearchCategoryResponseImplCopyWith<$Res>
    implements $AutoCompleteSearchCategoryResponseCopyWith<$Res> {
  factory _$$AutoCompleteSearchCategoryResponseImplCopyWith(
          _$AutoCompleteSearchCategoryResponseImpl value,
          $Res Function(_$AutoCompleteSearchCategoryResponseImpl) then) =
      __$$AutoCompleteSearchCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Paging? paging, int totalCount, List<String> data});

  @override
  $PagingCopyWith<$Res>? get paging;
}

/// @nodoc
class __$$AutoCompleteSearchCategoryResponseImplCopyWithImpl<$Res>
    extends _$AutoCompleteSearchCategoryResponseCopyWithImpl<$Res,
        _$AutoCompleteSearchCategoryResponseImpl>
    implements _$$AutoCompleteSearchCategoryResponseImplCopyWith<$Res> {
  __$$AutoCompleteSearchCategoryResponseImplCopyWithImpl(
      _$AutoCompleteSearchCategoryResponseImpl _value,
      $Res Function(_$AutoCompleteSearchCategoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AutoCompleteSearchCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paging = freezed,
    Object? totalCount = null,
    Object? data = null,
  }) {
    return _then(_$AutoCompleteSearchCategoryResponseImpl(
      paging: freezed == paging
          ? _value.paging
          : paging // ignore: cast_nullable_to_non_nullable
              as Paging?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutoCompleteSearchCategoryResponseImpl
    implements _AutoCompleteSearchCategoryResponse {
  const _$AutoCompleteSearchCategoryResponseImpl(
      {this.paging, required this.totalCount, required final List<String> data})
      : _data = data;

  factory _$AutoCompleteSearchCategoryResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AutoCompleteSearchCategoryResponseImplFromJson(json);

  @override
  final Paging? paging;
  @override
  final int totalCount;
  final List<String> _data;
  @override
  List<String> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AutoCompleteSearchCategoryResponse(paging: $paging, totalCount: $totalCount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoCompleteSearchCategoryResponseImpl &&
            (identical(other.paging, paging) || other.paging == paging) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paging, totalCount,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of AutoCompleteSearchCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoCompleteSearchCategoryResponseImplCopyWith<
          _$AutoCompleteSearchCategoryResponseImpl>
      get copyWith => __$$AutoCompleteSearchCategoryResponseImplCopyWithImpl<
          _$AutoCompleteSearchCategoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutoCompleteSearchCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _AutoCompleteSearchCategoryResponse
    implements AutoCompleteSearchCategoryResponse {
  const factory _AutoCompleteSearchCategoryResponse(
          {final Paging? paging,
          required final int totalCount,
          required final List<String> data}) =
      _$AutoCompleteSearchCategoryResponseImpl;

  factory _AutoCompleteSearchCategoryResponse.fromJson(
          Map<String, dynamic> json) =
      _$AutoCompleteSearchCategoryResponseImpl.fromJson;

  @override
  Paging? get paging;
  @override
  int get totalCount;
  @override
  List<String> get data;

  /// Create a copy of AutoCompleteSearchCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoCompleteSearchCategoryResponseImplCopyWith<
          _$AutoCompleteSearchCategoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Paging _$PagingFromJson(Map<String, dynamic> json) {
  return _Paging.fromJson(json);
}

/// @nodoc
mixin _$Paging {
  String get pagingType => throw _privateConstructorUsedError;
  int get currentPageNo => throw _privateConstructorUsedError;
  bool get lastPage => throw _privateConstructorUsedError;

  /// Serializes this Paging to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Paging
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PagingCopyWith<Paging> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagingCopyWith<$Res> {
  factory $PagingCopyWith(Paging value, $Res Function(Paging) then) =
      _$PagingCopyWithImpl<$Res, Paging>;
  @useResult
  $Res call({String pagingType, int currentPageNo, bool lastPage});
}

/// @nodoc
class _$PagingCopyWithImpl<$Res, $Val extends Paging>
    implements $PagingCopyWith<$Res> {
  _$PagingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Paging
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingType = null,
    Object? currentPageNo = null,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      pagingType: null == pagingType
          ? _value.pagingType
          : pagingType // ignore: cast_nullable_to_non_nullable
              as String,
      currentPageNo: null == currentPageNo
          ? _value.currentPageNo
          : currentPageNo // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagingImplCopyWith<$Res> implements $PagingCopyWith<$Res> {
  factory _$$PagingImplCopyWith(
          _$PagingImpl value, $Res Function(_$PagingImpl) then) =
      __$$PagingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pagingType, int currentPageNo, bool lastPage});
}

/// @nodoc
class __$$PagingImplCopyWithImpl<$Res>
    extends _$PagingCopyWithImpl<$Res, _$PagingImpl>
    implements _$$PagingImplCopyWith<$Res> {
  __$$PagingImplCopyWithImpl(
      _$PagingImpl _value, $Res Function(_$PagingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Paging
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingType = null,
    Object? currentPageNo = null,
    Object? lastPage = null,
  }) {
    return _then(_$PagingImpl(
      pagingType: null == pagingType
          ? _value.pagingType
          : pagingType // ignore: cast_nullable_to_non_nullable
              as String,
      currentPageNo: null == currentPageNo
          ? _value.currentPageNo
          : currentPageNo // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PagingImpl implements _Paging {
  const _$PagingImpl(
      {required this.pagingType,
      required this.currentPageNo,
      required this.lastPage});

  factory _$PagingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagingImplFromJson(json);

  @override
  final String pagingType;
  @override
  final int currentPageNo;
  @override
  final bool lastPage;

  @override
  String toString() {
    return 'Paging(pagingType: $pagingType, currentPageNo: $currentPageNo, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagingImpl &&
            (identical(other.pagingType, pagingType) ||
                other.pagingType == pagingType) &&
            (identical(other.currentPageNo, currentPageNo) ||
                other.currentPageNo == currentPageNo) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pagingType, currentPageNo, lastPage);

  /// Create a copy of Paging
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PagingImplCopyWith<_$PagingImpl> get copyWith =>
      __$$PagingImplCopyWithImpl<_$PagingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagingImplToJson(
      this,
    );
  }
}

abstract class _Paging implements Paging {
  const factory _Paging(
      {required final String pagingType,
      required final int currentPageNo,
      required final bool lastPage}) = _$PagingImpl;

  factory _Paging.fromJson(Map<String, dynamic> json) = _$PagingImpl.fromJson;

  @override
  String get pagingType;
  @override
  int get currentPageNo;
  @override
  bool get lastPage;

  /// Create a copy of Paging
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PagingImplCopyWith<_$PagingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
