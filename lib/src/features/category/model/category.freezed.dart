// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get categoryType => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get categoryValue => throw _privateConstructorUsedError;
  String? get posterImageUrl => throw _privateConstructorUsedError;
  int get openLiveCount => throw _privateConstructorUsedError;
  int get concurrentUserCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {String categoryType,
      String categoryId,
      String categoryValue,
      String? posterImageUrl,
      int openLiveCount,
      int concurrentUserCount});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? categoryId = null,
    Object? categoryValue = null,
    Object? posterImageUrl = freezed,
    Object? openLiveCount = null,
    Object? concurrentUserCount = null,
  }) {
    return _then(_value.copyWith(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryValue: null == categoryValue
          ? _value.categoryValue
          : categoryValue // ignore: cast_nullable_to_non_nullable
              as String,
      posterImageUrl: freezed == posterImageUrl
          ? _value.posterImageUrl
          : posterImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      openLiveCount: null == openLiveCount
          ? _value.openLiveCount
          : openLiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryType,
      String categoryId,
      String categoryValue,
      String? posterImageUrl,
      int openLiveCount,
      int concurrentUserCount});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? categoryId = null,
    Object? categoryValue = null,
    Object? posterImageUrl = freezed,
    Object? openLiveCount = null,
    Object? concurrentUserCount = null,
  }) {
    return _then(_$CategoryImpl(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryValue: null == categoryValue
          ? _value.categoryValue
          : categoryValue // ignore: cast_nullable_to_non_nullable
              as String,
      posterImageUrl: freezed == posterImageUrl
          ? _value.posterImageUrl
          : posterImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      openLiveCount: null == openLiveCount
          ? _value.openLiveCount
          : openLiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {required this.categoryType,
      required this.categoryId,
      required this.categoryValue,
      required this.posterImageUrl,
      required this.openLiveCount,
      required this.concurrentUserCount});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final String categoryType;
  @override
  final String categoryId;
  @override
  final String categoryValue;
  @override
  final String? posterImageUrl;
  @override
  final int openLiveCount;
  @override
  final int concurrentUserCount;

  @override
  String toString() {
    return 'Category(categoryType: $categoryType, categoryId: $categoryId, categoryValue: $categoryValue, posterImageUrl: $posterImageUrl, openLiveCount: $openLiveCount, concurrentUserCount: $concurrentUserCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.posterImageUrl, posterImageUrl) ||
                other.posterImageUrl == posterImageUrl) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryType, categoryId,
      categoryValue, posterImageUrl, openLiveCount, concurrentUserCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {required final String categoryType,
      required final String categoryId,
      required final String categoryValue,
      required final String? posterImageUrl,
      required final int openLiveCount,
      required final int concurrentUserCount}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  String get categoryType;
  @override
  String get categoryId;
  @override
  String get categoryValue;
  @override
  String? get posterImageUrl;
  @override
  int get openLiveCount;
  @override
  int get concurrentUserCount;
  @override
  @JsonKey(ignore: true)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryPage _$CategoryPageFromJson(Map<String, dynamic> json) {
  return _CategoryPage.fromJson(json);
}

/// @nodoc
mixin _$CategoryPage {
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int get openLiveCount => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryPageCopyWith<CategoryPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryPageCopyWith<$Res> {
  factory $CategoryPageCopyWith(
          CategoryPage value, $Res Function(CategoryPage) then) =
      _$CategoryPageCopyWithImpl<$Res, CategoryPage>;
  @useResult
  $Res call({int concurrentUserCount, int openLiveCount, String categoryId});
}

/// @nodoc
class _$CategoryPageCopyWithImpl<$Res, $Val extends CategoryPage>
    implements $CategoryPageCopyWith<$Res> {
  _$CategoryPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? openLiveCount = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      openLiveCount: null == openLiveCount
          ? _value.openLiveCount
          : openLiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryPageImplCopyWith<$Res>
    implements $CategoryPageCopyWith<$Res> {
  factory _$$CategoryPageImplCopyWith(
          _$CategoryPageImpl value, $Res Function(_$CategoryPageImpl) then) =
      __$$CategoryPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int concurrentUserCount, int openLiveCount, String categoryId});
}

/// @nodoc
class __$$CategoryPageImplCopyWithImpl<$Res>
    extends _$CategoryPageCopyWithImpl<$Res, _$CategoryPageImpl>
    implements _$$CategoryPageImplCopyWith<$Res> {
  __$$CategoryPageImplCopyWithImpl(
      _$CategoryPageImpl _value, $Res Function(_$CategoryPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? openLiveCount = null,
    Object? categoryId = null,
  }) {
    return _then(_$CategoryPageImpl(
      concurrentUserCount: null == concurrentUserCount
          ? _value.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      openLiveCount: null == openLiveCount
          ? _value.openLiveCount
          : openLiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryPageImpl implements _CategoryPage {
  const _$CategoryPageImpl(
      {required this.concurrentUserCount,
      required this.openLiveCount,
      required this.categoryId});

  factory _$CategoryPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryPageImplFromJson(json);

  @override
  final int concurrentUserCount;
  @override
  final int openLiveCount;
  @override
  final String categoryId;

  @override
  String toString() {
    return 'CategoryPage(concurrentUserCount: $concurrentUserCount, openLiveCount: $openLiveCount, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryPageImpl &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, concurrentUserCount, openLiveCount, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryPageImplCopyWith<_$CategoryPageImpl> get copyWith =>
      __$$CategoryPageImplCopyWithImpl<_$CategoryPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryPageImplToJson(
      this,
    );
  }
}

abstract class _CategoryPage implements CategoryPage {
  const factory _CategoryPage(
      {required final int concurrentUserCount,
      required final int openLiveCount,
      required final String categoryId}) = _$CategoryPageImpl;

  factory _CategoryPage.fromJson(Map<String, dynamic> json) =
      _$CategoryPageImpl.fromJson;

  @override
  int get concurrentUserCount;
  @override
  int get openLiveCount;
  @override
  String get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$CategoryPageImplCopyWith<_$CategoryPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryResponse {
  List<Category>? get categories => throw _privateConstructorUsedError;
  CategoryPage? get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryResponseCopyWith<CategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryResponseCopyWith<$Res> {
  factory $CategoryResponseCopyWith(
          CategoryResponse value, $Res Function(CategoryResponse) then) =
      _$CategoryResponseCopyWithImpl<$Res, CategoryResponse>;
  @useResult
  $Res call({List<Category>? categories, CategoryPage? page});

  $CategoryPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$CategoryResponseCopyWithImpl<$Res, $Val extends CategoryResponse>
    implements $CategoryResponseCopyWith<$Res> {
  _$CategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CategoryPage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $CategoryPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryResponseImplCopyWith<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  factory _$$CategoryResponseImplCopyWith(_$CategoryResponseImpl value,
          $Res Function(_$CategoryResponseImpl) then) =
      __$$CategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category>? categories, CategoryPage? page});

  @override
  $CategoryPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$CategoryResponseImplCopyWithImpl<$Res>
    extends _$CategoryResponseCopyWithImpl<$Res, _$CategoryResponseImpl>
    implements _$$CategoryResponseImplCopyWith<$Res> {
  __$$CategoryResponseImplCopyWithImpl(_$CategoryResponseImpl _value,
      $Res Function(_$CategoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? page = freezed,
  }) {
    return _then(_$CategoryResponseImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CategoryPage?,
    ));
  }
}

/// @nodoc

class _$CategoryResponseImpl implements _CategoryResponse {
  const _$CategoryResponseImpl(
      {required final List<Category>? categories, required this.page})
      : _categories = categories;

  final List<Category>? _categories;
  @override
  List<Category>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CategoryPage? page;

  @override
  String toString() {
    return 'CategoryResponse(categories: $categories, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryResponseImplCopyWith<_$CategoryResponseImpl> get copyWith =>
      __$$CategoryResponseImplCopyWithImpl<_$CategoryResponseImpl>(
          this, _$identity);
}

abstract class _CategoryResponse implements CategoryResponse {
  const factory _CategoryResponse(
      {required final List<Category>? categories,
      required final CategoryPage? page}) = _$CategoryResponseImpl;

  @override
  List<Category>? get categories;
  @override
  CategoryPage? get page;
  @override
  @JsonKey(ignore: true)
  _$$CategoryResponseImplCopyWith<_$CategoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
