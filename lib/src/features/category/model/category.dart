import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.g.dart';
part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String categoryType,
    required String categoryId,
    required String categoryValue,
    String? posterImageUrl,
    required int openLiveCount,
    required int concurrentUserCount,
    List<String>? tags,
    bool? existLounge,
    bool? following,
    bool? newCategory,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}


