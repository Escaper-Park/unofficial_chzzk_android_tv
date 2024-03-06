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
    required List<Category>? categories,
    required CategoryPage? page,
  }) = _CategoryResponse;
}
