import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'category_response.g.dart';
part 'category_response.freezed.dart';

@freezed
class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    required int size,
    CategoryPage? page,
    required List<Category> data,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

@freezed
class CategoryPage with _$CategoryPage {
  const factory CategoryPage({CategoryNext? next}) = _CategoryPage;

  factory CategoryPage.fromJson(Map<String, dynamic> json) =>
      _$CategoryPageFromJson(json);
}

@freezed
class CategoryNext with _$CategoryNext {
  const factory CategoryNext({
    required int concurrentUserCount,
    required int openLiveCount,
    required String categoryId,
  }) = _CategoryNext;

  factory CategoryNext.fromJson(Map<String, dynamic> json) =>
      _$CategoryNextFromJson(json);
}

@freezed
class FollowingCategoryResponse with _$FollowingCategoryResponse {
  const factory FollowingCategoryResponse({List<Category>? followingList}) =
      _FollowingCategoryResponse;

  factory FollowingCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowingCategoryResponseFromJson(json);
}
