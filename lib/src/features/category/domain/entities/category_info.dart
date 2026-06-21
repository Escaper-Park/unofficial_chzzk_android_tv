import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_info.freezed.dart';

@freezed
abstract class CategoryInfo with _$CategoryInfo {
  const factory CategoryInfo({
    required String categoryId,
    required String categoryType,
    required String title,
    String? posterImageUrl,
    required int openLiveCount,
    required int concurrentUserCount,
    @Default(<String>[]) List<String> tags,
    @Default(false) bool following,
  }) = _CategoryInfo;
}
