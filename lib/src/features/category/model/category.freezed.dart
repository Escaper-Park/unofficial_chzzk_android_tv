// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Category {
  String get categoryType;
  String get categoryId;
  String get categoryValue;
  String? get posterImageUrl;
  int get openLiveCount;
  int get concurrentUserCount;
  List<String>? get tags;
  bool? get existLounge;
  bool? get following;
  bool? get newCategory;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<Category> get copyWith =>
      _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Category &&
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
            const DeepCollectionEquality().equals(other.tags, tags) &&
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
      const DeepCollectionEquality().hash(tags),
      existLounge,
      following,
      newCategory);

  @override
  String toString() {
    return 'Category(categoryType: $categoryType, categoryId: $categoryId, categoryValue: $categoryValue, posterImageUrl: $posterImageUrl, openLiveCount: $openLiveCount, concurrentUserCount: $concurrentUserCount, tags: $tags, existLounge: $existLounge, following: $following, newCategory: $newCategory)';
  }
}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) =
      _$CategoryCopyWithImpl;
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
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

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
    return _then(Category(
      categoryType: null == categoryType
          ? _self.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryValue: null == categoryValue
          ? _self.categoryValue
          : categoryValue // ignore: cast_nullable_to_non_nullable
              as String,
      posterImageUrl: freezed == posterImageUrl
          ? _self.posterImageUrl
          : posterImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      openLiveCount: null == openLiveCount
          ? _self.openLiveCount
          : openLiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      concurrentUserCount: null == concurrentUserCount
          ? _self.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      existLounge: freezed == existLounge
          ? _self.existLounge
          : existLounge // ignore: cast_nullable_to_non_nullable
              as bool?,
      following: freezed == following
          ? _self.following
          : following // ignore: cast_nullable_to_non_nullable
              as bool?,
      newCategory: freezed == newCategory
          ? _self.newCategory
          : newCategory // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
