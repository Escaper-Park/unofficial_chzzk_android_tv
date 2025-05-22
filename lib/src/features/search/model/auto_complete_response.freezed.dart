// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auto_complete_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AutoCompleteSearchChannelResponse {
  int get page;
  int get size;
  int get totalCount;
  int get totalPages;
  List<String> get data;

  /// Create a copy of AutoCompleteSearchChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AutoCompleteSearchChannelResponseCopyWith<AutoCompleteSearchChannelResponse>
      get copyWith => _$AutoCompleteSearchChannelResponseCopyWithImpl<
              AutoCompleteSearchChannelResponse>(
          this as AutoCompleteSearchChannelResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AutoCompleteSearchChannelResponse &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, totalCount,
      totalPages, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'AutoCompleteSearchChannelResponse(page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }
}

/// @nodoc
abstract mixin class $AutoCompleteSearchChannelResponseCopyWith<$Res> {
  factory $AutoCompleteSearchChannelResponseCopyWith(
          AutoCompleteSearchChannelResponse value,
          $Res Function(AutoCompleteSearchChannelResponse) _then) =
      _$AutoCompleteSearchChannelResponseCopyWithImpl;
  @useResult
  $Res call(
      {int page, int size, int totalCount, int totalPages, List<String> data});
}

/// @nodoc
class _$AutoCompleteSearchChannelResponseCopyWithImpl<$Res>
    implements $AutoCompleteSearchChannelResponseCopyWith<$Res> {
  _$AutoCompleteSearchChannelResponseCopyWithImpl(this._self, this._then);

  final AutoCompleteSearchChannelResponse _self;
  final $Res Function(AutoCompleteSearchChannelResponse) _then;

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
    return _then(AutoCompleteSearchChannelResponse(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$AutoCompleteSearchCategoryResponse {
  Paging? get paging;
  int get totalCount;
  List<String> get data;

  /// Create a copy of AutoCompleteSearchCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AutoCompleteSearchCategoryResponseCopyWith<
          AutoCompleteSearchCategoryResponse>
      get copyWith => _$AutoCompleteSearchCategoryResponseCopyWithImpl<
              AutoCompleteSearchCategoryResponse>(
          this as AutoCompleteSearchCategoryResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AutoCompleteSearchCategoryResponse &&
            (identical(other.paging, paging) || other.paging == paging) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paging, totalCount,
      const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'AutoCompleteSearchCategoryResponse(paging: $paging, totalCount: $totalCount, data: $data)';
  }
}

/// @nodoc
abstract mixin class $AutoCompleteSearchCategoryResponseCopyWith<$Res> {
  factory $AutoCompleteSearchCategoryResponseCopyWith(
          AutoCompleteSearchCategoryResponse value,
          $Res Function(AutoCompleteSearchCategoryResponse) _then) =
      _$AutoCompleteSearchCategoryResponseCopyWithImpl;
  @useResult
  $Res call({Paging? paging, int totalCount, List<String> data});
}

/// @nodoc
class _$AutoCompleteSearchCategoryResponseCopyWithImpl<$Res>
    implements $AutoCompleteSearchCategoryResponseCopyWith<$Res> {
  _$AutoCompleteSearchCategoryResponseCopyWithImpl(this._self, this._then);

  final AutoCompleteSearchCategoryResponse _self;
  final $Res Function(AutoCompleteSearchCategoryResponse) _then;

  /// Create a copy of AutoCompleteSearchCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paging = freezed,
    Object? totalCount = null,
    Object? data = null,
  }) {
    return _then(AutoCompleteSearchCategoryResponse(
      paging: freezed == paging
          ? _self.paging
          : paging // ignore: cast_nullable_to_non_nullable
              as Paging?,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$Paging {
  String get pagingType;
  int get currentPageNo;
  bool get lastPage;

  /// Create a copy of Paging
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PagingCopyWith<Paging> get copyWith =>
      _$PagingCopyWithImpl<Paging>(this as Paging, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Paging &&
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

  @override
  String toString() {
    return 'Paging(pagingType: $pagingType, currentPageNo: $currentPageNo, lastPage: $lastPage)';
  }
}

/// @nodoc
abstract mixin class $PagingCopyWith<$Res> {
  factory $PagingCopyWith(Paging value, $Res Function(Paging) _then) =
      _$PagingCopyWithImpl;
  @useResult
  $Res call({String pagingType, int currentPageNo, bool lastPage});
}

/// @nodoc
class _$PagingCopyWithImpl<$Res> implements $PagingCopyWith<$Res> {
  _$PagingCopyWithImpl(this._self, this._then);

  final Paging _self;
  final $Res Function(Paging) _then;

  /// Create a copy of Paging
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingType = null,
    Object? currentPageNo = null,
    Object? lastPage = null,
  }) {
    return _then(Paging(
      pagingType: null == pagingType
          ? _self.pagingType
          : pagingType // ignore: cast_nullable_to_non_nullable
              as String,
      currentPageNo: null == currentPageNo
          ? _self.currentPageNo
          : currentPageNo // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
