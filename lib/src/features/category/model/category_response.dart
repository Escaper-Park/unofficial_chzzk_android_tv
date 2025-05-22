import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'category_response.g.dart';
part 'category_response.freezed.dart';

@freezed
@JsonSerializable()
class CategoryResponse with _$CategoryResponse {
  final int size;
  final CategoryPage? page;
  final List<Category> data;

  CategoryResponse({
    required this.size,
    this.page,
    required this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

@freezed
@JsonSerializable()
class CategoryPage with _$CategoryPage {
  final CategoryNext? next;

  CategoryPage({this.next});

  factory CategoryPage.fromJson(Map<String, dynamic> json) =>
      _$CategoryPageFromJson(json);
}

@freezed
@JsonSerializable()
class CategoryNext with _$CategoryNext {
  final int concurrentUserCount;
  final int openLiveCount;
  final String categoryId;

  CategoryNext({
    required this.concurrentUserCount,
    required this.openLiveCount,
    required this.categoryId,
  });

  factory CategoryNext.fromJson(Map<String, dynamic> json) =>
      _$CategoryNextFromJson(json);
}

@freezed
@JsonSerializable()
class FollowingCategoryResponse with _$FollowingCategoryResponse {
  final List<Category>? followingList;

  FollowingCategoryResponse({this.followingList});

  factory FollowingCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowingCategoryResponseFromJson(json);
}
