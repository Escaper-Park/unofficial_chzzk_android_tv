import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String categoryType,
    required String categoryId,
    required String categoryValue,
    required String? posterImageUrl,
    required int openLiveCount,
    required int concurrentUserCount,
    required bool? existLounge,
    required bool? following,
    required bool? newCategory,
    required List<String>? tags,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class CategoryPage with _$CategoryPage {
  const factory CategoryPage({
    required int concurrentUserCount,
    required int openLiveCount,
    required String categoryId,
  }) = _CategoryPage;

  factory CategoryPage.fromJson(Map<String, dynamic> json) =>
      _$CategoryPageFromJson(json);
}

@freezed
class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    required int size,
    @JsonKey(name: 'page', fromJson: _categoryPageFromJson)
    required CategoryPage? next,
    required List<Category> data,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

CategoryPage _categoryPageFromJson(Map<String, dynamic> json) =>
    CategoryPage.fromJson(json['next']);
