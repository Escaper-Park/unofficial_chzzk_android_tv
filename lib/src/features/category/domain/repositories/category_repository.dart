import '../entities/category_info.dart';
import '../entities/category_item.dart';
import '../entities/category_live.dart';
import '../entities/category_page.dart';
import '../entities/category_video.dart';

abstract interface class CategoryRepository {
  Future<CategoryPage> fetchCategories({
    CategoryPageCursor? cursor,
  });

  Future<List<CategoryItem>> fetchFollowingCategories();

  Future<CategoryInfo> fetchCategoryInfo({
    required String categoryType,
    required String categoryId,
  });

  Future<CategoryLivePage> fetchCategoryLives({
    required String categoryType,
    required String categoryId,
    CategoryLiveCursor? cursor,
  });

  Future<CategoryVideoPage> fetchCategoryVideos({
    required String categoryType,
    required String categoryId,
    CategoryVideoCursor? cursor,
  });

  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  });

  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  });
}
