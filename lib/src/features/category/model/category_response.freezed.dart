// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryResponse {
  int get size;
  CategoryPage? get page;
  List<Category> get data;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryResponseCopyWith<CategoryResponse> get copyWith =>
      _$CategoryResponseCopyWithImpl<CategoryResponse>(
          this as CategoryResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryResponse &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'CategoryResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $CategoryResponseCopyWith<$Res> {
  factory $CategoryResponseCopyWith(
          CategoryResponse value, $Res Function(CategoryResponse) _then) =
      _$CategoryResponseCopyWithImpl;
  @useResult
  $Res call({int size, CategoryPage? page, List<Category> data});
}

/// @nodoc
class _$CategoryResponseCopyWithImpl<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  _$CategoryResponseCopyWithImpl(this._self, this._then);

  final CategoryResponse _self;
  final $Res Function(CategoryResponse) _then;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(CategoryResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as CategoryPage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc
mixin _$CategoryPage {
  CategoryNext? get next;

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryPageCopyWith<CategoryPage> get copyWith =>
      _$CategoryPageCopyWithImpl<CategoryPage>(
          this as CategoryPage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryPage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'CategoryPage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $CategoryPageCopyWith<$Res> {
  factory $CategoryPageCopyWith(
          CategoryPage value, $Res Function(CategoryPage) _then) =
      _$CategoryPageCopyWithImpl;
  @useResult
  $Res call({CategoryNext? next});
}

/// @nodoc
class _$CategoryPageCopyWithImpl<$Res> implements $CategoryPageCopyWith<$Res> {
  _$CategoryPageCopyWithImpl(this._self, this._then);

  final CategoryPage _self;
  final $Res Function(CategoryPage) _then;

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(CategoryPage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as CategoryNext?,
    ));
  }
}

/// @nodoc
mixin _$CategoryNext {
  int get concurrentUserCount;
  int get openLiveCount;
  String get categoryId;

  /// Create a copy of CategoryNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryNextCopyWith<CategoryNext> get copyWith =>
      _$CategoryNextCopyWithImpl<CategoryNext>(
          this as CategoryNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryNext &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, concurrentUserCount, openLiveCount, categoryId);

  @override
  String toString() {
    return 'CategoryNext(concurrentUserCount: $concurrentUserCount, openLiveCount: $openLiveCount, categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class $CategoryNextCopyWith<$Res> {
  factory $CategoryNextCopyWith(
          CategoryNext value, $Res Function(CategoryNext) _then) =
      _$CategoryNextCopyWithImpl;
  @useResult
  $Res call({int concurrentUserCount, int openLiveCount, String categoryId});
}

/// @nodoc
class _$CategoryNextCopyWithImpl<$Res> implements $CategoryNextCopyWith<$Res> {
  _$CategoryNextCopyWithImpl(this._self, this._then);

  final CategoryNext _self;
  final $Res Function(CategoryNext) _then;

  /// Create a copy of CategoryNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? openLiveCount = null,
    Object? categoryId = null,
  }) {
    return _then(CategoryNext(
      concurrentUserCount: null == concurrentUserCount
          ? _self.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      openLiveCount: null == openLiveCount
          ? _self.openLiveCount
          : openLiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$FollowingCategoryResponse {
  List<Category>? get followingList;

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingCategoryResponseCopyWith<FollowingCategoryResponse> get copyWith =>
      _$FollowingCategoryResponseCopyWithImpl<FollowingCategoryResponse>(
          this as FollowingCategoryResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingCategoryResponse &&
            const DeepCollectionEquality()
                .equals(other.followingList, followingList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(followingList));

  @override
  String toString() {
    return 'FollowingCategoryResponse(followingList: $followingList)';
  }
}

/// @nodoc
abstract mixin class $FollowingCategoryResponseCopyWith<$Res> {
  factory $FollowingCategoryResponseCopyWith(FollowingCategoryResponse value,
          $Res Function(FollowingCategoryResponse) _then) =
      _$FollowingCategoryResponseCopyWithImpl;
  @useResult
  $Res call({List<Category>? followingList});
}

/// @nodoc
class _$FollowingCategoryResponseCopyWithImpl<$Res>
    implements $FollowingCategoryResponseCopyWith<$Res> {
  _$FollowingCategoryResponseCopyWithImpl(this._self, this._then);

  final FollowingCategoryResponse _self;
  final $Res Function(FollowingCategoryResponse) _then;

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingList = freezed,
  }) {
    return _then(FollowingCategoryResponse(
      followingList: freezed == followingList
          ? _self.followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ));
  }
}

// dart format on
