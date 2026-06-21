import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_item.freezed.dart';

@freezed
abstract class CategoryItem with _$CategoryItem {
  const factory CategoryItem({
    required String categoryId,
    required String categoryType,
    required String title,
    String? posterImageUrl,
    required int openLiveCount,
    required int concurrentUserCount,
  }) = _CategoryItem;
}
