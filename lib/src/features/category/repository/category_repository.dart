import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants/api.dart';
import '../../../utils/shared_preferences/shared_prefs.dart';
import '../../live/model/live.dart';
import '../../vod/model/vod.dart';
import '../model/category.dart';

part 'category_repository.g.dart';

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) =>
    CategoryRepository();

// Remote
class CategoryRepository {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
      },
    ),
  );

  Future<CategoryResponse?> getCategoryResponse({
    required String? categoryId,
    required int? concurrentUserCount,
    required int? openLiveCount,
    Options? options,
    int size = 20,
  }) async {
    final url = APIUrl.categories(
      categoryId: categoryId,
      concurrentUserCount: concurrentUserCount,
      openLiveCount: openLiveCount,
    );

    final response = await _dio.get(url, options: options);

    final Map<String, dynamic>? pageResponse = response.data['content']['page'];
    final List<dynamic>? categoriesResponse = response.data['content']['data'];

    final CategoryPage? page = pageResponse == null
        ? null
        : CategoryPage.fromJson(pageResponse['next']);

    final List<Category>? categories =
        categoriesResponse?.map((json) => Category.fromJson(json)).toList();

    return CategoryResponse(
      categories: categories,
      page: page,
    );
  }

  Future<LiveResponse?> getCategoryLiveResponses({
    required Category category,
    required LivePage? next,
    Options? options,
  }) async {
    final url = APIUrl.categoryLives(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
      concurrentUserCount: next?.concurrentUserCount,
      liveId: next?.liveId,
    );

    final response = await _dio.get(url, options: options);

    final Map<String, dynamic>? pageResponse = response.data['content']['page'];
    final List<dynamic>? livesResponse = response.data['content']['data'];

    final LivePage? page =
        pageResponse == null ? null : LivePage.fromJson(pageResponse['next']);
    final List<LiveDetail>? liveDetails =
        livesResponse?.map((json) => LiveDetail.fromJson(json)).toList();

    return LiveResponse(
      liveDetails: liveDetails,
      page: page,
    );
  }

  Future<VodResponse?> getCategoryVodResponse({
    required Category category,
    required VodPage? next,
    Options? options,
  }) async {
    final url = APIUrl.categoryVods(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
      publishDateAt: next?.publishDateAt,
      readCount: next?.readCount,
    );

    final response = await _dio.get(url, options: options);

    final Map<String, dynamic>? pageResponse = response.data['content']['page'];
    final List<dynamic>? vodsResponse = response.data['content']['data'];

    final VodPage? page =
        pageResponse == null ? null : VodPage.fromJson(pageResponse['next']);
    final List<Vod>? vods =
        vodsResponse?.map((json) => Vod.fromJson(json)).toList();

    return VodResponse(
      vods: vods,
      page: page,
    );
  }

  Future<List<Category>> getFavoriteCategories({
    required List<String> favorites,
    Options? options,
  }) async {
    List<Category> favoriteCategories = [];

    for (String favorite in favorites) {
      final url = APIUrl.categoryInfo(categoryTypeAndId: favorite);

      final response = await _dio.get(url, options: options);
      final categoryInfoJson = response.data['content'];

      favoriteCategories.add(Category.fromJson(categoryInfoJson));
    }

    return favoriteCategories;
  }
}

class CategoryLocalRepository {
  final SharedPreferences _sharedPreferences;

  CategoryLocalRepository(this._sharedPreferences);

  Future<void> setFavoriteCategories(String category) async {
    final List<String> favorites =
        _sharedPreferences.getStringList(SharedPrefencesKey.category) ?? [];

    if (favorites.contains(category)) {
      favorites.remove(category);
    } else {
      favorites.add(category);
    }

    await _sharedPreferences.setStringList(
      SharedPrefencesKey.category,
      favorites,
    );
  }

  List<String> getFavoriteCategories() {
    return _sharedPreferences.getStringList(SharedPrefencesKey.category) ?? [];
  }
}
