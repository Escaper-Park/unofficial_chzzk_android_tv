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
  List<String>? get tags => throw _privateConstructorUsedError;
  bool? get existLounge => throw _privateConstructorUsedError;
  bool? get following => throw _privateConstructorUsedError;
  bool? get newCategory => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      int concurrentUserCount,
      List<String>? tags,
      bool? existLounge,
      bool? following,
      bool? newCategory});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? categoryId = null,
    Object? categoryValue = null,
    Object? posterImageUrl = freezed,
    Object? openLiveCount = null,
    Object? concurrentUserCount = null,
    Object? tags = freezed,
    Object? existLounge = freezed,
    Object? following = freezed,
    Object? newCategory = freezed,
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
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      existLounge: freezed == existLounge
          ? _value.existLounge
          : existLounge // ignore: cast_nullable_to_non_nullable
              as bool?,
      following: freezed == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as bool?,
      newCategory: freezed == newCategory
          ? _value.newCategory
          : newCategory // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      int concurrentUserCount,
      List<String>? tags,
      bool? existLounge,
      bool? following,
      bool? newCategory});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? categoryId = null,
    Object? categoryValue = null,
    Object? posterImageUrl = freezed,
    Object? openLiveCount = null,
    Object? concurrentUserCount = null,
    Object? tags = freezed,
    Object? existLounge = freezed,
    Object? following = freezed,
    Object? newCategory = freezed,
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
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      existLounge: freezed == existLounge
          ? _value.existLounge
          : existLounge // ignore: cast_nullable_to_non_nullable
              as bool?,
      following: freezed == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as bool?,
      newCategory: freezed == newCategory
          ? _value.newCategory
          : newCategory // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      this.posterImageUrl,
      required this.openLiveCount,
      required this.concurrentUserCount,
      final List<String>? tags,
      this.existLounge,
      this.following,
      this.newCategory})
      : _tags = tags;

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
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? existLounge;
  @override
  final bool? following;
  @override
  final bool? newCategory;

  @override
  String toString() {
    return 'Category(categoryType: $categoryType, categoryId: $categoryId, categoryValue: $categoryValue, posterImageUrl: $posterImageUrl, openLiveCount: $openLiveCount, concurrentUserCount: $concurrentUserCount, tags: $tags, existLounge: $existLounge, following: $following, newCategory: $newCategory)';
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
                other.concurrentUserCount == concurrentUserCount) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.existLounge, existLounge) ||
                other.existLounge == existLounge) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.newCategory, newCategory) ||
                other.newCategory == newCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      categoryType,
      categoryId,
      categoryValue,
      posterImageUrl,
      openLiveCount,
      concurrentUserCount,
      const DeepCollectionEquality().hash(_tags),
      existLounge,
      following,
      newCategory);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      final String? posterImageUrl,
      required final int openLiveCount,
      required final int concurrentUserCount,
      final List<String>? tags,
      final bool? existLounge,
      final bool? following,
      final bool? newCategory}) = _$CategoryImpl;

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
  List<String>? get tags;
  @override
  bool? get existLounge;
  @override
  bool? get following;
  @override
  bool? get newCategory;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
