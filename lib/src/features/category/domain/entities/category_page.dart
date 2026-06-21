import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_item.dart';

part 'category_page.freezed.dart';

@freezed
abstract class CategoryPage with _$CategoryPage {
  const factory CategoryPage({
    @Default(<CategoryItem>[]) List<CategoryItem> items,
    CategoryPageCursor? cursor,
    @Default(0) int size,
  }) = _CategoryPage;
}

@freezed
abstract class CategoryPageCursor with _$CategoryPageCursor {
  const factory CategoryPageCursor({
    required String categoryId,
    String? categoryType,
    int? concurrentUserCount,
    int? openLiveCount,
  }) = _CategoryPageCursor;
}
