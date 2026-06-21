import '../../../../core/network/network.dart';
import '../../domain/entities/category_info.dart';
import '../../domain/entities/category_item.dart';
import '../../domain/entities/category_live.dart';
import '../../domain/entities/category_page.dart';
import '../../domain/entities/category_video.dart';
import '../../domain/failures/category_failure.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_api.dart';
import '../dtos/category_dtos.dart';
import '../mappers/category_mapper.dart';

final class ChzzkCategoryRepository implements CategoryRepository {
  const ChzzkCategoryRepository({
    required this.api,
  });

  final CategoryApi api;

  @override
  Future<CategoryPage> fetchCategories({
    CategoryPageCursor? cursor,
  }) async {
    try {
      final cursorDto = _categoryCursorToDto(cursor);
      final response = await api.getCategories(
        categoryId: cursorDto?.categoryId,
        categoryType: cursorDto?.categoryType,
        concurrentUserCount: cursorDto?.concurrentUserCount,
        openLiveCount: cursorDto?.openLiveCount,
      );
      final content = response.contentOr(const CategoryListDto());

      return categoryPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const CategoryLoadFailure(), stackTrace);
    }
  }

  @override
  Future<List<CategoryItem>> fetchFollowingCategories() async {
    try {
      final response = await api.getFollowingCategories();
      final content = response.contentOr(const FollowingCategoryListDto());

      return categoryItemsFromFollowingDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const CategoryLoadFailure(), stackTrace);
    }
  }

  @override
  Future<CategoryInfo> fetchCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) async {
    try {
      final response = await api.getCategoryInfo(
        categoryType: categoryType,
        categoryId: categoryId,
      );
      final content = response.contentOr(
        CategoryInfoDto(
          categoryId: categoryId,
          categoryType: categoryType,
          categoryValue: categoryId,
        ),
      );

      return categoryInfoFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const CategoryLoadFailure(), stackTrace);
    }
  }

  @override
  Future<CategoryLivePage> fetchCategoryLives({
    required String categoryType,
    required String categoryId,
    CategoryLiveCursor? cursor,
  }) async {
    try {
      final response = await api.getCategoryLives(
        categoryType: categoryType,
        categoryId: categoryId,
        concurrentUserCount: cursor?.concurrentUserCount,
        liveId: cursor?.liveId,
      );
      final content = response.contentOr(const CategoryLiveListDto());

      return categoryLivePageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const CategoryLoadFailure(), stackTrace);
    }
  }

  @override
  Future<CategoryVideoPage> fetchCategoryVideos({
    required String categoryType,
    required String categoryId,
    CategoryVideoCursor? cursor,
  }) async {
    try {
      final response = await api.getCategoryVideos(
        categoryType: categoryType,
        categoryId: categoryId,
        publishDateAt: cursor?.publishDateAt,
        readCount: cursor?.readCount,
      );
      final content = response.contentOr(const CategoryVideoListDto());

      return categoryVideoPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const CategoryLoadFailure(), stackTrace);
    }
  }

  @override
  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  }) async {
    try {
      await api.followCategory(
        categoryType: categoryType,
        categoryId: categoryId,
      );
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const CategoryMutationFailure(), stackTrace);
    }
  }

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) async {
    try {
      await api.unfollowCategory(
        categoryType: categoryType,
        categoryId: categoryId,
      );
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const CategoryMutationFailure(), stackTrace);
    }
  }
}

CategoryPageNextDto? _categoryCursorToDto(CategoryPageCursor? cursor) {
  if (cursor == null) {
    return null;
  }

  return CategoryPageNextDto(
    categoryId: cursor.categoryId,
    categoryType: cursor.categoryType,
    concurrentUserCount: cursor.concurrentUserCount,
    openLiveCount: cursor.openLiveCount,
  );
}
