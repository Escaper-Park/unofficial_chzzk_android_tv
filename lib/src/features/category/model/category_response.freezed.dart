// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return _CategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryResponse {
  int get size => throw _privateConstructorUsedError;
  CategoryPage? get page => throw _privateConstructorUsedError;
  List<Category> get data => throw _privateConstructorUsedError;

  /// Serializes this CategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryResponseCopyWith<CategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryResponseCopyWith<$Res> {
  factory $CategoryResponseCopyWith(
          CategoryResponse value, $Res Function(CategoryResponse) then) =
      _$CategoryResponseCopyWithImpl<$Res, CategoryResponse>;
  @useResult
  $Res call({int size, CategoryPage? page, List<Category> data});

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

  /// Create a copy of CategoryResponse
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
              as CategoryPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
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
  $Res call({int size, CategoryPage? page, List<Category> data});

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

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$CategoryResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CategoryPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryResponseImpl implements _CategoryResponse {
  const _$CategoryResponseImpl(
      {required this.size, this.page, required final List<Category> data})
      : _data = data;

  factory _$CategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryResponseImplFromJson(json);

  @override
  final int size;
  @override
  final CategoryPage? page;
  final List<Category> _data;
  @override
  List<Category> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CategoryResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryResponseImplCopyWith<_$CategoryResponseImpl> get copyWith =>
      __$$CategoryResponseImplCopyWithImpl<_$CategoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoryResponse implements CategoryResponse {
  const factory _CategoryResponse(
      {required final int size,
      final CategoryPage? page,
      required final List<Category> data}) = _$CategoryResponseImpl;

  factory _CategoryResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryResponseImpl.fromJson;

  @override
  int get size;
  @override
  CategoryPage? get page;
  @override
  List<Category> get data;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryResponseImplCopyWith<_$CategoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryPage _$CategoryPageFromJson(Map<String, dynamic> json) {
  return _CategoryPage.fromJson(json);
}

/// @nodoc
mixin _$CategoryPage {
  CategoryNext? get next => throw _privateConstructorUsedError;

  /// Serializes this CategoryPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryPageCopyWith<CategoryPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryPageCopyWith<$Res> {
  factory $CategoryPageCopyWith(
          CategoryPage value, $Res Function(CategoryPage) then) =
      _$CategoryPageCopyWithImpl<$Res, CategoryPage>;
  @useResult
  $Res call({CategoryNext? next});

  $CategoryNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$CategoryPageCopyWithImpl<$Res, $Val extends CategoryPage>
    implements $CategoryPageCopyWith<$Res> {
  _$CategoryPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryPage
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
              as CategoryNext?,
    ) as $Val);
  }

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $CategoryNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
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
  $Res call({CategoryNext? next});

  @override
  $CategoryNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$CategoryPageImplCopyWithImpl<$Res>
    extends _$CategoryPageCopyWithImpl<$Res, _$CategoryPageImpl>
    implements _$$CategoryPageImplCopyWith<$Res> {
  __$$CategoryPageImplCopyWithImpl(
      _$CategoryPageImpl _value, $Res Function(_$CategoryPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$CategoryPageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as CategoryNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryPageImpl implements _CategoryPage {
  const _$CategoryPageImpl({this.next});

  factory _$CategoryPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryPageImplFromJson(json);

  @override
  final CategoryNext? next;

  @override
  String toString() {
    return 'CategoryPage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryPageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  const factory _CategoryPage({final CategoryNext? next}) = _$CategoryPageImpl;

  factory _CategoryPage.fromJson(Map<String, dynamic> json) =
      _$CategoryPageImpl.fromJson;

  @override
  CategoryNext? get next;

  /// Create a copy of CategoryPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryPageImplCopyWith<_$CategoryPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryNext _$CategoryNextFromJson(Map<String, dynamic> json) {
  return _CategoryNext.fromJson(json);
}

/// @nodoc
mixin _$CategoryNext {
  int get concurrentUserCount => throw _privateConstructorUsedError;
  int get openLiveCount => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;

  /// Serializes this CategoryNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryNextCopyWith<CategoryNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryNextCopyWith<$Res> {
  factory $CategoryNextCopyWith(
          CategoryNext value, $Res Function(CategoryNext) then) =
      _$CategoryNextCopyWithImpl<$Res, CategoryNext>;
  @useResult
  $Res call({int concurrentUserCount, int openLiveCount, String categoryId});
}

/// @nodoc
class _$CategoryNextCopyWithImpl<$Res, $Val extends CategoryNext>
    implements $CategoryNextCopyWith<$Res> {
  _$CategoryNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryNext
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$CategoryNextImplCopyWith<$Res>
    implements $CategoryNextCopyWith<$Res> {
  factory _$$CategoryNextImplCopyWith(
          _$CategoryNextImpl value, $Res Function(_$CategoryNextImpl) then) =
      __$$CategoryNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int concurrentUserCount, int openLiveCount, String categoryId});
}

/// @nodoc
class __$$CategoryNextImplCopyWithImpl<$Res>
    extends _$CategoryNextCopyWithImpl<$Res, _$CategoryNextImpl>
    implements _$$CategoryNextImplCopyWith<$Res> {
  __$$CategoryNextImplCopyWithImpl(
      _$CategoryNextImpl _value, $Res Function(_$CategoryNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? openLiveCount = null,
    Object? categoryId = null,
  }) {
    return _then(_$CategoryNextImpl(
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
class _$CategoryNextImpl implements _CategoryNext {
  const _$CategoryNextImpl(
      {required this.concurrentUserCount,
      required this.openLiveCount,
      required this.categoryId});

  factory _$CategoryNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryNextImplFromJson(json);

  @override
  final int concurrentUserCount;
  @override
  final int openLiveCount;
  @override
  final String categoryId;

  @override
  String toString() {
    return 'CategoryNext(concurrentUserCount: $concurrentUserCount, openLiveCount: $openLiveCount, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryNextImpl &&
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

  /// Create a copy of CategoryNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryNextImplCopyWith<_$CategoryNextImpl> get copyWith =>
      __$$CategoryNextImplCopyWithImpl<_$CategoryNextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryNextImplToJson(
      this,
    );
  }
}

abstract class _CategoryNext implements CategoryNext {
  const factory _CategoryNext(
      {required final int concurrentUserCount,
      required final int openLiveCount,
      required final String categoryId}) = _$CategoryNextImpl;

  factory _CategoryNext.fromJson(Map<String, dynamic> json) =
      _$CategoryNextImpl.fromJson;

  @override
  int get concurrentUserCount;
  @override
  int get openLiveCount;
  @override
  String get categoryId;

  /// Create a copy of CategoryNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryNextImplCopyWith<_$CategoryNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingCategoryResponse _$FollowingCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _FollowingCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$FollowingCategoryResponse {
  List<Category>? get followingList => throw _privateConstructorUsedError;

  /// Serializes this FollowingCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingCategoryResponseCopyWith<FollowingCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingCategoryResponseCopyWith<$Res> {
  factory $FollowingCategoryResponseCopyWith(FollowingCategoryResponse value,
          $Res Function(FollowingCategoryResponse) then) =
      _$FollowingCategoryResponseCopyWithImpl<$Res, FollowingCategoryResponse>;
  @useResult
  $Res call({List<Category>? followingList});
}

/// @nodoc
class _$FollowingCategoryResponseCopyWithImpl<$Res,
        $Val extends FollowingCategoryResponse>
    implements $FollowingCategoryResponseCopyWith<$Res> {
  _$FollowingCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingList = freezed,
  }) {
    return _then(_value.copyWith(
      followingList: freezed == followingList
          ? _value.followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingCategoryResponseImplCopyWith<$Res>
    implements $FollowingCategoryResponseCopyWith<$Res> {
  factory _$$FollowingCategoryResponseImplCopyWith(
          _$FollowingCategoryResponseImpl value,
          $Res Function(_$FollowingCategoryResponseImpl) then) =
      __$$FollowingCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category>? followingList});
}

/// @nodoc
class __$$FollowingCategoryResponseImplCopyWithImpl<$Res>
    extends _$FollowingCategoryResponseCopyWithImpl<$Res,
        _$FollowingCategoryResponseImpl>
    implements _$$FollowingCategoryResponseImplCopyWith<$Res> {
  __$$FollowingCategoryResponseImplCopyWithImpl(
      _$FollowingCategoryResponseImpl _value,
      $Res Function(_$FollowingCategoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingList = freezed,
  }) {
    return _then(_$FollowingCategoryResponseImpl(
      followingList: freezed == followingList
          ? _value._followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingCategoryResponseImpl implements _FollowingCategoryResponse {
  const _$FollowingCategoryResponseImpl({final List<Category>? followingList})
      : _followingList = followingList;

  factory _$FollowingCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingCategoryResponseImplFromJson(json);

  final List<Category>? _followingList;
  @override
  List<Category>? get followingList {
    final value = _followingList;
    if (value == null) return null;
    if (_followingList is EqualUnmodifiableListView) return _followingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingCategoryResponse(followingList: $followingList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingCategoryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._followingList, _followingList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_followingList));

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingCategoryResponseImplCopyWith<_$FollowingCategoryResponseImpl>
      get copyWith => __$$FollowingCategoryResponseImplCopyWithImpl<
          _$FollowingCategoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _FollowingCategoryResponse implements FollowingCategoryResponse {
  const factory _FollowingCategoryResponse(
      {final List<Category>? followingList}) = _$FollowingCategoryResponseImpl;

  factory _FollowingCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$FollowingCategoryResponseImpl.fromJson;

  @override
  List<Category>? get followingList;

  /// Create a copy of FollowingCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingCategoryResponseImplCopyWith<_$FollowingCategoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
