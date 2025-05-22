import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.g.dart';
part 'category.freezed.dart';

@freezed
@JsonSerializable()
class Category with _$Category {
  final String categoryType;
  final String categoryId;
  final String categoryValue;
  final String? posterImageUrl;
  final int openLiveCount;
  final int concurrentUserCount;
  final List<String>? tags;
  final bool? existLounge;
  final bool? following;
  final bool? newCategory;

  Category({
    required this.categoryType,
    required this.categoryId,
    required this.categoryValue,
    this.posterImageUrl,
    required this.openLiveCount,
    required this.concurrentUserCount,
    this.tags,
    this.existLounge,
    this.following,
    this.newCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

