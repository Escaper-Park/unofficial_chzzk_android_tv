import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dtos.freezed.dart';
part 'category_dtos.g.dart';
part 'category_feed_dtos.dart';

@freezed
abstract class CategoryListDto with _$CategoryListDto {
  const factory CategoryListDto({
    @Default(<CategoryDto>[]) List<CategoryDto> data,
    CategoryPageDto? page,
    @Default(0) int size,
  }) = _CategoryListDto;

  factory CategoryListDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryListDtoFromJson(json);
}

@freezed
abstract class CategoryPageDto with _$CategoryPageDto {
  const factory CategoryPageDto({
    CategoryPageNextDto? next,
  }) = _CategoryPageDto;

  factory CategoryPageDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryPageDtoFromJson(json);
}

@freezed
abstract class CategoryPageNextDto with _$CategoryPageNextDto {
  const factory CategoryPageNextDto({
    String? categoryId,
    String? categoryType,
    int? concurrentUserCount,
    int? openLiveCount,
  }) = _CategoryPageNextDto;

  factory CategoryPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryPageNextDtoFromJson(json);
}

@freezed
abstract class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    required String categoryId,
    required String categoryType,
    required String categoryValue,
    @Default(0) int concurrentUserCount,
    @Default(<int>[]) List<int> dropsCampaignNos,
    @Default(false) bool newCategory,
    @Default(0) int openLiveCount,
    String? posterImageUrl,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}

@freezed
abstract class CategoryInfoDto with _$CategoryInfoDto {
  const factory CategoryInfoDto({
    required String categoryId,
    required String categoryType,
    required String categoryValue,
    @Default(0) int concurrentUserCount,
    @Default(false) bool existLounge,
    @Default(false) bool following,
    @Default(false) bool newCategory,
    @Default(0) int openLiveCount,
    String? posterImageUrl,
    @Default(<String>[]) List<String> tags,
  }) = _CategoryInfoDto;

  factory CategoryInfoDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfoDtoFromJson(json);
}

@freezed
abstract class FollowingCategoryListDto with _$FollowingCategoryListDto {
  const factory FollowingCategoryListDto({
    @Default(<FollowingCategoryDto>[]) List<FollowingCategoryDto> followingList,
  }) = _FollowingCategoryListDto;

  factory FollowingCategoryListDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingCategoryListDtoFromJson(json);
}

@freezed
abstract class FollowingCategoryDto with _$FollowingCategoryDto {
  const factory FollowingCategoryDto({
    required String categoryId,
    required String categoryType,
    required String categoryValue,
    @Default(0) int concurrentUserCount,
    @Default(<int>[]) List<int> dropsCampaignNos,
    @Default(0) int followerCount,
    @Default(false) bool newCategory,
    @Default(0) int openLiveCount,
    String? posterImageUrl,
  }) = _FollowingCategoryDto;

  factory FollowingCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingCategoryDtoFromJson(json);
}
